From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:50:19 +0100
Subject: [Buildroot] [PATCH v7 06/18] core: make host *-config scripts
 relocatable
In-Reply-To: <1457564339-27294-7-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20160310215019.27c72abc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Wed,  9 Mar 2016 23:58:47 +0100, Samuel Martin wrote:

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ffa21ee..845c8d3 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -207,6 +207,18 @@ $(BUILD_DIR)/%/.stamp_host_installed:
>  	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
>  	+$($(PKG)_INSTALL_CMDS)
>  	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
> +	$(Q)if test -n "$($(RAWNAME)_CONFIG_SCRIPTS)" ; then \

Using RAWNAME is not good here, because it prevents from having a
HOST_<pkg>_CONFIG_SCRIPTS value that is different from
<pkg>_CONFIG_SCRIPTS.

So, what you should do is:

 1/ Change the inner-generic-package macro to define
    HOST_<pkg>_CONFIG_SCRIPTS as having the value of
    <pkg>_CONFIG_SCRIPTS if not already defined. Like we do for the
    _SITE, _VERSION, _SOURCE, etc. variables.

 2/ Use $($(PKG)_CONFIG_SCRIPTS) here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
