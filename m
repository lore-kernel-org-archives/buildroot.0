From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 22:08:25 +0200
Subject: [Buildroot] [PATCH 06/12] gcc/4.9: add patch to warn about
 unsafe header paths
In-Reply-To: <1408540005-26934-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140910200825.GB23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-20 15:06 +0200, Thomas Petazzoni spake thusly:
> +Index: b/gcc/gcc.c
> +===================================================================
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
[--SNIP--]
> +@@ -4028,6 +4030,12 @@
> +       gcc_assert (!compare_debug_opt);
> +     }
> + 
> ++  temp = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
> ++  if (temp && strlen(temp) > 0)
> ++    {
> ++      save_switch("-Werror=poison-system-directories", 0, NULL, false, true);

Here you set the --error-poison-system-direcotries for the linker...

> ++    }
> ++
> +   /* Set up the search paths.  We add directories that we expect to
> +      contain GNU Toolchain components before directories specified by
> +      the machine description so that we will find GNU components (like
> +Index: b/gcc/incpath.c
> +===================================================================
> +--- a/gcc/incpath.c
> ++++ b/gcc/incpath.c
> +@@ -28,6 +28,7 @@
> + #include "intl.h"
> + #include "incpath.h"
> + #include "cppdefault.h"
> ++#include "diagnostic-core.h"
> + 
> + /* Microsoft Windows does not natively support inodes.
> +    VMS has non-numeric inodes.  */
> +@@ -382,6 +383,24 @@
> + 	}
> +       fprintf (stderr, _("End of search list.\n"));
> +     }
> ++
> ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> ++  if (flag_poison_system_directories)
> ++    {
> ++       struct cpp_dir *p;
> ++
> ++       for (p = heads[QUOTE]; p; p = p->next)
> ++         {
> ++          if ((!strncmp (p->name, "/usr/include", 12))
> ++              || (!strncmp (p->name, "/usr/local/include", 18))
> ++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
> ++            warning (OPT_Wpoison_system_directories,
> ++                     "include location \"%s\" is unsafe for "
> ++                     "cross-compilation",
> ++                     p->name);

But you do not handle include paths. We should error out if
BR_COMPILER_PARANOID_UNSAFE_PATH is set and non-empty, no?

BTW, I commented only one vrsion of each component, and the comments
apply to the other versions, of course.

Regards,
Yann E. MORIN.

> ++         }
> ++    }
> ++#endif
> + }
> + 
> + /* Use given -I paths for #include "..." but not #include <...>, and
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
