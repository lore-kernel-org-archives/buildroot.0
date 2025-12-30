Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189D5E94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9476813CE;
	Tue, 30 Dec 2025 08:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZ11oeRl_0KZ; Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECDE681372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082780;
	bh=fEd8iZmAktiHMH9IwggY7iOoHvb9NPTBZNfgpLEmsxU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=CM2PVkbvxVfKBWlqPs0cDpF9oGWIOjFWpgUhp9S9UgrtyNdqTVPp75AMCknTTPjVD
	 5cP9gzIuuWOOoIeFLSCuB1jpkaBt+SIV7ApTx4ia830IDFirmQJ5VDtNsb6P+oNUDE
	 t0RdQ87l0DJ+MS2T+pL4lXtYTZlkdiPyCHfyApNrXJq9hDdTgnsyBueRRTnh9iGQHW
	 3B/akWx1m+tCbgq4CPpqeClq+oNWHmHZOu7ZjWfyRhh8XCom3iTbVpK+TejxjjZOwA
	 k96DSl3kGmN2Mp8MkXJAIbkl0B7btNMT4yaJn8Vt2Lc/juTtWmVPNfqjR7gXgM9S6D
	 eBPBWmzZOXZ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECDE681372;
	Tue, 30 Dec 2025 08:19:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DC4177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01A2781337
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o0jjuFWXb69 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00DD881300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00DD881300
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00DD881300
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4327778df7fso1808277f8f.3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082774; x=1767687574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bVMV5AeFY2GJsS0O1pqUTkcDcw4JurAK58mD6piTRXM=;
 b=vWFJFvdZ345pZr8U/bY0GrNZs0vQhEF3h5omB7gPwo8teDumsV1TgY+lYCrpy17XOy
 IZpRyUpQvBjxy9zqkMiQ3wnjgLt/IrMO60GFSMUlDV2/LA6b8mrjXUAIxCTO8wdZIbhk
 SkYhWrF6U1shV4pyw/REt8tyKyXNAE/3mEWWV+Qs8PeQ/DXCHg5FVsXYHAkqdAowA57m
 1JYmyQHt+J/zfjHdAtQx0bvOZahrCRnAc9xKwgVOk6bYH0xL8n4XfpZWIKpI8KGeUQQF
 M0Z2FMV0l8tkCrFoB0ukg/47W15z753p15gjStfCfSrCdPfSA8DU4UBhOsurtU9B6Qoy
 e35Q==
X-Gm-Message-State: AOJu0YwzNGu4WrNOZ4mDfQZSrr5ILk9E9Kx+ihCc44/ZIRDoz1/3E4Rw
 UJgDcn6h3em5Ijf8F/Wj0LET5WnXIekOdMB0yWEBIvufpseD+F892xaoTFDyF6fwG2KTrhXHC4T
 NDKfpUsI=
X-Gm-Gg: AY/fxX6q1PyWv5BX8/sjd5K2HoW4yKC6i1iEGgli+LeDxXWHSmjRLwdft5x5NpiGjmR
 hsejflu+8kD8Gg2/TbQhO2ic+2y2isvm9T/aDXWLjmdD4l4h3QmcX2HMqyO27TxFam8Wwpjr7WV
 LpCxnh6funUzCUfDbhogHfV/kUXGkJ1Z2GsoCf7Kn5M15OJse4f7nS7coA4Ht6HUOgEEvUNw6ZY
 7JC3MW9x9PkM1FTFT/D66uX88zeHbAtnPrDZDFUJxWq4CxNI6BfR0C8rXjkAGwEbO5sYmFt8sfy
 tpGOZ6qdcBSJD1mpXhWaeU2nldqcsjcXbxEN8VLUIhexXHqJ/QQLe8pAZFlEJwwVLlsQ15wVoRM
 6hrx1fzM+OX1gjYXL5nEEphC7FHUQGmvX+KhfRqYqK99QVqbUrD8jJ7ql3k23TRfLojAOkESceQ
 k8lV0=
X-Google-Smtp-Source: AGHT+IF4q99BX4v0Bkzq9g+gXySg8sRYTdI0oE9bnVMx3/xTbd5/Q1RDXtFEvF1b8ZLCrGtmTt6OFg==
X-Received: by 2002:a05:6000:3103:b0:432:88c3:1ce7 with SMTP id
 ffacd0b85a97d-43288c31d86mr12889335f8f.47.1767082773705; 
 Tue, 30 Dec 2025 00:19:33 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:33 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:11 +0100
Message-ID: <20251230081917.18676-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082774; x=1767687574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVMV5AeFY2GJsS0O1pqUTkcDcw4JurAK58mD6piTRXM=;
 b=eoyIzTqMl5ZFlajgJAyzJwOdVOYoDK/w4Qa8qsScIaCPGE4MLBr80I/C/ypwohJBKj
 eS9/YE1SBv2w5yje/S0INLZV0ZFyiCUnrYvUWP5oI46rjleYm6uqGedVwVV/G/183zoP
 469/9V33vi1yZL3bclNMR+6j9SDsUL+MC5LCRvfONOTUkVZ5zouZlScidsdmIa4/wu+Y
 3TCSXsoc0Mm8SgNDfnYycy7BUq3eyCkNpu8eVDIdrIPSnGD6UskdhPZLU6t2/xON2uz+
 ZJIoXFgYDcO6JPdLvm7vx4WG5pi34FxhQFtfp30uucubgcsTBfBiCxqZBze7+d7dCaNj
 pL+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eoyIzTqM
Subject: [Buildroot] [PATCH v2 09/15] package/libcurl: remove stale
 IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2024-32928 introduced in [2] is then no longer matched to the
libcurl package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 7e739d49b2 package/libcurl: ignore CVE-2024-32928

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9e32c38d97..6924631735 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -25,10 +25,6 @@ LIBCURL_CONF_OPTS = \
 	--disable-ldap \
 	--disable-ldaps
 
-# Only affects Nest products.
-# https://nvd.nist.gov/vuln/detail/CVE-2024-32928
-LIBCURL_IGNORE_CVES += CVE-2024-32928
-
 # threaded resolver cannot be used with c-ares
 # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
