From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 May 2019 08:02:50 -0500
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: add new package
In-Reply-To: <1557085947-25842-1-git-send-email-pjtexier@koncepto.io>
References: <1557085947-25842-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <CANQCQpYFnEcyuYA=WRuaEpKx86VZT_Gyq-R-_BE4mLMfp86uUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 5, 2019 at 2:53 PM Pierre-Jean Texier <pjtexier@koncepto.io> wrote:
>
> Libubootenv is a library that provides a hardware independent
> way to access to U-Boot environment.
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/Config.in                                  |  1 +
>  ...w_printenv-remove-declaration-in-for-loop.patch | 53 ++++++++++++++++++++++
>  package/libubootenv/Config.in                      | 11 +++++
>  package/libubootenv/libubootenv.hash               |  2 +
>  package/libubootenv/libubootenv.mk                 | 14 ++++++
>  5 files changed, 81 insertions(+)
>  create mode 100644 package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
>  create mode 100644 package/libubootenv/Config.in
>  create mode 100644 package/libubootenv/libubootenv.hash
>  create mode 100644 package/libubootenv/libubootenv.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f592e74..b920554 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -458,6 +458,7 @@ endmenu
>         source "package/iucode-tool/Config.in"
>         source "package/kbd/Config.in"
>         source "package/lcdproc/Config.in"
> +       source "package/libubootenv/Config.in"
>         source "package/libuio/Config.in"
>         source "package/linuxconsoletools/Config.in"
>         source "package/linux-backports/Config.in"
> diff --git a/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
> new file mode 100644
> index 0000000..1ec908a
> --- /dev/null
> +++ b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
> @@ -0,0 +1,53 @@
> +From ffca94e6f84956838a2d88824b37fcd3b0d0694b Mon Sep 17 00:00:00 2001
> +From: Pierre-Jean Texier <pjtexier@koncepto.io>
> +Date: Sun, 5 May 2019 21:42:48 +0200
> +Subject: [PATCH] fw_printenv: remove declaration in for loop
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This commit fixes :
> +
> +src/fw_printenv.c:142:4: error: ?for? loop initial declarations are only allowed in C99 or C11 mode
> +    for (int i = 0; i < argc; i++) {
> +
> +Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> +[Upstream status: http://patchwork.ozlabs.org/patch/1092851/]
> +---
> + src/fw_printenv.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/fw_printenv.c b/src/fw_printenv.c
> +index 361d150..4236eaa 100644
> +--- a/src/fw_printenv.c
> ++++ b/src/fw_printenv.c
> +@@ -59,7 +59,7 @@ int main (int argc, char **argv) {
> +       char *cfgfname = NULL;
> +       char *defenvfile = NULL;
> +       char *scriptfile = NULL;
> +-      int c;
> ++      int c, i;
> +       int ret = 0;
> +       void *tmp;
> +       const char *name, *value;
> +@@ -139,7 +139,7 @@ int main (int argc, char **argv) {
> +                               fprintf(stdout, "%s=%s\n", name, value);
> +                       }
> +               } else {
> +-                      for (int i = 0; i < argc; i++) {
> ++                      for (i = 0; i < argc; i++) {
> +                               value = libuboot_get_env(ctx, argv[i]);
> +                               if (noheader)
> +                                       fprintf(stdout, "%s\n", value ? value : "");
> +@@ -151,7 +151,7 @@ int main (int argc, char **argv) {
> +               if (scriptfile)
> +                       libuboot_load_file(ctx, scriptfile);
> +               else {
> +-                      for (int i = 0; i < argc; i += 2) {
> ++                      for (i = 0; i < argc; i += 2) {
> +                               if (i + 1 == argc)
> +                                       libuboot_set_env(ctx, argv[i], NULL);
> +                               else
> +--
> +2.7.4
> +
> diff --git a/package/libubootenv/Config.in b/package/libubootenv/Config.in
> new file mode 100644
> index 0000000..9be52c4
> --- /dev/null
> +++ b/package/libubootenv/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBUBOOTENV
> +       bool "libubootenv"
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         libubootenv is a library that provides a hardware independent
> +         way to access to U-Boot environment.
> +
> +         The package provides the fw_printenv / fw_setenv utilities,
> +         new tools build from the library and not from U-Boot.

Curious why this project isn't just upstreaming changes to the u-boot
project.  I.e. Then the uboot-tools package already in Buildroot would
provide the latest u-boot tools with those updates.

> +
> +         https://github.com/sbabic/libubootenv/
> diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
> new file mode 100644
> index 0000000..79aaac7
> --- /dev/null
> +++ b/package/libubootenv/libubootenv.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 82c6966af5feae8726bd78a2cde4c4c2f69e81f8fdc548098063f8a35eaad090 libubootenv-8a7d4030bcb106de11632e85b6a0e7b7d4cb47af.tar.gz
> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> new file mode 100644
> index 0000000..d74e823
> --- /dev/null
> +++ b/package/libubootenv/libubootenv.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libubootenv
> +#
> +################################################################################
> +
> +LIBUBOOTENV_VERSION = 8a7d4030bcb106de11632e85b6a0e7b7d4cb47af
> +LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
> +LIBUBOOTENV_LICENSE = LGPL-2.1
> +LIBUBOOTENV_INSTALL_STAGING = YES
> +
> +LIBUBOOTENV_DEPENDENCIES += zlib
> +
> +$(eval $(cmake-package))
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
