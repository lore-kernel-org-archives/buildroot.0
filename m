From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 13:00:53 +0200
Subject: [Buildroot] [git commit] pkg-generic: check that SITE has a value
	when SOURCE
Message-ID: <20160703111601.4EAE38015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=235ac0cc185b453c475cfde32f0ba00da0137e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when an user forgets to define a SITE, he gets some fairly
weird download failure. In order to make things easier to diagnose, this
commit adds a check in the package infrastructure that verifies that if
SOURCE has a value, SITE is not empty.

Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
