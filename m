From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 17 Jul 2015 00:19:43 +0200
Subject: [Buildroot] [PATCH] Makefile: fix performance regression introduced
	by "Makefile: don't depend on the umask"
In-Reply-To: <1437084210-25086-1-git-send-email-arnout@mind.be>
References: <1437084210-25086-1-git-send-email-arnout@mind.be>
Message-ID: <1437085183-26124-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit bee5745c introduced an extra level of 'make' when the umask is
different from 0022. However, when several targets were specified on
the command line (i.e., 'make a b c'), a new make instance would be
called for each target, which each times parses all the makefiles. This
introduces a huge performance overhead when many targets are specified
on the command line.

To fix this, use the same approach as used in the mkmakefile script:
an additional _all target on which the MAKECMDGOALS depend, so that this
target is run only once.

Note that the mkmakefile script contains a special exception for
Makefile, because the Makefile in the output directory is generated.
Since the top-level Makefile is not generated, this exception is not
needed here.

While we're at it, also fix the whitespace in the UMASK assignment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Guido Mart?nez <guido@vanguardiasur.com.r>
---
v2:
 - replace _all by all in .PHONY
 - remove the useless MAKEFLAGS (it is not defined, the variable is
   called MAKEFLAGS but that's already included in MAKE)
 - add UMASK whitespace fix
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c7d6bee..b4ef2fa 100644
--- a/Makefile
+++ b/Makefile
@@ -29,11 +29,11 @@ UMASK=0022
 ifneq ($(shell umask),$(UMASK))
 .PHONY: all $(MAKECMDGOALS)
 
-all:
-	@umask $(UMASK) && $(MAKE) --no-print-directory
+_all:
+	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKEARGS) $(MAKECMDGOALS)
 
-$(MAKECMDGOALS):
-	@umask $(UMASK) && $(MAKE) --no-print-directory $@
+$(MAKECMDGOALS): _all
+	@:
 
 else # umask
 
-- 
2.1.4
