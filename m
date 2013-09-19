From: soochon radee <sradee@gmail.com>
Date: Thu, 19 Sep 2013 13:02:33 -0400
Subject: [Buildroot] Two or three stages gcc build?
Message-ID: <CADXR8ejAOgcjrxoHM8obEL0vFSeJhgbDn46aBT6OPpkoOfc-DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am also seeing the two-phase build break eglibc trying to link
SSP-related symbols on 64-bit targets (powerpc/970, x86_64/core2) in
libc/resolv. This happens even if SSP is enabled in .config

I've been digging around gcc-initial's configure arguments and directories
passed around to eglibc's configure script to no avail. But, I've been able
to make it work by forcing eglibc to assume no SSP support with the
following patch. Hopefully this will point a way to a better solution.

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4dd2e63..1e8b325 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -63,6 +63,7 @@ define GLIBC_CONFIGURE_CMDS
                CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
                $(SHELL) $(@D)/$(GLIBC_SRC_SUBDIR)/configure \
                ac_cv_path_BASH_SHELL=/bin/bash \
+               libc_cv_ssp=no \
                libc_cv_forced_unwind=yes \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \

Thanks,
Soochon

> Dear Khem Raj,
>
> On Fri, 6 Sep 2013 09:59:34 -0700, Khem Raj wrote:
>
> > > In the mean time, I've experimented a bit and actually implemented it.
> > > The patch hasn't been merged yet in Buildroot, but it has been posted:
> > >
http://lists.busybox.net/pipermail/buildroot/2013-September/077344.html.
> > >
> > > Don't hesitate to have a look and tell me what you think.
> >
> > OK. The patch looks ok to me. one thing
>
> After merging the patch, we got a report that it breaks SSP support,
> see [1]. After investigation, depending on the architecture, the
> __stack_chk_fail symbol maybe be part of the TLS (it's the case on x86,
> but on ARM, for example).
>
> However, since we're now only doing gcc-initial -> uclibc -> gcc-final,
> and gcc-initial has no thread/TLS support, it breaks the build of
> uClibc when SSP support is enabled (in such a case, uClibc is built
> with -fstack-protector, which creates references to __stack_chk_fail,
> but this symbol isn't available because we don't have TLS support).
>
> Have you already seen this problem? What solution do you suggest?
>
> Thanks!
>
> Thomas
>
> [1]
>
http://buildroot-busybox.2317881.n4.nabble.com/uClibc-fails-to-build-with-stack-smash-protection-td51478.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/4dd2c02c/attachment-0001.html>
