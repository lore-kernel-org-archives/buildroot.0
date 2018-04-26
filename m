From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 26 Apr 2018 22:53:09 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: add libatomic linkage when available
Message-ID: <20180426195309.26042-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ff5f7d3bcd713db9c9d92a746d6ad7134748fe16
http://autobuild.buildroot.net/results/9a743da1c3be673288c3482a9e7ddea12750206f
http://autobuild.buildroot.net/results/818b12387e6117569c4fab310b98c11fac80c047

If libatomic is available, it should be added to LIBS in CONF_ENV, since without
it we can get into a state in which symbols like __atomic_fetch_sub_4,
__atomic_compare_exchange_4 and __atomic_fetch_add_4 can't be found.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/zeromq/zeromq.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 8273cad763..214bd9e35c 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -58,4 +58,8 @@ else
 ZEROMQ_CONF_OPTS += --disable-libunwind
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ZEROMQ_CONF_OPTS += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
-- 
2.17.0
