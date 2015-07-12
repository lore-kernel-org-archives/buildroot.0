From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:30 +0200
Subject: [Buildroot] [PATCH 1/6] package/pkg-utils.mk: add relative-path
	utility function
In-Reply-To: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
References: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436718395-10536-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new helper computes relative path between 2 paths.
This helper will be useful later when fixing the RPATH valuel.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-utils.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..442c528 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -42,6 +42,18 @@ $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM
 # slashes, colons (OK in filenames but not in rules), and spaces.
 sanitize = $(subst $(space),_,$(subst :,_,$(subst /,_,$(strip $(1)))))
 
+# Return a relative filepath to path from a start directory.
+# This is a path computation: the filesystem is not accessed to confirm
+# the existence or nature of path or start.
+#   $1: path
+#   $2: start
+relative-path = $(strip \
+	$(subst //,/,\
+		$(eval __r :=) \
+		$(foreach p,$(subst /, ,$(1)),$(eval __r := $(__r)../)) \
+	$(__r)$(subst /%,%,$(2))))
+
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
-- 
2.4.5
