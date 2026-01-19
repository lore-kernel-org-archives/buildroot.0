Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD9AD29C33
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 14:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A44413C4;
	Mon, 19 Jan 2026 14:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep6EzvGmUyj8; Mon, 19 Jan 2026 14:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58AF941375
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768833619;
	bh=ursBQ8f8yifOqnD1cwdwGOpDiVst5HqjDzUbfexkge0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X877vcUG/86X1XGJmmikqCJdfjLeTCcxmj7oT+SfJvcX4Dm0Pi7LLumZIx2qm7Tkt
	 6kflWNKDZYjgFh7uxfb3qx+uaSTSg9nZbkafmaRLBCqBCw0qT1AXJLteIJ/mQ/CXGT
	 TmHFNedBCKxhuVSkkiTyB6W+GG9U/rG/FIWqcrOrX2gD+Rz+flOc1tZKzAke4+vn/m
	 T4beyGkln42J8jg3LQtfvjxIjhhhFW6apNhreaZRt2Ks3mUNq22vvpwT5y1n4ahM1B
	 m3M748YbzKFmmPe/8c/ydV9pySFB7/z7YpkoJf08vnZ760f5L6Ox/z6qTmUeOg6dcO
	 PLwKEIvbKOxog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AF941375;
	Mon, 19 Jan 2026 14:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B82D2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 14:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59C8D80972
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 14:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8kyUDPf64G4 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 14:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=jimmy.durand.wesolowski@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5713180966
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5713180966
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5713180966
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 14:40:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47ee3da7447so27382975e9.0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 06:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768833614; x=1769438414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ei3A1EsvSMgC7A2AkQVaD3DpaKRINj3wYjPpJSJeOlY=;
 b=ay2yXGZHoNl6fADCjvvsDkoG4yqV9xC7P3JQ+IanUSkyD/zXFUXzSEg1DCgBO8NgUe
 y483D3H4Z04EZG9ppBXBxLxHYrO+ha3bCYGLVAeMaPnQw9Uz66bgivNRlaWgOxmGn2Kv
 YUP0N2b7suoucdqKnmuxPaRczMXb7wq/kDZXZYgxofhWmEh1UOl3s9dCXBwRbxKjZ9Gu
 Ri3WJ2MOh6+yX+d2Sf+CS1CjuTexOWGLiH0MDgeKj2FgmrlXWL2R2vCpGEADSpvq8321
 PHE1ipi76u7QnCDVLfqyTy3j5fDsX7qHByM17pLTYARPn0zOfYgRRL0Jj7Nu0rYF86T9
 IbMA==
X-Gm-Message-State: AOJu0YwaNcivzDfuVr5cAZxLHqQV3rXfTVsO2Zgn9bWiKSrtuWdZ5IYS
 yV2JEkNAjs5oNAEsCQGusEEbpsUSmNlZmUINprn9RtXfZjRfx76TWw99AcTXsGX2
X-Gm-Gg: AY/fxX7Dv9CH2fQLNx/YtiQAKWXhl8eJVmla/sLl3DEeSnQimuC8N5JRaxk8iqx3LR1
 APcBm3sqZmf0JhA9LSEVtVAkLsBE2mKxeK4ny0oXdWZ3qZ8nIDeKD+eFVMlk/FZTbWQSsBiq+yt
 14ybylCftwLVSeLN3qjfEgQDD2yX9dXk6lpeBLqt/B60QrjwEi3NtGXFz9Ll+KkVrmt+a2MMcHt
 Dc2aC5cbypbEYn2NtaC8kGSJYLX+GmsTlfAqA1x6ZD1lbXJfPR4q8vFJ/Tvb+/VySXi4UXhEsVC
 s+M9HP7779ZHwhDAf6I/L/3oLsweA5x+Lf8edimQfBNejz5otaFlya1ENZtaghYb2JU3ijmBTlk
 +EM8ILsYSyPL1uwQyAK/gzFKI9ft/UFcHpw2Ry8OqTcjNx/nfvj2MIVzC6kZr368gNP0EGiIXTp
 8oKaMJnfoaWPdsDCF1OIsLccasyIplqON9rFhSuw==
X-Received: by 2002:a05:600c:6098:b0:480:3a72:5238 with SMTP id
 5b1f17b1804b1-4803a7253d1mr19131275e9.30.1768833613738; 
 Mon, 19 Jan 2026 06:40:13 -0800 (PST)
Received: from glados.me-corp.lan ([195.100.195.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428bb0b5sm252216795e9.8.2026.01.19.06.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 06:40:13 -0800 (PST)
From: Jimmy Durand Wesolowski <jimmy.durand.wesolowski@gmail.com>
To: buildroot@buildroot.org
Cc: Jimmy Durand Wesolowski <jimmy.durand.wesolowski@gmail.com>
Date: Mon, 19 Jan 2026 15:40:10 +0100
Message-ID: <20260119144010.1646792-1-jimmy.durand.wesolowski@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768833614; x=1769438414; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ei3A1EsvSMgC7A2AkQVaD3DpaKRINj3wYjPpJSJeOlY=;
 b=G5yMdeeagrojKrVFeP3nl8QUIxpoA8rwhsLHk1STUK4RqvOILwrmvBesM4ghykLAFc
 d6Kcks1tQ2IhZ5FkeoOO3eqBr6s92CisnrxtoxI19k75JEDjqeZUiN+uSGjBPkb/hAOH
 9muIV/dNQkbGdMK2z3/5yC+BFoymZsGr7wMv+6puQv+YpNN0BsVTk0X6oD69g6XI+d2q
 GTkRFpt2XWZAo+9Koye2J12+XL7D3zJGSq1DSTjqD28HmZttQoMRTSzmkia0/QVVGiGP
 3gM5iKXAucPiN3942H/RaqQQqLC8M80UdIBDsJbmQmdHto9jk49ko0nCS3ZDyHliZGVy
 4Eug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G5yMdeea
Subject: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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

Since Python 3.14, the multiprocessing library API has changed:
> On POSIX platforms the default start method was changed from fork to
> forkserver to retain the performance but avoid common multithreaded
> process incompatibilities.
https://docs.python.org/3/library/multiprocessing.html

Until this is not yet fixed in the nose2 library (see
https://github.com/nose-devs/nose2/pull/644), we need to fix it in
run-tests.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.durand.wesolowski@gmail.com>
---
 support/testing/run-tests | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 2f670c03b8..18a6e1dd91 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -10,6 +10,8 @@ from infra.basetest import BRConfigTest
 
 import infra
 
+multiprocessing.set_start_method("fork")
+
 
 def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
