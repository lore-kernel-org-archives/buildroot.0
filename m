Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD5EC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 08:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1851280E31;
	Sun, 27 Sep 2026 08:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU2a08EINbHT; Sun, 27 Sep 2026 08:57:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1D1C380DDB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790499466;
	b=QIbFP9J6cua9V72wOenoENoLp1A1iMccyh4Lc+AsteBBVAuNZYuqOGZS8/CU/LCTqQv6
	 GxF78HKl6wxcJO1keicML2PUOx+hvrGjSkTSP9FDRHMcjoimDgpJ1YvMiU97CJdsQ2f5U
	 58mE+nlFN9Hllab2Ib+wYyL8TIyWUVpnGQl/AD1lT/7NCCMkikW7MBoXpHKzFj0epxmeR
	 CeoG3ccJ2mnLDzaZq+eLcBbndsUPwfR1aJmZ6Gx6EOqHjnaWA2jtqAuSx2SCqet7gM3/D
	 fCUC4zHxuxIzRa5DL+a9ycCMjPnvfhSq1QJWfXfXCFO83C0Dj4e/CJgckBm9FwVJx/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790499466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dMMSTZ68gQxg+rBBoUzI2zcTFIm+emEY6uhWY7PAn5U=;
	b=nJG4GLX9Buzc8ZnxaZMD95GjX3v1lc64wzrD+yAJnaKGeac7Br7Zic/3RTiqmmv/Ke7m
	 +Bv39dndAymOJQ+HKjdbWuZ3qepV7H65EgbxuxUKiNZcV6OAipJBDskgyJk5nKUteMa9V
	 sH1iCrnvbDsXshwbpctltEYnbbMrOViOm4vYWDYEf/HsCFIJFp2FtWhec8SErD3nbVuI4
	 gYycXjgxu0hViG4bsBp8xeIaalxrX43YIWHz6HVFSlsYrpC25XSIujx2B11P3GL3fWvWK
	 2YpKcU3+lx+85Mq/mOOWzBer72EeuodhU/80swgNbGuByjoBdAo3JEhNSRI/aLKT/Bw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790499466;
	bh=dMMSTZ68gQxg+rBBoUzI2zcTFIm+emEY6uhWY7PAn5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rn5LKtkg9BFbibj3D3OwAyHGGlFh8p7lSWHiJQxNgZXGEEYlBvExFhCaB87Ucha8/
	 z/HG9ZlmYDkgtCLwpr//Ta/FDH7rFR1ks/mT9guoX6yIUMWxd5fbI0q8XzVuq0Wyf5
	 ZtRn/0Ur46eu8ZEX/2WnUFVMMa73Wv/NKmauX7a7vcitcfd9iTGKwFkiu/YL9tRC/G
	 z5gJdEDs7FXQ3zCI4vLP/erzt5sZK5miuwZgpwVrmdD6QWHlCvtYnYlq+Kiq7/uTzx
	 rHdExO7i2akT8qnLbjJArm6GbEHmvJFSmQ0XSHfK/WMIzu0ZVWoUJ9QGly74yJ3/8L
	 elG3MWVmmqjeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1C380DDB;
	Sun, 27 Sep 2026 08:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB85B422
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1C0C400C7
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5htvGxmiINQl for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 08:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E95D84008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790499464;
 b=da9sexNoZUmRM4DwM/mwIsmRqO0Cy1NWoiRdQLfpawlFtJjfpTAf8eVoicHvZxVaPPka
 bzjw2hAV51qIsHSWXj40LOaiO0U3RhYf6fxIR54oJ55EJD8KOYYVojrmebG5wTop0J3uS
 yF4/r7Z5AmtNdzCt0cjtNqyTQx+cMDylsJo/Nd0pA1s1H2LUVlEzw6MX/xqv7kjsFs9P/
 oIM6/+equfo/wxgTFCbBX6eGN4BaSzKgcNOFi07AmfKHcwu5NcqBIk7UNCfOoAiD3PHlL
 zRYti7CfbYS8zE3bZFpDalLaPDGt+dCIljCicXHLxwu9Y2bClmCIaE6fAxyYr9qhXEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790499464;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IgI4PNxx/mtQcSpzvPz/Gi5qf6POkPbXn+q5HyLegIY=;
 b=eZQAMMtvRspwaPUgczySBidV+pjPvxDoarNyhwcxdv+yMTnM0zBveMb4s+VuEULiU6/k
 uwYvIBmaDBi1QzWaSvZfTyDxg5w/ZZz9QVmymRCVAZvJovsKj84z8z6q+OIxENcVGwKhU
 I95+MT8TsvbZbdk7AQCUno7hwxy8XNY5AZaKZP/P5479jznZIRgbJKFC2SKD83y6fvf4E
 g3lFXAWahq6YSnTqU7ojJMytIJJs8+IBwapZB7OPNmCDHQi0raTEnssBlREr6kCEwE3Io
 Zehl/yICx0ZPbgHult4f1weZ/ps79K4SnP52bks62mlMhYTYgVEkC1fYc8nWP17/MkA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E95D84008C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 08:57:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20BFF91950; Sun, 27 Sep 2026 08:56:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 10:42:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1caeb632a6e99e8f4c98e71c4df01eeb8994f055
X-Git-Newrev: b19b1caaef34d2c2aa0e4ad35cbc2584531d0b0e
X-Patchwork-Hint: ignore
Message-Id: <20260927085632.20BFF91950@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: bump version to 10.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b19b1caaef34d2c2aa0e4ad35cbc2584531d0b0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 10.5.2 (for details see [1], [2])

https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.5.2
https://github.com/NetworkConfiguration/dhcpcd/releases

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index a5d80b135d..508189a8d8 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.4
-sha256  6721e606609226dbf4d864a78802a9e96beec0ee034a1bd84138b3e037bba7d9  dhcpcd-10.2.4.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.5.2
+sha256  3e476657fdb6eeb38b277da3a48d0ac0113ecce5858ebdcddff2b629faed52b4  dhcpcd-10.5.2.tar.xz
 # Locally calculated
 sha256  3aeab006b01c1573b42d4440d7edad0adfe61ad05848ca82e02e745424a2b4fa  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5504914003..4400c684a6 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.2.4
+DHCPCD_VERSION = 10.5.2
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
