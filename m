Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CDFCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 18:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DD160E91;
	Fri,  5 Jun 2026 18:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLMVhtlggocj; Fri,  5 Jun 2026 18:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC7F60E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780683286;
	bh=gNs4jcdPnBRKfEBZSobs8kvTj+7i4fWKzIQK4SZVdco=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=iOJiK5ZpUT2qkSIHdqVap4Zrc6PFcymlvY45QfeCUNrujVgYrhNS2qMRgVWCP/A2u
	 HldlXTGRS1VSOsAh8TTAPJyjagFvFWyaf7ZACH9wu/cvgbLbNLD7VTVHeKtcSMIwQi
	 HAC+8AY9TW62ebFNcfLvPFHl3RIP/NUiA/3QBIhwRJXhq7NO2D0wj6Oaj3srwYU9bW
	 WJkxn/AKFBxaS0fetEDymFhRoVRofciELLMfEGpjSb8kxcVuYpzash7OoUbeQAQZ2f
	 KtJcK3lzOdiv5TkVp4PPow/MFWqUQXLvAl80G4y9VzkDid8pb+EG460/gtJ+LTPGN+
	 qFx9mNQc9JJdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC7F60E92;
	Fri,  5 Jun 2026 18:14:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BB1D26A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E3860E92
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivpK9oVGzUSN for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 18:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39D9060E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D9060E91
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D9060E91
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 18:14:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-46015dc517aso1872075f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 11:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780683281; x=1781288081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2HW9yCYVvEFRudPRH8Wobm9noYH1qyTzEiUWbIV2lg=;
 b=aW0LSFEjaV67nyriVRVIrjHFa7q2El1xJlZpwnXDT0R4ouiORqwnTW0AmpaOofnNNm
 a7ucNQMbAdDlR4g+WMgzdnIfp3W7m0rwxm8vzWcYd1nlo9fttjseT6CiOeQf60wX6e3o
 RxME7J9kkXeWdW5b90zg6FAba1Cs1vzZqh0ndvzaOP7ficNBh5Jczxmp+qIzuPENrzL9
 y+RBvuVUwZ2b1idN82JX4ge4KPk9kss8vUroYASdBxixmxi4JJpFpNkJ/zHvzzbpLsXg
 uSRP6e/FEiQhcxmDMdd19LS3dm7CvzQ1YWcCrN317Rm5kDZ8cTYZZ5dBwi3Eychfe1GU
 GtBg==
X-Gm-Message-State: AOJu0YwgmsUC9daWqHTNlcsCiJzs52VDKygwmt4nuKrc8xZ8XfENHcM2
 tVQchV3cZkJMp1rnZL/kSRYxtRIxtRBlJpeAhaZyvl0YBCgC7pDx+WT4o/I3PCP/ixKYa3ewL2g
 z7qO2
X-Gm-Gg: Acq92OGf40zQUqJq37W1225HMkqVmXLv4FbS3tMqB05SEwAxeNEOU2D2IaX2XKyOBFF
 pYEa1iw+YdncJOK5acdeeLXjckHqYRjquqj5XhXwZ3bHCIW9XL2js62fhOLq9j0QF5RM403+gyh
 9zzO/0vJ3p/sJcUwujGcr3FxvAV+RUI7oLaPQ/nK4AoNiAbD/mH3JU9KYgpw6DTDjtS1SXt874s
 xE3zlLkEQE8zE7fj9qAcdN97xezWdweZc+fVJOhcxUJsS/8rZ1hb1qhfQyDWJht4iAcER8Cz85q
 MnShDTnQE0SV1aJkRaz0ixtW8SsZ3u/lg/e8aWt3QL8kKQehRnh/4f9KDlC6exWuUkurzLt+7xD
 5Lt3aflllPIaicjOGPai4WrBznELHKCear1fDqNu0sLkSVgdIKoq/g1F5V29UM3fxtHsI71RB5J
 SI7hnQ6+MIt5GbjTbvHLTu5zSixWMh+SeZjiF3uSMBVJiE6qYbJ7J+uTHjSfyxkPu6kQNHxaVNs
 kFLPyfBnCfm/O7XRKsZ9UhtNQmmQCboJAPH
X-Received: by 2002:a05:600c:4fce:b0:490:ace2:f8f with SMTP id
 5b1f17b1804b1-490c25b0a79mr86904975e9.21.1780683281209; 
 Fri, 05 Jun 2026 11:14:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3e59f5sm178458665e9.14.2026.06.05.11.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 11:14:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  5 Jun 2026 20:14:38 +0200
Message-ID: <20260605181438.392320-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780683281; x=1781288081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2HW9yCYVvEFRudPRH8Wobm9noYH1qyTzEiUWbIV2lg=;
 b=ulrKOZA/ZO1x6b595XIr5ocZEWefI6hjuUgbB/nqlZsen9Br4tag045A1Jkh4WKA15
 gMLfHxtLYE0R7OOSjqqRyY63iRCRaolidrvPVdNPglRdqvp/jCApxtBZWq+9ce+n+YZh
 msZkIy9rN9RsmJ36g5ErC5agDGMCpn1OABte4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ulrKOZA/
Subject: [Buildroot] [PATCH] support/testing: TestExternalToolchainCtngMusl:
 disable yescrypt
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The TestExternalToolchainCtngMusl use a really old toolchain generated
by Crosstool-ng. Since it's used to test our external toolchain infra
we want to keep it.

But this test doesn't build since the last busybox bump to 1.38.0 [1].
Indeed, Busybox 1.38.0 added yescrypt algorithms that requires
explicit_bzero() [2] introduced in Glibc 2.25 [3], uClibc-ng 1.0.47 [4]
and musl 1.1.20 [5].

Add a new busybox config fragment to be used by old toolchains.

While at it, apply the same change for
TestExternalToolchainBuildrootuClibc (uClibc-ng < 1.0.47) and
TestExternalToolchainBuildrootMusl (musl < 1.1.20).

Note: TestExternalToolchainBuildrootuClibc configuration is reused for
TestExternalToolchainCCache.

[1] 5a27004cffb6bb034ff80cfac42a87bbd208755d
[2] https://github.com/vda-linux/busybox_mirror/commit/80e676664e1d7a0b07f14bff44f93d1fef709cf4
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=ea1bd74defcf9d5291d14972e63105168ca9eb4f
[4] https://github.com/wbx-github/uclibc-ng/commit/9e7b342fde5505c0a1d4968e9d70537ac406f640
[5] https://git.musl-libc.org/cgit/musl/commit/?id=05ac345f895098657cf44d419b5d572161ebaf43

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843888 (TestExternalToolchainCtngMusl)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843887 (TestExternalToolchainCCache)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843886 (TestExternalToolchainBuildrootuClibc)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843885 (TestExternalToolchainBuildrootMusl)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../testing/conf/busybox-for-old-toolchains.cfg   |  1 +
 support/testing/tests/toolchain/test_external.py  | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 support/testing/conf/busybox-for-old-toolchains.cfg

diff --git a/support/testing/conf/busybox-for-old-toolchains.cfg b/support/testing/conf/busybox-for-old-toolchains.cfg
new file mode 100644
index 0000000000..63fa64f51a
--- /dev/null
+++ b/support/testing/conf/busybox-for-old-toolchains.cfg
@@ -0,0 +1 @@
+# CONFIG_USE_BB_CRYPT_YES is not set
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index aed3664a02..b3bb961aac 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -70,8 +70,10 @@ class TestExternalToolchainArmGnu(TestExternalToolchain):
 
 
 class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
+    busybox_fragment = \
+        infra.filepath("conf/busybox-for-old-toolchains.cfg")
     config = BASIC_CONFIG + \
-        """
+        f"""
         BR2_arm=y
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
@@ -83,6 +85,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{busybox_fragment}"
         """
     toolchain_prefix = "arm-linux"
 
@@ -96,8 +99,10 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
 
 
 class TestExternalToolchainCtngMusl(TestExternalToolchain):
+    busybox_fragment = \
+        infra.filepath("conf/busybox-for-old-toolchains.cfg")
     config = BASIC_CONFIG + \
-        """
+        f"""
         BR2_arm=y
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
@@ -110,6 +115,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{busybox_fragment}"
         """
     toolchain_prefix = "arm-ctng-linux-musleabihf"
 
@@ -123,8 +129,10 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
 
 
 class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
+    busybox_fragment = \
+        infra.filepath("conf/busybox-for-old-toolchains.cfg")
     config = BASIC_CONFIG + \
-        """
+        f"""
         BR2_arm=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
@@ -135,6 +143,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
         # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
         BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="{busybox_fragment}"
         """
     toolchain_prefix = "arm-linux"
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
