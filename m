Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09511C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B5460EB2;
	Fri, 18 Sep 2026 19:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6XggVZwtWsQ; Fri, 18 Sep 2026 19:03:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5134360E7E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758237;
	b=lNwKAYsBnIuu3qYG2ozhFAs6+QJLSzcDsGBiou6sf8h3ahTQJ92jfxMMWRNqQ7Oj/yBh
	 Nz48xnll76Ahm0atZS5z/JfzGr77GRq0W8tPHXieerrDbTCeieOnhi8rbsHsWUyp94MQz
	 QYxA9n4AAydBODQpYVyxGRb2I0lFVXhjbplXAfXttCJo5vVfpdF2BCPS0vSJG1Ps6Ll3S
	 fUc7PHY6pMdzLOhD/4a63Gnb/EfESeUhNTFsNuwju9/CLVPBs28dlrFEdgzApQ33NVE8F
	 4RJ1dH8zSMFypjiXG1LYZD3zMxMchQoOYVheBtsx7WPNLPTGJRp5otXoi8QTtN9HAcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/d5TLZutTMF4MOdMD+yCuP3tfrTAmulWkGPQuGCLzas=;
	b=Gss4NFFO5YNfirBAUpV7REXw7BhkYmvf2f8QWCiPkTusy7GXK76SnU3Ol90np7CVLwrM
	 PxB0YVaAZmvXuvA15/oOmcA9FYfDy/LO960zHuOa45HDsSneBnyDblK81/r84BDJYYyGr
	 r3yAxPCxpqI07az8aVEu8uNA6w8/EJvJnUZ//6fOAK9i6trR2pTKX7RemOixLTf4vM5gX
	 Hbey5HTlkwDgfhJ4L+wSJ2yb16Po4HwI0NpHOT+t/VUenmE6PB+Z+fTLtp74eoewUfzPz
	 09NMpxZzypkeaKNRUsnMH0QHOI5qDBASn4dbMQgnlyiJPbNTchw8I0wKI4qtY+4nxew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758237;
	bh=/d5TLZutTMF4MOdMD+yCuP3tfrTAmulWkGPQuGCLzas=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NssNJhx3NuJZ6WEi/HFgkSKHoaPUqGqsIKHbAM2zpJlZm+dNQeWtOWGU6Uy1iWJqI
	 qd2j3jlxoZGFq1yrvgtRe2qFIJAdRy4Ye9k6/ZQPky7H04RdBmNCjhkGBko8FwUhOq
	 ZNt3WrNBu9pbgdFfmAgvQyJfI08dHiXkg8qQ6gRu+N2O28FzgFxhN/yFr7X4NoOSKA
	 8OZUDBWdjqOJUQZUy73MqWmJTLCSOl3uhZ4lxUnhTBn0VgwNFgN3H4qfOrtSwZtyVt
	 pEdkhKLrvzBjI4qD5DQS4nmodoqqAPLHnJcDWx4+EEqe/ss4Rd57FmOh1kX6sn5mHi
	 153UKN/g0bTHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5134360E7E;
	Fri, 18 Sep 2026 19:03:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 626DD237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4915D400CE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itYxL3Lzd2t1 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:03:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5E6BF400AB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758233;
 b=hbPeBTnCumbIP03R1/iwvSlMVCQ+cgkkg4wRJcTwJBuJ4UPk2y9Pnde7WIMYfBywEXYB
 QbgB9c0ar3zZqrDcR7r/Ts8SHsHJ1FHnEEsVZ9M1tYJgO/hGyIvGGoh0AGBAeA94lt6ZI
 HWV+bGv6BCoTYetn8TOOSiSgRFN3CfiXzdA4xAoaeIdHVu1kCIYdnGWOS7NaHzPtHkfoM
 McpF5rgSOBzoobYbwhq+R3+0wS2h3zZLF+i5Fvv7+gnlEN1adkcv5ZqI0BLcFvF6A6ycS
 QdTSG3f5H9smPSST0SbACgIicYCrvUy8NGtQU7elWMUw+ejTtHnqshUd9qQEjDSrrBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758233;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lcHzyQBqrujW+MZs2BmiIjmJrtdTpwTjiuGx3t3w8FA=;
 b=aYHKYN6yaAVxJvSdWcipRRbNosq5YECuVoBMuwl3udEgfsjjuUYjERbUyZIYuWqlzyUF
 7yul7mrCa6xx6nLyq+LBHIJCnFZAwmfcauxWMzA8SB0nQLCYvNuKS2a5veVlAEvIdoRWc
 KLM7FukbrKJbAjbbEMnAn83//DUOVlH80QyPFm06BqsYhMSVUAMmTc3RlvxTDdY3qHi4E
 PxnGu7AIxeYrFGHwMO0/XDiLAYRjqt1Mmw9H12jJoWMwBdIHHKqjhCbDfaZb8To2+uPHQ
 gATFjJlArR3W3/Vttoe1b8TYAxseTGx9DYYHUrMvegySPpPuVsU/Dtsi74cvVDK0+wQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6BF400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD64C976A3; Fri, 18 Sep 2026 19:02:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:48:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55cec1d01307f8e93c6ce61c95c22c863fc1ce28
X-Git-Newrev: 9c0385972dfd2e244214ba4549e2e8d011a26565
X-Patchwork-Hint: ignore
Message-Id: <20260918190245.DD64C976A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: link with libatomic
 if needed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c0385972dfd2e244214ba4549e2e8d011a26565
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/

The build error occurs since 2024 so a backport to LTS branches should
be considered:
https://autobuild.buildroot.net/results/1ab/1ab4767c1198838c3e3d126cdba790197d102053/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ghostscript/ghostscript.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 250c851b28..08e2667981 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -37,6 +37,11 @@ GHOSTSCRIPT_CONF_ENV = \
 	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)"
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GHOSTSCRIPT_MAKE_ENV += XTRALIBS=-latomic
+endif
+
 GHOSTSCRIPT_CONF_OPTS = \
 	--disable-compile-inits \
 	--enable-fontconfig \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
