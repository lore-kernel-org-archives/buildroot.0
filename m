From: Allan Clark <allanc@chickenandporn.com>
Date: Tue, 17 Jul 2007 08:44:43 -0400
Subject: [Buildroot] [PATCH] fix packages/config on OS X
In-Reply-To: <469C8001.6080003@cs.helsinki.fi>
References: <469C8001.6080003@cs.helsinki.fi>
Message-ID: <37c712e0707170544s4fbfdd55s8c5213208b88128f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7/17/07, Heikki Lindholm <holindho@cs.helsinki.fi> wrote:
> Update to linux 2.6.21 config system broke packages/config on OS X. The
> following patch should allow it to build again. Note that "dylib" is
> hard-coded in check-lxdialog because HOST_SHREXT, which would be nicer,
> is not available at that point.
>
> -- Heikki Lindholm
>
> Index: package/config/lxdialog/check-lxdialog.sh
> ===================================================================
> --- package/config/lxdialog/check-lxdialog.sh   (revision 19125)
> +++ package/config/lxdialog/check-lxdialog.sh   (working copy)
> @@ -19,6 +19,11 @@
>                 echo '-lcurses'
>                 exit
>         fi
> +       $cc -print-file-name=libncurses.dylib | grep -q /
> +       if [ $? -eq 0 ]; then
> +               echo '-lncurses'
> +               exit
> +       fi
>         exit 1
>  }
>
> Index: package/config/foo.h
> ===================================================================
> --- package/config/foo.h        (revision 19125)
> +++ package/config/foo.h        (working copy)
> @@ -1,6 +1,8 @@
>  #ifndef __KCONFIG_FOO_H
>  #define __KCONFIG_FOO_H
> +#ifndef __APPLE__
>  #include <features.h>
> +#endif
>  #include <limits.h>
>
>  #ifndef PATH_MAX

This second patch, I posted a while back asking if anyone needed
features.h.  I didn't get any response.  I noticed in Linux, it's not
needed.  Not sure what platform actually needs features.h here.
__APPLE__ is defined by Apple's GCC?  cool.

Allan
