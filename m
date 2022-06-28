Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90219C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A9841919;
	Tue, 28 Jun 2022 16:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10A9841919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luunKT5m-G8R; Tue, 28 Jun 2022 16:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9731A408CF;
	Tue, 28 Jun 2022 16:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9731A408CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF3FE1BF28D
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99727408CE
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 16:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99727408CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMqxlEAZ3KK3 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 16:43:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B304088F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45B304088F
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 16:43:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id f190so7416062wma.5
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 09:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4swWInkMmCFb7TYW8udnkokSA5H9WNbb4xFrFSeui2I=;
 b=AoyoxoumJrKl+7nZUwk94GdUIHy0N+06xjHKwxVzDIKe8AmksHGFTCm/AQL3MBTCpD
 n63aqsrw18IS/YmDjyGYi7GXgzvR6HSDM8U7k9o4GqVe9gIPCL65cmQLbKr6DPwcrqzC
 ppmmivCtxYSv5slzwqmoGVEYIFJFAT/Uytc7fzANyjNeOrteAg+3SP28R4F8yljo70M8
 QpXW6NMUK4nIvhtXnB7ubXpQdTe+gNdlb6R0WM7KCzLGLUv1RSbVEmUbvD8n1MCc82MC
 HWnBVh7ahzRbcRmq9XUfwA+Do9UOM/Y/ovX/JA+HlSwWWWQNdfXwQPgDXO8+JsHl8a47
 1KEA==
X-Gm-Message-State: AJIora/Zwf+DgpZV7MieneByeA9zsS3gBk1MaSZCX48kPpxiMPPi3BAE
 ARqPJ5k40H0ehUZ7Ds4RECEdkHVScN4=
X-Google-Smtp-Source: AGRyM1siBCWAZWkd8krDQIkL6mTf72a18wHNaS41llzWByP+E1oGh3AV/LgkOhum+M1AB3ZPuXbNFQ==
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr603136wmc.56.1656434607280; 
 Tue, 28 Jun 2022 09:43:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003a047dccfffsm19703wmq.42.2022.06.28.09.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 09:43:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 18:40:38 +0200
Message-Id: <20220628164038.2836798-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4swWInkMmCFb7TYW8udnkokSA5H9WNbb4xFrFSeui2I=;
 b=lOxQD7P59cN1QDg4SdsQ9f9kJt83PheZXIzdrM/ioE1OKqHzj8IGv3Lfr8OoUJO5ko
 Nigp5IH4GTx/qk8o64kEZmNXGmWE7lXAwUZQ1XMHMwfo/gG9qYTLktyBgaP92PWaWZBt
 hXC9q+NcOUzJm8CSOyPleb2ddGJt8w83aZhkiMCRAV+iIQt2H1sx/GLKlJ1Oym3oGVM/
 erE2Sicut5b4B38rtMFE8lrNLOtFKwxNqiN4dhvJOdzbW7/eH4xq42dJs7T965BEA4I+
 7BD2I8Hb6lV2TT+vAGheGkJWEpD9LW4vlor2G2EPiog+gpnNDeq66tssZVz43PiFPl86
 AXVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lOxQD7P5
Subject: [Buildroot] [PATCH 1/1] package/uuu: add host-openssl dependency
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 776385d645b37cfc43479b37e106244aa9ab2e85:

CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the CMake files:
OPENSSL_CRYPTO_LIBRARY (ADVANCED)
    linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu
OPENSSL_SSL_LIBRARY (ADVANCED)
    linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu

Fixes:
 - http://autobuild.buildroot.org/results/2f05bc67112a59eba8f59ff707e43d76e41dbad1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uuu/uuu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index d1d7824018..9bf9ff123b 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -9,6 +9,6 @@ UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
+HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb
 
 $(eval $(host-cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
