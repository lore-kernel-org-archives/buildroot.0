From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 18 May 2021 22:22:29 +0200
Subject: [Buildroot] [git commit] package/environment-setup: Fix incorrect
 order of the `sed` expressions
Message-ID: <20210518195438.C538487C13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0ed2725e9816677ab395334fdb7ec2559bce878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Order of the `sed` expressions is important; when this was commited
to master, the order of the expressions from the original patch [1] was
changed, rendering the second expression to noop.

This made all the environment variables from the script to contain
absolute paths: long absolute paths makes verbose builds difficult
to read/follow.
We can take advantage of the fact that the PATH is updated and we
don't have to use absolute paths.

Fixed by reordering the `sed` expresions:
* first update the path of the binaries: e.g. 's%$(HOST_DIR)/bin/%%g'
* only then update remaining paths: e.g. 's%$(HOST_DIR)%\$$SDK_PATH%g'

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201027140140.47982-1-matthew.weber at rockwellcollins.com/

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/environment-setup/environment-setup.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index fcad013f0d..f4c52921f7 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -26,8 +26,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	printf "alias cmake=\"cmake \
 		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
 		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
-	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
-		-e 's%$(HOST_DIR)/bin/%%g' \
+	$(SED) 's%$(HOST_DIR)/bin/%%g' \
+		-e 's%$(HOST_DIR)%\$$SDK_PATH%g' \
 		-e '/^export "PATH=/c\' \
 		$(ENVIRONMENT_SETUP_FILE)
 	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
