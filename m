From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Fri, 26 Oct 2018 14:26:21 +0300
Subject: [Buildroot] [PATCH 1/1] support/scripts/mkmakefile: Silent wrapper
Message-ID: <20181026112621.8146-1-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Suppose we use Makefile wrapper and build
 project out of buildroot tree (with O=...). The commands like "make
 busybox-all-external-deps" will output the string "uname 022 && make ..." to
 stdout before the usefull information. It pollutes stdout. In the same time
 if we use the same command in the buildroot source-tree then we don't get the
 additional output. Some external scripts can analyze output of make and
 additional output can break them. This patch make wrapper silent.
 
 Sorry for the previous ugly-formatted patch.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 support/scripts/mkmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
index 37162a3173..3b1a9f8774 100755
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -33,7 +33,7 @@ MAKEFLAGS += --no-print-directory
 all	:= \$(filter-out Makefile,\$(MAKECMDGOALS))
 
 _all:
-	umask 0022 && \$(MAKE) \$(MAKEARGS) \$(all)
+	@umask 0022 && \$(MAKE) \$(MAKEARGS) \$(all)
 
 Makefile:;
 
-- 
2.17.1
