Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C3C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6CB8156A;
	Thu, 24 Sep 2026 19:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2yjTH5LLPoo; Thu, 24 Sep 2026 19:00:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A763D8156B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276404;
	b=PeB7eyxzGLnQGsN9JM+G3M9xiZdJxvQhlFtbEwU7tUkbJR5AAg0Ko9x7Hn9ipskDDogK
	 zxOoUo/cIgihjyB/n7n0sSH61ZVobfs61PLWnE5ZH3YVSdRCyLuMnc/exO/HDXQqXwMpb
	 dwYxAzPn8kRpL+xVYqyZvxmjfw/aNVPqbiRyBapqTc3I4fnFvvNpOLPx47Tm0WI4yqfGU
	 AWAyMdvG3SE3pT88RbdLkOVE1Trx+HQZ9uWtahJpvxKjvOSqC6cjlWsemZF4N0cfDBSD6
	 4o7JV6pOJY4Ee4Epv8kND9DyDnpqv+ik9yA7EFzYlzzkvZARkovesVSBJuhqFayF+sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/cTcyV66KFL4UZUOPev5Mo0crNMc8NWr73opBv8I/MQ=;
	b=P7hy4znCTvQ/lOHbCsmpC/nOJYDuNwv49ZWwvU8htGgVE1tksfywbl6TKmBIfHP7gXuz
	 4YD5h4oNePEIg84Bj3zwrDMVbqZWeLvKQbqAtWuqY0Yf0S5Zkc77zbczqvhDM6c/s0VHd
	 6atEBRKt5/heFvwmOjuWNBy12MVCKxPFJ0/I09/XqiE385sw73QVd3tuIM7iJndckfB+w
	 XPQhAPxcvjIPh6Fxx32umjNycbhK3Ak+9LTF1rnMKCwJ7abxevn76hI+fhXMLghTPHMBw
	 eiOCRs94KIT2eKMaIP774SIjm9YyVFhzrUwi13/1j0AVvtQan9DY9DKvp+mK8jje8Hw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276404;
	bh=/cTcyV66KFL4UZUOPev5Mo0crNMc8NWr73opBv8I/MQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BN2Plq6qqvTEdnIol2QRvSpjJApXTyI3u2BjBRktB/QQ5gNxu5FeVajyzwFUu+ngn
	 EaOf4BH33oSimUyyQVMh1j1KF6IPS81AZoRWsnxRJFWC/KGYK8PyEBDoMb3xe/P+Fj
	 kXNSfE5HvG8MqH84I0CoGzgLKaYxPrMo0LAOYMIjBE9aLyKA4tK4DCKVCSFopCq0Sq
	 UYpfJxH5dkOOC8YXdqCsD22bc173jlGMP4Thu9y/PaaIOk1+IDrJx2cik76xoScVKf
	 cKrLjSoIIVx3jnvxxGuj2nwP+j4qSMuZ8YTPBnK654i3ITNu8ZYt3+YJg34mBMRdFG
	 7YdyrGfWxw1oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A763D8156B;
	Thu, 24 Sep 2026 19:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 392AC392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B5E5404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id iR41TdkKC3xO for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4CDEA404D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=C95al6WOw/mfvA9RhWw93JwETqLFhiZWqwM08GSvZPTodffHUQLOMLt6Ldv1egmTH9wI
 9e8VoOoWVZ7JEGITTYJVfwI1+pTodzi723jTRw+Gem01NXxaAec8PV9zMKZhsZGFABZ8z
 4Xb7HFBhPn3hY1HBTrmDCMbLeDGltrg3LhemWG+hzYs34JpQeBnw/oF0GS3mlNybLDToG
 Zl77Ps/t1Y9IPXF1WdFjZ8mshz4shbdWZTX0NrAwhE0UCW3Pe3u2paRVMIR7F8hGA52pp
 wm29FxPt/vZcWwBmSXvmKIWxyfiqrpA0Hf+68nezlz5E+nPyHo6OIWr2PWBt5vGB/qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=crw5NyN9373MmQwu4Rfhvk0f3aIuI4wkck/n7ksxVVY=;
 b=GOK83Xx+ODt03snwMJ9NOyzvQlnwy8nw6k+e65vZrWmb43uwa7f1MlLRgTsTF/vzZ7yV
 QAaV6zyqyfLdBPh51gqrqTu1nUyTLNLK+y4JABxNh0+V64jn0evIR+VdZ+rI1/pxBhIpv
 pGS7KZcmvyRn4VZBHLulE4vsENWJxJhtRSPCYykmmKQsk/z5EIOBXT0xZ9UKyJ0HAb6Cm
 ENvnfHL0hzsYcRz6paGHgkvQOj77nnBXne7K3hdbjd1BwrCvs2mJpPMqJSwCDg0Fq2Dmr
 klLKxRORA/Gs8Ve9fFgaaMTOUt7Gf+fMSYYxd3WIQqRxmHbXuOqhaIJMiku99L0iNQQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CDEA404D5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D82579835A; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:35:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 039194046b2a0d28fe5a0d1f7602ef0c9187789d
X-Git-Newrev: 53d6021990bbc50da95021ef34b56872f1636ae0
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.D82579835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/{glibc,
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3666586423205398164=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3666586423205398164==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53d6021990bbc50da95021ef34b56872f1636ae0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes CVE-2026-8674:
https://gitlab.com/gnutools/glibc/-/commit/1f5026241027260e9280039698bca031484c82ad

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7162c4daa58c7881d0866f5a64c525bea1c58867)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============3666586423205398164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3666586423205398164==--
