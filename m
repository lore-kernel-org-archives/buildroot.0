From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:38 +0200
Subject: [Buildroot] [PATCH v3 02/14] package/gcc: complete the logic on
	libquadmath
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libquadmath requires wchar.

So, turn to positive logic and complete it to only enabling quadmath
support when it is available.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- new patch
---
 package/gcc/gcc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index a796f47..efcaf9b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -107,7 +107,9 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
 endif
 
 # quadmath support requires wchar
-ifeq ($(BR2_USE_WCHAR),)
+ifeq ($(BR2_USE_WCHAR)$(BR2_TOOLCHAIN_HAS_LIBQUADMATH),yy)
+HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
+else
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
-- 
2.9.0
