From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 22:02:50 +0100
Subject: [Buildroot] [PATCH 14/14] ejabberd: Bump to version 17.11
In-Reply-To: <20180116140649.7381-15-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
 <20180116140649.7381-15-johan.oudinet@gmail.com>
Message-ID: <20180116220250.483dff36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 15:06:49 +0100, Johan Oudinet wrote:
> * Adapt all patches.
> * Use the new configure option enable-system-deps even though there is
>   still a patch needed to correct includes.
> * Disable graphics to not depends on X libraries. Disable also
>   mod_avatar from the default loaded modules, since this module
>   requires graphics enabled.
> * Add a configure option to specify the Erlang cookie for users that do
>   not want a random cookie generated at first boot.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Thanks for this update! Can I apply all the erlang package version
bumps, even if I don't apply the ejabberd bump ?

More questions/comments below.


> diff --git a/package/ejabberd/0004-correct-includes.patch b/package/ejabberd/0004-correct-includes.patch
> new file mode 100644
> index 0000000000..812bf6c5be
> --- /dev/null
> +++ b/package/ejabberd/0004-correct-includes.patch
> @@ -0,0 +1,1909 @@
> +From 0487178693143955ff57e3c9371fb6e7b164294c Mon Sep 17 00:00:00 2001
> +From: Johan Oudinet <johan.oudinet@gmail.com>
> +Date: Thu, 11 Jan 2018 12:49:38 +0100
> +Subject: [PATCH] correct includes
> +
> +This part of the code was moved into it's own project and was packaged
> +separately by me. To make the build process work, this small fix is
> +necessary.
> +Author: Philipp Huebner <debalance@debian.org>
> +
> +Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

It is not entirely clear: is this patch already upstream?

> +if BR2_PACKAGE_EJABBERD
> +
> +config BR2_PACKAGE_EJABBERD_ERLANG_COOKIE
> +	string "Erlang cookie"
> +	help
> +	  An alphanumeric string used by Erlang to authenticate nodes.
> +	  If empty, erlang creates a random cookie at first execution.

Just curious, why is the Erlang cookie part of the Ejabberd
configuration?


> +# Install an Erlang cookie if any is provided.
> +ifneq ($(call qstrip,$(BR2_PACKAGE_EJABBERD_ERLANG_COOKIE)),)
> +define EJABBERD_INSTALL_ERLANG_COOKIE
> +	echo $(BR2_PACKAGE_EJABBERD_ERLANG_COOKIE) \

Don't you need to $(call qstrip,...) the variable to remove the double
quotes around the value ?

> +	>'$(TARGET_DIR)/var/lib/ejabberd/.erlang.cookie'

Why is this path between single quotes ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
