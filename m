Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C49BCAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F824125D;
	Tue, 16 Sep 2025 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igGgXxQmPsTH; Tue, 16 Sep 2025 20:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDE54123B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDE54123B;
	Tue, 16 Sep 2025 20:27:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6FC412D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADA5E41C7F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOGfYbkdpK7N for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFB8F418D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB8F418D4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB8F418D4
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3e9c5faa858so3132692f8f.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054461; x=1758659261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/nnmXcgIUz2l11AfwaOJ1HnjFTrkZnmR1Y0iv8fkXiw=;
 b=u9qG+LF2AalZE7zbzC+gAsubTdXV2rbRfTc0Ob8LOX3vUXxApKMuxEumxVNa1QkYrJ
 hx5hgmmXbez8F164qMpl6PlXYJ4PU3vNJRyiPEcwMhEn8fW9xhxdhQmHhFhV/Ml9klnE
 urCvGLscGcAqzt2WZVjbeMgvx7BCkexzor5zVHYXt0hOU7R5f83jit7Y3WqOPd2KGraj
 XgZWsMefS7IsLzxjXaOpyZ0OeuPxxzTLtyzCcXwzAx2cGwtgRwLRp+7Qnql6VIjlZtuV
 rBDJ6mYTaBfNvh7epLuTk9nkBvPdip4u90YS/Yp+K7aWTCeUKz2JNypVNJHcmuR9D44e
 AphA==
X-Gm-Message-State: AOJu0YyJ/3L4/rMuweZ1SX++lQWtR/CJvRnIUdwsr2Rk1x6JIM2bP2x7
 097n6R7EdGOyQmX6aWgpFgyy0ndfkLuRclC3GfzWoO4G7gUVGn8MMXnoPo3Sr7NV4RouJo9gEzR
 PrwPb3nI=
X-Gm-Gg: ASbGnct3NeggRyn7Tu4K+/mUHXukHRjEYQ1z/3pJXl2xzrzsUXY2Lxt0NHJtVoOM31R
 Uv3r3JYFy+FXFQeAjVq6L73LQsKG/pNXGuqrr5RxYiPiNnI+70Q6GHi6qN/9DuvdyQahciWST/i
 FIuGzKZp1DejU7EFh2QQuigB1rDwWg5yAeo6k3d9m3on6NTPKLkPdcfGG/8QHyo5zNc16PrHGH+
 8TYhcTFqTGef97RClhWYaIIl4TPRHbx84b0Rv7m+8JOC2waxjeExqd2cfxHNkSAvFnYMYuKCm6U
 d0m6TaT5b18uRqwcBg6VX2KDekuxEacTzZ/gEhe/1+pA6/IJQuIEb9hG2QNKHv6sMKbRNISNcsV
 76b5y+IXSTNahE3s=
X-Google-Smtp-Source: AGHT+IHJMUu0frUx6ZQr05LPJBHRXbdUqiW/wajOdBe6LXYA89TcZW3fQdRb7UpZkb85y3rf4m4Adw==
X-Received: by 2002:a05:6000:2901:b0:3ea:a694:ae0a with SMTP id
 ffacd0b85a97d-3eaa694b10fmr8487718f8f.48.1758054461528; 
 Tue, 16 Sep 2025 13:27:41 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:29 +0200
Message-ID: <20250916202735.1121872-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054461; x=1758659261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/nnmXcgIUz2l11AfwaOJ1HnjFTrkZnmR1Y0iv8fkXiw=;
 b=L/62SvaDF3w4VAjE0sef2mGpvuSJJOrikgkU+Xvsoh4I72Igo+aC+Ae/iXbTdJE8Jb
 4F6K6eUZyPg3TNsz8K9lFLh3yNejB79Bx6qd/SjDkpGAWgJpbcrPVtqNpNI73ZPPub4h
 PIOx3J8ZqjZtDmodwEy8LMCzo5QknLMiumnWTx4FuIayzU4IOCkAljkluWN5njkBMBRz
 ekzzoPFDp5Nvj9ivUPTZUEkQdBmYnFeke2jUvEFbm6HUC+HmK8dRcTIuPyw4BD7qTdV8
 O4tJ3krLvuGopyNPuBktjNUoBC5wH9Ki0IMT17RqX4ksDAbUybaGZ8rsVMzRUH2G6gE7
 z8mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L/62SvaD
Subject: [Buildroot] [PATCH 06/12] package/python-cryptography: fix
 deprecated CPE
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'cryptography_project:cryptography' has been deprecated in
favour of 'cryptography.io:cryptography'.

See the following:
 - https://nvd.nist.gov/products/cpe/detail/2EBA50FC-F3F9-40D5-82BD-EFB67F761153
 - https://nvd.nist.gov/vuln/detail/cve-2023-49083

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-cryptography/python-cryptography.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index fd2c3d7a50..b2142ddef1 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -11,7 +11,7 @@ PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPH
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
+PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography.io
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
