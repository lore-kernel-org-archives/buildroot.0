From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Feb 2021 21:35:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2020f
In-Reply-To: <8c8b3bb9-0179-b194-1ad3-98cdd55ff4b3@gmail.com>
References: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
 <20210110164711.1708062-2-bernd.kuhls@t-online.de>
 <87zh1ekq9r.fsf@dell.be.48ers.dk>
 <19dff490-6537-bc7d-7035-e4bd99f97452@gmail.com>
 <877dnad5ux.fsf@dell.be.48ers.dk>
 <602ba0f2-503c-7175-c4fb-7dcac246631c@gmail.com>
 <8735xyd2vs.fsf@dell.be.48ers.dk> <20210214182145.GH6798@piout.net>
 <8c8b3bb9-0179-b194-1ad3-98cdd55ff4b3@gmail.com>
Message-ID: <20210214203543.GA2945341@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-02-14 19:35 +0100, Romain Naour spake thusly:
> Le 14/02/2021 ? 19:21, Alexandre Belloni a ?crit?:
> > On 14/02/2021 17:34:47+0100, Peter Korsgaard wrote:
> >> Ok, thanks. There was a report on IRC that timezones on uClibc were
> >> broken as well because of an incompatibility between the new tzdata
> >> files and tzdump.
> > No, the issue is with zic that is not generating proper Tzif2 files (the
> > tzif2 header is there twice).
> The issue happen on Glibc toolchain.

The issues *also* happends on uClibc toolchains (as reported on IRC),
and I suspect it also happens on musl toolchains (as it uses the same
tzdata and zic as for glibc).

And Alexandre investigated quickly a few days ago, and reported on IRC
(quoting):

01:01 < abelloni> mcon: temporary workaround, you can revert 7868289fd53480201f8be7b72097246b7923611c.
01:02 < abelloni> y_morin: ^
01:02 < abelloni> y_morin: since the bump the zic output has two TZif2 headers, this breaks tzdump
01:03 < abelloni> maybe this also break glibc, I didn't check yet

So it looks like the duplicated header is causing issues everywhere...

> I added back the previous default zic format "fat" instead of "slim" [1] to pass
> the test. The default format has been changed in 2020b release.
> I'm not sure if we should keep the "fat" format...
> [1] https://github.com/eggert/tz/commit/6ba6f2117b95eab345a7ed9159cef939e30c4cd3

From this, it looks like the 'fat' format is not 2038-safe, while the
'slim' one is.

To be noted: the glibc version used in thoses tests is 2.18, released in
August 2013...

It seems the support for the slim format was only introduced with glibc
2.32. 2.31 has no mention of either slim or fat, while 2.32 mention
both, as it synced with upstream tz 2020a; the previous sync was with
2018i...

So, what I suggest we do:

  - for master (and next): revert to fat for external glibc, use slim
    for internal glibc (check for c-sky)

  - for maintenance branches: unconditionally revert to fat.

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
