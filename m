Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3906FCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051DB40704;
	Tue, 13 Oct 2026 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IuHgZtdbINw; Tue, 13 Oct 2026 20:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31E46406CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924788;
	b=tU637XT68nd5b1qsnjCuv6z2fkSIblJn2tZumUCY30M9tbGLUGLax+IVRAhvKiNP8RDu
	 XseDmaK66DEtCrjK6WsGRWMKm72JXORL1vHSjJmiZlJtxw9COdEotAxgTq4JKzRKtXRrU
	 JmWX702/yovY+vh8eLu3v6FA6XHZzt5RU2enEgs/lYpJZON4i/xUf4HjCZInwCBsaZay8
	 dZq2Gy99YeD4xlCiReUCtmPPv7BDsgu0sQV0JyCUAEZ5vJU1K648TeL0u2vHY0CAgZJ9f
	 qEW77lZ4iuGhn+lcCm1O/gBR3T7uNXoWCT+ZqhkprVQ8DPEpG+X9ihKucBtDZw6NoLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VG05GQpKo5P7lWcktNmJtG2NVXffmav9BSdaeGsNiWM=;
	b=fNv6sM9h5InIgRnrTh3Ai/8xsdt9bkInVueNDom83EfV+td/0bQ/Is0YTCkrV+xOpR1S
	 574DvyK3Jfp/o8ooCjLdHUnjIL34mfxi3ajhXmkUHcDU32hufVsw3BR3rlj1Sm23fsLa1
	 T8vtZkpHaGMirb+ViRHpED5Ph184zDJ3XbvbjM2DcCmQM+aHe2yXqaq3x5D8jNkx/40WV
	 8JAiWQkB75R/rAREBEGyWz4V3teB5edw0U2+4RoDsQgOZW/BUqxKyXBqwfDAe4YfDL0gG
	 nZjAe5Q6Mf6G/GTsZ2IOETcf8Iy/H8VJYzbxgwHxaensQyN3xx7nDHkDD1+56h2REQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924788;
	bh=VG05GQpKo5P7lWcktNmJtG2NVXffmav9BSdaeGsNiWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l2eGtzYYyqL4tonNfbOeVDtKvsVoLKjgyBsMCNky9/1FAcx2XyPWzqtsq7elHh84o
	 BdFEy8y0AdhC8X6E05MuRkTcvZaujpdb4/oT1/nk6oOHU4qQ8Fa1isgQqkyuWqu03E
	 WXOBiL6UPttEJDju6onxkOn9XnztZeTwV7tYlPcrXDz5+CSNxHr9BwLrUI3G9WjxWr
	 LEKqYVtg+1wUtGEA8M0wVy5BScbWfOFuQ6wsrO6cRasDcprr4dyNqz6omOMwJi/sA9
	 QVAJXS2KESNHXlX+M+rb7DYlgDQWUV+31dozYl74CWjnhb2QXjIudUhJfaJek0K69I
	 Hc9ogIpjEeVVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E46406CF;
	Tue, 13 Oct 2026 20:53:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A265E2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94EE8405DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAS5t_sC2g3Z for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CFE7940640
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=D/4jI1y3WPtvAU7iYUsKO/EXG8KQ8ljZE+XqxvFDxEyzR3ClwFBpt+EbkuzAYRxAwrGH
 L6Na09Dj/p9PzSepctk+JSMXaEGmAmFzsCOVsJ2Q/FrPVkzsDSVVTPN7CGe+XUWiLYKKU
 AUxJiSxfHVHChsmqLOi4AKEqa7bRtTrxerfvx0a0rNzWii94MyCghTrP/5qd2n+saAMWM
 dloo0zn/NmoOIv4fS+CdV4bzw51QI+WickQLf5+CWSY8JC9tn1WSqT7r/WYjCPl1LX1uf
 /8kmzqs+uxeig1v0gjRJOilSB3XIVRd7cH2BmueKrNaNXYXvBzQgO5jJjFcyDQPsM3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VPktPlQjIqA/1iOegeVbChHBOM1W9BTM3W60QMLPsLk=;
 b=ZeuHVMshReTGWuaL6Mk8GJMJgH7IGKjkqLi7xbZXFvXqHcdGLUMzv9b+6E9U8gnsZDs3
 ySIX6ShvaDX51MlLX11yVcRIugB1c5gvf1ZUBs0tBs2IEH8REJVi//Agg8xEB/ZkfgZCo
 SoqVnElcQYqroTNC2UgzXTF0Y/KhXrfFNR8FFfk257Tg6rZjgUgvZwlVeV1Ux1ttuDrex
 QOGwYYbpA8FDmhxTece4b4R3KQGsWw6I8efBhkR5U4wOg/sQVvBkA6vWy1n7Ym4gfZLdZ
 I4loc0M9dcMR1Yt4wDGStnxXCAMhpdZoLMViMwmpxG49qf5GFrsPGqbQu81N8/am2hg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFE7940640
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15998956D0; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:46:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8252f69992a0e70e9f85ac9d9f0e57a4c8a88488
X-Git-Newrev: bd71152b32c39338a17fa9b46530f2914d795fab
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.15998956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-servestatic: bump to
 version 4.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd71152b32c39338a17fa9b46530f2914d795fab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-servestatic/python-servestatic.hash | 2 +-
 package/python-servestatic/python-servestatic.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-servestatic/python-servestatic.hash b/package/python-servestatic/python-servestatic.hash
index 6d1fb6ecf9..fd61364835 100644
--- a/package/python-servestatic/python-servestatic.hash
+++ b/package/python-servestatic/python-servestatic.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256  1ab67d0654910c000864f9b6d7fefa8befc21a2156d539cf9e519afcc27c4d63  python-servestatic-4.3.2.tar.gz
+sha256  1c4896ff49d0e6b0aecbd69701229d5ec646d0c00927f7294e8df9ee16a20e70  python-servestatic-4.4.0.tar.gz
 sha256  1770e2fc440cce75b2b2bd1580c6d59f58a497f0bb7abe91a0136bee0f688bf3  LICENSE.md
diff --git a/package/python-servestatic/python-servestatic.mk b/package/python-servestatic/python-servestatic.mk
index 26d93fe9b5..3acf021961 100644
--- a/package/python-servestatic/python-servestatic.mk
+++ b/package/python-servestatic/python-servestatic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SERVESTATIC_VERSION = 4.3.2
+PYTHON_SERVESTATIC_VERSION = 4.4.0
 PYTHON_SERVESTATIC_SITE = $(call github,Archmonger,ServeStatic,$(PYTHON_SERVESTATIC_VERSION))
 PYTHON_SERVESTATIC_SETUP_TYPE = hatch
 PYTHON_SERVESTATIC_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
