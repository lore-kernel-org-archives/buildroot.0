From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 May 2018 22:59:51 +0200
Subject: [Buildroot] [PATCH 3/5] package/xorriso: fix to use system
 xattr header
In-Reply-To: <32ddfdf7660b00f7d067ce1c0b7c4f50786b0d5a.1525717511.git.yann.morin.1998@free.fr>
References: <cover.1525717511.git.yann.morin.1998@free.fr>
 <32ddfdf7660b00f7d067ce1c0b7c4f50786b0d5a.1525717511.git.yann.morin.1998@free.fr>
Message-ID: <20180507205951.GI14524@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-05-07 20:25 +0200, Yann E. MORIN spake thusly:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Steve Kenton <skenton@ou.edu>
> ---
>  package/xorriso/0001-use-sys-xattr.h.patch | 30 ++++++++++++++++++++++++++++++
>  package/xorriso/xorriso.mk                 | 10 ++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/xorriso/0001-use-sys-xattr.h.patch
> 
> diff --git a/package/xorriso/0001-use-sys-xattr.h.patch b/package/xorriso/0001-use-sys-xattr.h.patch
> new file mode 100644
> index 0000000000..89cd530d1d
> --- /dev/null
> +++ b/package/xorriso/0001-use-sys-xattr.h.patch
> @@ -0,0 +1,30 @@
> +Use system <sys/xattr.h>
> +
> +The one from attr is no longer installed with latest version.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Before Thomas whines about a git-formatted patch...

The git tree, or rather the git tree*s*, are bizarelly arranged.

Upstream is at https://www.gnu.org/software/xorriso/, which points to
http://libburnia-project.org/, which is a redirect to a mattermost
instance (you know, a slightly glorified irc client with fancy bells and
whisttles for millenials ;-])...

But then, digigng a bit unearthes what appears to be the upstream git
trees, at https://dev.lovelyhq.com/explore/projects

Then, there is no tree for xorriso. Instead, it seems to be part of
another tree, https://dev.lovelyhq.com/libburnia/libisoburn.

Alas, this is not all the story yet, as the code from the tarball does
not match the one from the tree: there are more things in the tarball
than in the tree, notably libisofs, which is in its own git tree
https://dev.lovelyhq.com/libburnia/libisofs.

So, again, we can't carry a git-formatted patch for xorriso...

But I'll be sending them patches to each of their impacted trees...
Tomorrow...

Regards,
Yann E. MORIN.

> +diff -durN xorriso-1.4.6.orig/configure.ac xorriso-1.4.6/configure.ac
> +--- xorriso-1.4.6.orig/configure.ac	2016-09-16 15:51:33.000000000 +0200
> ++++ xorriso-1.4.6/configure.ac	2018-05-06 23:45:38.377153069 +0200
> +@@ -264,7 +264,7 @@
> + dnl Check whether there is the header for Linux xattr.
> + dnl If not, erase this macro which would enable use of listxattr and others
> +         XATTR_DEF="-DLibisofs_with_aaip_xattR"
> +-        AC_CHECK_HEADER(attr/xattr.h, AC_CHECK_LIB(c, listxattr, X= ,
> ++        AC_CHECK_HEADER(sys/xattr.h, AC_CHECK_LIB(c, listxattr, X= ,
> +                                                    XATTR_DEF= ), XATTR_DEF= )
> +     fi
> + elif test x"$LIBBURNIA_SUPP_FATTR" = xextattr
> +diff -durN xorriso-1.4.6.orig/libisofs/aaip-os-linux.c xorriso-1.4.6/libisofs/aaip-os-linux.c
> +--- xorriso-1.4.6.orig/libisofs/aaip-os-linux.c	2016-09-16 15:51:34.000000000 +0200
> ++++ xorriso-1.4.6/libisofs/aaip-os-linux.c	2018-05-06 23:47:25.764941583 +0200
> +@@ -30,7 +30,7 @@
> + #endif
> + 
> + #ifdef Libisofs_with_aaip_xattR
> +-#include <attr/xattr.h>
> ++#include <sys/xattr.h>
> + #endif
> + 
> + 
> diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
> index 1f095911f8..2dda1e8d73 100644
> --- a/package/xorriso/xorriso.mk
> +++ b/package/xorriso/xorriso.mk
> @@ -8,6 +8,16 @@ XORRISO_VERSION = 1.4.6
>  XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
>  XORRISO_LICENSE = GPL-3.0+
>  XORRISO_LICENSE_FILES = COPYING COPYRIGHT
> +
> +# 0001-use-sys-xattr.h.patch
> +XORRISO_AUTORECONF = YES
> +
> +define XORRSISO_AUTOTOOLS_NEWS
> +	@touch $(@D)/NEWS
> +endef
> +XORRISO_POST_PATCH_HOOKS += XORRSISO_AUTOTOOLS_NEWS
> +HOST_XORRISO_POST_PATCH_HOOKS += XORRSISO_AUTOTOOLS_NEWS
> +
>  # Disable everything until we actually need those features, and add the correct
>  # host libraries
>  HOST_XORRISO_CONF_OPTS = \
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
