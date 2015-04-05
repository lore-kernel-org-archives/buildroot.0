From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 22:56:21 +0200
Subject: [Buildroot] [PATCH 2/4 v2] toolchain/external: ignore missing hash
	for custom downloaded toolchain
In-Reply-To: <cover.1428267362.git.yann.morin.1998@free.fr>
References: <cover.1428267362.git.yann.morin.1998@free.fr>
Message-ID: <5546fde6ea4361ee957500e77ae1c09b1587c2f6.1428267362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will *always* be missing a hash file for custom external toolchains
that are downloaded.

So, just ignore that failure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

---
Changes v1 -> v2:
  - fix typoes in title
---
 toolchain/toolchain-external/toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c0429bb..3659511 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -400,6 +400,8 @@ else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+# Magic value to tell the download helper to avoid failling on missing hash
+export BR_MISSING_HASH_OK := $(call ignore-missing-hash-magic,$(TOOLCHAIN_EXTERNAL_SOURCE))
 endif
 
 # In fact, we don't need to download the toolchain, since it is already
-- 
1.9.1
