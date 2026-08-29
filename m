Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8897CC61DE1
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 23:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B22080E46;
	Sat, 29 Aug 2026 23:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kpg0noKeUmPf; Sat, 29 Aug 2026 23:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788046021;
	bh=96E3Zu8aYSDVCH7aWxAnKW2Kqax6gTfPTAjzeMHy8gA=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MHmyizJjqw5kC5JL211w38PjKT7ddaBXzOr05fotbk8PaPkhzsebL5Bal5Syc7T5Y
	 XkLA5j+Yj8mF3FsoaUHPKIrmF3RJPk2gQ6umZI7AZwkGwC7j5xLUmBF5pSH8uCl8B6
	 G6sMbLlWAsrIFe2WpZSdinEpo5JvbikAkK09fA9Rl9O+THygcdYLtX7kBMrxvUDOHN
	 AuGMzvsoJmzhvFaz/sJ3LDNLfb5Kl46MiuNpLPGmyYfVLMO7pFzOBV3MMefKKg77z3
	 bNOXa5AaJnlSvahn48Z/ZasDZkdHmNR3CUQB7CkchxRtV7WoXFF22w6KAKVPJ4yucY
	 RoEs0cUwEX5Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C7680BA2;
	Sat, 29 Aug 2026 23:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 396A1118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 23:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F54D605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 23:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaVPmpIc2E_d for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 23:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9097605ED
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 23:26:57 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5b4a9994c20so2121164e87.0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788046015; x=1788650815;
 h=content-type:cc:to:subject:message-id:date:mime-version:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hDmvholCnvJELS3rpcAjgjzRKLROZHXEsHbeSZDa7LI=;
 b=pIs7Z0N6SyfuucMadX+718J6mXGVesyKoltDYhzkArMZJexk28tt5dzvU2ikkicX0U
 3LW0AZr010UQFAwWYnQdMS6916q6HKD+blDvQnE0Qur7gbgcDOzIvE2eqxk4Bv9AxJhD
 bYElrHYoktz6qLp0vfkmDmA4nqG6IunGg0wpuT933M9ksTwQ0BgMNkhaUv3E7QdPlPOm
 6g7f1N0OmycufwKDd2en/IPxeiYb+IErpjHxHnCrXqeyt562Q+16k12VoBvJFqWnxqAZ
 wQe8vJEocjo8ohn4+oHVrBWpyt2JJU42/jqGFZ8B2CfWS1wdASTEOLxTgJ5CUM+ehPRg
 xNZw==
X-Gm-Message-State: AFuF++mE+K5pQ9NTCBf3taIBuA2wgunJvOpTE0PpWW+0/fXCxfwuQPBz
 AH+kzWeIuDyRerX4SwGPX3u4Af2G/9CEFjBC8j/4Gyn/5Ctby7c8NpzBcnWqTJVbysoS2RRlBgB
 RS2A5bSOvMw==
X-Gm-Gg: AYBFou0UGDNnI+IfR2vFd1dJSaqvYIiZ6YYIxuxrpQ6Ant3ykX19JPrAaoCQ9lUlNv8
 /xTf2L+la4CdJ0tNWolenVrlm1drmKnDvsUcKiA3Yvzlqp7aX1m/R/F0mY/HlBnidZQhaoc0ft5
 wnGZdk91FQcUH6MyBA34at90WANon0J6igCu0Rv2t0nT5MVZ+cO/8gzr+XXhu4IfG7E9HsWs+Mj
 IebOwLqwMX39qz0Fv9CpBJQ3M+5Ude8YsZMzW2LOgfAzc6Ln4Vo0FVqe9P0gdVUwmTuAs3SAfoY
 8ULX6B8wg8kmZsj2PIMewPTwY352w91JhXTssBbvXDc9wdXwhY90Lz3yHF3Lj36PfhKIPpKrUVm
 Pje+gxzBXaY/zhyHbGS+RDiSQPDCTTOZNkSf/ekgzaClVcEXUZaIK/LoSM14Ce9kAKWh3gP7Ka9
 Hs7jT2qFjOT28PXTD6a9gqGtXYCQb3opCSZ7E+wKwQCCehgUTtjcdmbJiInzkvhorXXddoHj0Mf
 A8lFqAikHZ9c5mdNyobVSSqyHQ=
X-Received: by 2002:a05:6512:114e:b0:5b1:4caa:4b43 with SMTP id
 2adb3069b0e04-5b5e68464eamr5310237e87.0.1788046014816; 
 Sat, 29 Aug 2026 16:26:54 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b5e8a068efsm1218722e87.54.2026.08.29.16.26.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2026 16:26:53 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5b4a9994c20so2121153e87.0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:26:52 -0700 (PDT)
X-Received: by 2002:a05:6512:114e:b0:5b1:4caa:4b43 with SMTP id
 2adb3069b0e04-5b5e68464eamr5310132e87.0.1788046006914; Sat, 29 Aug 2026
 16:26:46 -0700 (PDT)
Received: from 441462959560 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 16:26:46 -0700
Received: from 441462959560 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 16:26:46 -0700
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 16:26:46 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oogx8b6yszEN14nMo0FumUSagS=aKYCDF2wLdsgFi3Sg@mail.gmail.com>
X-Gm-Features: AcwNN1WGDDyIUNXxMx7y8kRJnvSqZU1BmAhWxBwnKSGBTUNuI-LlkHhL60Var0Q
Message-ID: <CA+h8R2oogx8b6yszEN14nMo0FumUSagS=aKYCDF2wLdsgFi3Sg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [RFC PATCH v1 1/1] package/rtl8812au-aircrack-ng: bump
 to version 2026-03-17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop the upstreamed Linux 6.19 build patch and refresh the Linux
6.15 patch against the new source.

Add Linux 7.2 compatibility for the cfg80211 and PPPoE API changes.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 .../0001-fix-build-for-kernel-6.15.patch      |   4 +-
 .../0004-fix-build-for-kernel-6.19.patch      |  37 --
 .../0004-fix-build-with-linux-7.2.patch       | 483 ++++++++++++++++++
 .../rtl8812au-aircrack-ng.hash                |   2 +-
 .../rtl8812au-aircrack-ng.mk                  |   2 +-
 5 files changed, 487 insertions(+), 41 deletions(-)
 delete mode 100644
package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
 create mode 100644
package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch

diff --git a/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
b/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
index a48214fea2..bf32ea2481 100644
--- a/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
+++ b/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
@@ -40,7 +40,7 @@ index 10acbd2..d6e5809 100755
 -
 -EXTRA_CFLAGS += -I$(src)/include -I$(srctree)/$(src)/include
 -EXTRA_CFLAGS += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
--EXTRA_LDFLAGS += --strip-all -O3
+-EXTRA_LDFLAGS += --strip-debug -O3
 +ccflags-y += $(USER_EXTRA_CFLAGS) -fno-pie
 +ccflags-y += -O3
 +ccflags-y += -Wno-unused-variable
@@ -64,7 +64,7 @@ index 10acbd2..d6e5809 100755
 +
 +ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
 +ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
-+ldflags-y += --strip-all -O3
++ldflags-y += --strip-debug -O3

  ########################## WIFI IC ############################
  CONFIG_RTL8812A = y
diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
deleted file mode 100644
index 83ed1600f6..0000000000
--- a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f17facc866cb36bc889f873beb36e7991fa5e71c Mon Sep 17 00:00:00 2001
-From: Christian Stewart <christian@aperture.us>
-Date: Sat, 14 Mar 2026 14:53:48 -0700
-Subject: [PATCH] Fix build for kernel 6.19
-
-With kernel 6.19 and CONFIG_X86_KERNEL_IBT or CONFIG_KLP_BUILD enabled,
-objtool runs on the linked module object (delayed objtool via --link).
-The module Makefile passes --strip-all to ld -r, which strips local
-function symbols. Without these symbols, objtool cannot determine
-function boundaries and reports errors like:
-
-  88XXau.o: warning: objtool: rtw_mp_cmd+0xf8: unannotated intra-function call
-
-Replace --strip-all with --strip-debug to preserve function symbols
-while still stripping debug information, allowing objtool to properly
-validate the linked module object.
-
-Upstream: https://github.com/aircrack-ng/rtl8812au/commit/f17facc866cb36bc889f873beb36e7991fa5e71c
-Signed-off-by: Christian Stewart <christian@aperture.us>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -22,7 +22,7 @@
-
- ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
- ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
--ldflags-y += --strip-all -O3
-+ldflags-y += --strip-debug -O3
-
- ########################## WIFI IC ############################
- CONFIG_RTL8812A = y
---
-2.50.1 (Apple Git-155)
diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch
b/package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch
new file mode 100644
index 0000000000..9f7812ee32
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch
@@ -0,0 +1,483 @@
+From: Christian Stewart <christian@aperture.us>
+Date: Sat, 29 Aug 2026 00:00:00 -0700
+Subject: [PATCH] Fix build with Linux 7.2
+
+Linux 7.2 hides the PPPoE flexible array members from kernel code, passes
+wireless_dev to key and station callbacks, adds the receive address to
+remain_on_channel, and removes strncpy.
+
+Adapt the callbacks and structures while preserving the net_device used
+by the driver internals.
+
+Based on compatibility changes from the related 88x2bu driver:
+https://github.com/morrownr/88x2bu-20210702/commit/84262145aee22a33efc167adfc4535c9a3fecfac
+https://github.com/morrownr/88x2bu-20210702/commit/cbbac61564976d607892405c7dac3dd7a8ca7622
+
+Upstream: N/A, based on fixes from the related 88x2bu driver
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+---
+diff --git a/core/rtw_br_ext.c b/core/rtw_br_ext.c
+index c80474e..1062d38 100644
+--- a/core/rtw_br_ext.c
++++ b/core/rtw_br_ext.c
+@@ -68,6 +68,9 @@
+ #define MAGIC_CODE_LEN	2
+ #define WAIT_TIME_PPPOE	5	/* waiting time for pppoe server in sec */
+
++#define PPPOE_HDR_TAG(ph) ((unsigned char *)((ph) + 1))
++#define PPPOE_TAG_DATA(tag) ((unsigned char *)((tag) + 1))
++
+ #define IPX_NODE_LEN	6
+ struct ipx_address {
+ 	__be32  net;
+@@ -109,7 +112,7 @@ static __inline__ unsigned char
*__nat25_find_pppoe_tag(struct pppoe_hdr *ph, un
+ 	unsigned char *cur_ptr, *start_ptr;
+ 	unsigned short tagLen, tagType;
+
+-	start_ptr = cur_ptr = (unsigned char *)ph->tag;
++	start_ptr = cur_ptr = PPPOE_HDR_TAG(ph);
+ 	while ((cur_ptr - start_ptr) < ntohs(ph->length)) {
+ 		/* prevent un-alignment access */
+ 		tagType = (unsigned short)((cur_ptr[0] << 8) + cur_ptr[1]);
+@@ -135,12 +138,12 @@ static __inline__ int
__nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_ta
+
+ 	skb_put(skb, data_len);
+ 	/* have a room for new tag */
+-	memmove(((unsigned char *)ph->tag + data_len), (unsigned char
*)ph->tag, ntohs(ph->length));
++	memmove((PPPOE_HDR_TAG(ph) + data_len), PPPOE_HDR_TAG(ph),
ntohs(ph->length));
+ 	ph->length = htons(ntohs(ph->length) + data_len);
+ #if (defined __GNUC__) && (__GNUC__ > 10)
+     #pragma GCC diagnostic ignored "-Wstringop-overread"
+ #endif
+-	memcpy((unsigned char *)ph->tag, tag, data_len);
++	memcpy(PPPOE_HDR_TAG(ph), tag, data_len);
+ #if (defined __GNUC__) && (__GNUC__ > 10)
+     #pragma GCC diagnostic pop
+ #endif
+@@ -953,8 +956,8 @@ int nat25_db_handle(_adapter *priv, struct
sk_buff *skb, int method)
+ 								return -1;
+ 							}
+
+-							memcpy(tag->tag_data + MAGIC_CODE_LEN + RTL_RELAY_TAG_LEN,
+-							       pOldTag->tag_data, old_tag_len);
++							memcpy(PPPOE_TAG_DATA(tag) + MAGIC_CODE_LEN + RTL_RELAY_TAG_LEN,
++							       PPPOE_TAG_DATA(pOldTag), old_tag_len);
+
+ 							if (skb_pull_and_merge(skb, (unsigned char *)pOldTag,
TAG_HDR_LEN + old_tag_len) < 0) {
+ 								DEBUG_ERR("call skb_pull_and_merge() failed in PADI/R packet!\n");
+@@ -967,9 +970,9 @@ int nat25_db_handle(_adapter *priv, struct
sk_buff *skb, int method)
+ 						tag->tag_len = htons(MAGIC_CODE_LEN + RTL_RELAY_TAG_LEN + old_tag_len);
+
+ 						/* insert the magic_code+client mac in relay tag */
+-						pMagic = (unsigned short *)tag->tag_data;
++						pMagic = (unsigned short *)PPPOE_TAG_DATA(tag);
+ 						*pMagic = htons(MAGIC_CODE);
+-						memcpy(tag->tag_data + MAGIC_CODE_LEN, skb->data + ETH_ALEN, ETH_ALEN);
++						memcpy(PPPOE_TAG_DATA(tag) + MAGIC_CODE_LEN, skb->data +
ETH_ALEN, ETH_ALEN);
+
+ 						/* Add relay tag */
+ 						if (__nat25_add_pppoe_tag(skb, tag) < 0)
+@@ -1030,14 +1033,14 @@ int nat25_db_handle(_adapter *priv, struct
sk_buff *skb, int method)
+ 						return -1;
+ 					}
+
+-					pMagic = (unsigned short *)tag->tag_data;
++					pMagic = (unsigned short *)PPPOE_TAG_DATA(tag);
+ 					if (ntohs(*pMagic) != MAGIC_CODE) {
+ 						DEBUG_ERR("Can't find MAGIC_CODE in %s packet!\n",
+ 							(ph->code == PADO_CODE ? "PADO" : "PADS"));
+ 						return -1;
+ 					}
+
+-					memcpy(skb->data, tag->tag_data + MAGIC_CODE_LEN, ETH_ALEN);
++					memcpy(skb->data, PPPOE_TAG_DATA(tag) + MAGIC_CODE_LEN, ETH_ALEN);
+
+ 					if (tagLen > MAGIC_CODE_LEN + RTL_RELAY_TAG_LEN)
+ 						offset = TAG_HDR_LEN;
+diff --git a/hal/hal_com.c b/hal/hal_com.c
+index 7ef3222..9e8b16a 100644
+--- a/hal/hal_com.c
++++ b/hal/hal_com.c
+@@ -23,6 +23,11 @@
+ #include "../../hal/hal_halmac.h"
+ #endif
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
++#define strlcpy strscpy
++#define strncpy strscpy
++#endif
++
+ void rtw_dump_fw_info(void *sel, _adapter *adapter)
+ {
+ 	HAL_DATA_TYPE	*hal_data = NULL;
+diff --git a/hal/hal_com_phycfg.c b/hal/hal_com_phycfg.c
+index ada38b2..113fa4f 100644
+--- a/hal/hal_com_phycfg.c
++++ b/hal/hal_com_phycfg.c
+@@ -17,6 +17,11 @@
+ #include <drv_types.h>
+ #include <hal_data.h>
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
++#define strlcpy strscpy
++#define strncpy strscpy
++#endif
++
+ #define PG_TXPWR_1PATH_BYTE_NUM_2G 18
+ #define PG_TXPWR_BASE_BYTE_NUM_2G 11
+
+diff --git a/hal/phydm/phydm_debug.c b/hal/phydm/phydm_debug.c
+index 57d24e0..abb67d6 100644
+--- a/hal/phydm/phydm_debug.c
++++ b/hal/phydm/phydm_debug.c
+@@ -30,6 +30,11 @@
+ #include "mp_precomp.h"
+ #include "phydm_precomp.h"
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
++#define strlcpy strscpy
++#define strncpy strscpy
++#endif
++
+ void phydm_init_debug_setting(struct dm_struct *dm)
+ {
+ 	dm->fw_debug_components = 0;
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 3d834a4..b9aa4d2 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -17,6 +17,11 @@
+ #include <drv_types.h>
+ #include <hal_data.h>
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
++#define strlcpy strscpy
++#define strncpy strscpy
++#endif
++
+ #ifdef CONFIG_IOCTL_CFG80211
+
+ #ifndef DBG_RTW_CFG80211_STA_PARAM
+@@ -1742,6 +1747,19 @@ exit:
+ 	return ret;
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct wireless_dev *wdev
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0) || defined(RHEL88))
++	, int link_id
++#endif
++	, u8 key_index
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) ||
defined(COMPAT_KERNEL_RELEASE)
++	, bool pairwise
++#endif
++	, const u8 *mac_addr, struct key_params *params)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)) ||
(RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9, 0))
+ 	, int link_id
+@@ -1752,6 +1770,8 @@ static int cfg80211_rtw_add_key(struct wiphy
*wiphy, struct net_device *ndev
+ #endif
+ 	, const u8 *mac_addr, struct key_params *params)
+ {
++#endif
++
+ 	char *alg_name;
+ 	u32 param_len;
+ 	struct ieee_param *param = NULL;
+@@ -1889,6 +1909,20 @@ addkey_end:
+
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int cfg80211_rtw_get_key(struct wiphy *wiphy, struct wireless_dev *wdev
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0) || defined(RHEL88))
++	, int link_id
++#endif
++	, u8 keyid
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) ||
defined(COMPAT_KERNEL_RELEASE)
++	, bool pairwise
++#endif
++	, const u8 *mac_addr, void *cookie
++	, void (*callback)(void *cookie, struct key_params *))
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int cfg80211_rtw_get_key(struct wiphy *wiphy, struct net_device *ndev
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)) ||
(RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9, 0))
+ 	, int link_id
+@@ -1900,6 +1934,8 @@ static int cfg80211_rtw_get_key(struct wiphy
*wiphy, struct net_device *ndev
+ 	, const u8 *mac_addr, void *cookie
+ 	, void (*callback)(void *cookie, struct key_params *))
+ {
++#endif
++
+ #define GET_KEY_PARAM_FMT_S " keyid=%d"
+ #define GET_KEY_PARAM_ARG_S , keyid
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) ||
defined(COMPAT_KERNEL_RELEASE)
+@@ -2057,6 +2093,19 @@ exit:
+ 	return ret;
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int cfg80211_rtw_del_key(struct wiphy *wiphy, struct
wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0) || defined(RHEL88))
++	int link_id,
++#endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) ||
defined(COMPAT_KERNEL_RELEASE)
++				u8 key_index, bool pairwise, const u8 *mac_addr)
++#else	/* (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) */
++				u8 key_index, const u8 *mac_addr)
++#endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) */
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int cfg80211_rtw_del_key(struct wiphy *wiphy, struct net_device *ndev,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)) ||
(RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9, 0))
+ 	int link_id,
+@@ -2067,6 +2116,8 @@ static int cfg80211_rtw_del_key(struct wiphy
*wiphy, struct net_device *ndev,
+ 				u8 key_index, const u8 *mac_addr)
+ #endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) */
+ {
++#endif
++
+ 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
+ 	struct security_priv *psecuritypriv = &padapter->securitypriv;
+
+@@ -2132,6 +2183,16 @@ static int cfg80211_rtw_set_default_key(struct
wiphy *wiphy,
+ }
+
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 30))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++int cfg80211_rtw_set_default_mgmt_key(struct wiphy *wiphy,
++	struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0) || defined(RHEL88))
++	int link_id,
++#endif
++	u8 key_index)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ int cfg80211_rtw_set_default_mgmt_key(struct wiphy *wiphy,
+ 	struct net_device *ndev,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)) ||
(RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9, 0))
+@@ -2139,6 +2200,8 @@ int cfg80211_rtw_set_default_mgmt_key(struct
wiphy *wiphy,
+ #endif
+ 	u8 key_index)
+ {
++#endif
++
+ #define SET_DEF_KEY_PARAM_FMT " key_index=%d"
+ #define SET_DEF_KEY_PARAM_ARG , key_index
+
+@@ -2282,6 +2345,18 @@ static void
rtw_cfg80211_fill_mesh_only_sta_info(struct mesh_plink_ent *plink, s
+ }
+ #endif /* CONFIG_RTW_MESH */
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int cfg80211_rtw_get_station(struct wiphy *wiphy,
++	struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
++	u8 *mac,
++#else
++	const u8 *mac,
++#endif
++	struct station_info *sinfo)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
+ 	struct net_device *ndev,
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
+@@ -2291,6 +2366,8 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
+ #endif
+ 	struct station_info *sinfo)
+ {
++#endif
++
+ 	int ret = 0;
+ 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
+ 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+@@ -4566,7 +4643,11 @@ void rtw_cfg80211_indicate_sta_assoc(_adapter
*padapter, u8 *pmgmt_frame, uint f
+ 		#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 18, 0))
+ 		cfg80211_sinfo_alloc_tid_stats(&sinfo, GFP_KERNEL);
+ 		#endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++		cfg80211_new_sta(((_adapter *)rtw_netdev_priv(ndev))->rtw_wdev,
get_addr2_ptr(pmgmt_frame), &sinfo, GFP_ATOMIC);
++#else
+ 		cfg80211_new_sta(ndev, get_addr2_ptr(pmgmt_frame), &sinfo, GFP_ATOMIC);
++#endif
+ 	}
+ #else /* defined(RTW_USE_CFG80211_STA_EVENT) */
+ 	channel = pmlmeext->cur_channel;
+@@ -4612,7 +4693,11 @@ void
rtw_cfg80211_indicate_sta_disassoc(_adapter *padapter, const u8 *da,
unsign
+ 	RTW_INFO(FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
+
+ #if defined(RTW_USE_CFG80211_STA_EVENT) || defined(COMPAT_KERNEL_RELEASE)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++	cfg80211_del_sta(((_adapter *)rtw_netdev_priv(ndev))->rtw_wdev, da,
GFP_ATOMIC);
++#else
+ 	cfg80211_del_sta(ndev, da, GFP_ATOMIC);
++#endif
+ #else /* defined(RTW_USE_CFG80211_STA_EVENT) */
+ 	channel = pmlmeext->cur_channel;
+ 	freq = rtw_ch2freq(channel);
+@@ -5563,6 +5648,17 @@ void dump_station_parameters(void *sel, struct
wiphy *wiphy, const struct statio
+ #endif /* DBG_RTW_CFG80211_STA_PARAM */
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int	cfg80211_rtw_add_station(struct wiphy *wiphy, struct
wireless_dev *wdev,
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
++	u8 *mac,
++#else
++	const u8 *mac,
++#endif
++	struct station_parameters *params)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int	cfg80211_rtw_add_station(struct wiphy *wiphy, struct
net_device *ndev,
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
+ 	u8 *mac,
+@@ -5571,6 +5667,8 @@ static int	cfg80211_rtw_add_station(struct
wiphy *wiphy, struct net_device *ndev
+ #endif
+ 	struct station_parameters *params)
+ {
++#endif
++
+ 	int ret = 0;
+ 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
+ #if defined(CONFIG_TDLS) || defined(CONFIG_RTW_MESH)
+@@ -5709,7 +5807,11 @@ release_plink_ctl:
+
+ 			/* indicate new sta */
+ 			_rtw_memset(&sinfo, 0, sizeof(sinfo));
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++			cfg80211_new_sta(((_adapter *)rtw_netdev_priv(ndev))->rtw_wdev,
mac, &sinfo, GFP_ATOMIC);
++#else
+ 			cfg80211_new_sta(ndev, mac, &sinfo, GFP_ATOMIC);
++#endif
+ 		}
+ 		goto exit;
+ 	}
+@@ -5731,6 +5833,19 @@ exit:
+ 	return ret;
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int	cfg80211_rtw_del_station(struct wiphy *wiphy, struct
wireless_dev *wdev,
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
++	u8 *mac
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0))
++	const u8 *mac
++#else
++	struct station_del_parameters *params
++#endif
++)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int	cfg80211_rtw_del_station(struct wiphy *wiphy, struct
net_device *ndev,
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
+ 	u8 *mac
+@@ -5741,6 +5856,8 @@ static int	cfg80211_rtw_del_station(struct
wiphy *wiphy, struct net_device *ndev
+ #endif
+ )
+ {
++#endif
++
+ 	int ret = 0;
+ 	_irqL irqL;
+ 	_list	*phead, *plist;
+@@ -5834,6 +5951,17 @@ static int	cfg80211_rtw_del_station(struct
wiphy *wiphy, struct net_device *ndev
+
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int	cfg80211_rtw_change_station(struct wiphy *wiphy, struct
wireless_dev *wdev,
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
++	u8 *mac,
++#else
++	const u8 *mac,
++#endif
++	struct station_parameters *params)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int	cfg80211_rtw_change_station(struct wiphy *wiphy, struct
net_device *ndev,
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 0))
+ 	u8 *mac,
+@@ -5842,6 +5970,8 @@ static int	cfg80211_rtw_change_station(struct
wiphy *wiphy, struct net_device *n
+ #endif
+ 	struct station_parameters *params)
+ {
++#endif
++
+ #ifdef CONFIG_RTW_MESH
+ 	_adapter *adapter = (_adapter *)rtw_netdev_priv(ndev);
+ 	struct sta_priv *stapriv = &adapter->stapriv;
+@@ -5988,9 +6118,17 @@ struct sta_info
*rtw_sta_info_get_by_idx(struct sta_priv *pstapriv, const int id
+ 	return psta;
+ }
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++static int	cfg80211_rtw_dump_station(struct wiphy *wiphy, struct
wireless_dev *wdev,
++		int idx, u8 *mac, struct station_info *sinfo)
++{
++	struct net_device *ndev = wdev->netdev;
++#else
+ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy, struct
net_device *ndev,
+ 		int idx, u8 *mac, struct station_info *sinfo)
+ {
++#endif
++
+ #define DBG_DUMP_STATION 0
+
+ 	int ret = 0;
+@@ -7002,7 +7140,11 @@ static s32
cfg80211_rtw_remain_on_channel(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 8, 0))
+ 	enum nl80211_channel_type channel_type,
+ #endif
+-	unsigned int duration, u64 *cookie)
++	unsigned int duration, u64 *cookie
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++	, const u8 *rx_addr
++#endif
++	)
+ {
+ 	s32 err = 0;
+ 	u8 remain_ch = (u8) ieee80211_frequency_to_channel(channel->center_freq);
+diff --git a/os_dep/linux/ioctl_linux.c b/os_dep/linux/ioctl_linux.c
+index c577611..c8dfc3a 100644
+--- a/os_dep/linux/ioctl_linux.c
++++ b/os_dep/linux/ioctl_linux.c
+@@ -23,6 +23,11 @@
+ #include "../../hal/hal_halmac.h"
+ #endif
+
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
++#define strlcpy strscpy
++#define strncpy strscpy
++#endif
++
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 27))
+ #define  iwe_stream_add_event(a, b, c, d, e)  iwe_stream_add_event(b, c, d, e)
+ #define  iwe_stream_add_point(a, b, c, d, e)  iwe_stream_add_point(b, c, d, e)
+diff --git a/os_dep/linux/os_intfs.c b/os_dep/linux/os_intfs.c
+index 9c5d377..b2de2d2 100644
+--- a/os_dep/linux/os_intfs.c
++++ b/os_dep/linux/os_intfs.c
+@@ -19,6 +19,7 @@
+
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
+ #define strlcpy strscpy
++#define strncpy strscpy
+ #endif
+
+ MODULE_LICENSE("GPL");
+--
+2.50.1
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index bb7c4b297d..8fe1f162b5 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d4a1435e29bf4a46a4b0b31cad91f30bb263a899b382f828125437dce3cb4bae
 rtl8812au-aircrack-ng-c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e.tar.gz
+sha256  ab9d257758ec55a352a5671e3b96c0d73795c5ccea01173d4412dad35fd70d7e
 rtl8812au-aircrack-ng-734485506a30d6237c2deaad666a19f8ca5379f2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index d243f900d4..9170cc2023 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-RTL8812AU_AIRCRACK_NG_VERSION = c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e
+RTL8812AU_AIRCRACK_NG_VERSION = 734485506a30d6237c2deaad666a19f8ca5379f2
 RTL8812AU_AIRCRACK_NG_SITE = $(call
github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
