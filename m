From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 May 2017 12:59:46 -0500
Subject: [Buildroot] [PATCH 3/3] refpolicy: add ability to set default
	state.
In-Reply-To: <20170510174700.30734-3-aduskett@codeblue.com>
References: <20170510174700.30734-1-aduskett@codeblue.com>
 <20170510174700.30734-3-aduskett@codeblue.com>
Message-ID: <CANQCQpZyRPQdrhDuU00b1uZ9tNTqTgJUqR3+BcdiQv89Eocbsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Wed, May 10, 2017 at 12:47 PM, Adam Duskett <aduskett@gmail.com> wrote:
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

Similar patchset submitted here:
https://patchwork.ozlabs.org/patch/711537/
https://patchwork.ozlabs.org/patch/711536/

> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/refpolicy/Config.in    | 25 +++++++++++++++++++++++++
>  package/refpolicy/config       |  9 +++++++++
>  package/refpolicy/refpolicy.mk |  6 ++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 package/refpolicy/config
>
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> index e12222e..b6f86d3 100644
> --- a/package/refpolicy/Config.in
> +++ b/package/refpolicy/Config.in
> @@ -33,5 +33,30 @@ if BR2_PACKAGE_REFPOLICY
>  config BR2_PACKAGE_REFPOLICY_VERSION
>         string "Policy version"
>         default "30"
> +choice
> +       prompt "SELinux default state"
> +       default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_ENFORCING
> +       bool "Enforcing"
> +       help
> +         SELinux security policy is enforced
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +       bool "Permissive"
> +       help
> +         SELinux prints warnings instead of enforcing
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_DISABLED
> +       bool "Disabled"
> +       help
> +         No SELinux policy is loaded
> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_STATE
> +       string
> +       default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +       default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCING
> +       default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLED
>
>  endif
> diff --git a/package/refpolicy/config b/package/refpolicy/config
> new file mode 100644
> index 0000000..a45a349
> --- /dev/null
> +++ b/package/refpolicy/config
> @@ -0,0 +1,9 @@
> +# This file controls the state of SELinux on the system.
> +# SELINUX= can take one of these three values:
> +#     enforcing - SELinux security policy is enforced.
> +#     permissive - SELinux prints warnings instead of enforcing.
> +#     disabled - No SELinux policy is loaded.
> +SELINUX=disabled
> +
> +SELINUXTYPE=targeted
> +
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index 1eb0c54..c982014 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -23,6 +23,7 @@ REFPOLICY_DEPENDENCIES += \
>         policycoreutils
>
>  REFPOLICY_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/site-packages
> +REFPOLICY_NAME = "targeted"
>
>  # Cannot use multiple threads to build the reference policy
>  REFPOLICY_MAKE = PYTHON="$(HOST_DIR)/usr/bin/python2" $(TARGET_MAKE_ENV) $(MAKE1)
> @@ -44,6 +45,11 @@ endef
>
>  define REFPOLICY_INSTALL_TARGET_CMDS
>         $(REFPOLICY_MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +       $(INSTALL) -m 0755 -D package/refpolicy/config \
> +               $(TARGET_DIR)/etc/selinux/config
> +
> +       $(SED) "/^SELINUX=/c\SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE)" \
> +               $(TARGET_DIR)/etc/selinux/config
>  endef
>
>  $(eval $(generic-package))
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
