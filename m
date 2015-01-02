From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Jan 2015 12:43:34 +0100
Subject: [Buildroot] [RFC 3/4] toolchain-externel: mass-define actual source
	tarball for known patterns
In-Reply-To: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1420199015-16907-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some externel toolchain vendors the actual source code URL can be simply
derived from the binary file URL.

Here we obtain TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL for all Mentor and
Linaro toolchains with a few $(subst) calls.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b07b16c..91edd4a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -392,6 +392,14 @@ TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 endif
 
+# Some toolchain vendors have a regular file naming pattern.
+# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
+ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
+TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= $(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
+else ifneq ($(findstring http://releases.linaro.org,$(TOOLCHAIN_EXTERNAL_SITE)),)
+TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= $(subst _linux.tar.xz,_src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE))
+endif
+
 # In fact, we don't need to download the toolchain, since it is already
 # available on the system, so force the site and source to be empty so
 # that nothing will be downloaded/extracted.
-- 
1.9.1
