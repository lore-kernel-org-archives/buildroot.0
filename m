Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C097C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F16780E09;
	Sat, 12 Sep 2026 14:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXgrwEK2mmKe; Sat, 12 Sep 2026 14:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2C9BE80E0E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789222844;
	b=Qxhj+Jz6J5YRYHqvEKOrKGSyP42rj6FRhn36FKFDYFO7LgpKSo9l52JrHK6rnopC+gs3
	 JXD9nynNyQvYGOcmiEck+hiHrMMqr/kJKfWqYYLY9MaUk2BlSqcgCtK4v0hyRqKqaKCGv
	 /x2zb5f/sijSDcyiM5qhPQRNdvAmqmbTE7KWnEGeg2WF2Uu568FgRcGIStag2kzJLNvfm
	 y4/z7MxJlIh+vcf9GqU4V7PflWwzqvlEfmzIjdwmvjQ40JqS3yPIFBsGdWc42Pz35cNEN
	 Fp2FFLifk0FJJGnh0G+ZnEKZzbFvGwfuyy+h9SU0RWBe6fgoHMmHajVQHittfLrhkow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789222844;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8ER98HUAnI0MFaI6joWf/AazH6x1CeDaL97H1U+z/ac=;
	b=Wyr3lVPaCClTByKJU/pAdgJWHYxNEA3upBygf+qrOdXqBrck677uF7OBF3YQ4zrdup8M
	 U4q2j1QhfhO8Deg/c81jI6+zvvlpu1j/lIgX1oTgugujV8/Ee4ZdfgNv2OHv2IjgnA1tR
	 rVrKFkZVhIYyk0XUmrclGoXVVh7LbzQFcGBg0JAvdzcPCLYRJdDsf/G2wPiILzBmErMSq
	 N354DRAVXh7365XOAsrF1A7ov81fPdgE3qMa7lmIEO4fIl9KPxjn3BRt2UK46g/ynEq1v
	 avpJccXVUSTifyKY/MZGISEMcSUPPlAEexHbStCIeaXjxMBsefIzNwqQWqP4Js/CC5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789222844;
	bh=8ER98HUAnI0MFaI6joWf/AazH6x1CeDaL97H1U+z/ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nlCXQjMX960y23Sz56KVP+ngtJRjaYM/LZ8pf54L+wphi9pjYFZlnbFI4ceKwy7Ti
	 jenReIkSCjrngeJiW6IPKLC/aHhXjG5i+Gf8Cxi8qOLiKL/IFe8yvThsTLsWTsAkzA
	 INDQl75GMxAcoCIRrE9PhLF9nqC7DdoIr6pnrwIcJ2GKJK6knsDyZ3htGq6mwxPPV6
	 myMHurjbyqdGuB0krXCzj+7p+E/JHB0tBy7Z8dx5BJMyoRzlYxIM6kPU1ZDdIPvwKs
	 +DFtz8M5vPf0UFSuTS0oDxWX4QDYlL9e5vTYMBbKHfJMwdGUU7xogiwb8DB4qwcpIl
	 l4UdJ8TjSpcmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9BE80E0E;
	Sat, 12 Sep 2026 14:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8FA932F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4DD4406E7
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtnj-OnqNAGP for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0DFD5406E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789222842;
 b=huPxiNm0yI05W5WEdx4NWQcXe7wPaYDMsS7u3xQssw4+3sv573YLy5D3DGpXradqT2Pp
 7nrjIwTbpLovDSSZGlcknnY3UwXd/xHpuZVtc38fyn2S9psopXiS0J9bMsD/nXmfReHNE
 xw0h94tHcZWjGolcWe1c0cvOZ2d/mQfgGgTteXxo8gyL93flkhUgzzVghwoylvEHs8NCd
 GndlVrQpzvM3HYkbFFFiklLTP4MdbXbDMiiM76gVwwfCM4efJRmIR/Uat4R5G/a4DQWg5
 6eR7Nu5rAqD6YkzJX6/Yb3IxD4YUQItpvDL57afnJmC2zZYzjuGYICLy7uylD2VBUmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789222842;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gYncajoSM9jjWsOoFcdIMt1glrRD659aGoaPo1E+mSE=;
 b=FRX/upI2MdP8XX3n78kQ1qokbR3m+GXoI2xHEzU4lAlMR19Ol06fqp177QnXeIdrR2Fy
 vWxjzByMDvRhHK3rHIhAIyhUJ3sazI15og/S3nean1eryX4iXMu+sDHhKpUtgttULMEJJ
 CAABMq7SaZHEqFv2pkXE5fisas7BvBw0aXCNdGaneAUhmHnxjLdbXgUbHHNyIUYx5LjO/
 m/Pi3+FprCu2cPi95OFk4ZdkVvb7lIadaxXw47V6BLaC0fKH4KK/OGTBMeyAkRwZCAjOr
 PQTMvBpqvVkqzap9r346vy6TJcy9TT0IztvVRBFSohTqp9JvV3MxF09wCcA79SmJmKw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DFD5406E4
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:20:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DB95957DA; Sat, 12 Sep 2026 14:19:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 16:11:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 051e5ab13b751b474310124798b3cc6916ac341f
X-Git-Newrev: 51b366290b780a6c5f9e09f8e84bf5749d2022b2
X-Patchwork-Hint: ignore
Message-Id: <20260912141937.8DB95957DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xdg-dbus-proxy: security bump to
 verssion 0.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51b366290b780a6c5f9e09f8e84bf5749d2022b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes and issue that caused broadcast messages to skip some checks.
Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8

Fixes:
https://github.com/flatpak/xdg-dbus-proxy/security/advisories/GHSA-r7hp-698j-2h6c

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien: add link to GHSA]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index e5be1f0cd3..bbc1762acb 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
-sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
+sha256  b6630bd24f8161b0e2546d2acbb014a3b3249f5c0d75f2a863ade898b9034d3d  xdg-dbus-proxy-0.1.8.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 6c3ef5c9d4..7f9fe16f28 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.7
+XDG_DBUS_PROXY_VERSION = 0.1.8
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
