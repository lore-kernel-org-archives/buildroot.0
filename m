From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:47 +0200
Subject: [Buildroot] [PATCH 04/19] gdb: disallow GDB_HOST on external
	toolchain builds
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d328fef63c7fb3b499a05e4b6cb7c32b795881ea.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cross-gdb is supposed to be part of the external toolchain, so
Buildroot does not need to build it. Moreover, GDB_HOST build
currently fail with:

ln -snf ../../bin/arm-unknown-linux-gnueabi-gdb \
                /home/test/outputs/test-48/staging/usr/arm-unknown-linux-gnueabi/bin/gdb
ln: creating symbolic link `/home/test/outputs/test-48/staging/usr/arm-unknown-linux-gnueabi/bin/gdb': No such file or directory

And even worse: they overwrite the cross-gdb of the external
toolchain!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 09701c7..edd8715 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_GDB_SERVER
 
 config BR2_PACKAGE_GDB_HOST
 	bool "Build gdb for the Host"
+	# cross-gdb is supposed to be part of the external
+	# toolchain. And the build currently fails.
+	depends on !BR2_TOOLCHAIN_EXTERNAL
 	help
 	    Build gdb to run on the host to debug programs run on the target.
 
-- 
1.7.0.4
