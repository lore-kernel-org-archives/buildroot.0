Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84968C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 13:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F6F40B0D;
	Sat, 19 Sep 2026 13:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qQ5Y_WSsNVh; Sat, 19 Sep 2026 13:05:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 05C6D40B05
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789823151;
	b=hGizd9nQPsNVUxIil0Id74tcde6tmEpmcz81ptX2AbMnI0sH53cpH1mggelolYC8a+Ma
	 Povgjh2OJD77GTt15OMmKz2xFNkv8luStApyqxRasOKikuzYou9eULq5PpRVp8uSc7YUR
	 a82MDva812X9p4407ePFtpUarMFNgByN20ehQi9Ikmp1RA8GV0SOv0f4L7w3BiV8xByvn
	 1VolljvPzVwKvJ/pGcaklCC8KZShMUjPBambkL+3mIWMPDHx+pjIuKccK3T97MbPG2JtM
	 vhpinitg+50O3LYnqgpVo1CnIqM8ZQF5+a28EmZJac2OMm4X2928zdwaRpGFLJVB6Ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789823151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Y2SuHCcNCKhed32DNGUrUfYCxNXhPpGM2jKFVKEwwA=;
	b=BKG7ZVyBALr7IP1Qw7bcdz/XEUGR+JoYCXaUkEV7IZzazXQFm01pcQ8mtgjiRAXGAQfB
	 G/w+/nd4/nQL9RwdBSvaJAI8UOa1FnErk5VHU/uMZ1VQPGp2x9MP6eNUGv97b24accH/t
	 i9IPYcbipj1TJ5/uJD1dX8DP3co5AQBOrY1ESHwpdcLaMNQQbWHUtpzbNOIKe4R0QKatX
	 NrqLavsz/6z1fmWf/FRHmy8dp2NJL4q4h+qSFedBT2SLzkWeobvOUDgKyoj9RQMokBb3/
	 XfjoM7RU1wrkNjMjXJIfzh5KkcSDIhfBtoWQferOhLKU4Xn5ZemDHzWMbeRAzRz3CAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789823151;
	bh=3Y2SuHCcNCKhed32DNGUrUfYCxNXhPpGM2jKFVKEwwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f3IImxc2SoWB+wRUgfiAMLe/0kpcu1+PiMrJHZePcqpWhefmq17xTAEUiiNWPnaSv
	 epYGtNMFkx/viFVHdox7S46/SsJmpCWBRETaJZwlKof3REuvZkM7gyw/uWTzU/y0EJ
	 jmlD520/Wf44UmqTQbt51cWj6L22u1+W+UIkU4lOiHv25B4+XrWFO2KlesfsSzsLXe
	 5nPpoqMiooY/2/TeyrNtOT24MAL7XxmhXQWTXnng+KPHMT3wl9V7Y1B9mLe37u2Gew
	 6G4tdxBackjHMivTvAbSlolAJ0ayoviCjuSigquc7CYpL/NAeU8ZV8RSXtuFhW7HBR
	 RFSaFOVybzrjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C6D40B05;
	Sat, 19 Sep 2026 13:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8835F13D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D7646067A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id re_0mqLbxm_1 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 86F8660678
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789823147;
 b=IOI9yBNFZ4pJthybOMqgBc607VmviBDpAoTnSAVowNT+aHn9MU3I3aZ6y9KIMxYaafnY
 YGGlFkq0dfyVhBWxNwrsRrDGxA/1qwKcmK+xxhmkL1Rw1wKSGO+eRVg5+MJMl8UA+GckC
 oVBQPYM1hFDoHQCQecTV2r7ezwp4vZZGUZzWdkndViAVAcSmy2r2H+3s3s1mzaK3XSsbm
 aIMun7Q6jC1Te+jZMQp6+Foels40rcz80iuVBwOf7UEaH2Mxawqr2FSNHx0VRzWo1ZzIC
 SrrTpjgVmnbmzuBxfbtNvPegPIT894g12HlaG3R0RrhXerfBAUt3KzTd2janjhkB0bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789823147;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=smS8O4Dej6l9u6wGoCMKT4W5+uqfg9IOuZ2RfqTiTb0=;
 b=fsxJW6DZMc+z/NnFK1lU3sRSpko80nZodSLIA2KNjb/1uIgTTZ72ALjgjh1txkTpFHJ2
 oGJG7hGcSiY/TKraKUHIwnGFBbKvtz+VxpV7vjabikAPcPbPmyJ9X5OZ4YJiG98FjLZhA
 ebgitCywYj7KNsMYRZ68SxxN/+5+IS0U846cTSKaq8pmxeIHvT59iiQ5pJod2C8YQlC2W
 brLWi8PzaNd8dXFUevdxIUQlvkfXB0WHdvO9B9nQ3tXn1aQU/FX/OwFSRO22Bbvktbp2J
 VgA0ssPNZrB5ltVRCy6VBNCYmcTGg1CRmXNyCe0yT3zx79UbZ5kybG1dNXmiLHc8zmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F8660678
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E148D59A; Sat, 19 Sep 2026 13:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 14:25:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f94d8e253117ce4db9bd20bd2720a3e8f98e8342
X-Git-Newrev: 7162c4daa58c7881d0866f5a64c525bea1c58867
X-Patchwork-Hint: ignore
Message-Id: <20260919130439.99E148D59A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-48-g1f5026241
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7162c4daa58c7881d0866f5a64c525bea1c58867
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-8674:
https://gitlab.com/gnutools/glibc/-/commit/1f5026241027260e9280039698bca031484c82ad

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f541a8d8f8..b32fdada8d 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  440f4e6d5b787369c1af241de7ca0692731fff3a0c3d279a98e8827a6ccba5d1  glibc-2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c-git4.tar.gz
+sha256  d55ac4dbe32f36310d7a4b9a38d3796666fe323581825cc530f2000a2209947a  glibc-2.44-48-g1f5026241027260e9280039698bca031484c82ad-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3cddf7c1e3..6e306c7f2c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
+GLIBC_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -40,6 +40,9 @@ GLIBC_IGNORE_CVES += CVE-2026-80489
 # Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
 GLIBC_IGNORE_CVES += CVE-2026-18374
 
+# Fixes by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+GLIBC_IGNORE_CVES += CVE-2026-8674
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6904e147d9..f20a05aead 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
+LOCALEDEF_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
