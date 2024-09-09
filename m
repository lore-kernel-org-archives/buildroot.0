Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C906ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B76B81118;
	Mon,  9 Sep 2024 16:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PPak0diOLTy; Mon,  9 Sep 2024 16:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEA08114D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEA08114D;
	Mon,  9 Sep 2024 16:29:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19EEE1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 886CA80EB5
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRWkJsXdCdY0 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BACE380FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACE380FA1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BACE380FA1
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bb6d3e260so40918965e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899284; x=1726504084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mh8RmitvrBaIfDUbcq5sh1m5os1pqr1soS0Dg+XNd1k=;
 b=oJn+IEvSUK1aJV4Xa5imKuJFoAMdJ/B8ek6n05xjwqouC2u0TSXiqLOwysSkJEB/Ms
 f5St6mGeDd8nICnFiUWCnz8FGKwcIGDn6tXOPUmSGZIhOrXyjxy76njLnuAFGRT1gcVX
 +JqmTHVyk51/aWvvzfs6tLy4lZOtrmA/bdpON3+L2SWdXGodP/5Z/8C1lRO3mxvZ024P
 viNuAV5dsbCEOhvoeVr3emnONSEY+OkaxCWVRDWLr4PAI+QjVPH9VUr79+L2dyqi4B5/
 CDPO9/q2y14hWABwYK6fSowJdbKKOjRUhZ3jDf4h7btbVszajW/CapJ1HU2G0JAMV6TP
 JxHw==
X-Gm-Message-State: AOJu0YweR8Y1d6Q0nti7KsP8f5ky9QJ2Ez/RCqnQnnHNLxAxX0xgmK3G
 TjqzODEeLeWp4yYgcs0ev7tDWYzvyQoqO4xfkqNr5K4eSRqGqE+FNLKdhPSgKzt5JvuqxJmoABX
 vLw==
X-Google-Smtp-Source: AGHT+IED95yDu4JHWU7ScCsC7fadotYz5EOu+yCGAtNjEIHxx4NItIJNeLFiUpnaZiJB5geFmqNw/w==
X-Received: by 2002:a05:600c:1e22:b0:42c:b187:bde9 with SMTP id
 5b1f17b1804b1-42cb187c074mr47081685e9.30.1725899283532; 
 Mon, 09 Sep 2024 09:28:03 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:28:03 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:27:02 +0200
Message-ID: <20240909162703.3439481-20-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899284; x=1726504084; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mh8RmitvrBaIfDUbcq5sh1m5os1pqr1soS0Dg+XNd1k=;
 b=L0tryOsnhgS3Rrv9rI5Se4recMgzuPoXg9WxcEekjhxrfr6fnXk5o8b9NuxpeEmex2
 YV6fiIYXEn23uf1XYToys0OrswrE8AumTHmzQbC0LXjzTPYgWd1vV4nj0yyw6Wnw2Lxs
 DH743bHFI4lTOPphtOejY68PBTNz7ti0I4HM/O2b6g/eiKhjO7fVyzdRsvKbZzYdmBge
 AUnMvBCp3Gw37zzudETlbnpI67Pfkq5f4cXPCRoueIvD+Pjd5RiJH1Hd7VExDZ0/zoyi
 BL4HVKOfg0onLR39WV4qw+u5O8uHb6qDNcM/Zr9OCAK6k853eFSrdGGSaJ6X7PhHq0ny
 ynpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=L0tryOsn
Subject: [Buildroot] [PATCH 20/20] package/perl-crypt-openssl-random: bump
 to version 0.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

diff LICENSE: minor cleanup
    see https://metacpan.org/release/RURBAN/Crypt-OpenSSL-Random-0.17/diff/RURBAN/Crypt-OpenSSL-Random-0.15#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-crypt-openssl-random.hash                        | 8 ++++----
 .../perl-crypt-openssl-random.mk                          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
index 6c1344fb2..f8ab405ca 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  bcde8d5a822c91376deda3c4f0c75fbe  Crypt-OpenSSL-Random-0.15.tar.gz
-sha256  f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4  Crypt-OpenSSL-Random-0.15.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  294f545c54a5a4855cb00c5648eb5c2b  Crypt-OpenSSL-Random-0.17.tar.gz
+sha256  a571b24181baaa76c96704e92acffc6934ff593e380dade274db4e43c140ad51  Crypt-OpenSSL-Random-0.17.tar.gz
 
 # computed by scancpan
-sha256  fdaba2134145d3e252c5930180b2bcb13b5367ad5a8713d6868f014cd25c496f  LICENSE
+sha256  076d44a82dfa5a992169d47bc5e2d44ff113a3a84bd9963a6b51c953f8d05099  LICENSE
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index e70eb7e92..b52e83698 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.15
+PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.17
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
