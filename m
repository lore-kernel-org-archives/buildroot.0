From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sat, 28 Oct 2017 19:06:21 -0700
Subject: [Buildroot] [RFC 1/2] pkg-generic: Don't check for trailing slashes
	for local method
In-Reply-To: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
Message-ID: <1509242782-14524-2-git-send-email-f.fainelli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Local methods might be used to specify a path to a directory, which could
contain trailing slashes, don't bother checking those.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cca94ba338fb..4c090f2daed3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -998,9 +998,11 @@ $$(error $(2)_SITE cannot be empty when $(2)_SOURCE is not)
 endif
 endif
 
+ifneq ($$($(2)_SITE_METHOD),local)
 ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
 $$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
 endif
+endif
 
 ifneq ($$($(2)_HELP_CMDS),)
 HELP_PACKAGES += $(2)
-- 
2.7.4
