From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 13 Feb 2013 17:14:21 +0100
Subject: [Buildroot] disable downloaded source cache
Message-ID: <CAKAx1cjcxkBq67w_DV7sFK_Z+7X9+WkMuEkVWiswWgsq-Eskig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I am experimenting with the BR2_ROOTFS_OVERLAY feature which works
great for me to add my overlay before image creation.

My overlay is versioned with git, and I would like however to allow
automatic synchronisation (pull or even clone, the repository is very
small) with my remote each time I simply do 'make'. The overlay
feature only copies a folder content, but does not allow updating the
source folder content from a site (I perfectly understand it is not
its purpose and the feature must be kept simple).

For now, here is how I did this:
- I set up BR2_ROOTFS_OVERLAY="$(XXX_OVERLAY_DIR)"
- I created a package 'xxx_overlay' with the following content:

package/xxx_overlay/xxx_overlay.mk:

#############################################################
#
# xxx_overlay
#
#############################################################
XXX_OVERLAY_VERSION = master
XXX_OVERLAY_SITE = git at myserver:filesystem_overlay.git
XXX_OVERLAY_SITE_METHOD = git
XXX_OVERLAY_INSTALL_STAGING = NO
XXX_OVERLAY_REDISTRIBUTE = NO

# erase the .tar.gz and all visible stamps at that time
define XXX_OVERLAY_BUILD_CMDS
    rm -f $(DL_DIR)/$(XXX_OVERLAY_SOURCE) $(wildcard $(@D)/.stamp_*)
endef

# erase the .stamp_built stamp to force the build step to happen next time
define XXX_OVERLAY_INSTALL_TARGET_CMDS
    rm -f $(@D)/.stamp_built
endef

$(eval $(generic-package))
#################### END OF FILE ##############################

Yes I know it is horrible. but it actually works, i.e. it processes
dependencies correctly to force the whole dependency chain: download,
extract, patch, build and install_target.

Is there a simple method to avoid the caching of the source code in
$(DL_DIR)/xxx_overlay-master.tar.gz and force the download and
extraction each time?

Thank for any hints,
Lionel
