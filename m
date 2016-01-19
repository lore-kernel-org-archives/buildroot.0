From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 19 Jan 2016 07:53:12 -0200
Subject: [Buildroot] [PATCH] libedit: fix build error with musl toolchain
In-Reply-To: <87bn8i4k9n.fsf@dell.be.48ers.dk>
References: <1452127277-9538-1-git-send-email-sergio.prado@e-labworks.com>
 <87bn8i4k9n.fsf@dell.be.48ers.dk>
Message-ID: <CANu7NGs0xUf4ZsYnMhchb6JFnFMesrY0_sQStqQS3Ud51ZxS9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-01-18 20:04 GMT-02:00 Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:
>
>  > Libedit build fails when __STDC_ISO_10646__ is not defined, and that is
>  > the case when compiling with musl toolchains.
>
>  > chartype.h:52:3: error: #error wchar_t must store ISO 10646 characters
>  >   #error wchar_t must store ISO 10646 characters
>  >    ^
>
>  > Musl is ISO 10646 compliant but doesn't define __STDC_ISO_10646__, so
>  > let's define it manually.
>
>  > Fixes:
>  >
http://autobuild.buildroot.net/results/3d12a7e6423d236c9d528bca7cbcf86b1499d738/
>  >
http://autobuild.buildroot.net/results/b92f7e2b86ffa575d8a8a0b91fbdd9bcb0f231de/
>  >
http://autobuild.buildroot.net/results/c476a48936f8810117bb292fb0d8a43c09068de6/
>  >
http://autobuild.buildroot.net/results/a30bb1423cc92137a2deaec0a32c7df947384d49/
>
>  > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>  > ---
>  >  package/libedit/libedit.mk | 6 ++++++
>  >  1 file changed, 6 insertions(+)
>
>  > diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
>  > index 87a1cdc136d6..e7ddd1fcb562 100644
>  > --- a/package/libedit/libedit.mk
>  > +++ b/package/libedit/libedit.mk
>  > @@ -23,6 +23,12 @@ LIBEDIT_POST_EXTRACT_HOOKS += LIBEDIT_FIXUP_M4_DIR
>  >  # Doesn't really support !wchar, but support is disabled otherwise
>  >  LIBEDIT_CONF_OPTS += --enable-widec
>
>  > +# musl is ISO 10646 compliant but doesn't define __STDC_ISO_10646__,
>  > +# so let's define it manually
>  > +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>  > +LIBEDIT_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS)
-D__STDC_ISO_10646__=201103L"
>  > +endif
>
> Committed, thanks. Out of interest, why did you exactly select 201103?

For no specific reason. I have just selected the same value used by glibc.

>
> --
> Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160119/0f0fa758/attachment.html>
