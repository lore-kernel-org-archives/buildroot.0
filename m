From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:51:45 +0100
Subject: [Buildroot] [git commit branch/next] Makefile: drop redundant shell
	call when deriving BASE_DIR
Message-ID: <20161127221640.BDF9580F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6caa76db22ad952f3fe6329da39defed060d8980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 173135df5b69dfd5ae6fe6cf2de8833c6f74c143 ("core: re-enter make if
$(CURDIR) or $(O) are not canonical paths") introduced the CANONICAL_O
variable, defined as:

CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))

This duplicates the definition of BASE_DIR, by different means:

BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)

So one of these shell calls is redundant. CANONICAL_O is defined first,
so this commit replaces the BASE_DIR derivation with $(CANONICAL_O).

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4f6269f..55d928d 100644
--- a/Makefile
+++ b/Makefile
@@ -174,10 +174,10 @@ endif
 
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
 
 
