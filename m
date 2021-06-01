From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  1 Jun 2021 16:34:07 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210601143422.25064-1-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
Message-ID: <20210601143422.25064-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
it is set, then the assert statement is compiled away.

Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
default case).

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v4: reintroduced patch on suggestion of Arnout. I had previously dropped it from
the series based on an incorrect conclusion.


 package/Makefile.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..955e6a8e8c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -148,6 +148,9 @@ endif
 ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+TARGET_DEBUGGING += -DNDEBUG
+endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
-- 
2.26.3
