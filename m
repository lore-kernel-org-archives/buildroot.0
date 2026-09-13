Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5D2C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49C9F405C9;
	Sun, 13 Sep 2026 15:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUFccXzIUGbE; Sun, 13 Sep 2026 15:30:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 88E2E405C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789313418;
	b=iqyIRSCdYLA3AuJ6NU2BWmeHJEQjFWGzRIj+WiCT41S6aZ1dMbleNX/eUpX51+zydhWV
	 YUIA2m62cM7oWO9quluXvFDkWzLKOzPSvP3U4mk/6/8De3GCEEAwwPZunTD0NRkhGA1m1
	 SyMkWQNAFyrX4hBmTT43Rr6ufqMs18bM4lNfJx70s8EGMG41XBeelpqS2JZ8GkTMneHZp
	 wtO7k1LNO1LPMRB3ltoExfOwwxxguc/4WYlUxPTAI8l9d+VS/3Se/ouwghplzJlq39k8v
	 K68TKUCsLPhrK1fwbzHjjXAWGQ+u9BTXEYEgNWt4cJ9J4bf8v0qptt/f19Rf1Y1dr4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789313418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=naV01uT8W22ROyulpSxfMB5r4wwb9NprTBzqGzjdjrI=;
	b=cqhhbSLgi6ilNqEFJFvuunBJC0seXI0iGxUsvk1g9conlcdEGYVD2nANgwAo0u3XQ0+m
	 eEBehbGiQbkyxz0H9RBcPo3LntMKxxqC0sA2Ck2sQHbKCmyZx0r4Ze3dtLOrsYMRKevZz
	 mcb9vflJj/iph1TkBWKAXgs+GtMcfPsZNUpNYHULVK/RnqBqR8u2+0w6AvaUEYZA8Vw9e
	 Hj5QU4YWDZD2o4TaAMswDWS0yUCE9I82bd6LQMTzSRcwUHOuL5hveT5BO1O62QvhdEPdB
	 XV97ouXG2SH+FuHMn2UZRrh5x1ngNQFD9ZXRkGwTSofQ5WrhOugZMGW2f7C5lPFoxsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789313418;
	bh=naV01uT8W22ROyulpSxfMB5r4wwb9NprTBzqGzjdjrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c8noiDV+zBUC/yd15VcBZWEFIkgciutoKz6FWtEZnNxz6gEN4vHZc6cqymh4nGID7
	 EeRAD9PTH6Dzj0SncmxJeQjqWen4ng8XHJkh+ueuzHeriFAibRqJO2mf0AuRae6azY
	 4+ARE2yThN7NUACJ1UU2bdz22u1FN1IXfYqAmKllHXLWBu2LgwswCLXaHbYEvm5JLj
	 Lssdoq0ZOzbz5k96oDGsJjdhP27Hv89G6ub5iWH1zYeSiWphbeL5aMhLHVrvBdve9R
	 kWV9f+xmlrpZl7Wm58nk+QbfWn8zg01bmcupSe1nEms32cFxNT4auUMYmCN2RtsUQq
	 Q2jULt4yxjaJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E2E405C3;
	Sun, 13 Sep 2026 15:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA6B024D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC1CB405C3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQXnl9b8Af1i for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:30:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BD09A405C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789313415;
 b=XwyzpiK19OIUQS0x3un+vff1FgIitLYKqvGS5gm4OcYNqDY9jlbblPKXWpb77QL8YsW3
 8sNnQeMmYp7w0Xu0Ujw3KBA2MfjY1lxYzv7ZJR4ApryHBkvkz4ke+rYj09/fPXjdw5WXS
 n7+VHwuvpYG4+Q+w0pvGwHfVAufn0HUOyrOC8o5mf1LrYf4LdRoGGCrn/U/MC69mUFlBZ
 zDw1vGxhlRrfESq913G/NPUr6WO/Xh6OZw+L139LbxY+Vttf8mu1T1/3jmfLC8fnJLW/3
 y/L0hi3xalqtBYs6a8wuyqPVx9d29U2HFe7hzgcNqbSbY4MgTGD6qKGccHjwnuDuraw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789313415;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PV3nky6h+3PfUJyzCqXR5erdPWZHPUiQEiSMOItW518=;
 b=Pez9BL6j0n9VtZ3LQ+w2lPN3Cm1Us+Ki2mRFlVFlG0tsoCH3Rxwi/uKHVYq7luvz+Dyp
 rlLqfsY9qr1StC6+qsSNLY3/iyQurukmfYDZ9rLH0HdVm9CGSZmUjLh8qGSnOfJWwcmuA
 qOxSkwRStRpxjMeMq8bRffkT07ldb7S2xlsFyNYTr7hSS1tP8SMG8ZkS4IXEvn8KCmNKk
 dBxVLFB1Bhh6Gad0Rtfzh03hrWQafMJywvd8UB+V6u3JgIUlZqhItpZP36pbE7prN44+0
 9ZmZZKHMjTOox3UUOXzjgkNOiRsFLIuN16JKEFRm9q9IUz1VHeEGpwJ/hFADHUPzXnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD09A405C2
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C34E995C16; Sun, 13 Sep 2026 15:29:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 17:23:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74def2cdd46b44ede4d768026480291f56ccea87
X-Git-Newrev: 16e3d628bdb55623169412f52116f42a28b78df0
X-Patchwork-Hint: ignore
Message-Id: <20260913152910.C34E995C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: propagate mariadb
 dependencies to BR2_PACKAGE_KODI_MYSQL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16e3d628bdb55623169412f52116f42a28b78df0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Even though kodi itself has architecture dependencies (expressed
through BR2_PACKAGE_KODI_ARCH_SUPPORTS, the option
BR2_PACKAGE_KODI_MYSQL selects BR2_PACKAGE_MARIADB, which has its own
architecture dependencies as well. Make sure to propagate those to
BR2_PACKAGE_KODI_MYSQL, which doesn't require adding a Config.in
comment as these are purely architecture dependencies.

We haven't replicate all dependencies of BR2_PACKAGE_MARIADB because
all the others are covered by the top-level BR2_PACKAGE_KODI, and
propagating them would require adding a Config.in comment for
BR2_PACKAGE_KODI_MYSQL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 08a7caae2c..0b13136d82 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -202,6 +202,7 @@ comment "nfs support needs a toolchain w/ threads support"
 
 config BR2_PACKAGE_KODI_MYSQL
 	bool "mysql"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
 	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
