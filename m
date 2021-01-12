From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jan 2021 10:19:05 +0100
Subject: [Buildroot] Host tar 1.32 build issues
In-Reply-To: <95c3b23f-6805-e526-8bc2-a0d48a66895c@mind.be>
References: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
 <95c3b23f-6805-e526-8bc2-a0d48a66895c@mind.be>
Message-ID: <20210112091905.GA382149@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, Arnout, All,

On 2021-01-12 09:39 +0100, Arnout Vandecappelle spake thusly:
> On 12/01/2021 00:45, Markus Mayer via buildroot wrote:
> > I noticed that host tar is no longer locked to 1.29 and has been
> > bumped to 1.32. The only problem is that the host tar build requires
> > tar in CPIO format, and that 1.32 does not exist as CPIO archive on
> > the official server. As per http://mirror.sergal.org/gnu/tar/, tar
> > 1.31 is the latest that has a CPIO archive. 1.32 and 1.33 do not.
> >?
> > Naturally, that currently causes the build to fail if
> > BR2_FORCE_HOST_BUILD is enabled.
>?
> > I don't know if the absence of CPIO archives is temporary or
> > permanent.
>  AFAIU it's permanent :-(

Not so sure. 1.33 has been released 2021-01-07, but the cpio archives for
it are indeed present, and dated today, 2021-01-12.

So, maybe we can just point that out to the tar maintainers, that they
forgot the cpio for 1.32.

> > It might be better to use tar-latest.cpio.gz as the host
> > tar version to prevent this issue from happening again in the future.
> >?
> > -HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
> > +HOST_TAR_SOURCE = tar-latest.cpio.gz

That is a big no-no from me: since this archive is always pointing to
the latest version, that means it will be updated next time they do a
new release.

Which will be problematic as the hash we'd have for it will no longer
match.

>  An alternative is to download a tarball and extract it with custom extraction
> commands that don't use --strip-components or --exclude or $(TAR_OPTIONS). That
> way, we can extract it with any POSIX-y tar version.

I think this is the only good solution long-term.

Also, as a quick workaround for this issue, we can also bump to the
newly relased 1.33. ;-)

And I have tested with the Makefile in the commit log: 1.33 generates
archives that are reproducible.

I'll look more in-depth tonight (GMT+1)...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
