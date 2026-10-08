Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A660CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F35260A7B;
	Sat, 10 Oct 2026 09:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id GgoAdsM1cuAe; Sat, 10 Oct 2026 09:22:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C612B60909
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624148;
	b=VI0gH8VFHMPfCDocqcDhDDbvZfDFoz1rFG9EWog0U7S8NOlRZiivyrRT1uWzXnpgIU1w
	 rqbz8zX/M6osysYSfWrPS7xiPRcPeaAvEKl3BKHIg0SqTufvvTUrtG4qOCXpAxndTXUo6
	 Njx9DAhEq+TTjIFM5CVCYzjJSJMbsUz9M3/Q8INIOUhfi8jWoB84msFUxNRe/kQvvPLqj
	 gouRszESnbrmY1PkoozqoCu9Mh31d2E8opWySbMew5ZRwOeCGQgdQ1GRVfdZvr06nwX+F
	 3uYupfifJnq2lQeuGb3IMQbKGcjfNZZqhg0VH/1o2C4MhORwzfFHnjessdwAcbBZ6Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ltZZlTcHiWrd4VfnqNdKu9kGLxI3Ynf+hgW9Lr9fKSk=;
	b=VSus0Jdg3OBv9xalTQlAyFidceQB6dzd4/z6iacBQthkcpf1HjhinbpQjo7y4zI4+dvo
	 UozPfF1E6KmGxoqzTnxpf1KrkuS68GPytOTMKSnyNQ134pxFWMtqDuyiGQg8j54vPJVTo
	 Ctca61BTZ8FsTpllmA7LkuHCiqd0/7p9vjG5RJy5C679H8L1l6TfqaCGHkoSnllxs2npm
	 7fRFDY/luBhbhkQBZonpFGjzcph2SqVqHK4VbIdRVCThrjP4t33iNNtJEDk3b3AOAGiLC
	 dVDnB7LfjTZ9n0EPqiiSbiiYvZmb6gJ766jfqSRSNBfjcBEqzILS+K1IJYJ18l1EBuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624148;
	bh=ltZZlTcHiWrd4VfnqNdKu9kGLxI3Ynf+hgW9Lr9fKSk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m9e2v6xrcQlxCqhByRQXdTbAlhxdDXM/IZm9dDdfV7BYSyLLyvu2CnUqFVo5S4Dad
	 QsmVMJ0SMbFcW12z0/9iEMDTPJY4ZRRbDh5OIcuNb3L90FAkvPAF/XBg0XT3Yge+KH
	 Zr7sdBYh8A3F1nNra+SM3vgrSwIQ9hzqz0nYFfAA0HGxTWfglZ8n/GjruL9glq41A4
	 3LZDEBGN6WBgfUTRosMhAEUzj4IBOMkz3wrg/fE/kbmCkS/cqymgikoWa79mKMyaKE
	 t+/f6+WnrCTCxhPeoKpTIw+xUqLZb14p8kjR0/cIDDYGBefbOztczfTWZH4DkL/K9o
	 i3S4HcV6fezFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C612B60909;
	Sat, 10 Oct 2026 09:22:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0185F356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5C148121D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ebLjWDrLqTk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30FA1812F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624088;
 b=BadcYMC0ivJmfwTVoto//yE40BuE1dYiYE638tFpn0UPjB5XtB9ZmIaSAXMhoYoOTBCW
 m7ZCoTzeLGHftHTgEjhCrhhmNaVka/kK05z1VWVYyuToZIEkytpfOhS1AtRI5v/jM4zTP
 dGHMYCvhzEPAxYa0yWShj0naBxldVObQY5VSoEpGWlkafe1iHS0Un+lwrgvVj/I8hEgvA
 Fh4V68+ob3tedvhnHKAL4CnXMMUVmcXI1VPTDsElbx697NDSKphbI1huudiaYbg13djHC
 iQWi/yEk+BUSMDrQLMctMCci92znhRf5PlGUbnXZyDERdHDLmNanjtNonzcjIgTVGFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624088;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7TZN8ngGdRfknge1O9FNU0wrR3lD0V6DvowNJ4OTwdU=;
 b=btvNhYF2yO7Yk/o1vvOIQAORFQa6omjZsewvW8JcPhFiTLZGuQVzsTMS+bPFcYFqY4p3
 woVIalJevXSFM6UzsQYa+XZdZ1uNP86CFyAUr4G9Ww1nnIngUbp+BaWgsnPS16vbavrBe
 tFYnYO5DabE/9lK4zcjfUGplvkQYg2bvEUg3Y5kPm3QBWozMZnW1IavhqoI5kQFL3INen
 Gc34vIxNC8aW3EM5yGFtZuohhPgFHIH+namnywAnu8ln8l0Xxv4gvVsdIQQqQX4sXcXEK
 0cZ4B2Y/ChTz5AKwY3fO86GfSUcOjPDhc2d2mm/HNa3xBZk+BhJWIAAStjFmq0ZVKyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30FA1812F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AAE28F0B1; Sat, 10 Oct 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:33:57 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b42d59e25f59ac01a21beb5eed59d26d3f7288ef
X-Git-Newrev: a345a04442abeff4f9cc3a4608ca919e6f328a64
X-Patchwork-Hint: ignore
Message-Id: <20261010092010.1AAE28F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libheif: security
 bump version to 1.23.5
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
Content-Type: multipart/mixed; boundary="===============4509286244199523874=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4509286244199523874==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a345a04442abeff4f9cc3a4608ca919e6f328a64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/strukturag/libheif/releases/tag/v1.23.5

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw)
CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996)
CVE-2026-XXXXX (GHSA-9c75-9g8r-4728)
CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf)
CVE-2026-XXXXX (GHSA-q492-cfcm-895h)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5feefc6be00f40e6333feb9b2a9710c0c463fee6)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 78f59f6b67..30265f4aab 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
-sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
+sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 3428646016..cd171b9637 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.4
+LIBHEIF_VERSION = 1.23.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============4509286244199523874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4509286244199523874==--
