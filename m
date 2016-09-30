From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 30 Sep 2016 12:09:54 +0200
Subject: [Buildroot] [PATCH 2/2] Canonicalize $(BASE_DIR)
In-Reply-To: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
References: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
Message-ID: <1475230194-18524-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If compilation path contains symlinks, $(*_DIR) variables does not contains
same values depending if user run 'make O=out' or 'make -C out'.

This patch always canonicalize $(BASE_DIR) to avoid this problem.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5e4daef..5c907e5 100644
--- a/Makefile
+++ b/Makefile
@@ -136,7 +136,7 @@ endif
 # line doesn't affect the environment of $(shell ..) calls, so
 # explictly throw away any output from 'cd' here.
 export CDPATH :=
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
+BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && readlink -m .)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
 
-- 
1.9.1
