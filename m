Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE24C43602
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 19:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28BCE8229C;
	Tue, 30 Jun 2026 19:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmSX6HGqe9He; Tue, 30 Jun 2026 19:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D48F82313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782848531;
	bh=LzH2MLnS5dmf+jbSE8z9C3p7VQ2pJZq/UE65TZUczvk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JvkfYqX645UCiCw5mxVRCSPDoaAZAzrwuPZ8+69VOtXGFSEH3FdBfucfU2DsG2Try
	 P4J1VAk2ewjQZ1A4+X6pcHVaJOeUDrfnuSTFsNeT5J5swr9RvBzgalvroC0veO3CGx
	 R9jInmRHpac6qPIPb/RtTfTBa18plIz6QjV9wWyvAvfKfTpeINzHIEMClK683iFXnm
	 H8iEgYULHk1O2Nf8Kpe0OujeSWFvBvTDtx1EvjeVm9Fgw8Q9Gu4VeNkHoA6hNr+5EF
	 7HeyOujmJkWm+RECyR66j+BjsKWaSo5rGihAHdMRw1UmVSx5IXmqlVLgU/dXuWUJjY
	 ZD69HOmnlBq0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D48F82313;
	Tue, 30 Jun 2026 19:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1C11F8A
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72AFB412DF
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qx3bhBO9UECm for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 19:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B62ED412DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B62ED412DE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B62ED412DE
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 19:42:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so11029975e9.0
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 12:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782848522; x=1783453322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NzyywR0gs9FgxqGeLih6dW9dYrAHC5lqKOK5Ckmi1bw=;
 b=jAu/T0N6cbW3IwOCCeGxaUd9mr+PfEfsQW+GeZVtEyLRbFJTrayXpywyMbuj5KQ2ng
 Enh5Sm+iXZ47gylynkU/OXlYXOEk0tS42XpRJ1v2pm+jy7fyF/GSIO70BQ9x2N5h5rgE
 JzvROk/u00gmPXwKvScby2NM/L9jh0ytTJjMYKcNd0XIL+XUhWIWEClCFEcHxGxps8le
 GyBvekhwTzQh1bb0IKeWmTmIcRucuq0gbEPbuT54Su+JkA8B4PPe7SqeC7AursQlHFk6
 vSQx2GEmYhYzYgljfl/60BtCzh8QguRP+24xcCMviauOd2U0E+jMb/SqlBfbKgwX5W1w
 qD+Q==
X-Gm-Message-State: AOJu0YyGWbfCl89KQbVSJSjuSR03k6j7uu/DJChu+VNi3V1iO1o8GuXZ
 4QFu6dOrunMUNi5uREWyy6tQkqgQH6JGFPl4Kfvbfpn6yrzSM41tvZVX9SM6LCDC+WunR1EsSl3
 DVTca
X-Gm-Gg: AfdE7ckZqfiZ4kMGzQIuL44DQX88Knsts/P2dlMdf3PAUSAunwQuATt6PCStBEYkh8G
 UIxLWrIDM9Gx2xo1tX4MH//BlI6FnSQw9dao9ahXIFfydmYI0svjhgU54NAVdQiVB6cL2IVuijs
 ytFv6DQxOE8ES1/9MtPbSA7z6phcPgII53qDodZrc7Gj83S0sJGDrxTC01vyuP0zb8Zv1FuPRqS
 VVvQGw4+8Q+5oRtmSr8ftOYQovU2ei1wkOFauhrHG08ll2agXs3h7tdNS1LmbsrzU7jen/7VhCA
 MWPjgJ3jkbFAb7R1TeTYtg8YOCAz6HPDygqKhCvauINkwbYfEY1wzsG70NgqL3WCMVSqMgavWxQ
 sdmBNW3m4fKyVK/uaJd3b93aNzKnaOV+9tY6O0srMh+GnlkxAUtGac6UGAtj9ve9Tg03PANM90U
 OnsY8Q
X-Received: by 2002:a05:600c:4f55:b0:493:b4a3:5ab0 with SMTP id
 5b1f17b1804b1-493bc741b67mr48926995e9.13.1782848522493; 
 Tue, 30 Jun 2026 12:42:02 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4bfd47sm23100805e9.2.2026.06.30.12.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 12:42:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 30 Jun 2026 21:42:00 +0200
Message-ID: <20260630194200.250234-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630194200.250234-1-thomas.perale@mind.be>
References: <20260630194200.250234-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782848522; x=1783453322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzyywR0gs9FgxqGeLih6dW9dYrAHC5lqKOK5Ckmi1bw=;
 b=CuiyfRH3fQ5cn9FQI+BzANACPJEuQ2LeW38Iczn1R+loAB/IVYsIzsS1h1Bcp/sHhM
 KNzRPcslOkfq5k9B5GNJO53U70GyS7yTPTr1DE4cFe7R6rHjeRgddrCkRcn5Sa45Sqea
 xuLYUPgMdy3RBOVcki4LK1figVv2sJfMRH2WrTTXqfaSuCorIo5G3Qr+210LMOte0EGs
 VxwSeFiRt1zFKn5HZkOug+OeNXgjR8eJqbK0Vtq0HTtxnHZYaV5fWU66r+rLlnYTPl8e
 to2GPXaiGNW/PZLdT0stjEgZFrzVI4XO8fG8fAN+P/owNj2uOdWXQUVPbv06yFo5px+6
 oRbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CuiyfRH3
Subject: [Buildroot] [PATCH v2 2/2] package/libssh2: backport upstream patch
 for CVE-2026-55200
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-55200:
    libssh2 through 1.11.1, fixed in commit 97acf3df contains an out-of-
    bounds write vulnerability in ssh2_transport_read() that fails to
    enforce upper bounds on packet_length field. Remote attackers can send
    crafted SSH packets with excessively large packet_length values to
    corrupt heap memory and achieve remote code execution.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-55200
  - https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: fix the URL in the commit message and the commit id miswritten
    from cve.org
---
 ...al-boundary-checks-for-packet-length.patch | 36 +++++++++++++++++++
 package/libssh2/libssh2.mk                    |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch

diff --git a/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
new file mode 100644
index 0000000000..ef54771afc
--- /dev/null
+++ b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
@@ -0,0 +1,36 @@
+From 97acf3dfda80c91c3a8c9f2372546301d4a1a7a8 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://github.com/TristanInSec)
+
+CVE: CVE-2026-55200
+Upstream: https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
+[thomas: backport to 1.11.1, change ntohu32 call]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index 869fc5a4fa..7925ad33d1 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -645,8 +645,12 @@ int ssh2_transport_read(LIBSSH2_SESSION *session)
+                 total_num = 4;
+ 
+                 p->packet_length = _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+ 
+                 /* total_num may include size field, however due to existing
+                  * logic it needs to be removed after the entire packet is read
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index c85129a7cd..0ccf5effb3 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -19,6 +19,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-7598
 # 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-55199
 
+# 0003-transport-c-Additional-boundary-checks-for-packet-length.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-55200
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
