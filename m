From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:56:55 +0100
Subject: [Buildroot] [git commit branch/next] core/pkg-generic: redirect
 only when listing package's installed files
Message-ID: <20171127220553.61F0C81EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d63670009b42462a9c685b574af107e71ab1ab45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There is no need to redirect again and again for each new file added to
the list; we can just redirect once and for all.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d4cb42d..ad10a8c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -83,8 +83,8 @@ define step_pkg_size_end
 	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after)
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
-			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
-		done
+			echo "$(1),$${file}" ; \
+		done >> $(BUILD_DIR)/packages-file-list.txt
 	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef
 
