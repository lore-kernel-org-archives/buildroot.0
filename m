From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:26:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/gdb: don't remove
 support files if python chosen
Message-ID: <20180501073418.41169807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f92052857e9792cd0eeaf3175edb496a58a3f49c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

If one wants to use GDB with python support on the target, you need the support
files installed by GDB. These get usually deleted to save some space, so I just
wrapped the Makefile code deleting them in a conditional block depending on if
python support is active or not.

Signed-off-by: Jonas Zaddach <jzaddach@cisco.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - use positive logic "if python is disabled"
 - put the comment inside the condition, as suggested by Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit fa5ca6974d2504dccc35f43dcabcf30f076d8685)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 5ca464ad46..ad81818a35 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -164,6 +164,7 @@ else
 GDB_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_GDB_PYTHON),)
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
 define GDB_REMOVE_UNNEEDED_FILES
@@ -171,6 +172,7 @@ define GDB_REMOVE_UNNEEDED_FILES
 endef
 
 GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
+endif
 
 # This installs the gdbserver somewhere into the $(HOST_DIR) so that
 # it becomes an integral part of the SDK, if the toolchain generated
