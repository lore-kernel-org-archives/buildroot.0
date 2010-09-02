From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Sep 2010 16:10:58 +0200
Subject: [Buildroot] RFC: Getting rid of old-style hooks
Message-ID: <20100902161058.4ea7d8df@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Sorry, long presentation, the question is at the end)

I've started working on getting rid of the old-style hooks, i.e the
hooks defined this way :

====================================================================
[...]
$(eval $(call AUTOTARGETS,package,bind))

$(BIND_HOOK_POST_INSTALL):
	rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
endif
	touch $@
====================================================================

to the new style hooks :

====================================================================
[...]

define BIND_TARGET_INSTALL_FIXES
        rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
        $(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
endef

BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_INSTALL_FIXES

define BIND_TARGET_REMOVE_TOOLS
        rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
endef

ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
endif
====================================================================

I've done the work for all remaining old-style hooks, which also to get
rid of the support for these in the package infrastructure. This work,
composed of 70+ commits, is visible at :

 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=for-2010.11/remove-oldstyle-hooks

However, I have a question concerning these new style hooks. Since we
can't use make conditionals inside variable definitions, it is not
possible to write:

====================================================================
define FOOBAR_REMOVE_STUFF
	rm $(TARGET_DIR)/usr/bin/foo
ifneq($(FOOBAR_INSTALL_BAR),y)
	rm $(TARGET_DIR)/usr/bin/bar
endif
endef

FOOBAR_POST_INSTALL_TARGET_HOOKS += FOOBAR_REMOVE_STUFF
====================================================================

and we instead have to write:

====================================================================
define FOOBAR_REMOVE_FOO
	rm $(TARGET_DIR)/usr/bin/foo
endef

FOOBAR_POST_INSTALL_TARGET_HOOKS += FOOBAR_REMOVE_FOO

define FOOBAR_REMOVE_BAR
	rm $(TARGET_DIR)/usr/bin/bar
endef

ifneq($(FOOBAR_INSTALL_BAR),y)
FOOBAR_POST_INSTALL_TARGET_HOOKS += FOOBAR_REMOVE_BAR
endif
====================================================================

or

====================================================================
ifneq($(FOOBAR_INSTALL_BAR),y)
define FOOBAR_REMOVE_BAR
	rm $(TARGET_DIR)/usr/bin/bar
endef
endif

define FOOBAR_REMOVE_STUFF
	rm $(TARGET_DIR)/usr/bin/foo
	$(FOOBAR_REMOVE_BAR)
endef

FOOBAR_POST_INSTALL_TARGET_HOOKS += FOOBAR_REMOVE_STUFF
====================================================================

In other words, the conditional is placed on the assignment adding the
hook to the <pkg>_POST_INSTALL_TARGET_HOOKS list of hooks. This is the
only solution possible today with the current package infrastructure,
and is the one I've used in the patch set mentioned above.

However, there is another possible solution, on which I'd like to have
your opinion. Instead of having a list <pkg>_POST_INSTALL_TARGET_HOOKS
which contains the list of hooks to call, we could directly make the
package infrastructure call all hooks that are prefixed by
<pkg>_POST_INSTALL_TARGET_HOOK_. So, the above example would become:

====================================================================
define FOOBAR_POST_INSTALL_TARGET_HOOK_REMOVE_FOO
	rm $(TARGET_DIR)/usr/bin/foo
endef

ifneq($(FOOBAR_INSTALL_BAR),y)
define FOOBAR_POST_INSTALL_TARGET_HOOK_REMOVE_BAR
	rm $(TARGET_DIR)/usr/bin/bar
endef
endif
===================================================================

Which is a little bit shorter. In terms of implementation in the
package infrastructure, it is almost as simple as the current solution.
For example, for the post extract hook, the change would be:

-       $(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+       $(foreach hook,$(filter $(PKG)_POST_EXTRACT_HOOK_%, $(.VARIABLES)),$(call $(hook))$(sep))

However, a major difference is the call order:

 * With the current solution, hooks are called in the order they are
   defined in the .mk file

 * With the new proposed solution, hooks are called in the reverse
   order of their definition in the .mk file. In the case of hooks
   having dependencies between each other, this may be strange (but do
   we really have such cases today, and do we want to support such
   strange cases ?)

Which solution do you prefer ?

Another point is that in the generic package infrastructure, when
defining the commands to be executed in a step, there is also a single
variable that must be assigned, so we have more or less the same
problem. For example, with wpa_supplicant, I had to do something like :

===================================================================
ifeq ($(BR2_PACKAGE_LIBNL),y)
        WPA_SUPPLICANT_DEPENDENCIES += libnl
        WPA_SUPPLICANT_LIBNL_CONFIG = \
                echo "CONFIG_DRIVER_NL80211=y" >>$(WPA_SUPPLICANT_CONFIG)
endif

define WPA_SUPPLICANT_CONFIGURE_CMDS
        cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
        echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
        echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
        echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
        $(SED) "s/\/local//" $(@D)/wpa_supplicant/Makefile
        $(WPA_SUPPLICANT_LIBNL_CONFIG)
endef
===================================================================

I.e, the conditional part has to be taken care by a separate variable.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
