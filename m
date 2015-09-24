From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 09:51:54 +0200
Subject: [Buildroot] [git commit] micropython: Disable for Blackfin
Message-ID: <20150924075555.A6EE97FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2391109a8027a138628d6fe902769def1086268e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two problems building micropython for Blackfin. The first is
some printf format specifier warnings/errors that seem to be triggered
only for that architecture/compiler. This could be worked around by
specifying CFLAGS=-Wno-error=format.

The second problem is that libffi doesn't provide the closure
implementation on Blackfin. There is no known workaround for this issue.

For now disable micropython on Blackfin.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
