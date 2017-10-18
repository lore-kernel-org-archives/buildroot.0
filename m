From: Ismael Luceno <ismael@iodev.co.uk>
Date: Tue, 17 Oct 2017 23:35:39 -0300
Subject: [Buildroot] [PATCH v3] axel: bump to version 2.15
In-Reply-To: <20171017230313.3ea69a47@windsurf.home>
References: <20171016201221.17376-1-ismael@iodev.co.uk>
 <20171017230313.3ea69a47@windsurf.home>
Message-ID: <20171018023538.GC2965@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/Oct/2017 23:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 16 Oct 2017 17:12:21 -0300, Ismael Luceno wrote:
> 
> > +AXEL_CFLAGS = -D_POSIX_C_SOURCE=200112L
> > +# _POSIX_C_SOURCE required to compile against uClibc
> > +AXEL_CONF_OPTS = \
> > +	ac_cv_prog_cc_c99=-std=c99 \
> > +	CFLAGS="$(TARGET_CFLAGS) $(AXEL_CFLAGS)"
> > +# ac_cv_prog_cc_c99 is required because the C99 test relies on wchar_t
> 
> Somewhat weird to have the comment *after* the code. I believe it's
> common practice to have comments *before* the thing being commented.
> 
> That being said, I still don't understand those lines. Indeed, I've
> been able to build with your patch applied, minus those custom
> AXEL_CFLAGS/AXEL_CONF_OPTS with no problem:
> 
>                    br-arm-cortex-m4-full [1/5]: OK
>                 br-i386-pentium-mmx-musl [2/5]: OK
>                br-powerpc64-power7-glibc [3/5]: OK
>                           br-xtensa-full [4/5]: OK
>              mips64el-ctng_n64-linux-gnu [5/5]: OK
> 
> This has tested 2 uClibc toolchains, 2 glibc toolchains and one musl
> toolchain, and all succeeded.
> 
> Could you explain which specific problem you are fixing here with those
> custom flags, and under which conditions you produce a failure without
> those flags?

The C99 test doesn't pass unless BR2_TOOLCHAIN_BUILDROOT_WCHAR=y, but
axel doesn't use wchar_t; that's why it needs to be overriden.

Without -D_POSIX_C_SOURCE=200112L it's failing for me, against uclibc-ng
1.0.26. Now that I think about it, -std=c99 might be causing that.
