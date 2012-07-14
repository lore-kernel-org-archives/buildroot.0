From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 23:23:26 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: make sure cross compiling is
	enabled when host == target
In-Reply-To: <20120713225522.62040e4f@skate>
References: <20120713225522.62040e4f@skate>
Message-ID: <1342301006-3761-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling for the same architecture and libc as the host,
GNU_TARGET_NAME and GNU_HOST_NAME are equal.  configure scripts use
these to detect cross-compilation, and will decide that we're doing
native compilation.  This may trigger running of executables,
which fail because of missing libraries in the host environment.

To solve this, set the vendor part in GNU_HOST_NAME to buildroot.

This problem exists for instance in xserver_xorg-server on x86_64.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: -buildroot- instead of -buildroot_cross-, as suggested by ThomasP.

 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b80477f..d1c4c2b 100644
--- a/Makefile
+++ b/Makefile
@@ -200,7 +200,7 @@ unexport CXXFLAGS
 unexport GREP_OPTIONS
 unexport CONFIG_SITE
 
-GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
+GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess | sed s/-unknown-/-buildroot-/)
 
 ##############################################################
 #
-- 
tg: (b8b57bb..) t/force-cross (depends on: master)
