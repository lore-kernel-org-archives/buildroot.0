Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FEBC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 10:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A0F811E7;
	Sat, 19 Sep 2026 10:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf3ztnho2TSh; Sat, 19 Sep 2026 10:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B3831811E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789812614;
	b=Owkm4lc6tITNajdrFo3BitU9kPzTR2CQDsVpsbzBoxSLQzeIHL5JHW+NWyto3VWGW+Z+
	 9qQjDVsyvZy7jecxiEGG5WYadnB4kCbG7FxgQTYC7u32THoPOH907pgs3oeffWb4XxyXl
	 nIoIbQmmR/B1Jw7Wod3rFDxQeYn4MwK+F+PhKaoaBwp4rji2jGWW6u23XUE9nP1+B35cU
	 Z082zU5iGW5ZlvVJS1aQWouO4D89NgnMeL/r+p7zuH51MBEopeJcnfE7EfpaDzER5yUuu
	 keyDWWjCVkwK5vSORaWyv+FV1MOvKVuWathJoz2bkwe1NlR85u1EqZa4jF2FSIhgstA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789812614;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TzWMDeRdfP5rekAyQd/P3qXoZqbf52Kdm2Oc32Ka2W8=;
	b=SHmvMTVlEBb58ZhQtQW5zS1VP7HwHLyYG6I8XfQxRrNd4535fucVhqbOzdocqZDpx6Nz
	 KChdjX9mFIRbgkwvHsc/ymT7VsW1Uo252LgKbz7NwnZ3NP1Y4ewMzQYEP8lmiLOld2gdZ
	 v4sjitTJAFixjBZd29Re93S8atPtSWvVaebk1kqYIdLIf7vUljBa3qbjkqXeCvcH/+0sa
	 /y4IUt3XQwbiIKCz8Ppah0t+6l9Ta/HbD5jJDqMCSO+Rg2gw6Hbj4o3o0CeWI5Q68IXo2
	 WhQSHgcL0Qnowbc1IW02vI+gn065cAkK3xIWLE6E7qNGcUqjBxnRzcczMSW7zFIYStQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=LfOqD2MZ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789812614;
	bh=TzWMDeRdfP5rekAyQd/P3qXoZqbf52Kdm2Oc32Ka2W8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cSMyIx6B3KXeFe0UmhQhFpL/QtoIl+dmSWM8VNDkjmmVS6RT2+VEPll0nkcmSe8GG
	 Z5jP6EuzyuMfNryviix02JoQqbA4RPmDTHIeheoGlHbsLopa47Thaeg3XvJqwcUSCQ
	 1sF/Pv7Cue4LHdUYYU/LIWZYr/QcAG2gApgPtJOAtG1g5iwHleRf4L3gADIHTv7FZO
	 StpTMldMn/F9U01sBo/Wu981rYsNMAj6Z1T+ZWTWpr4vYtf64igARpqzVX+QSTOFlD
	 ZZoLSSZLHFuvv33RGAong3rmBz5SnaAUNvVUZajH6UqkxIOgjRekqhLrmZjHxPM2rW
	 eonrUMG9HG7XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3831811E1;
	Sat, 19 Sep 2026 10:10:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A74B793
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78911811E2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m19Z-ovw6D-5 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 10:10:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 26F7C811D4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789812612;
 b=MpHz4hpVCQfbzbVS75NISnGDxtDANsgtFNgjVXUahRVOnddgT2TD6oZr3vu504Qem8Yg
 gDxg7E0MKHkEClyPdDmENyJSNP3dPvYCMjQmiUipwLkrW6qrNLdfCb3IiFFpeDTk3/wMA
 SYkhlZfiNOwdA8CpDPZvVzE688kLXjnZV54RhgHnZK/aIt5pnwTWMe18Y3WJWR8udhYy8
 1qC0WrxcFwRhoM0v8FQbOn0XB9UYsCp8wT81yE/iTiQvoQEO3BPa9Iwtyh1TRHMLGU5K2
 S2Ng7ODCPWgaFUdllD57beIKoTHtSPiKR+47Px1qK/OnF3o8lKeNjn9ofQvZ9M5ovDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789812612;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dA14wLd14IoCFwi948E5iSQK3PT9tRgwZIrDrSm8nqs=;
 b=ZVheg1VrLdl2Na4mMGm3B5PCHBOfdyAManb9HorZezxCNvqI1w6jIpCmCoPELfDFqmJO
 aDqQ6RmzHKyNE2jcHpVEi/jhM1L8Z2RvVYIBk/aIQOCF1482E6ps3zuSV36D9misl3yIn
 QJah1bIU4ItCQugiHKZHa0vIQIfqVILNjR2helhM00p6BGM+E+4SlXWGL1UZupGVd4ANm
 oytHjZAloMXEOCTKdQaNC0O00au2nQDWcCJXMKzUUJDXYPUzQNvlX6JTtWMm9D/XmEXtf
 K+rKmPsRUnuAMIQtVHYq1XRIvlJPgOHOajZnoTXsoLB44aj7oMsnDWXuvv902dehL2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LfOqD2MZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LfOqD2MZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26F7C811D4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789812609;
 bh=dA14wLd14IoCFwi948E5iSQK3PT9tRgwZIrDrSm8nqs=;
 h=From:To:Cc:Subject:Date:From;
 b=LfOqD2MZyfIC6tPQT9Wm59vt+/WtmmRh0KCMsKuCx8g4Igy2UGU14GmObaJUoHj/h
 hHBLeZgeR0Gx+GUO4nAX9V43z6MfHVKVcaDn1mJvMzywjA3e2FgNsq2Z6UTjVsEGMh
 K6A4ldkBPwQ5sb6jD55IwD7g2DaO4IsV8kFyFGAqHiD7KHOlXWc9HdZ8d7D6geDuuq
 ejyM/9ydehS+0AmIna3Lc6Yt2ly6QEZAuhjyox754K1ccfMWxHAY+h3xRvEPF+nhn+
 21ViwJ2HLojvnCIWPb6ozBgZu0BmDUe/LifrP807Q0gv7Ib3tsSfKuLitcARMUjmdz
 CdCSwlCCNTZfA==
X-KAS-Sym: v3:f51bdf72230551df:f73QDLKji03Ok1w2lHRvmrMX1I4kl5qdZqIO2L931OmjqvJeZomdwEQ3m45JY7tVkcFXJPZR8rVgRsU+p6nDaou5OvcqyUzHI1LcTJD+GN7197f5Yi72J2gT4oGRHGLw0u1F5g1rM9GTlhgNvqxZ/26G+akqoOXPvmvZvRCi+JngYKn8d/IB5dnWLEwwWMu8/sR5zjLnFR/CR6ClGEnGR3jcs3+ijGFY7oKwY0WWdauYuX6gVrZXmo+uzA9+VRdWFtmpVGxIPgACNKHrveKPoUOlpxyFaZ/K+JVzDmrqHyTi60ymmekI5/Pk79jCo47bmok8sUT5vJoroAC+wkaUGg==:g5k8Gh4ghAi93f8ke1mhkdZfVtTk0tELDzpO7Moy2rHFxlsRzIZH+bVufuP1cgjr2jOoj06Kof+8A2k8yUM4iaac49pxymcB6C7pCW9Blj7edxYuibm/gVq6gDci7JiP3QwBAujl3UOu9WNO2gc5vXAGTWQkyelKIMOGWEk+y9ckAyu6wDz3So4+zvV1LVlKW1eG3GG3JW5hZ5csXNqLIStYDS3LiLSwl5Y7PvYsBTpfvWYVKvoAl0ZAoQybK8e+En3V4arlMetrjY5ojSwdQcUY/Kc5xVImvt1IlW6LjxpoLr6Jl78ygcEEFnm2hql7RgMSXhFjQqLBzq4X++0Cv7N6yDcUcBsuC9y0PUMDZgGpnY8ONWx1qwq6mw1j7D+PngEi/4um2oM+idQPBQ7RfQzivFVdwmkC/DbieyHSYACnjqbohc9r39fUgDgqirf21+/aeiKOJQLOzAfe7Kdsh9KOV8tipSdmsCdW7T0msAIBBEE3EF3KIF357aeXjrBhdLbstK8bW+FViPaSRee2uFm1qjQkdKUapy4eKCzVnvkv6J8WQFklDy/iD0uzDO3RzO4CSfUoVSCddN5MgETCmHNL8tB/g33XoU281RTXoho/Il
 gtcZz6uTEKq2x2hPZkbmiGNEpE/dJ1+6YTeoTu5w==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C28CA4C46E1;
 Sat, 19 Sep 2026 12:10:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46190)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7s1I-000000002o4-3KFF;
 Sat, 19 Sep 2026 10:10:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2026 12:10:08 +0200
Message-ID: <20260919101008.1338862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2026-8674:
https://gitlab.com/gnutools/glibc/-/commit/1f5026241027260e9280039698bca031484c82ad

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
