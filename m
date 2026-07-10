Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975DBC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6268A40AFB;
	Fri, 10 Jul 2026 13:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPrwMKRz9yEk; Fri, 10 Jul 2026 13:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD97840D57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691536;
	bh=+OEBeNFrCELJEYR0tosPmQd2nxnu5yK5Zz61JhG9hyI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sH0w221eX5H/bnD/+six3kDHE9jjOuBrZ59nFD2se30OSD25dpy15WZNlymCADbWQ
	 yT5UXc0lPf4iyDDogWMnG3W8xAUXxZkx33JIY7RsnEyp3Lz6Y+ayYH2v8o/4vf8LZM
	 eXpSk4SLmVUV8E6n5ur2H3/w6VFZnJ3GpKdZX6ptOkidxUVn6+GXWQGuFT2+rYRuoZ
	 xC5y8xZNjl4SNxPSXzCcIMoPj7IaYVY75JrB1U+kdBIOBIKxqx1vJ1pwWHbkOLewLL
	 1jPuEmqGQY6jbZ9EsJaaDN2VScRWDAdq2Wb6wU/jTrXZODtp75yO7zNETmt/7Q7W1x
	 LU6Jryr8KNptQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD97840D57;
	Fri, 10 Jul 2026 13:52:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8B122FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C791440D36
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAx-_bIkpkat for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6643740CF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6643740CF0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6643740CF0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47640541585so496773f8f.1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691524; x=1784296324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pe0V3hkNJZnN0qxSziB3NhYxFEb3n5Sk80hIv8m1KKs=;
 b=AfjuZyhRfEN6+YcWovsqVqHyQkT4bq+A2mxXAYSifdVo6wOHQ6KxgX+V56YcvgZXSt
 m2xFyAJHBsguZ7c85IEYQlKcY87yNAwLGgpQvteV8sJLMDOqPB73VGiM+d+pZAF4Noar
 LMQbtmJJhqn+GbDHcZ7T13grnhPP8XTinBtIVsoe17Qx04QK6KKAPnoCXXiRZWKgFtxO
 WnFCqRjemssrG95MezrkpCD4wReszKL7wNCUcoSoK6Xxv9gL5+FDcq5c1TQIrXqyGOcD
 +ek6Z4YgW6kZF4b+ve7kxeFjk8b02M/6OFxDxE8I/VuQGXvI3qk25vKej62C8ifnSPJ/
 pq+g==
X-Gm-Message-State: AOJu0YwsZNNX3czHD6P7RtF1BfaiOH6QCJxVyvh9CtauR4aNbEyK4WwL
 29h9No6WeBbSuQd/rcBO9yQ0PIDoC4x9NBgUQfXagyrlX0c1iWBPHLUIGevhH+3u1PQiP3QYH1Z
 9KaAS
X-Gm-Gg: AfdE7clfZEfkhLwazmcd0lDD7Ku6ke+79fU3N8AXfADTTDjuXgnnJzMM8V7IxgNg4p0
 CZ6TQeBPluxrCFFO/hDJfElYbOVFAjlDX2gNzTa252YTEZbcJ/6oHr1BZ+sIWCDg7CoUQF1mcIf
 rANDTD9AEjBa30gM1o060daVFCespki1WNOtaz6UA2ojt853I0YleW9//loeGCFbTmwTRhqe9Ts
 Iexb1lbyNLWm3KC50nFN0bstL1htv8HI+sAmXqG2MxjntCSJ1I00qtVBE6NCBhXOn9LilAFooAH
 TuRaChbbRIXDuwm3LXlXPaKsOCtuNJ3WUI9yrfzjFYxzvZiaey6xEyfyVaLe/v+UVeL4NAaURDi
 u5V2IyXZeOOl1roYZel8TYflmFSxiXZLxBIy3+Qcxaj1qNE03t1tKEHpidO+oEWc181FW1u2IFe
 j1J/4DQQ==
X-Received: by 2002:a05:6000:220d:b0:476:6559:2a72 with SMTP id
 ffacd0b85a97d-47df072e0b5mr12103735f8f.2.1783691524348; 
 Fri, 10 Jul 2026 06:52:04 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm60319398f8f.13.2026.07.10.06.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:04 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:03 +0200
Message-ID: <20260710135203.760111-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260630194200.250234-2-thomas.perale@mind.be>
References: <20260630194200.250234-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691524; x=1784296324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pe0V3hkNJZnN0qxSziB3NhYxFEb3n5Sk80hIv8m1KKs=;
 b=h3eN54a5VHzK3Pna4ZiSHPgSd95e0jcI/UrCYna4sL1b+4K4opN4RunBEJkSYY6f3u
 I0AUG9A64A9MKV2zJUjn34bxVObBAHS3VhAoZ7VsOv5fq8lIa6mEhG8H16WbFY8YpXGY
 8ZGw2843qy6RfmeEvxxJUR5hqzOMchLUZUbE5M0B4tNSJ3ITV2/y1/wMRuloZnl3mn6w
 nuyXOiNPp33oPYnXCIAgZ1A25kb9gmGTbTlQ8S4F89Dz/HcxQez0cPPnG/uyKgChYyCE
 gzn/EIxKcAcjzTjO7vm6l31D0EPH1KpjiTS7msmdsqIsdxSLoZ3TGUEP9kmB2CWSd1Z/
 c+tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h3eN54a5
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libssh2: backport upstream
 patch for CVE-2026-55200
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

In reply of:
> - CVE-2026-55200:
>     libssh2 through 1.11.1, fixed in commit 97acf3df contains an out-of-
>     bounds write vulnerability in ssh2_transport_read() that fails to
>     enforce upper bounds on packet_length field. Remote attackers can send
>     crafted SSH packets with excessively large packet_length values to
>     corrupt heap memory and achieve remote code execution.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-55200
>   - https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> v1 -> v2: fix the URL in the commit message and the commit id miswritten
>     from cve.org
> ---
>  ...al-boundary-checks-for-packet-length.patch | 36 +++++++++++++++++++
>  package/libssh2/libssh2.mk                    |  3 ++
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> 
> diff --git a/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> new file mode 100644
> index 0000000000..ef54771afc
> --- /dev/null
> +++ b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> @@ -0,0 +1,36 @@
> +From 97acf3dfda80c91c3a8c9f2372546301d4a1a7a8 Mon Sep 17 00:00:00 2001
> +From: Will Cosgrove <will@panic.com>
> +Date: Fri, 12 Jun 2026 15:57:44 -0700
> +Subject: [PATCH] transport.c: Additional boundary checks for packet length
> + (#2052)
> +
> +Add additional bounds checking on packet length to prevent OOB write.
> +
> +Credit: [TristanInSec](https://github.com/TristanInSec)
> +
> +CVE: CVE-2026-55200
> +Upstream: https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
> +[thomas: backport to 1.11.1, change ntohu32 call]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/transport.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/transport.c b/src/transport.c
> +index 869fc5a4fa..7925ad33d1 100644
> +--- a/src/transport.c
> ++++ b/src/transport.c
> +@@ -645,8 +645,12 @@ int ssh2_transport_read(LIBSSH2_SESSION *session)
> +                 total_num = 4;
> + 
> +                 p->packet_length = _libssh2_ntohu32(block);
> +-                if(p->packet_length < 1)
> ++                if(p->packet_length < 1) {
> +                     return LIBSSH2_ERROR_DECRYPT;
> ++                }
> ++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
> ++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
> ++                }
> + 
> +                 /* total_num may include size field, however due to existing
> +                  * logic it needs to be removed after the entire packet is read
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index c85129a7cd..0ccf5effb3 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -19,6 +19,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-7598
>  # 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
>  LIBSSH2_IGNORE_CVES += CVE-2026-55199
>  
> +# 0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> +LIBSSH2_IGNORE_CVES += CVE-2026-55200
> +
>  ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>  LIBSSH2_DEPENDENCIES += mbedtls
>  LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
