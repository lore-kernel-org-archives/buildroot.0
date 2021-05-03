From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 May 2021 13:13:45 +0200
Subject: [Buildroot] [PATCH 4/9] package/libgeos: fix build failure due to
 missing -mcmodel=large
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210503111350.2933319-5-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building libgeos for or1k -mcmodel=large is needed to link, so let's
add that gcc option in case we're building for or1k.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/libgeos.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index a355732af8..43211d0434 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
 LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
 endif
 
+ifeq ($(BR2_or1k),y)
+LIBGEOS_CXXFLAGS += -mcmodel=large
+endif
+
 LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
 
 $(eval $(cmake-package))
-- 
2.25.1
