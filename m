From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 11:25:24 +0200
Subject: [Buildroot] [PATCH v3] modplugtools: Added package
In-Reply-To: <1413676846-23424-1-git-send-email-maarten@treewalker.org>
References: <1413662640-16030-1-git-send-email-maarten@treewalker.org>
 <1413676846-23424-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141019092524.GJ4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten, All,

On 2014-10-19 02:00 +0200, Maarten ter Huurne spake thusly:
> This installs the 'modplug123' command line tool to play tracker music
> files (MOD, S3M, XM etc.) using libmodplug.
> 
> The modplugtools package can build two players: modplugplay that plays
> directly via OSS and modplug123 that plays via libao. Since modplugplay
> won't work without OSS support and modern kernels are likely to have no
> OSS or OSS emulation, we build only modplug123.
> 
> If you have a system without ALSA support for some reason, you can
> still use modplug123 to play over OSS via libao.
> 
> http://modplug-xmms.sourceforge.net/
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

See below...

[--SNIP--]
> diff --git a/package/modplugtools/modplugtools.mk b/package/modplugtools/modplugtools.mk
> new file mode 100644
> index 0000000..e8d73af
> --- /dev/null
> +++ b/package/modplugtools/modplugtools.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# modplugtools
> +#
> +################################################################################
> +
> +MODPLUGTOOLS_VERSION = 0.5.3
> +MODPLUGTOOLS_SITE = http://downloads.sourceforge.net/project/modplug-xmms/modplug-tools
> +MODPLUGTOOLS_LICENSE = GPLv3
> +MODPLUGTOOLS_LICENSE_FILES = COPYING

This is indeed GPLv3 and no 'or later'.

To be noted: their upstream repo is weird. They do have a COPYING file
in their git tree, but it is a simlink to /usr/share/automake-1.11/COPYING.
In the archive, it is a real file (not a symlink) with the text of the
GPLv3, and the source files have no 'or later' indication.

So the license is dependant on the host system of the person doing the
release tarball. Sigh... :-(

I'll report the issue upstream.

Regards,
Yann E. MORIN.

> +
> +MODPLUGTOOLS_DEPENDENCIES = libao libmodplug
> +
> +# Only build the 'mp123' subdir, which contains 'modplug123' that plays through
> +# various backends via libao. This excludes the 'mpplay' subdir, which contains
> +# 'modplugplay' that can play only through the deprecated OSS interface.
> +MODPLUGTOOLS_MAKE_OPTS = SUBDIRS=mp123
> +MODPLUGTOOLS_INSTALL_TARGET_OPTS = SUBDIRS=mp123 DESTDIR=$(TARGET_DIR) install
> +
> +$(eval $(autotools-package))
> -- 
> 1.8.4.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
