Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF71CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F74610A6;
	Fri, 16 Oct 2026 13:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3hkC-dp5FQg; Fri, 16 Oct 2026 13:11:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FEBD610BD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156284;
	b=krNCsbHXimFXO6rqnKTtbcvF4Dy8jJ2GvWXXXsSh9b9T/5aOfgrSZSt3fL4pxm76UCio
	 t83xNna6Mp88QFMIFINDQWPFfZN/IlcQsm9bfWLtc0CNOc+zceZ6Pq1XZ1Sd+oOGsq03D
	 ZcAUBSAy+tj0h2GnRTUGIVrkcTR07iBPcfqgCUkMpGexoJIXaS3k/BaPpa8WZANqeIxwT
	 V5Bu0enF2QVU3M+JXdzNlMhOT/BeZS0+qYVSOSPMEA7ubcNl6tA7gcWZLewMAEQg1KtLd
	 j5D+vjh30bQlDHN4k91J5XnkNgGs6UqO6OIJtjnvk3CqO/OFE5eYr6AuG5rWkeSwtxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oSRc3h0WUg+LB6gCDGGYdcixvbTaRZlCA/U4bj5cCpA=;
	b=DX0QnAUkxM5Q7S78xqu+H7hmcxV8wEdX/ym0CVXN6qbnT+wfRFcDZZFUYab3IhDnfaJP
	 kq1dAV+IklMFl1z/carsOKa9FE3izarQj7ByyU5SuAAjtH7TOtmjKMsZb837cRGZHGPxk
	 Ub6WJev56T7DTIy6F1ijYhvLcElLd/SQ68kK6Tq9Jimp2FzPur+sj+xxe7LBhPOmGC9Gb
	 JrO2iXTL1NqLGZ+ma00965T0d9lCKzpnzq3GaUxkgFySMjXgRTLy8m1JDgwVksBG7GxJk
	 wzig+3d5e4zepm+RuGM+njDoBPuwzQbPUAZKvliCYVT7/EQpXMGIe9mrdR3Kp9uLITQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156284;
	bh=oSRc3h0WUg+LB6gCDGGYdcixvbTaRZlCA/U4bj5cCpA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mJmp06QUVlmrOBGspMzTX2JJRFxrCHtRJcE/vrCcZOiSJ77VPgIUaQ6P6aCm1elpb
	 2XSK563Ek+uC/wC85T1S5d0hmpTJDli5G6qzflp9qMIQaI+6NZSR3zx6EoUFr/ZyMx
	 nVlALSUQCjSM0R38O1O24DdT6ymtlheGBOQX8uB616Gdx7+JSHxGiEHw6p6Uv7/hFq
	 jUwjyL9H5X/r4dfbzYEwa1nl1o7L0clOnYfy3WZoIYAunrSdA5N0dg5F7TQNjqDWFk
	 tSfsiQWqSpNXjiHp4gIAezieBnIcB1PToFf8uCLB4blRNek5ezc/veQxTvgdfMCJha
	 2j3JQ3ePMmgHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FEBD610BD;
	Fri, 16 Oct 2026 13:11:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55DD6F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4267940042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxRITmrEHPhJ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3D69540492
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=Vp4guIotDoZ1X/MYuzcuxWI8muCe9RgLgcthDnVfzeCCeeHZ3DC21xYDSS9OIMESNQme
 PRrt3BKZp9qZhJP1ynvtBPcxxAp0qdw1YKC8UEg//KWKjSoHTOdz/a6315KkGdwv9sMZo
 zhyDL7krRZc6SduD8FCAZ/t+n3DLaOyGrgSOE/8QeBjAZ7EzS0JjKPew+8mssEGYok3Bf
 3ZtdJ52RdsVU+lAVx6cEhXLSvfk3ibEZtp2o+/pfAqk/4hGt2Rgky69EfMOcHsvpLLZeh
 2W3xybItfgBMF5udTevlIIPNhHK2YkT1pX8OIruOq1DQmSizimJhPIz4ASpPEzMSX+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=geVZs0ETNrFrT4P+7td9naqSdo/eKrjIsKMYPhlT7Is=;
 b=iq7IB/znn4uFfclEHLw8lVsVZhYNJX4tRTpXp4p+e2YcZM6RWUTPevJPQLh3O88CI2cN
 8xnAPhcCX8jld5u6wLbz04Q5ZSzsH+Dvaki3FOUq6O2tR/QUV6EzB3Cd1d43ug854f5FE
 7akWkpaLs3WXG8qLMo+GgMMi+9D/FrDnGv17dBCfzjyqWxxC/0BejQf/6yX4l8Sr/V7T3
 mEq/p9wVY/sZ9wvwlgMD4FrR8YRO0c1KC3GrVHzlCupskrIPAf/+beBBwjHMCE4BsXTYq
 bCk1FpcYtnuKJneFVqgm2wEKYkWtvHlRfXTeKq6U54Vu5fWXYpYU4aGx2trThwC54Iw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D69540492
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CB8B960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:21:05 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: cceed8a0ab097d42536b635c66941a7d36e99d9e
X-Git-Newrev: 4afda3339a5d1d61fd820d8d02920cda32d4ca85
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.2CB8B960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openvpn: security
 bump version to 2.7.8
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
Content-Type: multipart/mixed; boundary="===============6401179413630763644=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6401179413630763644==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4afda3339a5d1d61fd820d8d02920cda32d4ca85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/OpenVPN/openvpn/blob/v2.7.8/Changes.rst

Fixes CVE-2026-84790 & CVE-2026-88964.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 43d55a6d9ccd9cbf62b0aca9fb179bd07758b99b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 947922f0c8..9274a853f1 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463  openvpn-2.7.7.tar.gz
+sha256  c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36  openvpn-2.7.8.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index d910802da7..01c049cd05 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.7
+OPENVPN_VERSION = 2.7.8
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0

--===============6401179413630763644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6401179413630763644==--
