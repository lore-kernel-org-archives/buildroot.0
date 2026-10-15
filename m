Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22370CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD35861236;
	Fri, 16 Oct 2026 13:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3nHE_x_6ENt; Fri, 16 Oct 2026 13:12:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 344026121A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156339;
	b=BNPMk7O1yN9DCWpQwxgfuyc+fIYd3g/8i6OIPrOnJeuK4EcPmYcLAXNd1+y2pS9y8NAr
	 utZtBXnvNzbNYJ3BLY0q9jWtfgbewZf/me0eNJtZqeYhL+Urt+bpHVVLCkzYHUNnCEzMU
	 om+jNk1AL4J6YI394ENyoeDU+saqYYB74vGmVyP701aSxmzYm7mxDlQNVAPjAK6qN1I1D
	 +nUsJ7NSuePR0k6+DxXkzVRnDWSXkSPESrCkAWGvfcyHZBp8F51X1tjL2xVrPVGe0FXfN
	 t1t/63w8k9fCy+hibgMy+j0pVLM9kYn+I3nu/PUDA8t21Ynv6CAFhnk2c0QmLTnkNGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LpRQXBLvoJ7GO+o3ZIs8JGG22eSPazUpuqwPKdtn9VA=;
	b=WsU+tM2URLPScC1SN74GGPvqOReSpLm9L/z6WfhY+ffIEjlJJzwyja8e4qn40KG9Eh7V
	 EnK3J8evNzFX54FIKk4Pxg+swa+gH/nprZXFpIB5N3wdL5935+8NNlGx5qd6rxgY0fC03
	 eSakM/B+vRMhHTjxRWDlq+242mY39AwG3IkDKtnlsLZHQwWMZbDJUn6YAWw2Gx/y/S5cI
	 TL4nlSp7XtNFEyIjpd1eZlBCxrbqjAoMooM0lal8Z8MDv1tCL8fXGvNWJ7k2KzVMI/SEM
	 fmwnNH5CgQt9k+GyvS7yMxKLMx2zlhAVd+34bU7he1tEnWDwwCFcrUrwkTlDmG4yKPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156339;
	bh=LpRQXBLvoJ7GO+o3ZIs8JGG22eSPazUpuqwPKdtn9VA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TQKLoeOcKl59acpJUq+lTZEa6PK6m7T2BbBXieQ9d4fh6iwMv8KVie79jcWsQqirK
	 utNMpN8NN7gM6vPSoxFXN10mp3c6V7zlod/69Dm8Rksujb6NaP1fjagdfvszQRPVn/
	 9l5gz7iApdhKiSOUtmVjt7qoUiFhSsV1rJCJyUHC1efFi0puUBeWqi1RA/T5BZ4391
	 O649xqsKn+4TT0SiLX+tPWt6PVrErA+16HBHh1va5v5iUqu9j2xMKOPVUrCVDyyRtN
	 FGADcFi924ofvl5U+Xpnpx+h8iZIMYrnp8tnZHb7xYOHngaASkyW5+kNHarkaBMO43
	 HfzS0xMcJOgWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344026121A;
	Fri, 16 Oct 2026 13:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA4C105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C4BC60E9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekSHLC_OT2m4 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 55D1960F1E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=fBLIhs35x7uaRHOl8SdzkBGdYOtc2gHZ57+30Gs9FzV6gAO8NT0t9GBUpKFcpeAuzonr
 LxKsn2LStNoQKOLYQE+exS22j0aaiph44oo1hbS/Sw2ACMNUL9gc2+/hpXtUVN7YjJ8y9
 907BQhUhg5zAIuk4Cy98cDnYC91ODCeArp1zFmL9R+YsXR3mJfTkI0dyBrJ0YHiyE6rQ1
 br+RJe/Q9KGc3eggx2D+mvKAeGfnM/twyX9VkOcseOCGqfXBFDRTQoucC3xYf1hhMPk95
 MTedy5924ePk1SWJLKsPt3L/2R8LnAwGWXphA4CdmzArhd3TPa8fqjFCVrUVLHejKRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u49fASe00ZNc2r45sK1AD1KqExj73lF1+U9YNoHTF2U=;
 b=jPf9HckZo27jqEQLmsJZTi+thcd76b276O4AlmLiM9KSAbB34atTjBizJHe+0UWQxLJ2
 PDJtw3ARov89cuGCcgRoGpjgPXXkQ/UgR8ZNOsBsLW+v5OwxXfUsVnxeHqGHSQEYGG5FM
 lAPooT4Q/uJgAK+x5JbN0YqUQuYkuR3ZB0yDEbSNKqZghqO4RE/dnwMDk8y0zxY94xx6v
 l/vigkOCD76bbqBtqwXMZ/UUACY+3XM0KPFnQXUOgz9p+x69LbQQQGksN/GhquW5PxcGf
 gj02OBoY/hDnSiDTxvolNdHek6f8ama9mqPnBDvZ+l+5Jt3DdIQEqIsOp914yo+Iqig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D1960F1E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 460A1960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:30:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a6ff89cc79459d5414dd9680b8326d280a5dbd8e
X-Git-Newrev: 64b813b5b7cdbd57b4c984d81e43d9e88603cf90
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.460A1960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tor: security
 bump version to 0.4.9.14
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
Content-Type: multipart/mixed; boundary="===============9074635782600989350=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9074635782600989350==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64b813b5b7cdbd57b4c984d81e43d9e88603cf90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.14/ReleaseNotes?ref_type=tags

Fixes TROVE-2026-062, TROVE-2026-064 & TROVE-2026-067.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbf47e3028dcfeb3a52419e5ed6ea3a49cf09cbd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 92e5fd4782..37dd1e6000 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
-sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
+sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 8de7ba50f9..49b9524c26 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.13
+TOR_VERSION = 0.4.9.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============9074635782600989350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9074635782600989350==--
