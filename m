Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6689C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 09:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469D8410AE;
	Thu, 30 Dec 2021 09:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqI7fMHC-6x4; Thu, 30 Dec 2021 09:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD273410CB;
	Thu, 30 Dec 2021 09:09:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76D7B1BF346
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6545360586
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkN-uitT7Imi for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 09:09:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27F9C606E7
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 09:09:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s1so49211778wra.6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yiGY+FzxSF37amlNy7vZ95CcFO9ZxRiwBRrcYyc1Aqk=;
 b=MyNtdWNTmqPRU+/QmJ2D1+eX0jGT3TuHDjo+WMZEAY35iNc4OuHxqIV8AU68Rwsk2U
 uR9AkH0LPDVwBTqt/q+qLSXcEMID+C57q9xdRg1O9Eu4GuXAk0hYnhP0NnWx59YJsXnN
 fW2K4IdFgkmdpCaiIGiYmfFzs5ZkUZ6D6I5Qx+VPix9C8pQ77DNi94zqwMD2YGUjJ+XX
 Ws8Ts0r4SAbNb5nxvqRpI7IgAFD5Ih9aQQJNs4feAe0bPbJhyTeOyp7ucKSvkjPXKWWn
 YSDvhwDRaW24Iy638HbBL3iibPkFR1FHQDLzlm702Pc1hWNTz+YV1b5Cy5inBHWDB2P/
 Us1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yiGY+FzxSF37amlNy7vZ95CcFO9ZxRiwBRrcYyc1Aqk=;
 b=KBIhQyWd07hiHUGG2ih59zhw/rReAg5inLGxzf4oVuq/xnpyCbKigL0Vi8HwyVbQ5a
 z/yVrpUDqmvrLeRa9Qm9fpewItUKWvbc1iW3T6Zbvf0+kd/RgTiDVyPq3QL1kAe9rOlb
 PobUfsGBcjNqRIEEV2z/q0mA3F0fSJ1ucOYkaLkFdt8NgQ6p1fYp/+8FVELdN9ABawxP
 sE9/JgaK0+dhdeea6gi9xo+w0ISZHhW0Ftt7y1ZfuP+/YTh3B33HZBJnsK6p+/AO7YJ3
 O/TfWjylK51OVPSuuG2NlecycMewz9AcHpaTa0I/pwY2TPnBMWcnCFUhmlkLuXjMQkXV
 VTVg==
X-Gm-Message-State: AOAM5333UC7zKxwfSo8BJAtako4I+NX2pUmgJjpapFOfBwIUTQpSzMlC
 Cwt7NTGxSUQkhyPVqSH0fDnegUoaWP4=
X-Google-Smtp-Source: ABdhPJwvDmgBLkqFKA7zI7E20EPyazejwBf+hfcesqXKrNEpT2RsGD26YerdSCHd19QGXUEyvOvIdg==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr24090290wrt.649.1640855374315; 
 Thu, 30 Dec 2021 01:09:34 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id c7sm27207806wrq.81.2021.12.30.01.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:09:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:08:22 +0100
Message-Id: <20211230090822.1332429-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: needs kernel >= 4.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rt-tests unconditionally uses CGROUP2_SUPER_MAGIC since
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=47e857d4bf77440cb59d17c6ed7882a48514f18d
which is only available since kernel 4.5 and
https://github.com/torvalds/linux/commit/67e9c74b8a873408c27ac9a8e4c1d1c8d72c93ff
resulting in the following build failure since bump to version 2.3 in
commit a952b016263cb9ae5f116dac0b3da4ad93a4c55f:

src/sched_deadline/cyclicdeadline.c:381:29: error: 'CGROUP2_SUPER_MAGIC' undeclared (first use in this function)
  ret = mounted(CGROUP_PATH, CGROUP2_SUPER_MAGIC);
                             ^

Fixes:
 - http://autobuild.buildroot.org/results/74766c215a6cc19cd02faec6181ccd5de49c15cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rt-tests/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 477fa288d7..47fa7cd840 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # deadline scheduler syscall
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU # fork(), numactl
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cyclictest
@@ -29,7 +29,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 3.14, dynamic library"
+comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
