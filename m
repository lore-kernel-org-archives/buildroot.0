Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15AECCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F2A60F49;
	Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GEejEKlZez8; Fri, 16 Oct 2026 13:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7567960AC3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156201;
	b=tTKrQb8QctcvtB46IVR1sR7uL5QruNozfrPRlF+WZZze/V2PUcL/wCQZ0JNzKsSJ9L2x
	 EiAc2xVnDZxDdPn9thY3jYyMDlsHlH7FeBUss32A9lqkS2xpTMWYMfWjWElJIkuGRIEtc
	 umPcN4IcD54cjiyiJ5iTo+AP/Pl1v9RF5xnCeT9+SAsQYK+Ov7t1Es4fIsqn3acDiht/S
	 6bmx91g4C8Wt8rCY86a7EZbjLtpw7qYRD6Q8P2DTPlv722XO8o+pLAHbO7n2OmAGwP5F4
	 ZaveGnvMTuZgTM003/VnpEciXkUXIREUBeM8yJi7paVP6K4BtBOnfDV+5ad+DliYtyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=m54m9LILlu9L7aHNwa19IxRC10BoWznZflHKnAkzRwE=;
	b=o1LQIeI4BOWHaPKMca8lsoQgjkFE6Itv27U9W3RHGzfkb8sU8oFPRYl8dK5hBp1kux53
	 KIYx8x/OJR5CYPVMY4owjwTzuycFLglmrwrT5Ec3Rijm8R945tD73yImEl6MYyrvIqMWW
	 fxYlEcDPEm0nIzGHquoI4I5TIeLdlK4zLmy3vtvHnUCeJAJhZ+aWFaRC63ryAz1GEIP89
	 xV+e7BRlL2hDs2MHDryJnN41Mq+BcOPFuC6XBaqCzKXZ+ihC78Lg26H5LvnbTZ9DswgUe
	 VRCYyKfrJ1K8wrHUPwdVc/eYnFwGcbvur9BgT3oHf1fogZOKSJZcUPLtvgMwhW8Sybg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156201;
	bh=m54m9LILlu9L7aHNwa19IxRC10BoWznZflHKnAkzRwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qrRWsrsLNos0Jsm7ZGjkzpZZXUc/cCZxsyUepIqx6JYNxd9LG8tXfixuuuk4QiocT
	 zRJZepWmXRZbYoO6S0S01xIvZJlMHXu6NbljL8mspEMA+k/rV9E7dT7Qq58lq3ofhe
	 Tu6AZFrYMGq3tvRDrfU6yrYSlMKYHy5o+sxYhw/gFUfmwHwGeugHmcz5lWZKmXAnn5
	 lHQjwJkIi1qT2B6sGKzq6wKtxuXyAYNnLCUBHWwyrb65lGFohdbHLevpywo2Pb9XNY
	 /iZtuZHGLHLa6BjKoLQLcLtCZJawCLWqnBfdju5m6iHQa475NuzxlJgMYO8mptbNxd
	 9Lj3GkxfG+SjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7567960AC3;
	Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 012561C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E465180772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBGcH7Q328eA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC030814EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=i/KdO4zS0llh20N17GPWrjywc1XQh52xtAlDP5N3OfceYoNCj3ThKv5ilUpNyyaBvl/z
 cFe7m6kueaO8PUwZQBJ1DowijeAqtN8IHqqOfkQcxesPdqz+X6xVhCl0vvml3mNic9SfC
 UD9QKkD4uqmPsnybx+xZJDcy+Im/JaKy6w/lNPSu4dEd5NhGhtzT92XUP2JavUNYGXSDf
 BuZ7iYZkTHZGUXeh/XLrTk3R96hcxlhRgtZkKSy0Bg56BXkWKK0DNKEAZoiIB2ofmQpFf
 mLl8MQ5JjQQiCSpMMf4p1c3fo8+OSVKv29CDF/lmezrAVrRj9lE1UxfHBZkxhwoMRnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fkuLHkuJP0Lo/pzHQbIXQsPCYZamOpjPzxeFPc2iaVk=;
 b=aBz1Epatkp8oWKGRngcE8ROVononWjRM9WNVrogqX/rcQ7VCajjAT52ejVc1AYp1WftE
 e974DDzOvOnCvHzAg5QFBXxCkNH2Yltmp3LWsMSg3P/dnAZEqVzIAfP/q0RSvDqHhf1cq
 MZJcxuH8p7esP80UlODHmkO+HUfHKNRrVqasFWJzdXvXGUKDKPhdme2s+RGzAdz2ftHkZ
 IFHg429k+Lfs83m02lXSRKwQ3lznUGr4+zrUcujvKqkIHvjDB6rQRvNqNf8qZ6greO0bW
 xuJZ6k8ufB2CtZppZTl8GgthyT5vjBdO8SZ2Jzqbc4S/Hd6BxQtrW/3zak97irPXlAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC030814EA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD2F8960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: aeaaf9bc810bf3cc67ce4bcfcd070fa1b6fd01f2
X-Git-Newrev: ecad010b3602dddc7aef582ada9350e058dbd99a
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.DD2F8960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/qt6/qt6declarative: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1665986479772575985=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1665986479772575985==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ecad010b3602dddc7aef582ada9350e058dbd99a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:qt:qtdeclarative:6.11.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2025-14576

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ef0f032677d8013db9782029026b63938a6eb275)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qt6/qt6declarative/qt6declarative.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index edec67649f..02a17a580a 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -8,6 +8,8 @@ QT6DECLARATIVE_VERSION = $(QT6_VERSION)
 QT6DECLARATIVE_SITE = $(QT6_SITE)
 QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
 QT6DECLARATIVE_INSTALL_STAGING = YES
+QT6DECLARATIVE_CPE_ID_VENDOR = qt
+QT6DECLARATIVE_CPE_ID_PRODUCT = qtdeclarative
 
 QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
 

--===============1665986479772575985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1665986479772575985==--
