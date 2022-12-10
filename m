Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD52C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C022814BB;
	Sat, 10 Dec 2022 18:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C022814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVSlaHblfbLs; Sat, 10 Dec 2022 18:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B698081496;
	Sat, 10 Dec 2022 18:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B698081496
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6445E1BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CEA74047D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CEA74047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0A-dlh6lQfz for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:03:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7574340376
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7574340376
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:03:03 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x12so1474769ilg.1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=janTuK30P3i2VaReB+zD7etJI9mtS9HmLqjyHzboyfw=;
 b=KzpfajeVcBusCprVtra3rQcC4B21aj+FckeSJCe2r8vgDPBeGOsIy4USEKdRHEZUMt
 w7GTz1I4WdnyNecCka1oti/szvdhCaC1Vr2LsEb75LKftwaYg49mz4nkrCwf+STjqIZ/
 pIMp8YCVDy6kgoPFrdTVPR2gFEWqdZr01k2qxmpbmK1W82S840/BMQVI+/ialPLs+luz
 8NhqXWVSD/LDM0RNbyGdnTozEdrJW//7/pjGILCi/TMiLAeZP4K/1gCj/J63VbfcKa3s
 9fQabjRkuenMzm+I9u/Ujti9y60/gSIMagWGwAKIAJ8izfyVh/wpEGr+k+Jw1/Ka9t/h
 AxZA==
X-Gm-Message-State: ANoB5pkzMuGpR6vLdnh86xSDvUcgq59ugMbjYSQPw2hK0olrDczbdmzS
 I4q85qTIAvekYpjkxi4+shoG1i2N0xYBbA==
X-Google-Smtp-Source: AA0mqf6KAbSUuwA5wGsi71+g4Kf+4P5o0CrpUJSPfUhV6l4uR6D52THoMWkn955c9l9pyTSbqMA2hQ==
X-Received: by 2002:a92:b12:0:b0:304:ac6d:c2bd with SMTP id
 b18-20020a920b12000000b00304ac6dc2bdmr1189313ilf.11.1670695382343; 
 Sat, 10 Dec 2022 10:03:02 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 u13-20020a02cbcd000000b00374d6db7566sm1538427jaq.117.2022.12.10.10.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:03:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:03:00 -0700
Message-Id: <20221210180300.2830711-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=janTuK30P3i2VaReB+zD7etJI9mtS9HmLqjyHzboyfw=;
 b=lK1UnhpfKCWJyakyBNpLrMNj8wTQLn1UGlmdfiW+AhXsAwzQh44aeCwHSdNQo+Y7As
 WPNAIJ3WxeLpSkPz/4EZ4LmkHADiAt4pIfH9rhp90sfELmZr9agwyfHdMsEevUAOokY6
 /7/tLMvc/GgvxcjJkZCxg59zLsOqKDfriZpugBJjc4uuguZngsJ+a4WBa1S09CRaU3i3
 2hyPLYnhIBQw0tBx/TOF8qnuJC+fGUxuJ8vGqKXCsyc9BxNPKyzTZ1EaPLmdWBghORWq
 Y/W5RUeLswurCWavMRaq4Y12hFmTvp5nAhiA1QLvzKns2hyrYQQh6qwSZHZgzC2lR09k
 OWZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lK1Unhpf
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-vcs: bump to version
 0.3.0
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
 package/python-hatch-vcs/python-hatch-vcs.hash | 4 ++--
 package/python-hatch-vcs/python-hatch-vcs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
index e57eeddd2f..6e5fe1de13 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.hash
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
-md5  e56b6d0c05cfb9b59d493c67f94d6e48  hatch_vcs-0.2.0.tar.gz
-sha256  9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce643c36d09ca908abff  hatch_vcs-0.2.0.tar.gz
+md5  c2f2cbe6851b7b2969cb4aa24c4b9b2f  hatch_vcs-0.3.0.tar.gz
+sha256  cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee  hatch_vcs-0.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index 55c6461751..ef5f6541cd 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_VCS_VERSION = 0.2.0
+PYTHON_HATCH_VCS_VERSION = 0.3.0
 PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
-PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/ac/13/b3d83564c0cc0f1d45b4ea2a78b87b383a8165797613fedf11f1a7e49b48
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/04/33/b68d68e532392d938472d16a03e4ce0ccd749ea31b42d18f8baa6547cbfd
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_VCS_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
