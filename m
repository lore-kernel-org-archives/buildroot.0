Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E10ECC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA57D40471;
	Tue, 13 Oct 2026 07:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etSHc7RuBJnH; Tue, 13 Oct 2026 07:58:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E681340412
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878281;
	b=kTE5dFRoVXYOG8Hpeyk8Bwlt0OBbSmwhk3P+cj3vyzeZX2ZSW3vN2AOyqTf6ebTtFG5H
	 bAj6ayWoIh2eWtBDsPmSIa23/BjSd3Bnxle/OUw5dt7c3B7lA7NCoptmg/khbntkDOwwm
	 jN6eCnt/T+L1gBiXmXt4k+63CJOngxgmvUiqWSLpxMY0pXQmqfq4FKMDjYQe+CsUeClLD
	 tS1w3F2dgPKe2p7Mevw1oUK6CHVsPusRnE7jhbcGh7/3rZyna4xhNyRRRDBTKTZ4H7Yzo
	 blY5I0btxDEiPyo8K+bh+zomSc7PPv9XQycwIqNEUfCDKDYokEABxOZbB30hwbQc0dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nw2vjzvg0FrIRlQKX4WNdu1Zhcf4fbzhGgEDUYdhuOg=;
	b=qIjIxLQ1rWZudrPJOFW4ZWWqV4/m9ZuXFfBPss5xT3Z/vjtOHzWWgDGYNJCxLovlFzcb
	 87irFBo0rLVKo+C2sfbvXKJMJaZhlqwtl/HZoO0YadMwEsbykTyLchop+iju5sgQhB8NN
	 kYLzFKshWxLHqYOjHEUzJJK0NiJUMvFdTPylPcvAyoxVtG8ga+qq4EkwuhZHRrQkuq7JK
	 NEBVt5G43OMCL97MkJGJvYg4wrHpkvm2s1RVFqjPZ3zNNZxlSYIS3vYba4RgUUjMYyPka
	 l/WQMjzjOd/F1FVLthcsjpeEOzIGD/TZEUKBvDvs2PqO3lrAPdLayxxK+Ewk+vok4FA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878281;
	bh=Nw2vjzvg0FrIRlQKX4WNdu1Zhcf4fbzhGgEDUYdhuOg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ONf80Kcn580MNDPwspx2HsEIZib5lFn9OBEQeVTQNAu3dl1Cl7BCVwP6GNHDU8MfK
	 E4lDy1IA3zrSGTKrqXOqvlIs7kWVvAoPguXXly9etPkXHfapreMefA+Cjp+Qu9HlpV
	 Ana+B+DCBbliGmKTgg5utDeMdrnk7pcrWbsxaoeeEa/2cvO5dBMRzqGcL772Xxw1PT
	 hGxdfygXIyRRt1ShmTSYbQTqoT/TItygChX/C34WW6C8A0OXCoLqvzp189wShQ1eac
	 ToLWWZwHG9mQ6u8Qrcr7GwkkP9GvtsHpuGQnKPgeKyhL4uYgmajHhHwkm7+H2i2vY2
	 2dmBvDFZNJGxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E681340412;
	Tue, 13 Oct 2026 07:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A43E8129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 961A580AA6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKhyaqHyyU7s for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:57:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCBD580A87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878276;
 b=qm88LQ1hdUnR3dXbeVMeCgou8AB34GkjBEEUxOcNrhPU+sNC31iKpIzEBkzBUdQbVK5E
 QjBe+7IF13sdff2CrTM8Eyn0fKWKQNK+J2aG4NIOWgfDO8RXhPi9j+5hVOPP9l6cdW04L
 613IXY+7D7B7ZdZUzfwaDIm2GKKzEoiEcjVzoZjtrKYrYl2QEM4yFwgfY/mhFEXJEDiOI
 9CpT5h+2q28AnoBKH195ATWE2hcgfUskbpK3/9zOTrTQKSweOl9kgHgzoCryDrGaAcxSp
 jBNh0K5tYZuWvuHSYi+4RofQGHxHFkrIXkruhzGE7F1cwn40+2fleoXoDFH1fX1lFDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Uh5wuOS6352WGgMWRz9ELcTj/GSQezm7sXMnCvVUUOA=;
 b=qqO/mZaJgkpjbcqaSwMeZK4/aDJrqoF9JRPHlSDRKtzV07kvCqk4mRdDEqtbNXAxnu3n
 1gJhKgG35NwiCBy5ZDwQm/NH2j1ji/nlQwWZWnOZz4NAKntEnxxK6H3akTrp4JLW10nWl
 MA2QRKoC/KAGbWWuBvv0T0FXHPGbiL3Y5unmllfTs+/nx4p2rzssvpl8snb+r0md4q6iP
 FsxGMD022pP9NsjmK5/kZSKo2Do2aHLXYnSuQgYgdIpQSJ2Qw9YKJrj/bhAlnX2TkgJK9
 t0H5xzm65egJ5FDl0Rg3EuBRPhEDn3AMCUt9oWBlqYBPeblimbvVQ7Jbn/h3C08IhFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCBD580A87
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:57:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3986095322; Tue, 13 Oct 2026 07:56:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 09:46:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae4d8b39b700e6275909ea2004e73faca0ed1dd6
X-Git-Newrev: 9e0d3863d1549b3965fea29aa0c3b3858ce60cf5
X-Patchwork-Hint: ignore
Message-Id: <20261013075637.3986095322@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cqueues: bump to version
 20261006
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e0d3863d1549b3965fea29aa0c3b3858ce60cf5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-cqueues/Config.in        | 2 +-
 package/lua-cqueues/lua-cqueues.hash | 2 +-
 package/lua-cqueues/lua-cqueues.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index a8c38950cf..22e1bcee59 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LUA_CQUEUES
 	  Continuation Queues: Embeddable asynchronous networking,
 	  threading, and notification framework for Lua on Unix.
 
-	  http://25thandclement.com/~william/projects/cqueues.html
+	  https://25thandclement.com/~william/projects/cqueues.html
 
 comment "lua-cqueues needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index 5803a60d50..b2033b7f29 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e112edd246da5cfca264314b70325a0b63665cb87a00e45ee3ae4f194000d52  lua-cqueues-20200726.tar.gz
+sha256  4a6d45982ff0b916a7c71fb1a9dacdfcd67f1f0fe828ac0fc669f234d2f8e7c4  lua-cqueues-20261006.tar.gz
 sha256  5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 6d842eca97..c909d2587f 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = 20200726
+LUA_CQUEUES_VERSION = 20261006
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
