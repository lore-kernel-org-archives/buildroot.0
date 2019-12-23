From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 22:05:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libsemanage: add option to
 manually define policy version
In-Reply-To: <20191215180003.2162894-1-aduskett@gmail.com>
References: <20191215180003.2162894-1-aduskett@gmail.com>
Message-ID: <20191223220514.1dd1fcaf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sun, 15 Dec 2019 10:00:03 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The semodule package derives the maximum SELinux policy version from
> the libsemanage library.
> 
> By default, libsemanage returns the highest supported policy version that
> libsepol supports found in include/sepol/policydb/policydb.h and not just from
> the Kernel. However, if the maximum supported SELinux policy version supported
> by the Kernel is lower than the maximum supported policy version from
> libsemanage, if a user attempts to build a policy using the semodule program,
> semodule fails when creating a policy with the error:
>   "policydb version X does not match my version range 15-X."
> 
> This default value may be overwrriten by setting the policy-version = line in
> /etc/semanage/semanage.conf.
> 
> Create an option that allows a user to overwrite the default policy version to
> ensure that semodule works on older kernels.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

So, I had a more serious look into this. I have some implementation
details which I fixed up locally, but then had some second thoughts.

The thing that made me wonder is that you are adding an option for the
*target* version of libsemanage, but it also affects libsemanage on the
host. But what if you don't have libsemanage on the target? I think it
is not mandatory to have it on the target. In this case, how would you
select the policy version ?

Ideally, the selection of the policy version should be chosen together
with the policy itself, or somewhere close to where the policy
compilation happens.

And it turns out we already have such an option that exists in Buildroot:

config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
        string "Policy version"
        default "30"

why don't we use this version ?

It's used in refpolicy.mk to create the build.conf:

define REFPOLICY_CONFIGURE_CMDS
        $(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
                $(@D)/build.conf

How does this interacts with libsemanage ?

I nevertheless give my minor implementation details below.

> +define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY_TARGET
> +	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
> +		$(TARGET_DIR)/etc/selinux/semanage.conf

This command can go directly in LIBSEMANAGE_INSTALL_TARGET_CMDS.

> +endef
> +define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY_HOST
> +	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
> +		$(HOST_DIR)/etc/selinux/semanage.conf

This command can go directly in HOST_LIBSEMANAGE_INSTALL_CMDS. The name
of the hook was not very well chosen in any case, as we prefer to have
HOST_ as a prefix rather than a suffix.

Again, these are minor details that I had fixed locally. It's really
the more fundamental questions above that makes me wonder what is the
right solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
