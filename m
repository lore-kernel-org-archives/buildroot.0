From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 12 Mar 2015 09:36:10 +0100
Subject: [Buildroot] [PATCH v2 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <CA+TH9VnuGksMWzUWj6Va70bDVALSs-kiFy_SriYs6P638-AUBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-10 20:28 GMT+01:00 Emeric Vigier <emeric.vigier@savoirfairelinux.com>:
> If you had some files added to the targetfs (fs-overlay, new packages,
> ...) and you no longer need them, buildroot does not offer a simple way
> to remove these items from the output/target directory. The rule added
> by this commit allows you to clean the targetfs. Issuing 'make'
> afterward will generate a new and clean targetfs.
>
> A section in the documentation is also added. It describes few examples
> when developers could need it. 'make help' is also updated accordingly.
>
> Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Reviewed-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes v1 -> v2
>   - remove non-existent .built and deprecated .stamp_installed
>     references (suggested by Baruch Siach)
>   - mention the new target in 'make help'
> ---
>  Makefile                                |  5 +++++
>  docs/manual/advanced.txt                |  2 ++
>  docs/manual/clean-target-filesystem.txt | 37 +++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 docs/manual/clean-target-filesystem.txt
>
> diff --git a/Makefile b/Makefile
> index af043a3..45ad2aa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -679,6 +679,10 @@ graph-depends: graph-depends-requirements
>         |tee $(BASE_DIR)/graphs/$(@).dot \
>         |dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
>
> +clean-target:
> +       rm -rf $(TARGET_DIR) $(STAGING_DIR) $(BUILD_DIR)/.root \
> +               $(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>
>  all: menuconfig
> @@ -849,6 +853,7 @@ help:
>         @echo 'Cleaning:'
>         @echo '  clean                  - delete all files created by build'
>         @echo '  distclean              - delete all non-source files (including .config)'
> +       @echo '  clean-target           - delete targetfs, issuing make again will recreate it'
>         @echo
>         @echo 'Build:'
>         @echo '  all                    - make world'
> diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
> index b7bfc49..1cf0427 100644
> --- a/docs/manual/advanced.txt
> +++ b/docs/manual/advanced.txt
> @@ -14,3 +14,5 @@ include::download-location.txt[]
>  include::package-make-target.txt[]
>
>  include::using-buildroot-development.txt[]
> +
> +include::clean-target-filesystem.txt[]
> diff --git a/docs/manual/clean-target-filesystem.txt b/docs/manual/clean-target-filesystem.txt
> new file mode 100644
> index 0000000..0274474
> --- /dev/null
> +++ b/docs/manual/clean-target-filesystem.txt
> @@ -0,0 +1,37 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +==== Clean target filesystem
> +
> +There are various cases where you would like to clean the target
> +filesystem. Especially once you understood that buildroot build system
> +is kept simple, and does not allow to uninstall files. Let's take some
> +examples:
> +
> +1. You enabled +PACKAGE_OPENSSH+ to have a SSH server running on your
> +   board. But you figure out that +sshd+ does not run well on your
> +   target's architecture. Thus you decide to disable +PACKAGE_OPENSSH+
> +   and enable +PACKAGE_DROPBEAR+ instead. You run +make+, +openssh+
> +   gets built and installed. Problem: +openssh+ files are still present
> +   in +output/target+!
> +
> +2. You enabled +PACKAGE_NTPD+ and set the local timezone to
> +   +America/Montreal+ with +BR2_TARGET_LOCALTIME+ config. Then you find
> +   out that +Montreal+ local has been replaced by +Toronto+ (French
> +   looks like a rogue language). You enter +make menuconfig+, make the
> +   change, save, and run +make+ again. Problem:
> +   +output/target/etc/timezone+ still has +America/Montreal+ content!
> +
> +Solution to this is either to identify which package to reconfigure, or
> +remove files manually, or destroy the target filesystem and recreate it.
> +This latter option is convenient: you don't have to care about which
> +packages to rebuild, and it is fast. Here is how to recreate your
> +target filesystem, and get rid of filesystem _stains_:
> +
> +------------------
> +make clean-target
> +make
> +------------------
> +
> ++clean-target+ removes +output/target+, tells buildroot to recreate the
> +target skeleton, and install each package again.
> --
> 1.9.1

This patch works for me, I think the documentation is well written and usefull.

Sincerely, Angelo.

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
