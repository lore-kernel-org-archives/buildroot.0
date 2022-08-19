Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EB6C28B2B
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 17:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B6784159B;
	Fri, 19 Aug 2022 17:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B6784159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8JlSBtADUeB; Fri, 19 Aug 2022 17:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D991405D0;
	Fri, 19 Aug 2022 17:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D991405D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F04021BF366
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F7941D35
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F7941D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ommWUetxY4y for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B214741D22
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B214741D22
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 17:51:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso2820355wmr.3
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 10:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=0b1QzhPzhESvoers5qBwhH0OVDZiudCgLseUr1C0RKo=;
 b=kSjhvUFSFjiYqPPqn+tEcrJOqAKc6K+05TyS/v7o8pgYwX7q0lRRa9NzmLTJWDzR80
 uI8pj+XY7lvTEdWZiVgjZZDBi42scsBzZ1DQGFQ01/nZU5fHeJQppEkJQ4VbAUQEUdSA
 nAReA7+JgQRXpzbiofaZ6eW4JXP4IO000bi+DWxfhd2tQ5D823tyrB6fsomu23qwlc24
 hBP1JVZ/sRgrmPLgzJNQ5lXKIuSPACOSV36MUcdkB5bubnYUNxuCCIrnHS0p4hJLRnvr
 9YYEbqqPuvqWDUMIAp+/ieQ9tgusxDP/jHq+3q1hTW0OxErF9SGfXyxrbOddy2Fdg7Hi
 fTjg==
X-Gm-Message-State: ACgBeo39se1ULFaO8kVrJ967g7SDPsTItkcrgtS6Q/IORqXHsa3EWXyc
 DKxumICqqTqW4HR8RWOWrKS3tnqwRCc=
X-Google-Smtp-Source: AA6agR4GtjZeUwrXoWyhLwwhPv/taKhV/YAW8peRjTwWPjiNxs7eh/bszKGtp0XstE0QDG+C94E1kw==
X-Received: by 2002:a05:600c:ace:b0:3a5:b495:854d with SMTP id
 c14-20020a05600c0ace00b003a5b495854dmr5373762wmr.86.1660931462740; 
 Fri, 19 Aug 2022 10:51:02 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:54a5:9a99:1f8c:15e1])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm8937295wme.8.2022.08.19.10.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:51:02 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 19:50:58 +0200
Message-Id: <446f8241f76f0bb59b032b5368e3028e769830f9.1660931225.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660931225.git.yann.morin.1998@free.fr>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=0b1QzhPzhESvoers5qBwhH0OVDZiudCgLseUr1C0RKo=;
 b=M0XNLQF+SnuEqXDCj1O5l+OhI/GtsPF4mfafdAlSF9ZR9RcdxZcN846DwnAdTm/9gT
 9bAldItm3n/hPdDMOqNmuwzPjS0xKQ699J+TvNii8Z/3j7EFffLpOLH6GpXB5sxHQJSP
 Bujee2TGUQ5jLdT1pER+YNS4LivjpfmfO58RtlTVBLfWc9pQnNE5Z8o6RoF1424ny65W
 jYlgpMratrdYeyOxKFVRrvuSKln9DHK9pLyawr4TAxB3UZzzR6tew/nquw25GBiMVSbh
 UT8RKQ39sBb2Ln/YPPSfqRpASXK4YoJvuyXnF5+94JjLRDiYzNZOy/0whhrW16+cv99t
 JUjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M0XNLQF+
Subject: [Buildroot] [PATCH 1/4] support/test/cpio: test for pv already done
 by listing the cpio archive
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since we do not pivot_root/switch_root from the cpio, whatever we get
in the rootfs was exactly what we got by listing the cpio archive.

Drop the test for the presence of pv, it's redundant.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 support/testing/tests/fs/test_cpio.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 3f661e370c..9a529f1edd 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -57,10 +57,6 @@ class TestCpioDracutBase(infra.basetest.BRTest):
                              self.builddir)
         self.assertEqual(exit_code, 0)
 
-        # No pivot_root is done, so pv shouldn't be there
-        _, exit_code = self.emulator.run("ls -l /usr/bin/pv")
-        self.assertNotEqual(exit_code, 0)
-
 
 class TestCpioDracutUclibc(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
