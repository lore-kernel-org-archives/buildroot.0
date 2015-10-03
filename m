From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  3 Oct 2015 23:18:19 +0200
Subject: [Buildroot] [PATCH v2 2/4] toolchain-external: mass-define actual
	source tarball for known patterns
In-Reply-To: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
References: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443907101-5290-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some external toolchain vendors the actual source code URL can be simply
derived from the binary file URL.

Here we obtain TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL for all Mentor and
Linaro toolchains with a few $(subst) calls.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---

Changes v1 -> v2:
 - Wrap a long line as much as possible (Arnout).
---
 toolchain/toolchain-external/toolchain-external.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 79afdaa..fecf3de 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -422,6 +422,16 @@ TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)
 BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
 endif
 
+# Some toolchain vendors have a regular file naming pattern.
+# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
+ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
+TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
+	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
+else ifneq ($(findstring http://releases.linaro.org,$(TOOLCHAIN_EXTERNAL_SITE)),)
+TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
+	$(subst _linux.tar.xz,_src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE))
+endif
+
 # In fact, we don't need to download the toolchain, since it is already
 # available on the system, so force the site and source to be empty so
 # that nothing will be downloaded/extracted.
-- 
1.9.1
