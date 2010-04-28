From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:42 +0200
Subject: [Buildroot] [PATCH 01/19] autotools: fix autoreconf check
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <de4a337f16aaf9c7ec73339bff28f21264c32dc6.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autoreconf check was incorrect, missing a $ sign to properly
reference a package-specific variable. There was no visible effect
until now since :

 * The existing syntax allowed to access the value defined in the
   package specific .mk file, so when AUTORECONF was set to YES by a
   package, it was working.

 * The default value in Makefile.autotools.in was NO. In fact, when a
   package .mkf file wasn't defining the AUTORECONF variable, the
   Makefile.autotools.in test was testing the empty string against
   'YES', which was false, leading to the AUTORECONF not being done,
   which was the desired effect.

However, in a later patch, we intend to change this default value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index a4be8c8..d624881 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -161,7 +161,7 @@ define AUTORECONF_HOOK
 	fi
 endef
 
-ifeq ($($(2)_AUTORECONF),YES)
+ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
-- 
1.6.3.3
