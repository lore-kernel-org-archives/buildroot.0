From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:32:50 +0200
Subject: [Buildroot] [PATCH v4 2/3] refpolicy add ability to specify
 policy version
In-Reply-To: <20170520204143.18154-2-Adamduskett@outlook.com>
References: <20170520204143.18154-1-Adamduskett@outlook.com>
 <20170520204143.18154-2-Adamduskett@outlook.com>
Message-ID: <20170606233250.1d18dc9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 May 2017 16:41:42 -0400, Adam Duskett wrote:
> Refpolicy by default will build the highest version supported.
> This may cause older kernels to not load the policy.
> 
> This patch adds a custom policy version string which is defaulted
> to 30, which is the highest supported as of today.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

I've applied, after doing some minor changes. See below.


> +config BR2_PACKAGE_REFPOLICY_VERSION

I've renamed this option to:

   BR2_PACKAGE_REFPOLICY_POLICY_VERSION

see below why.

> +	string "Policy version"
> +	default "30"
> +
> +endif
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index 117e570..fa02b5a 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -32,7 +32,7 @@ REFPOLICY_MAKE = \
>  	$(MAKE1)
>  
>  define REFPOLICY_CONFIGURE_CMDS
> -	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
> +	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(BR2_PACKAGE_REFPOLICY_VERSION)" $(@D)/build.conf

This adds some double quotes which were not present before. And we
normally qstrip string Config.in options in Buildroot.

If I had kept your original Config.in option name, it would have given

REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_VERSION))

except that REFPOLICY_VERSION would override the version of the package.

So I've changed the code to:

+REFPOLICY_POLICY_VERSION = \
+       $(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_VERSION))
+
 define REFPOLICY_CONFIGURE_CMDS
-       $(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
+       $(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
+               $(@D)/build.conf
        $(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
        $(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
 endef

Please check that everything still works fine for you.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
