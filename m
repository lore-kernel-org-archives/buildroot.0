Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54169C982EE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB5D60743;
	Mon, 21 Sep 2026 18:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7Bi38CQq7GG; Mon, 21 Sep 2026 18:45:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1BB0B6072B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790016313;
	b=hjTb1N1soaLZrj3yfMf3szRNeLvvpAJF+CWrF328p9NT+zyPpDZpV/MFO3Xe2x2UUfwI
	 I/5wczcV+j1CJt/M65wmRcDdq9hSzzKZcuDpKxkqBmeIPpiv6WGQr/d7I+VPM3AZ7WYgp
	 03W47pGER0U2i+xXIq15rlKybdqeDbjz96z9PgUFVpqgFm4PKH6bfYVX0abcKNUasfB3P
	 G68MKLCTLhFbxypXdsd2N5ADsrb+MhkBUFkLCzvF7OYq6H6TX3Q+MHK3+0XnAP5k83YdF
	 qXE0yWdPK/bSGpyhLzL2cRn+vPYzos2d90JUQOcGjHyUeyE6nkI1DE9TEtNwwSaGbOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790016313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=58jc9cUoA9Ik1YpX71+xdRn7J8U1Z4BumgB1aZgFcVo=;
	b=VDhjGevGWyjylaLk923HxpoFDqJqJ6LkijILvw02TO/GTMJ8KPx3g1VHSZYi1U/+RawW
	 Mv4NmtsSzvJ/IC+ZNIefzLJQ2Kel2sEW033ggvPqN5aw6te9iHCyWzSkyQ37mmkA+a3vv
	 azZKeDw3VGTlk6U8kS2QrAgJKwRCqBSX1ke5S3UEpj0YP40j76OsprLRxu74YiGBUMsvj
	 yjo2WYyHpr8mFY35dRaeq87TBnZ/dKaK+AyyojYCtyFD8kjbGrj15aY96erfhhQ6mDlzz
	 oPtqlkoZUQAFgadzeRL4hwMwwogOwm0hY4T21eQ7uLl9DRDc6CmBo2bDQ67vXPLe7Yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790016313;
	bh=58jc9cUoA9Ik1YpX71+xdRn7J8U1Z4BumgB1aZgFcVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b47Ca12NHl2O06Ggy3r4yd0sw8lNQj8v9iNeXcXRJA4aK5tsJ3+IR5wZzsuY45ELA
	 1ClqcpWnxCEtjrT37gEBrTGAotN2py7X9HZmJIrLSrJ9JUwECGoqjzF+XGVoKt4JU4
	 ZgroLqPAj5PRzadunnWVNyK8dQIEneNs4lG8vghgBG56GRFEhGi6FIDrGdkSRvtHro
	 lNWVMkl68vXITMp87wkGrLAWqUwWlQG+cCj6kDOwW7zaLA7lt0eTN1xJidr1nCR1Y1
	 55OQdZlO/Q+cXallBb9FDBPg6odTDpzYEpS6PL14ShH5jrAgbcwdrjkW6hJf/c+h+S
	 7t4LJUeZYjk9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB0B6072B;
	Mon, 21 Sep 2026 18:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67C173A9
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E30360730
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptaDmfZCs6FS for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 55B586072B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790016307;
 b=WhGXbCspSddHy2DsiyYNuUA8sM5f520VP5jkvgt8K6ZzXB5UgzVvjpKyBDOcC2XmHRNy
 PEdtdbThRNM21feNuebFhFVzdxcW7PYpSveI3e6lb5M2cDCpm7TMo4arycriC28rlftXU
 fbH4iupP0FtUX8O3Yyf3Sto7KAbMbcszS9iGAn9+znZWarXlfp0IyxvuFr9yJVEAXjnfi
 Hj24mX5pmVxE7hVts3770UM669OuF3TamsQqUirnF5TXOASDlFzYB1RJoaqpZvAtqtRx5
 szGrWiWYuwIYxCobo/626ODmutThvnzAZG7hrkt7LGlWDNq3MDhbu5Pp2AlojVFGgAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790016307;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=x0MO3VCkPcOc5na4+RjraHLoq03eE6kUDtJxquRJqQc=;
 b=Dfz0EKNNAM7I2nWk3/q9GtkfYCBk6YLNTy9bPgQCAW+SnHmK/QQ3XFojpPufg2zbMml0
 JBcFkyb0JYUZw1EZlsja+8ZeKdynBoJeXaFsSiHYe1XQA8t4fl9Tj8SyaXTFOpnvaBsPT
 TNQ+l15sLzE/tXtN6728y6qjDxQak4D7GOOVQ5jHglTUSLRq8t7Wjo6761jSVQsg8fI7l
 kZ4PI2QQMPqNIlYv/V5q33u/lmS1S1WKEEeMxEOCe97pI8Ma2EeNa6+p8HvGQY5VnkefX
 QmhPtobuyR/ZqmqhGoI+GwE3ACwh3ubEM00trwXADpJljvloxbdkwryyeHn7ubVYpvQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B586072B
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BC0294B94; Mon, 21 Sep 2026 18:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 19:44:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02cc32ee5c66708b1f57c3aba1fc357c3429c2eb
X-Git-Newrev: e80a249f492c0ecb981810c47800514feef59d9c
X-Patchwork-Hint: ignore
Message-Id: <20260921184358.6BC0294B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-gcr: bump
 version to 2.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e80a249f492c0ecb981810c47800514feef59d9c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog since v2.1.32:
https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/tag/v2.2.1
https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/tag/v2.2.0
https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/tag/v2.1.33

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 1269e239ad..fe022e4391 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7dcb5b75650a49e181afdbd735d09f3289cb62d5b30cb6e3f681e64cf804cbf9  docker-credential-gcr-v2.1.32-git4-go2.tar.gz
+sha256  4f624eeab2923fc135b8d69211036b6fb04f3d62290cac63260d07d3f2f9eecf  docker-credential-gcr-v2.2.1-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index 7419a47d4a..95c7af83a4 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.32
+DOCKER_CREDENTIAL_GCR_VERSION = v2.2.1
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
