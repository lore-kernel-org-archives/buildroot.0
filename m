From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 22 Sep 2015 16:18:23 +1200
Subject: [Buildroot] [PATCHv2] micropython: Disable for Blackfin
In-Reply-To: <20150921092243.GL2782@tarshish>
References: <20150921092243.GL2782@tarshish>
Message-ID: <1442895503-2786-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are two problems building micropython for Blackfin. The first is
some printf format specifier warnings/errors that seem to be triggered
only for that architecture/compiler. This could be worked around by
specifying CFLAGS=-Wno-error=format.

The second problem is that libffi doesn't provide the closure
implementation on Blackfin. There is no known workaround for this issue.

For now disable micropython on Blackfin.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Changes since v1:
- Supress comment section on bfin also
- Re-order depends to list !BR2_bfin last

 package/micropython/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index c62b3ab..dae41b7 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
 	select BR2_PACKAGE_LIBFFI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# libffi doesn't provide the closure implementation on Blackfin
+	depends on !BR2_bfin
 	help
 	  Micro Python is a lean and fast implementation of the Python 3
 	  programming language that is optimised to run on a microcontroller.
@@ -10,3 +12,4 @@ config BR2_PACKAGE_MICROPYTHON
 
 comment "micropython needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_bfin
-- 
2.5.0
