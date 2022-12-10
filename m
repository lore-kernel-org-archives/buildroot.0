Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A170BC10F1B
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406E381980;
	Sat, 10 Dec 2022 19:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 406E381980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98UspiJA2vSo; Sat, 10 Dec 2022 19:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7817381970;
	Sat, 10 Dec 2022 19:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7817381970
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 897A61BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A5081970
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64A5081970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03qYYJoZJd2X for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F7918195C
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F7918195C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:10:58 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id j28so1510793ila.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYY/hNLdXruco/g43iU4q43Z1kxJXU+QHdINAvs01V0=;
 b=m9dCH8Ow4jYc/sl3vnLVAkBcDXBZJ2tk7ymQGFhtM+DUaajgUqz5Agkyrm1iyR5hd+
 6R8WpMpARleB0E2InzUAe1ffK1PkbS5rmKlXUFuMlw1sMt333AWBzy8l+Y6kCFLRLS8v
 YZigUoLE5DnPAcdgEoYfLyk7UX445CAgcbsDa4Pgyu9ueDmuhk8572lj8+Mk6V5KFQSs
 1ofcNc0ABq1ugbut8e9mwxW/0mYnfDXgwhzpVRMyv7ztmynjb92Y7xfzL1efsWgHF5N8
 QOxSJcu6Wg+gupzxYMWYLMfzBTviWG0cPRL0WbwAwG8cybN1YaX6uSvpF8rkjrb7ojpF
 B6Lw==
X-Gm-Message-State: ANoB5pk5EFAvvaIWxEcIapBSNvbZsoMuGDaxkRNznAifLF4QcCd98h8k
 48Fn+3SndRZgVWElsg9AKmZZqLevoHBd5Q==
X-Google-Smtp-Source: AA0mqf59x86aSIPCDNVoUGciq4umAYPmp3wTQbtU8tmeSHSAZtX0zEP7pbEoQ/82bJlQO+l7RlANmQ==
X-Received: by 2002:a92:dc02:0:b0:302:ff81:3ffe with SMTP id
 t2-20020a92dc02000000b00302ff813ffemr5649235iln.8.1670699457363; 
 Sat, 10 Dec 2022 11:10:57 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q1-20020a02b041000000b00374f99a3de5sm1661010jah.63.2022.12.10.11.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:10:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:10:55 -0700
Message-Id: <20221210191055.3071277-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HYY/hNLdXruco/g43iU4q43Z1kxJXU+QHdINAvs01V0=;
 b=MpAWVJlHD1OHP67ctg+/IwcF1CoR/AVrNEVozrRvJPZ1C3jky12tgHy3Qy4sT8k9T/
 NJmc4gV1d+USPiI86kBEgOsYPHFyDyvbPidQrHO7VaHo2ZTdQ7kqBdDHwkxz+r5B1cxQ
 0PqoMJTmKRevymWCQubh+0/u5ui/lXieMs7x17hgN16QE7pQD4NPYQ631LuOXfI0VGoc
 m+d07JO00CSPAM0j7OPWbIn3lAAmbKhVCfjrxQ774OGvm+TCcDXaO53Ff96tTQ5Mn9cG
 /G9bYK83b7AmO3yGV7X45tdwZJifCdNHCRKKZZcAyyHD7DUZV99yskxLj63dDYWLh9HI
 rc9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MpAWVJlH
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 2.12.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index f4142b5c33..b327a6b8a9 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  b01682efcd6943936702c497afdd0aed  paramiko-2.11.0.tar.gz
-sha256  003e6bee7c034c21fbb051bf83dc0a9ee4106204dd3c53054c71452cc4ec3938  paramiko-2.11.0.tar.gz
+md5  3f49814473cc153a7189fec31cfacfab  paramiko-2.12.0.tar.gz
+sha256  376885c05c5d6aa6e1f4608aac2a6b5b0548b1add40274477324605903d9cd49  paramiko-2.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index a33e11c768..621176ed41 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.11.0
+PYTHON_PARAMIKO_VERSION = 2.12.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1d/08/3b8d8f1b4ec212c17429c2f3ff55b7f2237a1ad0c954972e39c8f0ac394c
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/98/75/e78ddbe671a4a59514b59bc6a321263118e4ac3fe88175dd784d1a47a00f
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
