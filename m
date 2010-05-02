From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] autotools: fix autoreconf check
Message-ID: <20100502220948.E2F298A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7dfa3b3fb42adabe5bbf36ea32909f427561ca59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index b7a7103..fc5bcee 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -162,7 +162,7 @@ define AUTORECONF_HOOK
 	fi
 endef
 
-ifeq ($($(2)_AUTORECONF),YES)
+ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
-- 
1.6.3.3
