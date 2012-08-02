From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:47 -0000
Subject: [Buildroot] [git commit branch/next] Globally disable
	PKG_CONFIG_PATH
Message-ID: <20120802195247.5A0C38C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=670cb306704d76b4c3b717931cc7abef8c693099
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If PKG_CONFIG_PATH is set in the environment, it allows pkg-config to
look for libraries outside of the buildroot tree.  This is a problem
both for host and target builds.  To avoid it, globally set an empty
PKG_CONFIG_PATH in the environment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 7a66897..bcbe9fc 100644
--- a/Makefile
+++ b/Makefile
@@ -165,6 +165,9 @@ HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
+# Make sure pkg-config doesn't look outside the buildroot tree
+unexport PKG_CONFIG_PATH
+
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
 # line doesn't affect the environment of $(shell ..) calls, so
