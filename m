From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:40:03 +0200
Subject: [Buildroot] [git commit branch/next] package/sofia-sip: don't set
 'NDEBUG' explicitly
Message-ID: <20210601201214.2EEFA8148C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0993954814e8f54c7fea5dcb6dff1cc2c3d3e780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

The sofia-sip package was setting '--enable-ndebug' conditionally based on
BR2_ENABLE_DEBUG, and this would have to be updated to be based on
BR2_ENABLE_RUNTIME_DEBUG.

However, the sofia-sip option '--enable-ndebug' only sets the 'NDEBUG'
preprocessor macro, and the core package infrastructure already sets this
macro correctly based on BR2_ENABLE_RUNTIME_DEBUG.

This means that the explicit '--enable-ndebug' flag can be removed.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sofia-sip/sofia-sip.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 274c72fce8..fb565637eb 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -30,8 +30,4 @@ SOFIA_SIP_CONF_OPTS += \
 	--without-openssl
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),)
-SOFIA_SIP_CONF_OPTS += --enable-ndebug
-endif
-
 $(eval $(autotools-package))
