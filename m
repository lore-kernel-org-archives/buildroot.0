Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12252C982D0
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1ADD80E4D;
	Wed, 16 Sep 2026 20:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ur1Hjrjfrr5; Wed, 16 Sep 2026 20:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ECD8080E35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589937;
	b=m4beOznGgmseq11C2qz1JPggatfxlu4J0yxSsNVIDFFeWkN1+zUuz+NZKrJOag3Mx7jF
	 Qdt2DKrt7TcVG9/HyyTpRqWV3XP4E7f0nmPaoXQHAZffrGIwpt9GCshmn3798a6xl22+s
	 AWSwg8SLPppOMNuWOeZTcbV4ptJV6jK1tIO0f0U0uIvXlvi2VfEwTLuOJujV/dlBiddvp
	 qQV5nS2OzzOq5xE1wkYZd8yYyPeXWp1QenFqH6NULk91NyXm/ru/W73HYQhJa8zBin0wa
	 rnAyIqkZPTunhxypyHbLn3RcEK0fqljOdpANC982Fu5DJrKHpIcd7MQM9fERaGqqSaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r68a0quz8XMQ9GUbOT1OoaGeNLJ57obkslrqYy3+VpI=;
	b=QLGm/H1pMD2iAQw5Lv44eY8weDxAumwG9OwLQjqDNOxNmMV343t7OxmmMcEilXdCJdCk
	 nBPMIdbLXUnZyJ3Ikiloq8rNoHJ0bdw7WlmKSVragKbXPbkZUq0zEDt1cybbb6m4sc+2Q
	 kJVE7ze6Uvi/6JMn7qdeRGGwlgm3+XPsM/wykUJtEIoQoXDjFZzkJIHNoFQA+2VxdbKae
	 euiPbobQTAZoZV1+4no/SV+txMtD+i+KO6qqtIn2TdF78bSdAnyq1NoVj/HpjyVdgj9yt
	 wJMqm4WLUYK9Qmmv//YyBQrqNRK1IrEFdDDPejEtkuVz8h5yoOIO/kv37yD0Vo/O5/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589937;
	bh=r68a0quz8XMQ9GUbOT1OoaGeNLJ57obkslrqYy3+VpI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JnXCsy1xkjyTFJahyw0A7D2c9PRWYqzCIxFB3YGl8bxlK1fRtQeQV+CkmWmfmFhAD
	 DHo/4jEm+4RofjJpkbyVlgfgAdMFvP88fF+G97S33zdvXPQN65qJiwIKfVnp8aXM9q
	 twRjKtDGv6OWdjw6Iu6DHD9Q5HM1Kmh2BM5gOQ8R8VCjbEJnJuQ9sK58zJHFIDttns
	 ywjTFseV+cnS1bia4CCy7rxfPV4xj5g7KhLA6ZiSzUTa6vOYyLS1r3LVlELfRVKt7i
	 eqhuo9TVs8epjt8bNpPGebNhCzOWUF+Scj22RrqruUJbMMZLcYb5v5w+7ce6TEzCy/
	 LG6xc/Q7t6YSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD8080E35;
	Wed, 16 Sep 2026 20:18:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A4B24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F12EF406D4
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKtEQMhMzY-G for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CFBEC404F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589932;
 b=L/BgVl4jRPl4/SbKwsmUENujwcJbP4fflJ1D8vn2tZ0aaO0Y7V13zQA4DZ35balKODx2
 ac58tr4DL+3LSI6I4zEcTC572hGbq6LRT1HdRYQAAkWZ1tKmNioLeXjX11KDRVhjE1edQ
 BVqDx9g+r2u2429fJAz9kNolH7KNJ2y5OLkcHKz5KkThpuhxnpnPahRDngds0cLNC9EyM
 PnszIaecCOtxcE2eTHuqYeFyY69rK2zaT2iXZp46NG8iXZ3pZPZv34Gl/E6IeyQfFpi6S
 NKQTeo3Ga8zR1KYuU1QVQ733nykN6tKCX1/guqQx/CP36S7xZYRT/Koe6Q3SDXjb5IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589932;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AzLZZU0d9kpBthRipbm6UKNGWZOnQuyfEWxR4Q6ubSo=;
 b=Sk1kHVUuKYor59AiFpkr8bSzlO9UlnGECIT3f+sf2Lhs56WMSIAkQLJyxkpNCCTcPrQj
 Fc5Kp8aYDiyUfqASdStOfZviGhQrliHm3MIjjiJ22cbPsoOX2OlMZuHNRigWltEOlclfm
 y2FYu2C0JZ//RbdIG4Ep2UKvqE3khmsvhprKdSwWtIYplfravsvSUlNc8dU5Yro8xK62U
 vz4K4T+OThrR0j/XOn2sgv6HEm9UJPf1zd1bbsGSzsbzdwpJN62QGieMnMfVsX90XRFHv
 KsiNssolnJ9lWAjmaNdzL1mu3FOAkCEHYc9jysCZ8ZNq13kv0IShsXuyc9qgaCy6T2g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFBEC404F4
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3636695FF0; Wed, 16 Sep 2026 20:17:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:09:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d7e810f731bb11fc4c866c52dda1a6e171aa513
X-Git-Newrev: b424201cc05f9646bc732abb26dab1e0aba78306
X-Patchwork-Hint: ignore
Message-Id: <20260916201746.3636695FF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasyslog: bump to version 2.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b424201cc05f9646bc732abb26dab1e0aba78306
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luasyslog/luasyslog.hash | 2 +-
 package/luasyslog/luasyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasyslog/luasyslog.hash b/package/luasyslog/luasyslog.hash
index 1e2a5ddec5..3a04cd3397 100644
--- a/package/luasyslog/luasyslog.hash
+++ b/package/luasyslog/luasyslog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1b19ca142130f93c3f8f2e85303ff50cc6f4ed4aa52b8569176ae56e3dc3f43  luasyslog-2.2.1.tar.gz
+sha256  59c1f570b0e262b1e0fd47b650ebd1dcc8e152f004a0ac7a0dbcf7bfac394654  luasyslog-2.2.2.tar.gz
 sha256  833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
index 972d4c5a7d..d512e45b8e 100644
--- a/package/luasyslog/luasyslog.mk
+++ b/package/luasyslog/luasyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASYSLOG_VERSION = 2.2.1
+LUASYSLOG_VERSION = 2.2.2
 LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
 LUASYSLOG_DEPENDENCIES = host-luarocks luainterpreter
 LUASYSLOG_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
