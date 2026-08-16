Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B6C5DF6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 12:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7422180E51;
	Sun, 16 Aug 2026 12:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnth1aCAz9SR; Sun, 16 Aug 2026 12:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E5E480E46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786884214;
	bh=4ahy0A48XxzDEFRvlPkkoI+JoX7+n4tqqaiIKr2UCpk=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHlRlnPlf5qMf3uyANdRCiP7L7zn2yBTmCmwEBpBAnFqxgHzRly1T8Ify0eXycRq9
	 EmJaibv7MyOQeXpRUiHyBsiQiWPrD/2fj2vzPYs/y9QLYT0b57ZF1HKw4sdB70BmM/
	 2CX+9jYCgnpc202X7BFLPoHIjtIlqMKSu7rPnGigGZYBwIaYKTV2cHZsZQr5MVgY1c
	 jnZtyxQnAzDBxylYR6R9Tr9Nu4r7xItHi1Hz77+VO9uvwnmSwRWuIIdON8jh+OHZYQ
	 rsNMbA1oEvItnVsvX6bvY52alEkHDOg/JmMpD3GPePUjerU5LfHdD8yitFqS+SQ4VP
	 IQANbL4GXYIww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E5E480E46;
	Sun, 16 Aug 2026 12:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97E98336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DED780E46
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqjiupCTTKoQ for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 12:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25AFD80E45
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AFD80E45
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25AFD80E45
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786884210; bh=jfBu/Hr1wQqr5lR/xJ44TQbkCp7ApwH4m8SCMoCfm9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZyD6tj9fgJf2hXsps+LxbM+N7mOnTvV7R0xkNWYgMPqbzo5cQn0abQ2eZyhGssmrz
 J0yMHcEyZVNmaZ2/UcI03CZRmuaLZsxygtIembBdzWr0wZHLaVN2gmq4eZM4K9HvAm
 iPSupaNlFawjfWR3TA9xcywnQ31PicypwjvRrLu20ZaRHq29g2Fq5H4SUl0BVvt8au
 olq0ZFSYRWOsrlt/KIr2TTUcxkRoUKcfCw3G5Rc2+EALR5hxQZcFghRLpiSKjD0RhM
 xXPg/A0MIP/YV5RkcjY+IfOs9H3qRdzsP2HYmV4URl6KnzD5+nipE/09sfRfBrjG77
 M/7Rfsi3K8xxA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 472BC31E0AF6; Sun, 16 Aug 2026 14:43:30 +0200 (CEST)
Date: Sun, 16 Aug 2026 14:43:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <aoGwcjcKAP0U4OnW@waldemar-brodkorb.de>
References: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoGO11vvqxF6VTOy@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: security bump to
 2.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

forgot to add Maintainer to CC.

Waldemar Brodkorb wrote,

> See here for a Changelog:
> https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/ChangeLog?id=e6386389448a4e0ec568fa7a27026e03f95bb768
> 
> Security issues fixed in this release:
> https://w1.fi/security/2026-4/incomplete-bounds-checking-of-mesh-ampe-messages-in-wpa_supplicant.txt
> https://w1.fi/security/2026-3/unexpected-sae-commit-message-contents-terminating-wpa_suppliant.txt
> https://w1.fi/security/2026-2/missing-network-context-validation-for-pmksa-caching.txt
> https://w1.fi/security/2026-1/missing-ml-parsing-validation.txt
> 
> Patches 0001 and 0002 are upstream.
> 
> Tested on Raspberry PI4 (64 Bit).
> 
> License changed:
> -Copyright (c) 2002-2024, Jouni Malinen <j@w1.fi> and contributors
> +Copyright (c) 2002-2026, Jouni Malinen <j@w1.fi> and contributors
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...orization-completed-on-driver-indica.patch | 55 -------------------
>  ...dware-offload-requires-Linux-headers.patch | 53 ------------------
>  package/wpa_supplicant/wpa_supplicant.hash    |  4 +-
>  package/wpa_supplicant/wpa_supplicant.mk      |  2 +-
>  4 files changed, 3 insertions(+), 111 deletions(-)
>  delete mode 100644 package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
>  delete mode 100644 package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
> 
> diff --git a/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch b/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
> deleted file mode 100644
> index 89954eb7c5..0000000000
> --- a/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 170d8a433308ee39f87af94acaef461f8e80b67b Mon Sep 17 00:00:00 2001
> -From: Janne Grunau <janne-fdr@jannau.net>
> -Date: Sun, 4 Aug 2024 13:24:42 +0200
> -Subject: [PATCH] Revert "Mark authorization completed on driver indication during 4-way HS offload"
> -
> -This reverts commit 41638606054a09867fe3f9a2b5523aa4678cbfa5.
> -
> -Signed-off-by: Janne Grunau <janne-fdr@jannau.net>
> -Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> -
> -Upstream: not yet sent, ongoing discussion http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
> -
> ----
> - wpa_supplicant/events.c | 25 ++++++++-----------------
> - 1 file changed, 8 insertions(+), 17 deletions(-)
> -
> -diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
> -index 49917f7aa..bbb3a3eda 100644
> ---- a/wpa_supplicant/events.c
> -+++ b/wpa_supplicant/events.c
> -@@ -4327,23 +4327,14 @@ static void wpa_supplicant_event_assoc(struct wpa_supplicant *wpa_s,
> - 		eapol_sm_notify_eap_success(wpa_s->eapol, true);
> - 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_PSK) &&
> - 		   wpa_key_mgmt_wpa_psk(wpa_s->key_mgmt)) {
> --		if (already_authorized) {
> --			/*
> --			 * We are done; the driver will take care of RSN 4-way
> --			 * handshake.
> --			 */
> --			wpa_supplicant_cancel_auth_timeout(wpa_s);
> --			wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
> --			eapol_sm_notify_portValid(wpa_s->eapol, true);
> --			eapol_sm_notify_eap_success(wpa_s->eapol, true);
> --		} else {
> --			/* Update port, WPA_COMPLETED state from the
> --			 * EVENT_PORT_AUTHORIZED handler when the driver is done
> --			 * with the 4-way handshake.
> --			 */
> --			wpa_msg(wpa_s, MSG_DEBUG,
> --				"ASSOC INFO: wait for driver port authorized indication");
> --		}
> -+		/*
> -+		 * We are done; the driver will take care of RSN 4-way
> -+		 * handshake.
> -+		 */
> -+		wpa_supplicant_cancel_auth_timeout(wpa_s);
> -+		wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
> -+		eapol_sm_notify_portValid(wpa_s->eapol, true);
> -+		eapol_sm_notify_eap_success(wpa_s->eapol, true);
> - 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_8021X) &&
> - 		   wpa_key_mgmt_wpa_ieee8021x(wpa_s->key_mgmt)) {
> - 		/*
> --- 
> -2.45.2
> -
> diff --git a/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
> deleted file mode 100644
> index 7330319d06..0000000000
> --- a/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
> -From: Sergey Matyukevich <geomatsi@gmail.com>
> -Date: Thu, 22 Aug 2024 00:03:41 +0300
> -Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
> -
> -Hardware offload in Linux macsec driver is enabled in compile time if
> -libnl version is >= v3.6. This is not sufficient for successful build
> -since enum 'macsec_offload' has been added to Linux header if_link.h
> -in kernels v5.6 and v5.7, see commits:
> -- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
> -- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
> -
> -New libnl with older Linux headers is a valid combination. This is how
> -hostapd build failure has been detected by Buildroot autobuilder, see:
> -- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
> -
> -Extend compile time condition for the enablement of the macsec hardware
> -offload adding Linux headers version check.
> -
> -Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
> -Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> -
> -Upstream: https://w1.fi/cgit/hostap/commit/?id=809d9d8172db8e2a08ff639875f838b5b86d2641
> -
> ----
> - src/drivers/driver_macsec_linux.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
> -index c86715498..fad47a292 100644
> ---- a/src/drivers/driver_macsec_linux.c
> -+++ b/src/drivers/driver_macsec_linux.c
> -@@ -19,6 +19,7 @@
> - #include <netlink/route/link.h>
> - #include <netlink/route/link/macsec.h>
> - #include <linux/if_macsec.h>
> -+#include <linux/version.h>
> - #include <inttypes.h>
> - 
> - #include "utils/common.h"
> -@@ -32,7 +33,8 @@
> - 
> - #define UNUSED_SCI 0xffffffffffffffff
> - 
> --#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
> -+#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
> -+     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
> - #define LIBNL_HAS_OFFLOAD
> - #endif
> - 
> --- 
> -2.46.0
> -
> diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
> index 2f38dc257a..bea1e99b1f 100644
> --- a/package/wpa_supplicant/wpa_supplicant.hash
> +++ b/package/wpa_supplicant/wpa_supplicant.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a  wpa_supplicant-2.11.tar.gz
> -sha256  f1b5992bbdd015c3ccb7faaadd62ef58ed821e15b9329bf2ceb27511ccc3f562  README
> +sha256  08e23937e16d0155e55cab2b51f51fbe10d80a1aa91c4e15442645059b737ef6  wpa_supplicant-2.12.tar.gz
> +sha256  83be1b142c59ccf0d6c5dde0695d8f84dfba109bea058e78ec2942389ccf327f  README
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index fe4bc34d55..93ac228947 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPA_SUPPLICANT_VERSION = 2.11
> +WPA_SUPPLICANT_VERSION = 2.12
>  WPA_SUPPLICANT_SITE = http://w1.fi/releases
>  WPA_SUPPLICANT_LICENSE = BSD-3-Clause
>  WPA_SUPPLICANT_LICENSE_FILES = README
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
