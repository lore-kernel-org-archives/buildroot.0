Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450A9C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032C7411B6;
	Thu, 24 Sep 2026 18:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHO5AN1vRkWT; Thu, 24 Sep 2026 18:59:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 667E841174
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276381;
	b=n+FKGqEKr7q8IrF4AK8Kd+tVhmhKuWeRuiYqeuKnpvwNBiAWQJwYfKgGybyHKF9XF41W
	 IhFapdAO0Pr49LrzlJobEvNYpzDwfE+OcVK7vJ0UL0s1Ci2MB1+T+UkiHhc9rGeL9vNQw
	 N/lPwanBUXgHjU86IsuV11BATYCjLNkMxFEstj3wje7Fdbho9F7tN2akGK53JjqBDvoho
	 J6CDMJD04LkdpC2I2BVKYu73j244f0hTUed75ACalqxd/dKy31+oS51RyQD23AndYq9bt
	 fKdKtM/JMt5/u+WAJNdwTEdLvPV5OYUcFGCwPQp0A60ma5UjKMzSYuun5Avn7DAgXpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vvAU3VPI/185NnrOAp0E6GR+7ewrMieX8WEYCnto1CU=;
	b=j0eoCq2/VjUyJDDW2+HqXO9RkBk64Q/5aLrBCy7fiAvP9iUvNx+o9udoeJC/VaQbrT0z
	 mtS0Cz5VkeqB1j8Xd7r/ULiSvxc52rUwgCDzkZi4ogTD8YvolaRdSl8KYEkvBWXgnjlv3
	 gF9MzJa9H8VMaCeVNa+KVuscrMomY1odTV+r6QmOa7sZ+endjfCWNbwjFLBylaLxepL9z
	 K5CtH/lqR/KtAx5ShyHFNO150AF/mp65t3dtR6UaZ3R2haq6WXGwZEvZjjkK+pfFyAgES
	 XE0K8vUSNUF0Q58Ztx9mLdLvytE4el1ML0+g/5bcjRsNUt4cxLpVxHtuZC90dFPJAQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276380;
	bh=vvAU3VPI/185NnrOAp0E6GR+7ewrMieX8WEYCnto1CU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YU3ZLOJ2B8prUrG0rDUYJ8Dq/mb4EtnsIqjZBHkS3xnbAVNCBHXPh3hyD5oL0Y+Zd
	 rXsKvZifcoM/UAq+NEAv5ukECNxgRTsMdMYQX4tWUJsL2BVCAiK5K3Xt/eLmsVvmfk
	 48/xr2tgJUuMGIW8NyfGBDqqZIhUW/6Uva+Wzofjoej/Dbxha7YHoD3BwEwldYSs0P
	 vwyXNWtOywBM9CKM8g5XDdvJDp9vO+xn4aM015L9MQhUUEaJTen9qh9nsRrLAeK1Lr
	 puY0ri3+NDC2wlOjvWu1df0IhIBaAMJSJv4sehrni4PowAHsivqEjXktXD+2tLMd31
	 LuJPLIpgJHOHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667E841174;
	Thu, 24 Sep 2026 18:59:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4AC328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88C7B81225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-i-qC5E8lQO for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 63B5881240
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=lHF62i7c6zaSmtRXTlngoSklHiiRRtm3QVZDEgVEqw4tAHzjnyw58d4OKV/BtcnO4yFv
 vVJk8JlfZ0d8YTXDnsq9WjHdrwf7/1z0ARWxe1A/xez5UmF9h2hgnopnEutBClLsY9Kr8
 CYT7Nqn6RCQmq9urJHCd7xrc0avCapH5WZvguugxF9evehBozXZjCEHB6UE27BQlUJqln
 /1WnZ5RTn0JWOd1HQEHzbWy4xwraF2XlAeW8bXUWVvN3jAF5QBSFJROoKVXp89otmXT0P
 lpFJacO9ZutScTRv7h63P/S00AAA4zmZ/EIJgcrsGkzZ2CCJWq1mf7ryXxmm54OnROg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hk1+bd72yKRsn3LNJCRrYJjyTyxxWdpqDoNCreFF90k=;
 b=EBBOgQ2uDzcxbZModKv+YwQlnAqkgxevFARxCcve2FwHwr91CeHzh1tmw7uAb2tHzD9A
 S1QHVGI0L/VvpSMby5Thop7koZsu495xALZ42qnm4AseKFMpe3uHYPkkVtwKkwgBEPk4w
 P4rXx7XebVrvCSND0e/ZTgld7tU/kULm4OXG76R+0zAaQZFFniQ1SywFSRDORhk4f3xMk
 sqjBvoD/l9UcSOStfPZ1I/rjRiAw4EQmP8VaJ3HG1pwuNVUQI3Tk9cgQ5XC8BpRUyGxM+
 vSdOvpEPyLfKB48ROWlh8BbMjF7U4PasBAalem2seO5nT+Ll/UBciN6FRG5QNMwd/bg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B5881240
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 082F898323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c18415c2d991a2fd57ca8c84dbb5693e59a4dd09
X-Git-Newrev: 900a64b2fc5724456b2c7b2b72b80ef746357177
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.082F898323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ghostscript: link
 with libatomic if needed
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
Content-Type: multipart/mixed; boundary="===============0653094468439518596=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0653094468439518596==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/900a64b2fc5724456b2c7b2b72b80ef746357177
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes:
https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/

The build error occurs since 2024 so a backport to LTS branches should
be considered:
https://autobuild.buildroot.net/results/1ab/1ab4767c1198838c3e3d126cdba790197d102053/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9c0385972dfd2e244214ba4549e2e8d011a26565)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0653094468439518596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0653094468439518596==--
