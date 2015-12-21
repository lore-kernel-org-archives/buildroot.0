From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:55 +0100
Subject: [Buildroot] [PATCH 4/8 RFC] core: re-instate different target and
	host PATHs
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <98156fa4f1051f9e13e26a0859fd95e01bba3308.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In b989976 and previous commits, the differentiation between host and
target PATH has been removed, because there was no reason at that time
to have two different PATHs.

We now have the foo-config scripts installed in their own directory, and
that has to come first in the PATH when building for the target. However,
we do not want to use those directories for the host packages, as those
foo-config scripts are only for the target packages.

So, we need to differentiate the host and target PATHs again.

This is a preparatory commit, which only introduces the two new
variables. Follow-up patches will make use of those variables in the
proper locations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 780b596..b5fadf4 100644
--- a/Makefile
+++ b/Makefile
@@ -366,8 +366,12 @@ HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 # foo-config scripts for the target go here
 FOO_CONFIG_DIR := $(HOST_DIR)/opt/foo-config
 
+# Host PATH is just BR_PATH, but target PATH must find the foo-config
+# scripts first.
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH = $(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)
+HOST_PATH = "$(BR_PATH)"
+TARGET_PATH = "$(FOO_CONFIG_DIR):$(BR_PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-- 
1.9.1
