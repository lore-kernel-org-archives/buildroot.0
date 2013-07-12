From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 12 Jul 2013 19:07:58 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <201307111402.34152.yann.morin.1998@free.fr>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
 <20130711134646.6ef211dd@skate>
 <201307111402.34152.yann.morin.1998@free.fr>
Message-ID: <CAEYzJUHpYVBAgHnrj73aMwj8pw+p_bScMToM-BSZh3bm--q2gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 July 2013 14:02, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On Thursday 11 July 2013 13:46:46 Thomas Petazzoni wrote:
>> On Thu, 11 Jul 2013 12:33:42 +0200, Bj?rn Forsman wrote:
>> > How about going all the way: clean out the environment completely, and
>> > explicitly add env vars to builders as needed. That would result in a
>> > more deterministic build environment, IMHO.
>>
>> I don't think this works: there are a bunch of environment variables
>> that we accept (to tune the uClibc config file, the Busybox config
>> file, the host gcc to use, etc.). And we also accept the feature that
>> all BR2_<foo> values can be overridden using environment variables. So
>> I don't think wiping out the entire environment is possible. However,
>> we could /maybe/ (if that's possible), wipe out the entire environment
>> *except* the BR2_<foo> variables, and the few other variables that we
>> explicitly accept. But I'm not sure how to achieve that.
>
> Even that would not work. For example, I have LD_PRELOAD set to tsocksify
> all network connections, without which I could not download anything.
>
> So, even though LD_PRELOAD looks like a good candidate to dump, it can be
> valid in some cases.
>
> I believe it is much better that Buildroot chokes on a select list of
> variables, warn about a few others, and accept the rest.

If you think about it, the downloader is actually a bit different from
the builder. At some point Buildroot will (like all other build
systems) grow support for checking each downloaded file against
checksums specified in the package build file. And once you have that,
it doesn't really matter how dirty the environment in the *downloader*
is, because it will be guaranteed to match the checksum, or fail. It
is only in the *builder* that the environment must be clean.

Are there any reasons for allowing env vars, other than BR2_*, to slip
through from host and into the Buildroot *builder* processes? I cannot
think of any.

Best regards,
Bj?rn Forsman
