Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88E0C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 23:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71681808C4;
	Sat, 29 Aug 2026 23:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiefpHw5c_rL; Sat, 29 Aug 2026 23:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788046015;
	bh=KZ/C+uqZcRgYokl1pzLG+r0PFxiKHnVlNmtYMeefSsM=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cynmKI6oOwdy3VlAB+UoZJ9wjUPcqxXGPchrZm1+LKvjXFnaK5v3fOB2rkTkKDkTq
	 g4k2EiCH/IahwNkJcrzBFkdHWc2VSCHOMN8D2g2BHvZRLNBwnwceOONEYNADp9O2Qj
	 OYGqnZXiQDvDmrhFENMvQJuHCG2XxmAnG5kQJDMvDaJvNH44ncScaqlf13BtIji7I8
	 yIW4tr9ezk96h6qNUa3eCxxR2dud9AvlPPA6xkzUFeX/ztpSUHa1D/2oFTFh2Wyl9s
	 1/ONWXUe/GiRUBvsl9XI0/+c4BrJj4A9H8rq4JqsWhQVrEKTmSOIM1I+J1q6/yZDbk
	 b51cr55OzmPig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB75D80DF2;
	Sat, 29 Aug 2026 23:26:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AE44355
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 23:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102F7605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 23:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyOyVqbW86IL for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 23:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA901605ED
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 23:26:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3a151eda82dso17386221fa.1
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788046010; x=1788650810;
 h=content-type:cc:to:subject:message-id:date:mime-version:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=uS1omfw73Tks1Im2wY1WwA9Ry3sFChgpPoWs7Xt018w=;
 b=tTtO4bPmqmISp3lv0J3pm5+HvSKARr5kZv0gHAPiiPn/fxr8h99yJrhGBcst6GzYKy
 7VAgFgWv470Y6OHpYy8AKxK1ojXUG/SP0b2th0XUEtFMAeqapXDviAd8Pv2jWSrpbXXe
 RxW2P8RA3FDw2dxpMarsBjVbQeZ1E5KgoXWRd+KG/jpdx5PHsGDVecKsQQoArch+z8fn
 5rWz2ReVJTAAxiK+/em4syQN+AjtY9EuoLkHqbdzhYJ10D2kJqySa6BUJVAHoGdaY8ll
 ypXQS2LBVFF8D/4N+qdcASBhrtUSzCPMp9r/l3OpoMAzOMJJUurOujYRD4MTeuyBb3Mk
 QH2A==
X-Gm-Message-State: AFuF++nUYTbcD4P9I8MOT9zuRQcsXxtWUKLE15eIRuI385Dk+UFFFYDM
 sTPQIc1cmCQVmaDKNTENWNZP1Ji+Ump7IWqqS5QQJ2nGNTpJugVHp5YXat/1Gtphdjr3HN87Bux
 BIdUkJg1IYA==
X-Gm-Gg: AYBFou0VqKSFblWkdY7XjTlEkI5Poh6XYpf6irG9b5vdd7Ov0ni4PhpoY+w/3DOdxDb
 X7hyoor4hTyOpjjF38aj5RCiR/XEOOMKKj+D0kK0qoPxbzJD+2cAT2DUni8Yi6r1dmbKZKk5Oyp
 CM5Ekgm5G+xb53GyGUMgS1SuVBiREksuFBK9GobK7LWupSukvK2jpYeBHxbhTkuEej0Ej5bX+U7
 fqwaxbT7tvvMYJ5NiW/3rqMOAPW14aO4Kl0joi47bn+ghlSuZ76/41NMdU8VEQst/naQ4s5pWEY
 oiWpH29MDjS4XX6+lzUTqTFdV9cdVyeFeMrXMEgY2LOWxtcPCfUO53k/wrxAzCZC+YJpNNxhdqM
 eSlFOR37xnAqk9ve9XdNJfBjmJ2ILC5mkELm08vMtBRYxfQZIfmXQeoBPedVq1340mhPU0CuJgM
 UgGepvJGU0HBvl0LAtXztpgItoxfjKolF0HMsRZ/2LbTCiFz4eLoh7NcKOM7vaGeyn7EsB4MpDY
 Mnq6bu42VslGgtI17NuqUB4gzP18JhrtJZLxCjQjg==
X-Received: by 2002:a05:651c:a208:10b0:3a3:364:f789 with SMTP id
 38308e7fff4ca-3a30364fdc9mr21500591fa.13.1788046009472; 
 Sat, 29 Aug 2026 16:26:49 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a3053ee6d1sm9702411fa.17.2026.08.29.16.26.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2026 16:26:48 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3a1f628b1d1so13888991fa.0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 16:26:46 -0700 (PDT)
X-Received: by 2002:a2e:a995:0:b0:3a3:1674:a814 with SMTP id
 38308e7fff4ca-3a31674c3e0mr14804931fa.2.1788046006159; Sat, 29 Aug 2026
 16:26:46 -0700 (PDT)
Received: from 441462959560 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 16:26:45 -0700
Received: from 441462959560 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 16:26:45 -0700
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 16:26:45 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oed-F_NN0s0OA2yF1+YLZCsMp2+Vnb=TR+ANTZnHLeyQ@mail.gmail.com>
X-Gm-Features: AcwNN1WPSnEp6sfv5uCcA4jySu7UPjlSXy49gs2RHbNy15_X761AEurASh50Om4
Message-ID: <CA+h8R2oed-F_NN0s0OA2yF1+YLZCsMp2+Vnb=TR+ANTZnHLeyQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [Buildroot] [RFC PATCH v1 1/1] package/rtl8821cu: bump to version
 2026-08-21
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 .../0001-fix-build-with-linux-7.2.patch       |  91 ++++
 ...02-fix-cfg80211-build-with-linux-7.2.patch | 452 ++++++++++++++++++
 package/rtl8821cu/rtl8821cu.hash              |   2 +-
 package/rtl8821cu/rtl8821cu.mk                |   2 +-
 4 files changed, 545 insertions(+), 2 deletions(-)
 create mode 100644 package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
 create mode 100644
package/rtl8821cu/0002-fix-cfg80211-build-with-linux-7.2.patch

diff --git a/package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
b/package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
new file mode 100644
index 0000000000..31a0c301c7
--- /dev/null
+++ b/package/rtl8821cu/0001-fix-build-with-linux-7.2.patch
@@ -0,0 +1,91 @@
+From: Christian Stewart <christian@aperture.us>
+Date: Sat, 29 Aug 2026 00:00:00 -0700
+Subject: [PATCH] Fix build with Linux 7.2
+
+Linux 7.2 hides the PPPoE flexible array members from kernel code. Derive
+the tag and tag-data addresses from their enclosing structures instead.
+
+Upstream: N/A, based on fixes from the related 88x2bu driver
+https://github.com/morrownr/88x2bu-20210702/commit/cbbac61564976d607892405c7dac3dd7a8ca7622
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+---
+ core/rtw_br_ext.c | 21 ++++++++++++---------
+ 1 file changed, 12 insertions(+), 9 deletions(-)
+diff --git a/core/rtw_br_ext.c b/core/rtw_br_ext.c
+index f8b8035..f0d778d 100644
+--- a/core/rtw_br_ext.c
++++ b/core/rtw_br_ext.c
+@@ -71,6 +71,9 @@
+ #define MAGIC_CODE_LEN	2
+ #define WAIT_TIME_PPPOE	5	/* waiting time for pppoe server in sec */
+
++#define PPPOE_HDR_TAG(ph) ((unsigned char *)((ph) + 1))
++#define PPPOE_TAG_DATA(tag) ((unsigned char *)((tag) + 1))
++
+ /*-----------------------------------------------------------------
+   How database records network address:
+            0    1    2    3    4    5    6    7    8    9   10
+@@ -89,7 +92,7 @@ static unsigned char *__nat25_find_pppoe_tag(struct
pppoe_hdr *ph, unsigned shor
+ 	unsigned char *cur_ptr, *start_ptr;
+ 	unsigned short tagLen, tagType;
+
+-	start_ptr = cur_ptr = (unsigned char *)ph->tag;
++	start_ptr = cur_ptr = PPPOE_HDR_TAG(ph);
+ 	while ((cur_ptr - start_ptr) < ntohs(ph->length)) {
+ 		/* prevent un-alignment access */
+ 		tagType = (unsigned short)((cur_ptr[0] << 8) + cur_ptr[1]);
+@@ -115,9 +118,9 @@ static int __nat25_add_pppoe_tag(struct sk_buff
*skb, struct pppoe_tag *tag)
+
+ 	skb_put(skb, data_len);
+ 	/* have a room for new tag */
+-	memmove(((unsigned char *)ph->tag + data_len), (unsigned char
*)ph->tag, ntohs(ph->length));
++	memmove((PPPOE_HDR_TAG(ph) + data_len), PPPOE_HDR_TAG(ph),
ntohs(ph->length));
+ 	ph->length = htons(ntohs(ph->length) + data_len);
+-	memcpy((unsigned char *)ph->tag, tag, data_len);
++	memcpy(PPPOE_HDR_TAG(ph), tag, data_len);
+ 	return data_len;
+ }
+
+@@ -1150,8 +1153,8 @@ int nat25_db_handle(_adapter *priv, struct
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
+@@ -1164,9 +1167,9 @@ int nat25_db_handle(_adapter *priv, struct
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
+@@ -1227,14 +1230,14 @@ int nat25_db_handle(_adapter *priv, struct
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
+--
+2.50.1
diff --git a/package/rtl8821cu/0002-fix-cfg80211-build-with-linux-7.2.patch
b/package/rtl8821cu/0002-fix-cfg80211-build-with-linux-7.2.patch
new file mode 100644
index 0000000000..1566bb6450
--- /dev/null
+++ b/package/rtl8821cu/0002-fix-cfg80211-build-with-linux-7.2.patch
@@ -0,0 +1,452 @@
+From: Christian Stewart <christian@aperture.us>
+Date: Sat, 29 Aug 2026 00:00:00 -0700
+Subject: [PATCH] Fix cfg80211 build with Linux 7.2
+
+Linux 7.2 passes wireless_dev to key and station callbacks, adds the
+receive address to remain_on_channel, and removes the 5/10 MHz wiphy
+flag. It also removes strncpy and requires flexible arrays in two driver
+structures.
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
+ hal/hal_com.c                 |   5 ++
+ hal/hal_com_phycfg.c          |   5 ++
+ hal/phydm/phydm_debug.c       |   5 ++
+ include/rtw_mlme_ext.h        |   2 +-
+ include/rtw_recv.h            |   2 +-
+ os_dep/linux/ioctl_cfg80211.c | 146 +++++++++++++++++++++++++++++++++++++++++-
+ os_dep/linux/ioctl_linux.c    |   5 ++
+ os_dep/linux/os_intfs.c       |   1 +
+ 8 files changed, 168 insertions(+), 3 deletions(-)
+diff --git a/hal/hal_com.c b/hal/hal_com.c
+index 4ebcae7..d1f4860 100644
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
+index 0e0da62..c3d5231 100644
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
+index 5b28ca2..acf3b3f 100644
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
+diff --git a/include/rtw_mlme_ext.h b/include/rtw_mlme_ext.h
+index af05277..9d9a6ea 100644
+--- a/include/rtw_mlme_ext.h
++++ b/include/rtw_mlme_ext.h
+@@ -274,7 +274,7 @@ enum TDLS_option {
+ #if defined(CONFIG_ATMEL_RC_PATCH)
+ 	#define RTW_SCAN_NUM_OF_CH 2
+ 	#define RTW_BACK_OP_CH_MS 200
+-#elseif defined(CONFIG_CUSTOMER_EZVIZ_CHIME2)
++#elif defined(CONFIG_CUSTOMER_EZVIZ_CHIME2)
+ 	#define RTW_SCAN_NUM_OF_CH 1
+ 	#define RTW_BACK_OP_CH_MS 200
+ #else
+diff --git a/include/rtw_recv.h b/include/rtw_recv.h
+index 513cf24..5a68071 100644
+--- a/include/rtw_recv.h
++++ b/include/rtw_recv.h
+@@ -815,7 +815,7 @@ __inline static union recv_frame
*rxmem_to_recvframe(u8 *rxmem)
+ __inline static union recv_frame *pkt_to_recvframe(_pkt *pkt)
+ {
+
+-	u8 *buf_star;
++	u8 *buf_star = NULL;
+ 	union recv_frame *precv_frame;
+ 	precv_frame = rxmem_to_recvframe((unsigned char *)buf_star);
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 9f3ac31..434cd9c 100644
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
+@@ -1922,6 +1927,19 @@ exit:
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
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
+ 	, int link_id
+@@ -1932,6 +1950,8 @@ static int cfg80211_rtw_add_key(struct wiphy
*wiphy, struct net_device *ndev
+ #endif
+ 	, const u8 *mac_addr, struct key_params *params)
+ {
++#endif
++
+ 	char *alg_name;
+ 	u32 param_len;
+ 	struct ieee_param *param = NULL;
+@@ -2087,6 +2107,20 @@ addkey_end:
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
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
+ 	, int link_id
+@@ -2098,6 +2132,8 @@ static int cfg80211_rtw_get_key(struct wiphy
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
+@@ -2278,6 +2314,19 @@ exit:
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
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
+ 	int link_id,
+@@ -2288,6 +2337,8 @@ static int cfg80211_rtw_del_key(struct wiphy
*wiphy, struct net_device *ndev,
+ 				u8 key_index, const u8 *mac_addr)
+ #endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 37)) */
+ {
++#endif
++
+ 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
+ 	struct security_priv *psecuritypriv = &padapter->securitypriv;
+
+@@ -2353,6 +2404,16 @@ static int cfg80211_rtw_set_default_key(struct
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
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
+@@ -2360,6 +2421,8 @@ int cfg80211_rtw_set_default_mgmt_key(struct
wiphy *wiphy,
+ #endif
+ 	u8 key_index)
+ {
++#endif
++
+ #define SET_DEF_KEY_PARAM_FMT " key_index=%d"
+ #define SET_DEF_KEY_PARAM_ARG , key_index
+
+@@ -2503,6 +2566,18 @@ static void
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
+@@ -2512,6 +2587,8 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
+ #endif
+ 	struct station_info *sinfo)
+ {
++#endif
++
+ 	int ret = 0;
+ 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
+ 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+@@ -5138,7 +5215,11 @@ void rtw_cfg80211_indicate_sta_assoc(_adapter
*padapter, u8 *pmgmt_frame, uint f
+ 		sinfo.assoc_req_ies = pmgmt_frame + WLAN_HDR_A3_LEN + ie_offset;
+ 		sinfo.assoc_req_ies_len = frame_len - WLAN_HDR_A3_LEN - ie_offset;
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 2, 0))
++		cfg80211_new_sta(((_adapter *)rtw_netdev_priv(ndev))->rtw_wdev,
get_addr2_ptr(pmgmt_frame), &sinfo, GFP_ATOMIC);
++#else
+ 		cfg80211_new_sta(ndev, get_addr2_ptr(pmgmt_frame), &sinfo, GFP_ATOMIC);
++#endif
+ 	}
+ #else /* defined(RTW_USE_CFG80211_STA_EVENT) */
+ 	channel = pmlmeext->cur_channel;
+@@ -5184,7 +5265,11 @@ void
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
+@@ -5728,6 +5813,17 @@ void dump_station_parameters(void *sel, struct
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
+@@ -5736,6 +5832,8 @@ static int	cfg80211_rtw_add_station(struct
wiphy *wiphy, struct net_device *ndev
+ #endif
+ 	struct station_parameters *params)
+ {
++#endif
++
+ 	int ret = 0;
+ 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
+ #if defined(CONFIG_TDLS) || defined(CONFIG_RTW_MESH)
+@@ -5874,7 +5972,11 @@ release_plink_ctl:
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
+@@ -5896,6 +5998,19 @@ exit:
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
+@@ -5906,6 +6021,8 @@ static int	cfg80211_rtw_del_station(struct
wiphy *wiphy, struct net_device *ndev
+ #endif
+ )
+ {
++#endif
++
+ 	int ret = 0;
+ 	_irqL irqL;
+ 	_list	*phead, *plist;
+@@ -6022,6 +6139,17 @@ static int	cfg80211_rtw_del_station(struct
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
+@@ -6030,6 +6158,8 @@ static int	cfg80211_rtw_change_station(struct
wiphy *wiphy, struct net_device *n
+ #endif
+ 	struct station_parameters *params)
+ {
++#endif
++
+ 	_adapter *adapter = (_adapter *)rtw_netdev_priv(ndev);
+ 	int ret = 0;
+
+@@ -6088,9 +6218,17 @@ struct sta_info
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
+@@ -7599,7 +7737,11 @@ static s32
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
+@@ -10289,8 +10431,10 @@ static int rtw_cfg80211_init_wiphy(_adapter
*adapter, struct wiphy *wiphy)
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 11, 0))
+ #ifdef CONFIG_WIFI_MONITOR
+ 	/* Currently only for Monitor debugging */
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(7, 2, 0))
+ 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_5_10_MHZ;
+ #endif
++#endif
+ #endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 11, 0)) */
+
+ 	ret = _SUCCESS;
+diff --git a/os_dep/linux/ioctl_linux.c b/os_dep/linux/ioctl_linux.c
+index 7d8d09c..fa91bcd 100644
+--- a/os_dep/linux/ioctl_linux.c
++++ b/os_dep/linux/ioctl_linux.c
+@@ -21,6 +21,11 @@
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
+index 89a27b6..c664d0c 100644
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
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index 5ff86f439c..f49faa434e 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c471f8a73efb5985b4e880e40de439ac8837241c74d3b7f8cc06a1bbfcc85075
 rtl8821cu-7f63a9da2e8ed83403f6f920e9b1628a37b38ef4.tar.gz
+sha256  73ceb08456344517e54b5344d03e4408b910144f5554198b511b1349eb9a623c
 rtl8821cu-bda65aac150d2cde0df9603206eec23a6f3b77c4.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0
 LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 45d1da3750..5cf76a6ef6 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-RTL8821CU_VERSION = 7f63a9da2e8ed83403f6f920e9b1628a37b38ef4
+RTL8821CU_VERSION = bda65aac150d2cde0df9603206eec23a6f3b77c4
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
