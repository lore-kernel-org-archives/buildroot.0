From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Apr 2017 23:20:57 +0200
Subject: [Buildroot] [PATCH 1/3 v2] core/pkg-generic: rmove intermediate
	file-list files
In-Reply-To: <cover.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <dedc397770e0af15eac2c7cbac771dbd9260c716.1491427248.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To compute the list of files added by a package, we first store the list
of files before the install, do the install, list the files after the
install, and finally compare the two lists. The two lists are stored in
dot-files, hidden in the package's build dir.

We currently keep those two files, and only list the files installed in
target/

In followup patches, we'll also list files installed in staging/ as well
as files installed in host/.

Rather than add even more internal, hidden files in the package build
dir, we'll just re-use the same two temporary files to store the bfore
and after lists.

So, remove them after the comparison is done.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 31dbc54..6b3c69c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -78,6 +78,7 @@ define step_pkg_size_end
 		while read hash file ; do \
 			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
 		done
+	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef
 
 define step_pkg_size
-- 
2.9.3
