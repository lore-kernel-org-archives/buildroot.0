From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:50:01 +0200
Subject: [Buildroot] [PATCH 13/13] pkg-generic: check that SITE has a value
	when SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when an user forgets to define a SITE, he gets some fairly
weird download failure. In order to make things easier to diagnose, this
commit adds a check in the package infrastructure that verifies that if
SOURCE has a value, SITE is not empty.

Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dab455c..0c9c7ab 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -938,6 +938,12 @@ endif
 	$(1)-source \
 	$(1)-source-check
 
+ifneq ($$($(2)_SOURCE),)
+ifeq ($$($(2)_SITE),)
+$$(error $(2)_SITE cannot be empty when $(2)_SOURCE is not)
+endif
+endif
+
 ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
 $$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
 endif
-- 
2.7.4
