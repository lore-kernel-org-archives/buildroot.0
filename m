From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 16:34:04 +0100
Subject: [Buildroot] [git commit master] Makefile: release: use git archive
Message-ID: <20100209153530.0649677750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=23ddf460aa6def6b70a694ed5898750fda8d429a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create tarballs with git-archive so we're sure they don't contain
anything not in git (E.G. local backup configs).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 177701e..a0c18ba 100644
--- a/Makefile
+++ b/Makefile
@@ -634,11 +634,9 @@ help:
 	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo
 
-release: distclean
+release:
 	OUT=buildroot-$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
-	rm -rf ../$$OUT*; cp -al . ../$$OUT; cd ..; \
-	tar cfz $$OUT.tar.gz --exclude .svn --exclude .git --exclude \*~ $$OUT; \
-	rm -rf $$OUT
+	git archive --format=tar --prefix=$$OUT/ master|gzip -9 >$$OUT.tar.gz
 
 .PHONY: $(noconfig_targets)
 
-- 
1.6.3.3
