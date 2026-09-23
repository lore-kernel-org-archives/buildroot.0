Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343CDC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED77440F8D;
	Thu, 24 Sep 2026 18:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id D4GFspgPJ8mP; Thu, 24 Sep 2026 18:58:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D1CA640F90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276310;
	b=IsDjPO4lWfOuQ4ins5AAdDoAIB0LsM/pAybSVcaDQIRx5oS+pVMmScUWbNvgLIlNw7hC
	 8fCinpuqaXBydhUeH2tvGCcqTghWv5HZeIqL4ZUeuorukaqTAFTFJlzQTAi2ehtqATl06
	 6fLucf1Z/9xGeQRLr2psQpmIUR5vdtpczBZ8Tdn357kVqgQHbJOaOAkrCqISZfXqWQJ4T
	 /M25KfRE8yIxaw8Zil3Ol7E3L3LzbSatl1qCczUjaJf+JD9Glc45vnkBOShH3YdmbpjxF
	 r8wG4CP/amxHxDSUMT9FXKo6rCX/ZyuxSRocGhs++G9aJk56TmOuTqv7x8I8ZFqnzrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DsEMxG5Ih4ZEwcSgDJAggbnOQ56ZK8gu+Gk0xiz3iD0=;
	b=h1hbOh5enyadFzyhnZjZkA5v1YT7B2FF17J9CX4Qp2RwLEYOsnd6um6Hlctc7DuaZsIS
	 HQ1zfGL3J/lbqlV/Z83uVLgTJzhIkYrRDqp+OSnXyXSj6bw/vE5j/sWxab6KKGgmw9X+p
	 NZ88ME9q62Zlk2LadRXKVDvz5Tk+rbr+rav4LttzM4wcU/xzNZ0fY8qWIAUYAFtvPPRG7
	 X5Mj1oGbwyjTC8MCcsq/PP3n/awnXHSu449Dw621gsJD2UogBXprWS/K+/9m4NdhCzUsr
	 bc1t6hNGZoVmjbCXnZX6cqAXIpiA8qucdz9vTRnv1FdiMAk20F4ktvXD9pIHPeCQ15Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276309;
	bh=DsEMxG5Ih4ZEwcSgDJAggbnOQ56ZK8gu+Gk0xiz3iD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UqMbyZSoBBPm8l8Jd671EyNlbAfUPkKHrflrDDrCu0guRr46YyiuxlOoW151BZN3Q
	 IyAkois3k2qVEwHgdAb09eIUTjh3IrWaDmIz21E9Szl5O4kps0y4g3Ln9UrBOlfTbG
	 //He69BCbvTz++FCkA3jeY4SuGWyOW6pRfTqtDOqgfkpIF3GclvCBqmpES81E7jszn
	 qupM+c1akdhSrYFl+dY/uC2jn4Mbd3Q1fxhE5JXYKIMpjSCUw1i6SKuN6H+oANPS9q
	 zMXa2yby/jIHzQh7S7uHGEcDwK+3tEyUaP/wrMs4OO6NlJCaGHh9E2NUkiDF4z1Elc
	 pX2wytze/+Cig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CA640F90;
	Thu, 24 Sep 2026 18:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F22332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F11381230
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfpt118YK8fi for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 71C3A81226
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=ddb4TBhHf+i3rTM1ixT52q3d1AKLlZS0UliTso5TNv/ADcDVOkhRdGx+s3YC1AYZjWUZ
 yHrxR3BipRkX7AgDskhMOsWIYXUf+SoXGE/qFVsDGFjh6bU7M6Fic0Lo3hMetriwxONQ9
 Qj+jBmTIT2AG3gxmgsTROzyoMn2XwTknvEQkaKmFHT+YCX8tRVrn49bEw2SHWNRKhxbVB
 A13XEcyV1JUrtVGqxZDmWUwOpXBABJL4/kNIuy7EFfa0uHqYCrpHuiHPVeujgQXqZfrVL
 S9LzXMzypPXegtVSh/tPptMSkXCPKIb53lyxkHaV5x65ep2dJQzUy0VbxeyruHZ3Kvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uLqIoK1uM+pBkkJLNdON0aV2LyDWkMaJviJSDRSFzO0=;
 b=ZJ9LF95fkQy/R2PDGGRvrHL3o4xAXV7aZ2zlBNPzNQzYqvsTr3LRRJP764Vh9W8RBo+x
 U/qLpgLOIRmaQYUOSdmHll6d88S5Zw6hKAsWcXA7VFoPpGj6gctwYpUyDtW4gIwc3y4Ok
 gOPiehfHAKzmK939/3rIKQNSkvl1pIQED/GdmuJfbqgAU49lXUhRL0d5Bj6GzM+FVhZzy
 pG4nX5/xYMy2qWI0ZJDLzvIq4adFfIx3CQ/Ek6QXYMUh8Gm6GaTf0p84rfOXe9gv31GDx
 pGly/WKOw10jQ5o6BBPfRRGsR4eqx6iPm4Gt+X1K9GlOX/V3QxCCw6Fk06o3paj3cJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71C3A81226
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 155B898330; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:01 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 69c37d796e1dea153297fb1589ee95778a563c0c
X-Git-Newrev: d5943e5047a29f4d41324ca9d056bdb26b5d62d6
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.155B898330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/zabbix: update
 SITE
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
Content-Type: multipart/mixed; boundary="===============3431684289794191369=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3431684289794191369==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5943e5047a29f4d41324ca9d056bdb26b5d62d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Zabbix version 7.2 is no longer maintained. The version 7.0 is the LTS
and the stable moved to 7.4 [1]. The source location moved from "stable"
to "oldstable" directory.

This error is present in the autobuilder since the 22nd of May.

[1] https://endoflife.date/zabbix

Fixes: https://autobuild.buildroot.org/results/636/636c4514c67f1b0fcd20976d064f17b0e0a314fe//
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7878630479ae26bcbac37c73f64e043f773ed171)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/zabbix/zabbix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index caa69fda38..50bdfed609 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -6,7 +6,7 @@
 
 ZABBIX_VERSION_MAJOR = 7.2
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
-ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
 ZABBIX_LICENSE_FILES = COPYING

--===============3431684289794191369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3431684289794191369==--
