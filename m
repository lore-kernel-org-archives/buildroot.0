From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 03 Nov 2011 19:13:15 +0100
Subject: [Buildroot] [PATCH] sudo: optionally add user "default" to
	sudoers
In-Reply-To: <4EB0019D.3070701@relinux.de>
References: <CANVadiHajYSQyOY9VAVX9mL=ZW+3vgsra5SW76LjKZtPJneNcg@mail.gmail.com>
 <CAAXf6LX1JfKGScyO9v269rLEdbk8wf9UTiw_SHdQ=5XqKuJdDA@mail.gmail.com>
 <4EB0019D.3070701@relinux.de>
Message-ID: <4EB2D9BB.10701@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

my previously sent patch to add user "default" to sudoers fails when
/etc/sudoers.d/default already exists. Please find the corrected patch
below.

With kind regards

Stephan

Signed-off-by: Stephan Hoffmann <sho@relinux.de>

---
 package/sudo/Config.in |    9 +++++++++
 package/sudo/sudo.mk   |    9 +++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index fc0a175..59b6a93 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -7,3 +7,12 @@ config BR2_PACKAGE_SUDO
          but still allow people to get their work done.

          http://www.sudo.ws/sudo/
+
+if BR2_PACKAGE_SUDO
+
+config BR2_SUDO_ADD_DEFAULT
+       bool "add default user"
+       help
+         Add user "default" to sudoers file
+
+endif
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9c62c49..adc1c0d 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -15,10 +15,19 @@ SUDO_CONF_OPT = \
                --without-interfaces \
                --without-pam

+ifeq ($(BR2_SUDO_ADD_DEFAULT),y)
+define SUDO_ADD_DEFAULT
+       test -d $(TARGET_DIR)/etc/sudoers.d || mkdir $(TARGET_DIR)/etc/sudoers.d
+       test -f $(TARGET_DIR)/etc/sudoers.d/default || \
+               echo "default ALL = ALL" >$(TARGET_DIR)/etc/sudoers.d/default; \
+               chmod 0440 $(TARGET_DIR)/etc/sudoers.d/default
+endef
+endif
+
 define SUDO_INSTALL_TARGET_CMDS
        install -m 4555 -D $(@D)/sudo $(TARGET_DIR)/usr/bin/sudo
        install -m 0555 -D $(@D)/visudo $(TARGET_DIR)/usr/sbin/visudo
        install -m 0440 -D $(@D)/sudoers $(TARGET_DIR)/etc/sudoers
+       $(SUDO_ADD_DEFAULT)
 endef

 $(eval $(call AUTOTARGETS))
-- 1.7.0.4



Am 01.11.2011 15:26, schrieb Stephan Hoffmann:
> Hello all,
>
> I think that using a non privileged user even in embedded systems is a
> real good concept.
>
> To make things easier I made this little patch that generates a config
> option to add user "default" to the sudoers list when the package sudo
> is included in the system.
>
> Kind regards
>
> Stephan
>
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>
> ---
>  package/sudo/Config.in |    9 +++++++++
>  package/sudo/sudo.mk   |    9 +++++++++
>  2 files changed, 18 insertions(+), 0 deletions(-)
>
> diff --git a/package/sudo/Config.in b/package/sudo/Config.in
> index fc0a175..59b6a93 100644
> --- a/package/sudo/Config.in
> +++ b/package/sudo/Config.in
> @@ -7,3 +7,12 @@ config BR2_PACKAGE_SUDO
>           but still allow people to get their work done.
>
>           http://www.sudo.ws/sudo/
> +
> +if BR2_PACKAGE_SUDO
> +
> +config BR2_SUDO_ADD_DEFAULT
> +       bool "add default user"
> +       help
> +         Add user "default" to sudoers file
> +
> +endif
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 9c62c49..adc1c0d 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -15,10 +15,19 @@ SUDO_CONF_OPT = \
>                 --without-interfaces \
>                 --without-pam
>
> +ifeq ($(BR2_SUDO_ADD_DEFAULT),y)
> +define SUDO_ADD_DEFAULT
> +       mkdir $(TARGET_DIR)/etc/sudoers.d
> +       echo "default ALL = ALL" >$(TARGET_DIR)/etc/sudoers.d/default
> +       chmod 0440 $(TARGET_DIR)/etc/sudoers.d/default
> +endef
> +endif
> +
>  define SUDO_INSTALL_TARGET_CMDS
>         install -m 4555 -D $(@D)/sudo $(TARGET_DIR)/usr/bin/sudo
>         install -m 0555 -D $(@D)/visudo $(TARGET_DIR)/usr/sbin/visudo
>         install -m 0440 -D $(@D)/sudoers $(TARGET_DIR)/etc/sudoers
> +       $(SUDO_ADD_DEFAULT)
>  endef
>
>  $(eval $(call AUTOTARGETS))


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
