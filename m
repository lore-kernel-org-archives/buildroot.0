Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA26C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D3081F05;
	Wed, 23 Nov 2022 22:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D3081F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyEPzAJLfGGH; Wed, 23 Nov 2022 22:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03ABE81EDD;
	Wed, 23 Nov 2022 22:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03ABE81EDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 161A01BF32A
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E529B81EC7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E529B81EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWiUR1ONnvZQ for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:24:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9598881EBA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9598881EBA
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:24:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so2314971wms.0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GROOrD5LAue+byFnnNr3fNZCYsgbqEvrw90kJaIVYlQ=;
 b=gta3/JOpCYGVYKsq6nIT2mvTo5J21eQoc5HGpXme89Pnlj71zUWbU7zpCCjEtfe7QM
 BYoFVlO7QK2/u1B3cV+yQmsyDEz8yicDMn8aw9SO3xGAaOOboBKFdkhwQ3UcYWxXmZRR
 2m5bO3TIab8HrrxCVhh3nKlaZCZmlCppwGEah8bROqjl2KuofPJOSJTzly9oGDa7EKWZ
 9wMwEGtSe3eyfdg8CnvGqxFn5MlOSWqARU0ttR+jHyxK7evjyid+FND9UQobZ3JiHeO9
 ScSJ21vxbzaPXm6K9j206LPgFtA/nys5WsVdtx+sjC+axFhdtjHlz+RlaqunNL2WkWJW
 fYkw==
X-Gm-Message-State: ANoB5pn2dYxpngr4402PLkKtmDAL1yFffyNnXs6YQotqyYNG+yrpPBjR
 Cc8Id53bGBT/KthZtUXi9ulOneG4NVc=
X-Google-Smtp-Source: AA0mqf6KToR1p4RanLib7CrD8eF34k/6HxJK515Op65y9LYk6qexP1EYbZIZ94613KL33lTLEZOrUA==
X-Received: by 2002:a05:600c:314f:b0:3cf:9efc:a9b7 with SMTP id
 h15-20020a05600c314f00b003cf9efca9b7mr21894031wmo.10.1669242251234; 
 Wed, 23 Nov 2022 14:24:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c1d0200b003c6d21a19a0sm4194698wms.29.2022.11.23.14.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 14:24:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 23:24:01 +0100
Message-Id: <20221123222401.84489-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GROOrD5LAue+byFnnNr3fNZCYsgbqEvrw90kJaIVYlQ=;
 b=n1A/k6OZnNMyIrMgXERm2nT1oeoE+YYic+jL8v66xCVCFKoKOUtX99OkYfbG8B/mNa
 Vfun71fRditpuoPDC3ssvk7q87k9aeeRHMUvwd1HgII6VhAI9sg4VuTEu2LlEtIVl2Dw
 Uh0C+RJXzvvWctAEFAi1bk+PCrfoyq2h6ZgGYMTAz5Eqvos8kgNJ6qzJSOXgr3t4H6Sj
 r+LrfPc+HuoH9C0e6+K3YHSYtZ76jlCS9o/DzWv3QONvozwwAUxgou/Ma6v8jT3V66hm
 g+wUAfpprdgI/OavkTzZNhtsLuFZVWFaTgeGAwa2euG7Dt6hzmiMjusT/ohCRX2qnEtJ
 VNWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n1A/k6OZ
Subject: [Buildroot] [PATCH 1/1] package/heimdal: security bump to version
 7.7.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release fixes the following Security Vulnerabilities:

- CVE-2022-42898 PAC parse integer overflows
- CVE-2022-3437 Overflows and non-constant time leaks in DES{,3} and
  arcfour
- CVE-2022-41916 Fix Unicode normalization read of 1 bytes past end of
  array
- CVE-2021-44758 NULL dereference DoS in SPNEGO acceptors
- CVE-2021-3671 A null pointer de-reference when handling missing sname
  in TGS-REQ
- CVE-2022-44640 Heimdal KDC: invalid free in ASN.1 codec

  Note that CVE-2022-44640 is a severe vulnerability, possibly a 10.0
  on the Common Vulnerability Scoring System (CVSS) v3, as we believe
  it should be possible to get an RCE on a KDC, which means that
  credentials can be compromised that can be used to impersonate
  anyone in a realm or forest of realms.

  Heimdal's ASN.1 compiler generates code that allows specially
  crafted DER encodings of CHOICEs to invoke the wrong free function
  on the decoded structure upon decode error. This is known to impact
  the Heimdal KDC, leading to an invalid free() of an address partly
  or wholly under the control of the attacker, in turn leading to a
  potential remote code execution (RCE) vulnerability.

  This error affects the DER codec for all extensible CHOICE types
  used in Heimdal, though not all cases will be exploitable. We have
  not completed a thorough analysis of all the Heimdal components
  affected, thus the Kerberos client, the X.509 library, and other
  parts, may be affected as well.

  This bug has been in Heimdal's ASN.1 compiler since 2005, but it may
  only affect Heimdal 1.6 and up. It was first reported by Douglas
  Bagnall, though it had been found independently by the Heimdal
  maintainers via fuzzing a few weeks earlier.

  While no zero-day exploit is known, such an exploit will likely be
  available soon after public disclosure.

- CVE-2019-14870: Validate client attributes in protocol-transition

- CVE-2019-14870: Apply forwardable policy in protocol-transition
- CVE-2019-14870: Always lookup impersonate client in DB

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/heimdal/heimdal.hash | 4 ++--
 package/heimdal/heimdal.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 005447a43b..cf822340da 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,5 +1,5 @@
 # From https://github.com/heimdal/heimdal/releases
-sha1  5dd16703be7255f66a4d65440f0c622aeeca60d9  heimdal-7.7.0.tar.gz
-sha256  f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b  heimdal-7.7.0.tar.gz
+sha1  a33fdc957f84ab13f39f164b04fe1deeaab3179e  heimdal-7.7.1.tar.gz
+sha256  117cb1ede7848db24cf27311c46f7f735a99f9c836c22e80aec92b91efe56644  heimdal-7.7.1.tar.gz
 # Locally computed
 sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index a8d87531ec..21b6c0ccb3 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.7.0
+HEIMDAL_VERSION = 7.7.1
 HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
