From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:45:54 +0100
Subject: [Buildroot] [PATCH v6 06/13] core: make host *-config scripts
 relocatable
In-Reply-To: <1454342021-22960-7-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20160201194554.743ace10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon,  1 Feb 2016 16:53:34 +0100, Samuel Martin wrote:

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1bf613e..ca79450 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -207,6 +207,18 @@ $(BUILD_DIR)/%/.stamp_host_installed:
>  	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
>  	+$($(PKG)_INSTALL_CMDS)
>  	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
> +	$(Q)if test -n "$($(RAWNAME)_CONFIG_SCRIPTS)" ; then \

So you're testing if the current package has defined some
<pkg>_CONFIG_SCRIPTS variable....

> +		$(call MESSAGE,"Fixing package configuration files") ;\
> +			ls $(HOST_DIR)/usr/bin/*-config 2>/dev/null |\

But do the replacement on all *-config scripts ?

This doesn't look good, and I think we should be changing just the ones
that are in <pkg>_CONFIG_SCRIPTS.

I read your commit log saying that this is a bit complicated due to
some packages installing config scripts whose name depend on the host
system. Can you give some specific examples to see if we can address
this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
