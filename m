From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 21:03:52 +0200
Subject: [Buildroot] [git commit] package/runc: use BR_PATH to find
	pkg-config
Message-ID: <20160708190409.4D8AA80800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbc7cd99612e7083fac01c046a1b358aa9a3b39b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_LIBSECCOMP is set, go will try to find libseccomp
library using pkg-config. But pkg-config is not in the PATH when go
is called during the runc build.

Set the correct PATH in RUNC_MAKE_ENV.

Fixes:
http://autobuild.buildroot.net/results/fea/fea069fec671b32bffd3d133898d71d45abab552

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/runc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c4e75dd..1396e0c 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -15,7 +15,8 @@ RUNC_GOPATH = "$(@D)/Godeps/_workspace"
 RUNC_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_ENABLED=1 \
 	GOBIN="$(@D)/bin" \
-	GOPATH="$(RUNC_GOPATH)"
+	GOPATH="$(RUNC_GOPATH)" \
+	PATH=$(BR_PATH)
 
 RUNC_GLDFLAGS = \
 	-X main.gitCommit=$(RUNC_VERSION) \
