From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Nov 2018 18:15:48 +0100
Subject: [Buildroot] [PATCH 1/4 v2] core/download: drop the SSH command
In-Reply-To: <cover.1542474939.git.yann.morin.1998@free.fr>
References: <cover.1542474939.git.yann.morin.1998@free.fr>
Message-ID: <3112a0a19120c6af84b83833aa09014a3dd95fb5.1542474939.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ssh command was added back in 2011 with commit c61788f09 (GENTARGETS:
add support for scp://) and was used to check that the remote file
existed, back when we supported 'make source-check'.

However, in 2017, with commit bf28a165d (pkg-{download, generic}: remove
source-check), we actually removed support for source-check.

The SSH command however was not removed then, and stuck, even though
nothing ever uses it It is not even exported in the environment, and scp
does not use it either (it has -S to specify an ssh-compatible program).

Get rid of it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 Config.in               | 4 ----
 package/pkg-download.mk | 1 -
 2 files changed, 5 deletions(-)

diff --git a/Config.in b/Config.in
index 03e4eb3928..f965e9d6d8 100644
--- a/Config.in
+++ b/Config.in
@@ -136,10 +136,6 @@ config BR2_SCP
 	string "Secure copy (scp) command"
 	default "scp"
 
-config BR2_SSH
-	string "Secure shell (ssh) command"
-	default "ssh"
-
 config BR2_HG
 	string "Mercurial (hg) command"
 	default "hg"
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 73ea2a69f8..6293e2985b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -15,7 +15,6 @@ export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
-SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-- 
2.14.1
