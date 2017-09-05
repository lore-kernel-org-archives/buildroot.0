From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 20:59:04 +0200
Subject: [Buildroot] [git commit] support/scripts/check-bin-arch: fix
	symbolic link check
Message-ID: <20170905190117.BA95C80E2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb0f3fa13f315a1aa0469d3479673860dcba8eb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c96b8675ea03a5d3194d439f740c725dd239ed1a
("support/scripts/check-bin-arch: ignore symbolic links") was bogus,
because it tested ${f}, which is the relative path of the file inside
${TARGET_DIR}, so we end up testing if ${f} on the system is a
symbolic link.

This commit fixes that by testing ${TARGET_DIR}/${f}.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-bin-arch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 700ee3f..887b661 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -38,7 +38,7 @@ while read f; do
 
 	# Skip symlinks. Some symlinks may have absolute paths as
 	# target, pointing to host binaries while we're building.
-	if [[ -L "${f}" ]]; then
+	if [[ -L "${TARGET_DIR}/${f}" ]]; then
 		continue
 	fi
 
