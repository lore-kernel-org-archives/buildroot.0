From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 21 Sep 2015 20:51:57 +1200
Subject: [Buildroot] [PATCH] micropython: Disable for Blackfin
In-Reply-To: <20150921091356.17452d5c@free-electrons.com>
References: <20150921091356.17452d5c@free-electrons.com>
Message-ID: <1442825517-28669-1-git-send-email-judge.packham@gmail.com>
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
 package/micropython/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index c62b3ab..4664494 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
 	select BR2_PACKAGE_LIBFFI
+	# libffi doesn't provide the closure implementation on Blackfin
+	depends on !BR2_bfin
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Micro Python is a lean and fast implementation of the Python 3
-- 
2.5.0
