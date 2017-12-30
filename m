From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 14:07:11 +0100
Subject: [Buildroot] [PATCH 2/3] package/brltty: use gcc instead of ld
 to link shared objects
In-Reply-To: <20171230104804.16489-2-mlang@blind.guru>
References: <20171230104804.16489-1-mlang@blind.guru>
 <20171230104804.16489-2-mlang@blind.guru>
Message-ID: <20171230130711.GB2921@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario, All,

On 2017-12-30 11:48 +0100, Mario Lang spake thusly:
> Fixes:
>   http://autobuild.buildroot.net/results/2419741c43dea0f91859c19167c8d65cb54e1470
>   http://autobuild.buildroot.net/results/4b83e53c718520661dc99cde2121f69ce3fd08d7
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  .../0003-Remove-MKOBJ-in-favour-of-MKMOD.patch     | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
> 
> diff --git a/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch b/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
> new file mode 100644
> index 0000000000..d836652850
> --- /dev/null
> +++ b/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
> @@ -0,0 +1,63 @@
> +From b3b0e47015e9162f519730789976157c7cc38178 Mon Sep 17 00:00:00 2001
> +From: Mario Lang <mlang@delysid.org>
> +Date: Fri, 29 Dec 2017 14:52:37 +0100
> +Subject: [PATCH] Remove MKOBJ in favour of MKMOD. (ml)
> +
> +Calling ld directly can lead to problems when cross-compiling.

Since this is a backport of an upstream commit, we like to have a
pointer to the upstream commit:

    https://github.com/brltty/brltty/commit/4c8aba42e246b96d10ffcbd57653682375499e46

Also, since you are patching configure.ac, you must autoreconf:

    BRLTTY_AUTORECONF = YES

However, as a backport for Buildroot, I would just keep the diff about
Drivers/Braille/EuroBraille/Makefile.in and drop the rest of the diff,
which would no longer require running autoreconf.

Regards,
Yann E. MORIN.

> +Signed-off-by: Mario Lang <mlang@blind.guru>
> +---
> + Drivers/Braille/EuroBraille/Makefile.in |  2 +-
> + config.mk.in                            |  1 -
> + configure.ac                            | 10 ----------
> + 3 files changed, 1 insertion(+), 12 deletions(-)
> +
> +diff --git a/Drivers/Braille/EuroBraille/Makefile.in b/Drivers/Braille/EuroBraille/Makefile.in
> +index 0500aa70e..ce8a3d1a4 100644
> +--- a/Drivers/Braille/EuroBraille/Makefile.in
> ++++ b/Drivers/Braille/EuroBraille/Makefile.in
> +@@ -28,7 +28,7 @@ SRC_FILES = eu_braille.c eu_clio.c eu_esysiris.c
> + OBJ_FILES = $(SRC_FILES:.c=.$O)
> + 
> + braille.$O: $(OBJ_FILES)
> +-	$(MKOBJ)  $@ $(OBJ_FILES)
> ++	$(MKMOD)  $@ $(OBJ_FILES)
> + 
> + %.$O: $(SRC_DIR)/%.c
> + 	$(CC) $(BRL_CFLAGS) -o $@ -c $<
> +diff --git a/config.mk.in b/config.mk.in
> +index 686f547e6..8d1da79b4 100644
> +--- a/config.mk.in
> ++++ b/config.mk.in
> +@@ -250,7 +250,6 @@ LD = @LD@
> + LDFLAGS = @LDFLAGS@
> + LDLIBS = $(ICU_LIBS) $(POLKIT_LIBS) $(SYSTEM_LIBS) @LIBS@
> + 
> +-MKOBJ = @MKOBJ@
> + MKMOD = @MKMOD@
> + MKLIB = @MKLIB@
> + CONFLIBDIR = @CONFLIBDIR@
> +diff --git a/configure.ac b/configure.ac
> +index 07119dd9f..ad80b8d60 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -428,16 +428,6 @@ AC_SUBST([can_make_manual])
> + test "${DOXYGEN}" = "false" && can_make_BrlAPIref=no || can_make_BrlAPIref=yes
> + AC_SUBST([can_make_BrlAPIref])
> + 
> +-AC_CACHE_CHECK([for make relocatable object command], [brltty_cv_prog_mkobj], [dnl
> +-case "${host_os}"
> +-in
> +-   *)
> +-      brltty_cv_prog_mkobj="\$(LD) -r -o"
> +-      ;;
> +-esac])
> +-MKOBJ="${brltty_cv_prog_mkobj}"
> +-AC_SUBST([MKOBJ])
> +-
> + AC_CACHE_CHECK([for loadable module creation command], [brltty_cv_prog_mkmod], [dnl
> + case "${host_os}"
> + in
> +-- 
> +2.15.0
> +
> -- 
> 2.15.0
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
