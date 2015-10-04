From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:03:30 +0100
Subject: [Buildroot] [git commit] toolchain-external: mass-define actual
	source tarball for known patterns
Message-ID: <20151004160501.977B0807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8d7b6670f962dcb81706085514a1c7fc31edae3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some external toolchain vendors the actual source code URL can be simply
derived from the binary file URL.

Here we obtain TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL for all Mentor and
Linaro toolchains with a few $(subst) calls.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 33d2f8d..58291eb 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -418,6 +418,16 @@ TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)
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
