From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 17:52:38 +0100
Subject: [Buildroot] [PATCH/next v2 1/4] package/openrc: drop custom
 getty service
In-Reply-To: <20200301151747.25723-2-unixmania@gmail.com>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-2-unixmania@gmail.com>
Message-ID: <20200311165238.GL5357@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> In Buildroot getty is provided by BusyBox or util-linux (agetty). Both
> create a /sbin/getty symlink pointing to the actual program, so make the
> agetty service use that path instead of /sbin/agetty.
> 
> Also start agetty after all other services, to prevent mixing startup
> messages with the getty prompt on devices with a single serial console.
> 
> This allows us to drop the custom getty service, which causes an error
> message from openrc 0.42.1 (in a forthcoming patch):
> 
>     Error: getty is the name of a real and virtual service.
> 
> The patches are required because it's not possible to override the
> command or startup order by means of a configuration file. Anyway it's
> still better to patch something maintained upstream than depending on a
> custom piece that may easily become obsolete.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, thanks.

It is to be noted, however, that util-linux' agetty is optional (with
BR2_PACKAGE_UTIL_LINUX_AGETTY), but the problem was pre-existing, so
it's not a problem of your patch.

I wonder anyway if we should not try to fix that somehow?

Regards,
Yann E. MORIN.

> ---
> CC: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...ty-replace-sbin-agetty-by-sbin-getty.patch | 33 +++++++++++++++++++
>  ...getty-start-agetty-after-all-sevices.patch | 29 ++++++++++++++++
>  package/openrc/getty                          | 24 --------------
>  package/openrc/openrc.mk                      |  8 ++---
>  4 files changed, 65 insertions(+), 29 deletions(-)
>  create mode 100644 package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch
>  create mode 100644 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch
>  delete mode 100755 package/openrc/getty
> 
> diff --git a/package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch b/package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch
> new file mode 100644
> index 0000000000..feeff22254
> --- /dev/null
> +++ b/package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch
> @@ -0,0 +1,33 @@
> +From b39ab180358ed451eae9df900f49a72ef1eb7442 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <unixmania@gmail.com>
> +Date: Sun, 1 Mar 2020 09:04:48 -0300
> +Subject: [PATCH] init.d/agetty: replace /sbin/agetty by /sbin/getty
> +
> +In Buildroot getty is provided by BusyBox or util-linux (agetty). Both
> +create a /sbin/getty symlink pointing to the actual program, so make the
> +agetty service use that path instead of /sbin/agetty.
> +
> +The patch is required because it's not possible to override the command
> +by means of a configuration file.
> +
> +Signed-off-by: Carlos Santos <unixmania@gmail.com>
> +---
> + init.d/agetty.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/init.d/agetty.in b/init.d/agetty.in
> +index e4866f7a..e1864628 100644
> +--- a/init.d/agetty.in
> ++++ b/init.d/agetty.in
> +@@ -14,7 +14,7 @@ supervisor=supervise-daemon
> + port="${RC_SVCNAME#*.}"
> + respawn_period="${respawn_period:-60}"
> + term_type="${term_type:-linux}"
> +-command=/sbin/agetty
> ++command=/sbin/getty
> + command_args_foreground="${agetty_options} ${port} ${baud} ${term_type}"
> + pidfile="/run/${RC_SVCNAME}.pid"
> + 
> +-- 
> +2.18.2
> +
> diff --git a/package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch b/package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch
> new file mode 100644
> index 0000000000..f1c927a450
> --- /dev/null
> +++ b/package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch
> @@ -0,0 +1,29 @@
> +From c2dc04f6b8c6784941b896e0b17c160dd43a566f Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <unixmania@gmail.com>
> +Date: Sun, 1 Mar 2020 11:14:37 -0300
> +Subject: [PATCH] init.d/agetty: start agetty after all services
> +
> +This is required for Buildroot, to prevent mixing service initialization
> +messages with the getty prompt on devices with a single serial console.
> +
> +Signed-off-by: Carlos Santos <unixmania@gmail.com>
> +---
> + init.d/agetty.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/init.d/agetty.in b/init.d/agetty.in
> +index e1864628..a1ad4e9f 100644
> +--- a/init.d/agetty.in
> ++++ b/init.d/agetty.in
> +@@ -19,7 +19,7 @@ command_args_foreground="${agetty_options} ${port} ${baud} ${term_type}"
> + pidfile="/run/${RC_SVCNAME}.pid"
> + 
> + depend() {
> +-	after local
> ++	after *
> + 	keyword -prefix
> + 	provide getty
> + }
> +-- 
> +2.18.2
> +
> diff --git a/package/openrc/getty b/package/openrc/getty
> deleted file mode 100755
> index 8fcb071f8a..0000000000
> --- a/package/openrc/getty
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -#!/sbin/openrc-run
> -# based on agetty service from OpenRC package
> -
> -description="start getty on terminal"
> -supervisor=supervise-daemon
> -port="${RC_SVCNAME#*.}"
> -term_type="${term_type:-linux}"
> -command=/sbin/getty
> -command_args_foreground="${getty_options} ${baud} ${port} ${term_type}"
> -pidfile="/run/${RC_SVCNAME}.pid"
> -
> -depend() {
> -	# start getty at the very end of init
> -	after *
> -	keyword -prefix
> -}
> -
> -start_pre() {
> -	export EINFO_QUIET="${quiet:-yes}"
> -}
> -
> -stop_pre() {
> -	export EINFO_QUIET="${quiet:-yes}"
> -}
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 1f8516f5ee..ce0b05e965 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -68,17 +68,15 @@ endef
>  OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_REMOVE_UNNEEDED
>  
>  ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> -OPENRC_GETTY_SVCNAME = getty.$(SYSTEM_GETTY_PORT)
> +OPENRC_GETTY_SVCNAME = agetty.$(SYSTEM_GETTY_PORT)
>  OPENRC_GETTY_CONF_D = $(TARGET_DIR)/etc/conf.d/$(OPENRC_GETTY_SVCNAME)
>  define OPENRC_SET_GETTY
>  	{ \
>  		echo "baud=\"$(SYSTEM_GETTY_BAUDRATE)\""; \
>  		echo "term_type=\"$(SYSTEM_GETTY_TERM)\"" ; \
> -		echo "getty_options=\"-L $(SYSTEM_GETTY_OPTIONS)\""; \
> +		echo "agetty_options=\"-L $(SYSTEM_GETTY_OPTIONS)\""; \
>  	} > $(OPENRC_GETTY_CONF_D)
> -	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/getty \
> -		$(TARGET_DIR)/etc/init.d/getty
> -	ln -sf getty $(TARGET_DIR)/etc/init.d/$(OPENRC_GETTY_SVCNAME)
> +	ln -sf agetty $(TARGET_DIR)/etc/init.d/$(OPENRC_GETTY_SVCNAME)
>  	ln -sf /etc/init.d/$(OPENRC_GETTY_SVCNAME) \
>  		$(TARGET_DIR)/etc/runlevels/default/$(OPENRC_GETTY_SVCNAME)
>  endef
> -- 
> 2.18.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
