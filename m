From: Julien Letessier <julien.letessier@technosens.fr>
Date: Fri, 22 Jun 2007 23:58:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
In-Reply-To: <20070622190151.09C9D48673@busybox.net>
References: <20070622190151.09C9D48673@busybox.net>
Message-ID: <f0528b5b0706221458w11b681a6q4029cc57b8871077@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Almost exactly what I was about to submit  :)
(my builds were broken)

Extra patch:
- replace $(STAGING_DIR)/ccache-bin with a $(CCACHE_PATH) variable
(lower redundandy)
- define CCACHE_PATH to be under usr/libexec, which is more LSB-ish.

2007/6/22, aldot at uclibc.org <aldot@uclibc.org>:
> Author: aldot
> Date: 2007-06-22 12:01:48 -0700 (Fri, 22 Jun 2007)
> New Revision: 18897
>
> Log:
> - fixup ccache to know about usr/bin
>
>
> Modified:
>    trunk/buildroot/toolchain/ccache/ccache.mk
>
>
> Changeset:
> Modified: trunk/buildroot/toolchain/ccache/ccache.mk
> ===================================================================
> --- trunk/buildroot/toolchain/ccache/ccache.mk  2007-06-22 17:49:14 UTC (rev 18896)
> +++ trunk/buildroot/toolchain/ccache/ccache.mk  2007-06-22 19:01:48 UTC (rev 18897)
> @@ -46,7 +46,7 @@
>         $(MAKE) CC="$(HOSTCC)" -C $(CCACHE_DIR1)
>
>  $(STAGING_DIR)/$(CCACHE_TARGET_BINARY): $(CCACHE_DIR1)/$(CCACHE_BINARY)
> -       mkdir -p $(STAGING_DIR)/usr/bin;
> +       mkdir -p $(STAGING_DIR)/usr/bin
>         cp $(CCACHE_DIR1)/ccache $(STAGING_DIR)/usr/bin
>         # Keep the actual toolchain binaries in a directory at the same level.
>         # Otherwise, relative paths for include dirs break.
> @@ -55,23 +55,23 @@
>                 ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc; \
>                 ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
>                 ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc);
> -       [ -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc ] && \
> -               mv $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin-ccache/
> -       (cd $(STAGING_DIR)/bin; \
> -               ln -fs ../usr/bin/ccache $(GNU_TARGET_NAME)-cc; \
> -               ln -fs ../usr/bin/ccache $(GNU_TARGET_NAME)-gcc; \
> -               ln -fs ../usr/bin/ccache $(REAL_GNU_TARGET_NAME)-cc; \
> -               ln -fs ../usr/bin/ccache $(REAL_GNU_TARGET_NAME)-gcc);
> +       [ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc ] && \
> +               mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin-ccache/
> +       (cd $(STAGING_DIR)/usr/bin; \
> +               ln -fs ccache $(GNU_TARGET_NAME)-cc; \
> +               ln -fs ccache $(GNU_TARGET_NAME)-gcc; \
> +               ln -fs ccache $(REAL_GNU_TARGET_NAME)-cc; \
> +               ln -fs ccache $(REAL_GNU_TARGET_NAME)-gcc);
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> -       [ -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-c++ ] && \
> -               mv $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin-ccache/
> -       [ -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-g++ ] && \
> -               mv $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin-ccache/
> -       (cd $(STAGING_DIR)/bin; \
> -               ln -fs ../usr/bin/ccache $(GNU_TARGET_NAME)-c++; \
> -               ln -fs ../usr/bin/ccache $(GNU_TARGET_NAME)-g++;\
> -               ln -fs ../usr/bin/ccache $(REAL_GNU_TARGET_NAME)-c++; \
> -               ln -fs ../usr/bin/ccache $(REAL_GNU_TARGET_NAME)-g++);
> +       [ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ ] && \
> +               mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin-ccache/
> +       [ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ ] && \
> +               mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin-ccache/
> +       (cd $(STAGING_DIR)/usr/bin; \
> +               ln -fs ccache $(GNU_TARGET_NAME)-c++; \
> +               ln -fs ccache $(GNU_TARGET_NAME)-g++;\
> +               ln -fs ccache $(REAL_GNU_TARGET_NAME)-c++; \
> +               ln -fs ccache $(REAL_GNU_TARGET_NAME)-g++);
>         (cd $(STAGING_DIR)/bin-ccache; \
>                 ln -fs $(REAL_GNU_TARGET_NAME)-c++ $(GNU_TARGET_NAME)-c++; \
>                 ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++);
> @@ -80,27 +80,27 @@
>  ccache: gcc $(STAGING_DIR)/$(CCACHE_TARGET_BINARY)
>
>  ccache-clean:
> -       rm -rf  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-cc
> -       rm -rf  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-gcc
> -       rm -rf  $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-cc
> -       rm -rf  $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc
> +       rm -rf  $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc
> +       rm -rf  $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
> +       rm -rf  $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc
> +       rm -rf  $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
>         if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ] ; then \
> -               mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin/; \
> -               (cd $(STAGING_DIR)/bin; \
> +               mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/bin/; \
> +               (cd $(STAGING_DIR)/usr/bin; \
>                     ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
>                     ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
>                     ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc); \
>         fi;
>         if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ] ; then \
> -               rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-c++; \
> -               mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin/; \
> +               rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++; \
> +               mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/usr/bin/; \
>         fi;
>         if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ] ; then \
> -               rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-g++; \
> -               mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin/; \
> +               rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++; \
> +               mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/usr/bin/; \
>         fi;
>         rm -rf  $(STAGING_DIR)/bin-ccache/*
> -       (cd $(STAGING_DIR)/bin; \
> +       (cd $(STAGING_DIR)/usr/bin; \
>                 ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-c++; \
>                 ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++;\
>                 ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(REAL_GNU_TARGET_NAME)-c++);
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ccache-lsb.patch
Type: application/octet-stream
Size: 3927 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070622/5b2f7752/attachment.obj 
