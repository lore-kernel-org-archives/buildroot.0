From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:43:00 +0200
Subject: [Buildroot] [PATCHv3 16/18] Makefile: add BR_BUILDING variable
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages do some sanity checks on their configuration, for
example linux checks that the defconfig string is not empty when a
defconfig is used. Such checks are currently always performed, except
when the 'source' target is part of make goals.

This is problematic for two reasons:

 - Other targets such as 'source-check', 'external-deps' or
   'legal-info', that do not consist in doing a build, cannot be
   executed in such situations.

 - The current code removes the check as soon as one of the targets is
   source. But if there are other non-source targets called at the
   same time, the checks are ignored.

This commit therefore introduces an internal variable called
BR_BUILDING, which tells packages if we are actually building or
not. A variable nobuild_targets indicates the targets that we do not
consider as being build targets.

For the moment, nobuild_targets only contains 'source', to be
completely iso-functional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 0ba341b..e0be636 100644
--- a/Makefile
+++ b/Makefile
@@ -77,6 +77,22 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig
 
+# Some global targets do not trigger a build, but are used to collect
+# metadata, or do various checks. When such targets are triggered,
+# some packages should not do their configuration sanity
+# checks. Provide them a BR_BUILDING variable set to 'y' when we're
+# actually building and they should do their sanity checks.
+#
+# We're building in two situations: when MAKECMDGOALS is empty
+# (default target is to build), or when MAKECMDGOALS contains
+# something else than one of the nobuild_targets.
+nobuild_targets := source
+ifeq ($(MAKECMDGOALS),)
+BR_BUILDING = y
+else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
+BR_BUILDING = y
+endif
+
 # Strip quotes and then whitespaces
 qstrip = $(strip $(subst ",,$(1)))
 #"))
-- 
2.1.0
