From: James Knight <james.d.knight@live.com>
Date: Sun, 21 Feb 2016 10:40:49 -0500
Subject: [Buildroot] [PATCH 1/1] pkg-utils: mask tput failure for
	non-interactive sessions
Message-ID: <BLU436-SMTP6377F2EEAE54E32A4A6DDDA0A20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When invoking a build from a non-interactive session (for example, a
Jenkins build), there is no terminal session to modify. When preparing
variables to track the bold and boldoff mode sequences, the `tput`
command will always fail as there is no terminal to query. The following
change masks the error message when `tput` fails; leaving the TERM_BOLD
and TERM_RESET variables empty.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..12447fc 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -84,8 +84,8 @@ suitable-extractor = $(INFLATE$(suffix $(1)))
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
-TERM_BOLD := $(shell tput smso)
-TERM_RESET := $(shell tput rmso)
+TERM_BOLD := $(shell tput smso 2> /dev/null)
+TERM_RESET := $(shell tput rmso 2> /dev/null)
 
 # Utility functions for 'find'
 # findfileclauses(filelist) => -name 'X' -o -name 'Y'
-- 
1.9.5.msysgit.1
