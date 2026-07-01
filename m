Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80119C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 12:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC3061013;
	Wed,  1 Jul 2026 12:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmPL7Zzw_7r4; Wed,  1 Jul 2026 12:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 472B460A62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782910673;
	bh=xfS+2gS1Dbd84scxWA0bz2j7tHJMQoPmtSbLH+2D8ec=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EiTjpIJsU8VxjUr9aItLDhfaLFZc3eBGcI1KZIzsGnzDaVcVi05cUrVWN3/onNWCZ
	 NfCGfK9zTEkKyWvIJ2Gca/pSDq26nCSoNSbLwlj501VneYRnCGh1kjnHqFQFuzHWVt
	 inimRdoH2Iou4LSpTi9bbxAB8ft7ELgMGhyjGPmugsHY0pJKEIuIu2fPdLlzgWCiVk
	 UWsy4preul28R3kU59vXwmejE1L7OevCNLmzL6jO7g8lUMygXJ+aNjVFZ+FVNg78+m
	 YcM7blnR9PAtPyFIXb37j2hRJAXjss1/0QNW6cHjd4scUXzAbCKbNTVH+8QjWuinr0
	 Q2Phlg+BbyZTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 472B460A62;
	Wed,  1 Jul 2026 12:57:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C97A2EB
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2235A821A9
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tj4WPVF2GHxU for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 12:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2BB0821A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2BB0821A6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2BB0821A6
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:57:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47362928f65so616467f8f.2
 for <buildroot@buildroot.org>; Wed, 01 Jul 2026 05:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782910668; x=1783515468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhyLRGvFNRXVQdDPDcT/UOMZHd7D7Dyv7djHjcEH1B4=;
 b=iP9YTqGzRk220e/MdorgQDa1DunGkniEiaQYu2kfQfp0DuzNG40SRoczX5sGUR2uIf
 QCwCKzt4uwUHsbjwjZFblSam7pi2oErNhzEd5KQb4zrk4JcXZVsrYqokT3yghcqJEvXA
 XZul4RH8al6z0fqncFsUwplqaubCM78UbJ2JUN4o1zCnGpixgjBy9644n7xNQPCp3rtu
 VBtxbtMDB09qTgYExgIdF9VM8e3dktPCo7klFww1PJXs0WifGM9pILJT4kVCfviPXEcd
 GAMmTDml43+NX1lx6nrE+0f4EU0/73NRjmmhDXZ+0eowiAq+HdPSZGHrLtiqEo6K2ryt
 Emjw==
X-Gm-Message-State: AOJu0YzOlEMYYTd/ubFe6nX73QYFAAo/K5cDz1VRg891dqyJ81yBNdgi
 jgpM0OzOs6ybfT0coCZRTL0p0cUyCoGZ1FgYnavM0PMZ7pMXHs5U/6+3JF4iceKd0N+SuLQeSys
 KYdl3C+c=
X-Gm-Gg: AfdE7clzNhPU484BwtKi/Tj9Ydw14KAMtIWec21DdFB5pRbOrAxyPIfSkSye/KNVIl4
 rZfYOAWMdXzY1UD/fzRc83tO6djAhwCO+IQ6zRAAZc01YJMxXLJZ4k5sWUk3369SdpxYLZ+OmuV
 j0utO+U71dzkTHocAS/5rlnfhuLcPw1SD0aLx6E/kp4XBFLx37k/Tz/MlUuRjapg1yewVNbNRdL
 hq7r/EJ8PWXG5eEhaZPPjW2OnkOQVdRcDjw7Yn2/MSML3ezigmQ7w7KptXBlZQbi57hoxOsgP6P
 ItiAdU9oY7dKoIjcL2+mYO1MC897XZYgxvUgGSRrRqtR7z9VkfVIwKArQHVUThZ+Bd72Y4+uu4x
 gskrsf2WUY7S691reWEqoIUamG2AvLOEFRZjOAb7jMb0l/CaNZTCxDBfs3IOfZhbNsjk0Bk4iiz
 jbHmsKehoi7YRY9ADGSz7zrvSzgtXbrSzJCosEd2BR7U1KfsRnY2C7B/DSgBZqzENjUbk4J1Gw0
 QWvFXB6Nw==
X-Received: by 2002:a5d:5d0a:0:b0:472:326c:a4a1 with SMTP id
 ffacd0b85a97d-4775a7cb87cmr2809663f8f.22.1782910667593; 
 Wed, 01 Jul 2026 05:57:47 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756778f015sm17633893f8f.31.2026.07.01.05.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 05:57:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Wed,  1 Jul 2026 14:57:41 +0200
Message-ID: <20260701125741.4064511-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782910668; x=1783515468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zhyLRGvFNRXVQdDPDcT/UOMZHd7D7Dyv7djHjcEH1B4=;
 b=aNxaHm32V/GFiyjVROOQOxyWKfbgvK8eiemB4j8CPUn8PXYbE3zkT1Zc9j+Pl45piQ
 koUJgBWNSc/yndCvuRXGXVr6vfUEYjbxEdiBUTAEjJ5oqQdqGPsFyASTCvpaWUvU2Dfu
 dwfZ/eBpdJQjUZJbLFauy0+0RQTqjlNFWU6fQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=aNxaHm32
Subject: [Buildroot] [PATCH] [PATCH v2 1/1] support/testing : test_gnupg2 :
 fix runtime failure
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the precedent patch "support/testing: test_gnupg2.py: use assertRunNotOk()" [1]
a small typo (OK instead of Ok) was introduced in the test_gnupg2.py file,
which caused a runtime failure.

This patch simply replace "self.assertRunNotOK(cmd)" with
"self.assertRunNotOk(cmd)" to correct this typo.

[1] cb791850ada782beca4b03e26356fd8506912d52

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_gnupg2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 6f862c31ce..c8fb029c95 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -108,4 +108,4 @@ class TestGnupg2(infra.basetest.BRTest):
         self.assertRunNotOk(cmd)
 
         cmd = "gpg --armor --verify {}".format(asc_file)
-        self.assertRunNotOK(cmd)
+        self.assertRunNotOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
