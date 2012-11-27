From: John Tobias <john.tobias.ph@gmail.com>
Date: Tue, 27 Nov 2012 10:25:18 -0800
Subject: [Buildroot] Package Management
Message-ID: <CACUGKYNYvemiQqxvu03Pdzax8X2mxVKZhKy7CYbd9yq_gVkQYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

My package management support is working in generic-package,
pkg-autotools, pkg-cmake. By default, if you compile any libraries, it
will create a package file (.pkg) with or without modifying the .mk
file of the library, except for generic-package. I will provide a
patch file sometimes next week if you guys are interested to try it...

Right now, if I compile the busybox for example, I have to add the
function BUSYBOX_CREATE_PACKAGE_CMDS definition in the .mk file of the
busybox.

define BUSYBOX_CREATE_PACKAGE_CMDS

endif


So, in my pkg-generic.mk I added the following:

# Create package
$(BUILD_DIR)/%/.stamp_create_package:
@$(call MESSAGE,"Creating package")
$($(PKG)_CREATE_PACKAGE_CMDS)
$(foreach hook,$($(PKG)_POST_CREATE_PACKAGE_HOOKS),$(call $(hook))$(sep))
$(Q)touch $@


I need to check if the $(PKG)_CREATE_PACKAGE_CMDS exist or not in the
current building library, so I did the following:

# Create package
$(BUILD_DIR)/%/.stamp_create_package:
ifdef $(PKG)_CREATE_PACKAGE_CMDS
@$(call MESSAGE,"Creating package")
$($(PKG)_CREATE_PACKAGE_CMDS)
$(foreach hook,$($(PKG)_POST_CREATE_PACKAGE_HOOKS),$(call $(hook))$(sep))
endif
$(Q)touch $@


But, calling "ifdef $(PKG)_CREATE_PACKAGE_CMDS" to filter if the said
function is exist or not.

So my question is, how to check if the $(PKG)_CREATE_PACKAGE_CMDS is
exist or not?.

Regards,

john
