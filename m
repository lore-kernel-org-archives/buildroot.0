From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 17 Sep 2013 13:01:14 -0400
Subject: [Buildroot] [PATCH v2] Add support for eglibc-2.17 multiarch
 layout, from Linaro 2013.07+
In-Reply-To: <1379411093-37240-1-git-send-email-greg.beresford@zbdsolutions.com>
References: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com>
 <5237F574.9070700@mind.be>
 <1379411093-37240-1-git-send-email-greg.beresford@zbdsolutions.com>
Message-ID: <CA+-urNTYe7NF43KmEQDYVZBsqvgC0w+F7VtEafRUQVxhzO+CNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Greg,

On Tue, Sep 17, 2013 at 5:44 AM, Greg Beresford
<greg.beresford@zbdsolutions.com> wrote:
> From: Henry Luis <henry@echelon.com>
>
> Arch-specific libraries, including libc.so.6, are expected to be in a
> subdirectory of /lib (e.g. /lib/arm-linux-gnueabihf). This patch
> changes copy_toolchain_lib_root() in helper.mk to preserve the
> toolchain sysroot's lib directory structure, except for SUPPORT_LIB_DIR
> which are still copied directly under DESTDIR.
>
> Signed-off-by: Greg Beresford <greg.beresford@zbdsolutions.com>
> ---

Thanks for posting the patch. I've been trying it out, but I think
that I'm running into a bigger problem of how the shared library
search path works now. I.e. /usr/lib is not searched by default
anymore even though that's where many buildroot packages install their
libraries.

Here's the new search path:

/lib/arm-linux-gnueabihf/
/usr/lib/arm-linux-gnueabihf/tls/v7l/neon/vfp/
/usr/lib/arm-linux-gnueabihf/tls/v7l/neon/
/usr/lib/arm-linux-gnueabihf/tls/v7l/vfp/
/usr/lib/arm-linux-gnueabihf/tls/v7l/
/usr/lib/arm-linux-gnueabihf/tls/neon/vfp/
/usr/lib/arm-linux-gnueabihf/tls/neon/
/usr/lib/arm-linux-gnueabihf/tls/vfp/
/usr/lib/arm-linux-gnueabihf/tls/
/usr/lib/arm-linux-gnueabihf/v7l/neon/vfp/
/usr/lib/arm-linux-gnueabihf/v7l/neon/
/usr/lib/arm-linux-gnueabihf/v7l/vfp/
/usr/lib/arm-linux-gnueabihf/v7l/
/usr/lib/arm-linux-gnueabihf/neon/vfp/

I can think of a few hacks to get around this, but is there a right
way that I should be configuring buildroot to deal with this
multiarch/multilib toolchain feature?

Thanks,
Frank



>
> I couldn't initially see a particularly clear way of removing the pushd
> and popd commands, but the below worked (once I figured out how escape
> it properly.)
>
> Regards
> Greg
>
>  toolchain/helpers.mk | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 0e270ee..3b4900d 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -66,12 +66,17 @@ copy_toolchain_lib_root = \
>                 LIBDIR=`dirname $${LIBPATH}` ; \
>                 while test \! -z "$${LIBNAME}" ; do \
>                         LIBPATH=$${LIBDIR}/$${LIBNAME} ; \
> -                       rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
> -                       mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
> +                       if [ "$${dir}" = "$${SUPPORT_LIB_DIR}" ]; then \
> +                               DDIR=$${DESTDIR} ; \
> +                       else \
> +                               DDIR=$${LIBDIR\#$${ARCH_SYSROOT_DIR}} ; \
> +                       fi; \
> +                       rm -fr $(TARGET_DIR)/$${DDIR}/$${LIBNAME}; \
> +                       mkdir -p $(TARGET_DIR)/$${DDIR}; \
>                         if test -h $${LIBPATH} ; then \
> -                               cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/; \
> +                               cp -d $${LIBPATH} $(TARGET_DIR)/$${DDIR}/; \
>                         elif test -f $${LIBPATH}; then \
> -                               $(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +                               $(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DDIR}/$${LIBNAME}; \
>                         else \
>                                 exit -1; \
>                         fi; \
> --
> 1.8.4
>
>
>
> Disclaimer: This email contains proprietary information some or all of which may be legally privileged and/or is confidential. It is for the intended recipient only. If an addressing or transmission error has misdirected this email, please notify the author by replying to this email. If you are not the intended recipient, you must not use, disclose, distribute, copy or print this email. Any views expressed in this message are those of the individual sender, except where the message states otherwise. ZBD Displays accepts no responsibility for any computer virus which might be transferred by way of this email. We may monitor all email communication through our networks. If you contact us by email, we may store your name and address to facilitate communication. ZBD Displays Ltd is registered in England and Wales, company registration number: 03929602. Registered Office: Malvern Hills Science Park, Geraldine Road, Malvern,  Worcestershire, WR14 3SZ, UK
>
> ______________________________________________________________________
> This email has been scanned by the Symantec Email Security.cloud service.
> For more information please visit http://www.symanteccloud.com
> ______________________________________________________________________
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Frank Hunleth
Troodon Software LLC
http://troodon-software.com/
