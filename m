From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Jun 2017 20:32:16 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: regenerat .gitlab-ci.yml when
	configs/ directory changes
In-Reply-To: <20170627183216.31749-1-arnout@mind.be>
References: <20170627183216.31749-1-arnout@mind.be>
Message-ID: <20170627183216.31749-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependencies were not correct. For example, if a defconfig is
removed, the .gitlab-ci.yml file has to be regenerated but the
dependency doesn't reflect this. Therefore, it should depend on the
configs directory instead of on the individual defconfig files.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I have an intuition that using a directory as a dependency is less
reliable, but I did some testing (renaming defconfigs, adding, removing)
and it seems to work fine.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 88d98e0405..e4d9e60fae 100644
--- a/Makefile
+++ b/Makefile
@@ -1098,7 +1098,7 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
-.gitlab-ci.yml: .gitlab-ci.yml.in configs/*_defconfig
+.gitlab-ci.yml: .gitlab-ci.yml.in configs
 	(cd configs; LC_ALL=C ls -1 *_defconfig) | sed 's/$$/: *defconfig/' | cat $< - > $@
 
 include docs/manual/manual.mk
-- 
2.13.1
