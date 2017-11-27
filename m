From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:56:43 +0100
Subject: [Buildroot] [git commit branch/next] core/pkg-generic: remove
 intermediate file-list files
Message-ID: <20171127220553.540AA80FB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=306ad0181a329c2d6fda064c2b746f5f4a4aea25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

To compute the list of files added by a package, we first store the list
of files before the install, do the install, list the files after the
install, and finally compare the two lists. The two lists are stored in
dot-files, hidden in the package's build dir.

We currently keep those two files, and only list the files installed in
target/

In followup patches, we'll also list files installed in staging/ as well
as files installed in host/.

Rather than add even more internal, hidden files in the package build
dir, we'll just re-use the same two temporary files to store the before
and after lists.

So, remove them after the comparison is done.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0e28675..d4cb42d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -85,6 +85,7 @@ define step_pkg_size_end
 		while read hash file ; do \
 			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
 		done
+	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef
 
 define step_pkg_size
