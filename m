From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:25:37 +0200
Subject: [Buildroot] [PATCH v3] add package for pdmenu
In-Reply-To: <1503958949-17690-1-git-send-email-brock@cottonwoodcomputer.com>
References: <1503958949-17690-1-git-send-email-brock@cottonwoodcomputer.com>
Message-ID: <20170830232537.46d32939@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 16:22:29 -0600, Brock Williams wrote:
> Signed-off-by: Brock Williams <brock@cottonwoodcomputer.com>

So, I applied your patch, but after fixing a number of issues. Some
easy, some more complicated. See below.

> diff --git a/package/pdmenu/pdmenu.hash b/package/pdmenu/pdmenu.hash
> new file mode 100644
> index 0000000..be6d27a
> --- /dev/null
> +++ b/package/pdmenu/pdmenu.hash
> @@ -0,0 +1 @@

Missing comment above the hash that says where it comes from.

> +md5	0623b992572511d5fd90d481c426fa40	pdmenu_1.3.4.tar.gz

We use sha256 hashes when locally calculated, so I've added that.

I've also added the hash for the license file.

> diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
> new file mode 100644
> index 0000000..f3d9fba
> --- /dev/null
> +++ b/package/pdmenu/pdmenu.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# pdmenu
> +#
> +################################################################################
> +
> +PDMENU_VERSION = 1.3.4
> +PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
> +PDMENU_SITE = http://snapshot.debian.org/archive/debian/20170828T160058Z/pool/main/p/pdmenu
> +PDMENU_LICENSE = GPL-2.0+

Nowhere they say it's GPLv2 or later. They only include the license
text of the GPLv2, with no further information. So the license is
GPL-2.0 only.

> +PDMENU_LICENSE_FILES = COPYING.GPLv2

This file does not exist, it's doc/COPYING.

> +PDMENU_DEPENDENCIES = slang

Now the more complicated part is that the NLS handling was broken, in
two situations:

 * If NLS support is enabled with uClibc/musl, the gettext functions are
   located in an external library (not in the C library) called
   libintl, and pdmenu was not linking with it. I've added a first
   patch to fix this. I also had to add $(TARGET_NLS_DEPENDENCIES) to
   PDMENU_DEPENDENCIES to make sure host-gettext/gettext get defined as
   necessary.

 * On the other hand, even if NLS support was disabled, pdmenu Makefile
   was trying to use the msgfmt tool on the build machine to
   generate .mo files from .po files, causing a build failure. I fixed
   that by adding another patch that only builds/installs .mo files if
   msgfmt is available.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
