From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Fri, 10 Jul 2009 16:26:39 -0000 (Europe/London)
Subject: [Buildroot] [PATCH] Add support for custom post-build script
Message-ID: <38210.172.16.221.10.1247243199.squirrel@172.16.0.251>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




I am currently building my app using the tools in staging_dir to
build my app then I mount the built ext2 from binaries cp my program on
and build a new ext2

Is there a standard why to do this .ie
this custom post-build

would it be possible to document how to
add a simple Hello World app.? So that it gets built? with
buildroot or have I missed somthing in the docs.

Thanks

Nick


> The config help text says it all:
> 
>   Specify a script to be run after the build has
finished and before
>   the BR2 starts packing the files into
selected packages.
> 
>   This gives users the oportunity
to do board-specific cleanups,
>   add-ons and the like, so the
generated files can be used directly
>   without further
processing.
> 
>   The script is called with the target
directory name as first and
>   only argument. Make sure the exit
code of that script is 0,
>   otherwise make will stop after
calling it.
> 
> Signed-off-by: Daniel Mack
<daniel@caiaq.de>
> Cc: Sven Neumann
<s.neumann@raumfeld.com>
> ---
>  Makefile         |
   4 ++++
>  target/Config.in |   15 +++++++++++++++
>  2
files changed, 19 insertions(+), 0 deletions(-)
> 
> diff
--git a/Makefile b/Makefile
> index 76dd2cd..dbeede5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -360,6 +360,10
@@ endif
>  	find $(TARGET_DIR) -type f -perm +111 | xargs
$(STRIPCMD) 2>/dev/null ||
> true
> 
	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
> 
>
+ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
>
+	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
> +endif
>
+
>  ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> 
LOCALE_WHITELIST=$(PROJECT_BUILD_DIR)/locales.nopurge
> 
LOCALE_NOPURGE=$(strip $(subst ",,$(BR2_ENABLE_LOCALE_WHITELIST)))
> diff --git a/target/Config.in b/target/Config.in
> index
87abbe6..dbdc2d6 100644
> --- a/target/Config.in
> +++
b/target/Config.in
> @@ -12,6 +12,21 @@ config
BR2_ROOTFS_SUFFIX
>  	help
>  	  Add a custom string to
the end of the root file system name.
> 
> +config
BR2_ROOTFS_POST_BUILD_SCRIPT
> +	string "Custom script to run
before packing files"
> +	default ""
>
+	help
> +	  Specify a script to be run after the build has
finished and before
> +	  the BR2 starts packing the files into
selected packages.
> +
> +	  This gives users the
oportunity to do board-specific cleanups,
> +	  add-ons and the
like, so the generated files can be used directly
> +	  without
further processing.
> +
> +	  The script is called with
the target directory name as first and
> +	  only argument. Make
sure the exit code of that script is 0,
> +	  otherwise make will
stop after calling it.
> +
>  comment "filesystem for
target device"
> 
>  source
"target/cramfs/Config.in"
> --
> 1.6.3.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
>
http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090710/2de3d73b/attachment.htm>
