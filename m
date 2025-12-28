Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE108D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BD3405D8;
	Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1CEoM0-x7_R; Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6181740542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948204;
	bh=HbhmgWXtQDa1J85EkvocRfMMlkO+MkuvfRchjUzZyc4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Xp8pe9pQFd6GHlmwfn8sn6lwYywIiU7/IVjZxbQTOwp3biLVBJlhb5HQW1LcUkuVd
	 1wb76oWzKQv0Xh/53tRUiQbh8zYBwQjzNiX9fNVzz0RnsER3x0cEmAWHzr4aOVGqyz
	 itsz0TyZskcb+6SA+3zUKr39nn5tXSwpv7DYIJSXPNDsIAMiDksZaOl/abtFXs/Em7
	 CR3vy1cf5QD6Y2dBCc0d/HeY44XDJaAwawSUKfUKbypUiAzC7O3/XgTKbUZRblklxc
	 vNjRILsA25hIWbvH/JqPr/7m9QNMiY9QdJ+eJ0rg4tBA5URzctkOPA3IxqStFEC0Kf
	 ivS8hy79tAKpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6181740542;
	Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24243B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE0B40082
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI3zajImAlu7 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E09D840077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E09D840077
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E09D840077
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so5590019f8f.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948199; x=1767552999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBjs93pTUZgUXHaH40l32PcexU1xHxtrkyLexAaGQZY=;
 b=iP1q4fsgN/uv6F4nAuFH7+3jBaPtFHOOV/SBpBGrM29xE0HxpsZQdT+XYVGe03SVkh
 N8qhtHpYBLfoT9tgFnrluUDjI01vqrglU8KrS+Erq5mSSpPv3bpCekO81Bkp5ESy2/nE
 7aRLDtqq9vQMOVoh2yVfbHB1KxZFrl8MM4ZZnIE5J2tFxKnHridXrGFak+xjm/95/3Fp
 aUdmV9MOkYzwo1czzCEAf4x1MJ6LfH8uZaiGKwQFDWcywvkDnhFxBhoHiJ0ntvTIdPe/
 Z6yCgOoB5BFBeiEzcDIX+q69jf96mLexY2UTincn93NiHz7ahGrfymzxdCRgjTuoWJ2q
 WVYw==
X-Gm-Message-State: AOJu0YxSUnkE6WtciZidm9oV8hjj2NVbKx3dNWEj+dR+PJZk8E+dze/u
 ioU2zQlTzsBXfzb9Bp6qMfjaF/92TpT+NN1KnRogk1+xzsppD1hbdVF3tvVXeQZ8Z2CP1fmOpt3
 z6lICZxY=
X-Gm-Gg: AY/fxX6KRYk8M+HfgPJL4tsDBV66bPZMWJydnxbOaCnNSUQZoO548mbqGHYHgIAToIw
 T+T01/+nXu9xb08YKyW9Wcr4o/eAoixhkklKKCHR8tEivr0zIcFz8l6X9BhtcwCE24Pdh1Hh2Jk
 L6X0VxDvl0rUha/VelSTRMt9O7TEeGuXPeSe3qYLSFfVdG8pe0qefZUKttQDYVFbquWlH374r5q
 um56dD7doUX4yJgKI2GyFGw2/KlqKlRZap7/5BpbmJgNT0tLpJFxzy9rXBI1ZXAqzWqr5Pf7t7L
 vZbR01oq5507Y/walsSBjdEaufTkg+qE9NMwPTZXHK29ZZ5XX6dMJKEO4ug81tWxpH5FbAAGmrn
 Q25vHZxXhtqlG/llcXGPF2v2oNkOJLvV7Jww/hFNqsHqxwx1vmR5+xhKcPLB8fkrjzsdjRkaIQB
 RoCEH+98pXYxG1d0MXcP9MLS4XNGi15PkuVb+ACUg20k8zUws0RIQMX1BsU4ktRD+Fm/zZh2gx
X-Google-Smtp-Source: AGHT+IFrmS/pNfhz12urqoDADyTjie00YnaazwBaR+8e7hAFj0f3CzqK6a6MpUg3nMI650kcK6HASQ==
X-Received: by 2002:adf:f4c4:0:b0:432:5b81:483 with SMTP id
 ffacd0b85a97d-4325b810949mr22771069f8f.24.1766948199046; 
 Sun, 28 Dec 2025 10:56:39 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:38 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:26 +0100
Message-ID: <20251228185637.58072-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948199; x=1767552999; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BBjs93pTUZgUXHaH40l32PcexU1xHxtrkyLexAaGQZY=;
 b=KQV77kRiHk7uRIp4ZvDfzlDM55K/PNgNHleZyjqbgGXNB1gPGVwKaZF5Ldh8wP5yfy
 j2E8jiP6K7dVedtpDY3MK12/+cu+jLr9b5SuhJQn485YVZ5Z2lZOM+53izpeUhqvSbDD
 y3hssluXod/kOIfGxY5dx24RP/2IDwH75su93zot1zpqhtIkHz+yXY2KOo+LFcaxMaWH
 A1skC/etmCbg4xT2H2zQSKr4oTwoqUd+z65Cu9iwynuIxx3u0pVH/WdohoQrvotCgX64
 zqi07ewBA5VQvAnpJEBY/cYdYR/g2Wx0XA0vrGH7EYN5E9yuIEQVPuWkSXHnULCKvuSq
 /xxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KQV77kRi
Subject: [Buildroot] [PATCH 01/10] package/cpp-httplib: remove stale
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] removed the stale cpp-httplib patched but the
IGNORE_CVES entry wasn't removed.

[1] 8988278241 package/cpp-httplib: remove stale patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 62255180f4..ed5c33d2a5 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -13,9 +13,6 @@ CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dtest=false
 
-# 0001-merge-commit-from-fork.patch
-CPP_HTTPLIB_IGNORE_CVES += CVE-2025-46728
-
 ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
 CPP_HTTPLIB_CONF_OPTS += -Dcompile=true
 CPP_HTTPLIB_DEPENDENCIES += host-python3
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
