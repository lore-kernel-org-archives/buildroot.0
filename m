From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:01:03 +0200
Subject: [Buildroot] [PATCH 5/6] libgtk2: remove useless post-patch hook
In-Reply-To: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369695664-5670-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There used to be a post-patch hook to apply a patch only on the host
variant of libgtk2. However, after the reorganization of the patch
naming policy, this was no longer working properly, so
dd1848bc73ee9dfe211ca3ed3a233707e3bc5955 changed this by a patch that
works on both the target and host variants.

We can therefore get rid of the useless post-patch hook.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index b1ce99a..5881ea7 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -175,12 +175,6 @@ HOST_LIBGTK2_CONF_OPT = \
 		--disable-cups \
 		--disable-debug
 
-define HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
- support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) host-*.patch
-endef
-
-HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
-
 define HOST_LIBGTK2_BUILD_CMDS
  $(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
 endef
-- 
1.7.9.5
