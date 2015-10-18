From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 22:30:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libdcadec: Add -fPIC to
 static build, enable shared build
In-Reply-To: <1445199875-28494-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445199875-28494-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018223004.4b4617d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

Thanks for the new version!

The title of the commit now seems a bit odd, since you're no longer
adding -fPIC.

On Sun, 18 Oct 2015 22:24:35 +0200, Bernd Kuhls wrote:
> Build errors occured due to libdcadec being linked statically.

Can you be more verbose in your commit log, to explain what's going on?
At the bare minimum, something like:

"""
The libdcadec package currently only builds a static library, which is
naturally built without -fPIC (since this is generally not needed for
static libraries).

However, when the generated static library gets used inside a larger
dynamic library, such as ffmpeg's one, the link fails, since we're
trying to include in a shared library non-PIC code.

To solve this, this commit changes the way the libdcadec library is
built to make sure a shared variant of the library gets built when
appropriate. This way, ffmpeg has a PIC-enabled libdcadec library to
link with.
"""

> diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
> index 76862a6..dff67b5 100644
> --- a/package/libdcadec/libdcadec.mk
> +++ b/package/libdcadec/libdcadec.mk
> @@ -10,19 +10,24 @@ LIBDCADEC_LICENSE = LGPLv2.1+
>  LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
>  LIBDCADEC_INSTALL_STAGING = YES
>  
> +ifneq ($(BR2_STATIC_LIBS),y)

This should be:

ifeq ($(BR2_STATIC_LIBS),)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
