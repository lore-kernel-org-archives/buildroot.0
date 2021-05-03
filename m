From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 May 2021 13:13:46 +0200
Subject: [Buildroot] [PATCH 5/9] package/protobuf: fix build failure due to
 missing -mcmodel=large
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210503111350.2933319-6-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building protobuf for or1k -mcmodel=large is needed to link, so let's
add that gcc option in case we're building for or1k.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/protobuf/protobuf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ea75480038..d6b3557020 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 PROTOBUF_CXXFLAGS += -O0
 endif
 
+ifeq ($(BR2_or1k),y)
+PROTOBUF_CXXFLAGS += -mcmodel=large
+endif
+
 PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.25.1
