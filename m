From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 22 Nov 2016 21:31:31 -0500
Subject: [Buildroot] [PATCH 1/1] Makefile: drop redundant shell call when
	deriving BASE_DIR
Message-ID: <1479868291-2863-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 173135df5b69dfd5ae6fe6cf2de8833c6f74c143 ("core: re-enter make if
$(CURDIR) or $(O) are not canonical paths") introduced the CANONICAL_O
variable, defined as:

CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))

This duplicates the definition of BASE_DIR, by different means:

BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)

So one of these shell calls is redundant. CANONICAL_O is defined first,
so this commit replaces the BASE_DIR derivation with $(CANONICAL_O).

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 37e4bd4..a4a6147 100644
--- a/Makefile
+++ b/Makefile
@@ -165,10 +165,10 @@ endif
 
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
-# line doesn't affect the environment of $(shell ..) calls, so
-# explictly throw away any output from 'cd' here.
+# line doesn't affect the environment of $(shell ..) calls.
 export CDPATH :=
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
+
+BASE_DIR := $(CANONICAL_O)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 
-- 
1.9.1
