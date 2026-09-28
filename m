Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF24CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8459780B49;
	Mon, 28 Sep 2026 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1E_5QVWoDDcJ; Mon, 28 Sep 2026 21:04:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D63C980A56
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629443;
	b=jDOt44TR1dJ4Ysm4iVVaqQh+tJidWVJD3jucsLy08JDDa9wy0mdpuRcJz38Alrh/wpAa
	 yEAOqLTp0DXft8td/4jDwo3/bVQLfeopdzx4J0aPaeJrH9NrXe+Pozi+IxeLcfqNmoHfu
	 trdQLGYF8aGxtcK0pvpjjIwV9B0nB63J1SeikJnATeqQpLjA0JBRIcSrw+qp9RLHDQvK5
	 Iwa2esCAfEHKB/B6HY9Ohn8WLZvEqN6ta01hSFNUuMCjsjPPYLBGmXEjSa3CDKZfXMj0n
	 zguE8mjtwNkNLD5lR5VksIrNF6j9KF5XOl8lZ+9i6l3hLQblXWQ8hjFm7vu9GXNif/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y406FWJAGLP5aVNIHrOkI2dtXc1urD0Fc5joKJNwtjw=;
	b=falzQ81tf+37UIen2sVmWS13hS1uJBV9NOGa24r8mIUjToisVuE6zDmhQdXioTn8kzYJ
	 xijR4cajBUfiCpy66Bhoqgzr8NLppt49g+RelvP57+AkIrn5HCZ4KmVs+XckebF9kyBaj
	 y3ufOJ3/x1dvkg9dGNntAD+k5kWFJWGX4nqotMGmRQ1pjuwna7Hc4hvnwYRqF25VtVpYp
	 GNFOAzLqc6mkBW2iJcsggtrc0vQ4D6Zclp8AzVcy3lTh/jNF3oi3xB5m7hOMrWy7VU39A
	 gApu7T+X47luXN/hDbJIggnbW/Lj/pvo5ZVDGhR8ihvYUJOZcu0A3qjtXGCE1jfU0Ng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629442;
	bh=Y406FWJAGLP5aVNIHrOkI2dtXc1urD0Fc5joKJNwtjw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ohkuaDGbltOY9dZihjIszgEU7tuAcOfN6kwWjsnNIuiLVrfWoaMoMPJ64Rrywhk1+
	 gFQKIRZzzJr1Q7IQfEuws4NlTaWz2KnvGAMcnJeJgRvgYAsBrk16Y8lr1vZsTSIFs5
	 /F1/15xWsvjioz3suVDVDKUlMLAZsJYFIBzYs3jxoda6zPk6PGsHbFSknyvfV1Nz9X
	 xMv2Sc8R2+He/N80XUH1R7HV7Dn3OIZo40MRSwyrZMXHN+AsgqnWRMF9mKCLiTTpdl
	 0z0joPw4QYWxDQLglMw0blthFDSEnH6YILCwr2gETFrQ2QizlJ7/KF8WyXBDqv2/L0
	 ZcmbmLrgos6QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63C980A56;
	Mon, 28 Sep 2026 21:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCD461
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A3B780A56
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbWNjTYEgMih for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:04:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D91FA80989
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629440;
 b=GB722b4LIfFCHAnM9oVJ7UoxdKzce5Qykr9wGDagQu8yYUFXpahjDPjK1FsDO/fcTJsu
 jreAYMPXSJoSpR4VRR96GBzKHbrFhfu6Z4pLsHdi1bfHZ9sUlOUUdrkGlYVH92NKasjkG
 xW6QEz+uxVkVKD7JWb69WFNdCGy63Zuo6etvjLkCLs4ZcMOhwwf3mVucs++dsLk2SgrAq
 FrfWZOMLz9gwp1n75B5OF0INkSrU3IpMD4SkR7Eubg5jlR2nt/zNa85pnc+v5ACk3RKTs
 m0h/rRZM+lpEPz0hgfk9e0fM1JBIl47QFW7cmBhOcJBeJtBqPbfhr7cLAiiKYQCL2rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629440;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IWzXrsoBLCg4mQKQaY2k4iSlwWqHWh2MP16m3vDG/XI=;
 b=k5OKoeg20jcNCerEmgnUJF+WCorhlY7V6hVgOWV1m3XpqhGHDJse90MNQRqKZoe2e6NN
 dc2hE7tWQNTgUH+BTgaIR8rfddpMBKqnzQpE13E8n4nz8qjzYQPtZxy4FyVw9os8bh/FB
 aDNIcN5Kdy2b6Rd8reco3u6IrESdgnM/8WJf+THPNdujc8EYlPb3MqBVygaZ6xW6wdG/S
 XY9QOPzO0Jda5ZCPV+zih3dJyxz68oD5zXx/pIYEEqj0WGO5Pjrj4FXY9pTGGWNSKRJzs
 O1cqYoUZqotLDY+s5tTYwXUaE2IC7LDSfjYXyJzJqB1vXZ4q1LqhlgmH+A1mEpg7OAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D91FA80989
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:04:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EDD1983D7; Mon, 28 Sep 2026 21:02:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3fc9c76fa3c253da2b3db535e24f8a6da91b607
X-Git-Newrev: c4c6ad81bfa4dd5b12c230c450dbf798c5a1542d
X-Patchwork-Hint: ignore
Message-Id: <20260928210248.6EDD1983D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: fix support for lua
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4c6ad81bfa4dd5b12c230c450dbf798c5a1542d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 4.4.0 of wireshark, support for Lua 5.3 and 5.4 has been
added, and support for Lua 5.1 and 5.2 has been removed. See
https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html

This fixes an infinite loop during the build, as for some reason when
Lua 5.1 is available, the CMake check for Lua 5.3 or 5.4 loops
indefinitely, with cmake taking up 100% of one CPU core.

Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")
Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a67b915b5b..c394f85beb 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -109,8 +109,7 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
 endif
 
-# no support for lua53 yet
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
 WIRESHARK_DEPENDENCIES += lua
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
