From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:40:04 +0200
Subject: [Buildroot] [PATCH v4 3/3] refpolicy: add ability to set
 default state.
In-Reply-To: <20170520204143.18154-3-Adamduskett@outlook.com>
References: <20170520204143.18154-1-Adamduskett@outlook.com>
 <20170520204143.18154-3-Adamduskett@outlook.com>
Message-ID: <20170606234004.0f3e612d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 May 2017 16:41:43 -0400, Adam Duskett wrote:
> SELinux requires a config file in /etc/selinux which controls the state
> of SELinux on the system.
> 
> This config file has two options set in it:
> SELINUX which set's the state of selinux on boot.
> SELINUXTYPE which should equal the name of the policy.  In this case, the
> default name is targeted.
> 
> This patch adds:
> - A choice menu on Config.in that allows the user to select a default
>   SELinux state.
> 
> - A basic config file that will be installed to
>   target/etc/selinux and will set SELINUX= to the selected state.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

I've applied, after doing a few changes as well.

> +choice
> +	prompt "SELinux default state"
> +	default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_ENFORCING
> +	bool "Enforcing"
> +	help
> +	  SELinux security policy is enforced
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +	bool "Permissive"
> +	help
> +	  SELinux prints warnings instead of enforcing
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_DISABLED
> +	bool "Disabled"
> +	help
> +	  No SELinux policy is loaded
> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_STATE
> +	string
> +	default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCING
> +	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLED

To be consistent with the other option, I've renamed all options to
BR2_PACKAGE_REFPOLICY_POLICY_STATE_xyz.

>  REFPOLICY_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/site-packages
> +REFPOLICY_NAME = "targeted"

This variable is unused, so I dropped it.

>  define REFPOLICY_INSTALL_TARGET_CMDS
>  	$(REFPOLICY_MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +	$(INSTALL) -m 0755 -D package/refpolicy/config \
> +		$(TARGET_DIR)/etc/selinux/config
> +
> +	$(SED) "/^SELINUX=/c\SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE)" \
> +		$(TARGET_DIR)/etc/selinux/config

And I've added a qstripped version this variable. So the code looks
like this:

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 4d85ee5..aab1877 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -31,6 +31,8 @@ REFPOLICY_MAKE = \
 
 REFPOLICY_POLICY_VERSION = \
        $(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_VERSION))
+REFPOLICY_POLICY_STATE = \
+       $(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
 define REFPOLICY_CONFIGURE_CMDS
        $(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
@@ -50,6 +52,10 @@ endef
 
 define REFPOLICY_INSTALL_TARGET_CMDS
        $(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+       $(INSTALL) -m 0755 -D package/refpolicy/config \
+               $(TARGET_DIR)/etc/selinux/config
+       $(SED) "/^SELINUX=/c\SELINUX=$(REFPOLICY_POLICY_STATE)" \
+               $(TARGET_DIR)/etc/selinux/config
 endef

Once again, please test that everything still works fine for you after
my changes.

Thanks a lot for this work on refpolicy.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
