Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604C0F8FA87
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 14:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217BD606EE;
	Tue, 21 Apr 2026 14:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwbE0JrSTtms; Tue, 21 Apr 2026 14:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3077260723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776782013;
	bh=v4hqz4sWV23M8qKlvkcJHv4TMR9Q+f8GYWX+sGUnZGA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Ini8C37XbqdFgBwPDPuHa+3+/EKV2lt1y9ZlVYRBJl7b+KASSp0JY3huFEgkLdaa4
	 AuENW6x8Kq/HNwPmeQwnxa7qJG6lr+35G1iwf58gYOok3Uu3P4WCxBs6vqhD5iLOdQ
	 +aMAsoKjgX5czerIimY7y3iEBvOJH6w7E0Hi4UjnxiA5ZTSCRJCivah9Z/j8JEtAGG
	 UZnmIIYTzNdWZyIYQJEO4cLDXIY8PsALrR0+BQ8eCVPH4FnFcSkTn1iFoB5Ft0L9oJ
	 5wV1mR2ZOsLCXvhOz48W0ttgNhO1PfDqxuvx0mTHhRtn2bJSuzapp/KqZhkO98PH0X
	 gsAWuxKQkLm/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3077260723;
	Tue, 21 Apr 2026 14:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB84259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F14883BDD
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OV-PqLi-Fja8 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 14:33:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D57A83B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D57A83B9D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D57A83B9D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:33:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso20769065e9.1
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 07:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776782008; x=1777386808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZE9M6Dr53/L4kO0n9x0Z4cRJMl2V2a5pMVt5TclQDc=;
 b=NcxhggE3YhUxjiu9Kz389NEOnjBcI2pZ4Q7+S65NwTwB8u0MCMmKe5Tn/xbnbLn0HH
 ltCl4wx3Nlktz960UOtmr2n5pMosTrbpGB+V/TiZQ97fUJspV3EruTpJcKXzVsPKLJZj
 96fsv0MWCf5/HK743rDqplDa16+R1dmkHHMmLUR48UOta7P3ZbfbqmF3xwRNJNRW0EjA
 GXvWTiy1n4IuIRcqiDLc5ul+1ZnWBNtMr1DP9s8/I+VzsiUOhYmoGSUzFgmwq1xQondZ
 qEf1D+cEOsHGdw5GbwkvhBuXyxh8Zw/eCyWXwGx135IZ+koKqeq7dAZq2vsdHg/JPyUS
 KVWg==
X-Gm-Message-State: AOJu0YyXblEP7luTanfEAc8Ak+TMonNebDxvDr0xPYoV4JtLwtI0TXsy
 h8pjPRxTjF2g0J/GZViEtV8NZyTMHVr9oAc5zpolcS22OwS9WTykjJ3CVPpkw97kxPZ76gLVH3Q
 0C2fS/4o=
X-Gm-Gg: AeBDiesbABIW61qPPqZFhgaswZwCICf4qPO4AxsrpMgdsEasNB7HreXsVz/Qh1m/rUI
 pkc71v6UY9GplRvnvJqlmulwTxORyv0IySVSFqYuIwMZN4d9zPTS0sqHjNhdubhhz4aqs3m6hNy
 FhlOzhgtYdGJGvfYQIg0oQ1V9YVwvGrbHMEriYkjPIFhK9w8YhGCWIUXoENQAHbeEFv41Slb3Ed
 GiJLc612MQ3eK55iPEVP/iLsHjVgQkdVEmxZgeDjrzeaAAtKPp0MyIlCRTLFjvH1wGOzuv9eUKG
 xeQlu4Sjj9eJjdX42CZMgdRhu8mHUbjnIZVq6vDVtppZ+jOo4hGD1yZzsOa7V38VcIzBkJI8Szk
 R7U8hmaDilFXOr9qVG4GszwxQK1/FabTRdgHsBdIc+/FM8+Ky4cXqwBpfOSx3yQZUqD+pcgWbsk
 qccVDFllUXPvGPCZ/Q7b1IuOZbUNSWvmc+yokacQBQ1INSAr01dJdFSA==
X-Received: by 2002:a05:600c:4fc7:b0:488:dbcb:ca08 with SMTP id
 5b1f17b1804b1-488fb787a62mr260164695e9.30.1776782007553; 
 Tue, 21 Apr 2026 07:33:27 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1393f5sm349704055e9.9.2026.04.21.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 07:33:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 thomas.perale@mind.be
Date: Tue, 21 Apr 2026 16:33:10 +0200
Message-ID: <20260421143310.2795827-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776782008; x=1777386808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZE9M6Dr53/L4kO0n9x0Z4cRJMl2V2a5pMVt5TclQDc=;
 b=PQBspwSHxsWy+AlBsdGk0HvTJDHWYxd/yeRzpeakzuhQI6sp0Nd5l1V+4PnuwjLG1J
 t/JHAUvIppZUZ+81LxsAxcKB59DBAov8He5/ibnB2phNz6JMlX5AmC1IIX6XL43CCWdq
 w7OSRboqiDFh63tg4TIKu1lUeh2H4VNXdI1aXZ4x6QOUkHF/Z3ABi6p4yqNoA0qEoUTj
 Wa6bPMvg3I+Cx2cHnu4erWv8QZttZ1mB8wue3jX7TkIujcuctDcw3c4Vu3/2m5VTcMcK
 iWjNc08kx4psGwMNk49Q6IKfoaX3ieMhFSe3I4874CpZmNu4hsCNqwAy18RoMwTtEmnq
 mlwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PQBspwSH
Subject: [Buildroot] [PATCH for 2025.02.x] package/strongswan: add patch for
 CVE-2026-25075
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2026-25075:
    strongSwan versions 4.5.0 prior to 6.0.5 contain an integer underflow
    vulnerability in the EAP-TTLS AVP parser that allows unauthenticated
    remote attackers to cause a denial of service by sending crafted AVP
    data with invalid length fields during IKEv2 authentication. Attackers
    can exploit the failure to validate AVP length fields before
    subtraction to trigger excessive memory allocation or NULL pointer
    dereference, crashing the charon IKE daemon.
    https://www.cve.org/CVERecord?id=CVE-2026-25075

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../strongswan/0002-fix-cve-2026-25075.patch  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/strongswan/0002-fix-cve-2026-25075.patch

diff --git a/package/strongswan/0002-fix-cve-2026-25075.patch b/package/strongswan/0002-fix-cve-2026-25075.patch
new file mode 100644
index 0000000000..82e07fba3f
--- /dev/null
+++ b/package/strongswan/0002-fix-cve-2026-25075.patch
@@ -0,0 +1,48 @@
+From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 5 Mar 2026 12:43:12 +0100
+Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is invalid
+
+The length field in the AVP header includes the 8 bytes of the header
+itself.  Not checking for that and later subtracting it causes an
+integer underflow that usually triggers a crash when accessing a
+NULL pointer that resulted from the failing chunk_alloc() call because
+of the high value.
+
+The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
+0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
+in a buffer overflow even if the allocation succeeds.
+
+Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
+CVE: CVE-2026-25075
+Upstream: https://download.strongswan.org/security/CVE-2026-25075/
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+index 06389f7ca73e..2983bd021ded 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
+@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 		chunk_free(&this->input);
+ 		this->inpos = 0;
+ 
+-		if (!success)
++		if (!success || avp_len < AVP_HEADER_LEN)
+ 		{
+ 			DBG1(DBG_IKE, "received invalid AVP header");
+ 			return FAILED;
+@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
+ 			return FAILED;
+ 		}
+ 		this->process_header = FALSE;
+-		this->data_len = avp_len - 8;
++		this->data_len = avp_len - AVP_HEADER_LEN;
+ 		this->input = chunk_alloc(this->data_len + (4 - avp_len) % 4);
+ 	}
+ 
+-- 
+2.43.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
