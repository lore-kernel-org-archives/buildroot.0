Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82EACA9EBE
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8037840931;
	Fri,  9 Oct 2026 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4yjYUPNExpu; Fri,  9 Oct 2026 21:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 984C640934
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791580423;
	b=lrvYeEQdQPeJ1bEabThrapeDDvM0n/tFDP8QXZ/r9sCEg9enDD1JuKkOJ349rYFVo+JW
	 cXEX+dP/MAXnGbCZZdfJ1eYn6dnwXD5qbZUcVyZn3egfwM1yJDlVpE0D6mg37xCM7mwE1
	 QTucj4XQILmXQ4yVOPIS51Ls/FPJCf1XHcYbJQuOahxHUuAXo9/u1OsiJKjL4bnYMtyu8
	 oHjsHdbKT91/bZm/ZlS0p/OsgL/HcfkTjmVYYI2MOu5gw5RUNNchr35EA8npRLRa1r/dn
	 vwDHE7+PZNjy0+WQd4MS3C20wFO0Un4j13onBpUljtTqCJkdC2uHMhlgQ6+2zBuSE3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791580423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6AOjO6iQEmJ4cEECXaG6wjz1hG9dX5QdAO2zH4jzIVA=;
	b=E0qjlf9Fxu6saqdmif93XXJHA6gCH/CWKMahUj4/479PEhZ6ZMXiqSTgVZU9+0YiQ8r7
	 T+Vhz3Z4huxtT2YI74HeIiXhEtAIqQKMK+ZfOEksDxQ3WJtwVcCxVLBfRX3goIoYHmOdP
	 sOz9N3HoCJ+54yB7pmriSz9u0s44COpZnR0zOqK9dzcy9DRLaeG5d0mpoB59MS6PQ9QBQ
	 4zkQRd4k6H7vGcz9CiQpdZZIrZDutXN87kDJcN7LM81TNuuQGjARQxqRZRVE92RKGaQz9
	 Vw8GeEnvgMZjLJ5c7Ows9YAT07xp7lmiPykqAYa1TkH7pxzdYTXZQnBkP7UGNHAsaxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791580423;
	bh=6AOjO6iQEmJ4cEECXaG6wjz1hG9dX5QdAO2zH4jzIVA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eFO/nNFmzp8JEMq1zYyfi8e60U/jnzI+aIkNRPT677cIT56pSUa+Jv7FYtH5X7H3B
	 v7c3Eolmcj6pxHZecLFPhO1PDACLwobhiVp2U5l7B6h/TCaOxdGGoj92vGsZx6TtXc
	 4F/mC25SfTZzbhGJapC0Edsa5mGJUK9t2SQkn38COD+lyUhCw+IqynryoIPxQ79UQx
	 yhXuX2xzoez1hjGS1ajcSMzaf8pY/qwZuSc43Tz12bQ+iZgJVu8xjBHk0uTxEPHLBM
	 rmk/vGTq+1Hvhvek34W0YebGO+tv93EtvGoaAogOWFv1YQffhxJGaaqLQXNU4Wmei/
	 tH1KKvhe8QCKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 984C640934;
	Fri,  9 Oct 2026 21:13:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1D4194E
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 945654018C
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lyhz3l9_gzPP for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 21:13:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C500A40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791580419;
 b=BU4l7ccQNJRvLy4N5RTBerWzsyF4Q3is/zG34gXxsgQhG85bgJQv+xgku7Ca3DQuxrCY
 559+z0jNWEOUDXHkrZp+gNgV9Tar+L25U5nV+jDm1tNe8G3yJ6IyLAQFydtRTG2m4AbRV
 mbTPeEb517NSIeOfe/wT6Q+S3dhkeC0Cz5ohizVc9AlscbXt2Zx0CgEtRv06jzZF2ERmV
 gwKW0xSumCXjvmbA8Z1RdzkcRdEoel0pfXamcXuOHwb/dxG1zc2J1byMSqFW8y+ezFv22
 CMdc5sVB1JoPO0hqLwGtmgyQG8uia6dhtekWbBxlbKZ0So4wwVdbIHK2vWtpmgHx9tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791580419;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2sThFerKHQx20edtbgA/TGeSUHi09/aQ5jdlV+XE0V4=;
 b=Yygdy5JB/HrcnmKGHvws9cMLWvXisOreURP6tTi5AtYi3y4K5nJvTUM1Um3cdKisu6IW
 KeVGocjW4PPP7i6HB+Brk1+99T0M1/gcLU5oOpoBE63/VWgwf8Uz6sZ/WpE9Vbly1yL0q
 GGrIzf58hSI26FoUMA6xk3poEDn+A6mS7Pe8DXUfV2fAL6codmbQ31OfJK1dFimdfwQBe
 WDs887eoOYkcD/lbU9KxrskGcuaNldTixuq9m3vy/serqJ8XO39/Zk3BLfavKwZ0YsyEa
 e9zB2xU2rEjdOftz/xZZCjDfbI6WZ/SmcorFrCqTbKxtMcB4vDvogvKtdclDI1NkW0A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C500A40080
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C51338E21F; Fri,  9 Oct 2026 21:12:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 22:21:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a152da33b17badcaa1aeba1742c24da3f7391475
X-Git-Newrev: 67905e82827c32b452f7e4ea34cd8139c7aa0096
X-Patchwork-Hint: ignore
Message-Id: <20261009211221.C51338E21F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: bump to v2.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67905e82827c32b452f7e4ea34cd8139c7aa0096
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bug fix release, following the v2.5.0 feature release and v2.5.1.
Configure options and license file are unchanged.

Release notes:

  https://github.com/firewalld/firewalld/releases/tag/v2.5.0
  https://github.com/firewalld/firewalld/releases/tag/v2.5.1
  https://github.com/firewalld/firewalld/releases/tag/v2.5.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index 48d80b1b87..58358b0f52 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,4 +1,4 @@
 # Hash generated by GitHub https://github.com/firewalld/firewalld/releases
-sha256  d441705746cf3d0a5efaad58b1b1193a23c58114162d81a9a0f4fe0c58ee43cf  firewalld-2.4.3.tar.bz2
+sha256  99d7468c22f6cafd8c72aa53173a632f2ca29cb19aec913e8ed45b6102af322d  firewalld-2.5.2.tar.bz2
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index c443ab3db4..8a390c0fe6 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 2.4.3
+FIREWALLD_VERSION = 2.5.2
 FIREWALLD_SITE = https://github.com/firewalld/firewalld/releases/download/v$(FIREWALLD_VERSION)
 FIREWALLD_SOURCE = firewalld-$(FIREWALLD_VERSION).tar.bz2
 FIREWALLD_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
