Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A32CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A1681656;
	Sat,  3 Oct 2026 14:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E80As3NHuFsj; Sat,  3 Oct 2026 14:01:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D67EE81551
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036076;
	b=kkA2+BpT7kebZz24jdVwgVp12yTf224jK0DQ5ktzVAJg4+NysJ3rC09MSvJn9I4LYTK7
	 c6KN6xWm5l8uzhvwTcE+INMGWyAsEJLxwouGDLHseEprZjBpQccMbRaPkqXu3QiY5Nf4T
	 alqqYJr9viwHZCbG36kNjGoWTeG+8p8+Nt0Ci0BG96xcCRtoXBLu+8jYX5XxbzMNOPy8J
	 R7PCpjlHvop9qlXDorpFtng22dEFY0dlb3dIgFSV5DpcLh3FXtcza6ffMA9GBnCOXGVLo
	 6YbhPCs80nAVziR3AC4FTxnMGI6AQy4R48GMv6cwcOI1qt8Rl93Sk4GV8Aj8f/W7s9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036076;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rsfie2sX1ibPUhmbKuNpbh5RskSqu6CYQok5js07nRE=;
	b=SPxAbGa9YafCIF4YPfUlWs9SFKgHz74T5H1pS802Hcc/4SOc9xcPQoI6NWBWKdjLkCfh
	 duzcWPo7ATBKA8DfdQMh0436skBpv5R0ELZh7rjmS/W1ZVuwwpNkpaTemwsl8yXkURr28
	 3KkHYauiFwkhPuFYzrl6IsjRyGG9kb94GcEoCgAH4mhFdkUgqF5nwTDymNx7EzpdXX1mD
	 zu/2xfR/jC8FBZj8xHSj20mAPI/6K8nac07a7b/kQd2AJTfdsUj9G8eIMOUAI6P/Z4nDr
	 kV/DhZeSPavPMSw1Dw0595j9uJfmDMZxc9rXIKIliQ/hnCmSCY3KBw8xAAWSZ5jrsDQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036076;
	bh=Rsfie2sX1ibPUhmbKuNpbh5RskSqu6CYQok5js07nRE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UYXMJDj8GNGMYJOB+3Q3RfQJsznVEWCds3ePN9qEwOSi76PE3RVSKlWsK13JEi1cf
	 Q5DM6afDdlR7MvJbGerRra/aAU/b9cDo4SNYvHhnjF4IpOf8wBEoxmvZOCun1wSadI
	 +cvR6mXVXoJ6Jra1QfBJOjfYvofu0swDb8Jgt1Y/qX6Uf+XrmtZlh7qUmSddJpskUZ
	 tFnjCAideQIjJSFzi19w9WTr0ozD5049hyt1LxXx2/zkdET56SF1LSVVpelyFEBD8j
	 jiBUeDuxn7ceVGRJHVY1kem3ijG47xJEOF7PvdxlpDC1dt+JmWRPCYyre9EY+WxQUe
	 V6b8Y4mtv7nbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67EE81551;
	Sat,  3 Oct 2026 14:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3523D4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B7A140063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3v-FMJIoEgoA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:01:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6374B40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036071;
 b=gsbT9EgDA8XDiDkKn3prcc/wQxeRVj3oWE/B2vr9zbgjwXp1EhhdlVtUkCKitJ0JY774
 sLlwr1tD+h6kbdW+jvle1NWTbQU6XZO2eKZ9eKCnQv4c3algfODINl+PVH8ipmYHHFYUI
 ye36jlYWX+WhytuCiVjqbYf3dH79H/p42ldZwzrgJ7hewsYlKJ3eudeRGBy+DTifbIBsw
 qa6WHHhJb9IYiAmHBeURLPJZJzzDAnDuqyxeSIstIRoQ1PB0diyMvVWSVbTpuo+I7Ruhj
 Hr5RVvMnzmM+KukHjTSfXZw8k0p+lkmTJ6nXZpXoWw4cT8BjV0/Djpq/E7tC/gLLj9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036071;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qL4Ww1pL0qXgV0cynN77yeg/eiO34MyGPcyGJPij0ak=;
 b=nLRzzyAbhlXGuUSz4O8qbMKbIxy9wmQ/BihpnKjaC1XHMUaj5NBicT+XiDH1osh+U6Nm
 NafjL6R84VFkkZrB1kb7tfBkygSMHJpsftO2hHFWoqcj4dyNGn5lmzGFnFP98AuCTLcOM
 XjVPGozIBHGG6c7J0nGo1D29EHPrpdXt4uQG+29mqIauDMjlyUp0trTS1DaZzkiPVvNxA
 araY9p4vC4Z8Jja3NKSAgGJ85t1GjwLnwh0F99+Hv16MW3y3roJ9ckbt8AptpU6EBe9Nk
 3nVn+WxEyzKu1kUvCjxq83JyXasFbag5OqcKBOjIfb4/HMNkH67WIoEzo8A94OgI8IQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6374B40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E7998A39C; Sat,  3 Oct 2026 13:59:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:58:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dc679ed9f7008340f8027169faa1b224c2bc4a2
X-Git-Newrev: a205fa58d2261a33479cf64ad6bcc96b374ae948
X-Patchwork-Hint: ignore
Message-Id: <20261003135956.9E7998A39C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-57-g34106fee6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a205fa58d2261a33479cf64ad6bcc96b374ae948
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-97399:
https://gitlab.com/gnutools/glibc/-/commit/34106fee698c83eb0af71d4d0381e66b399be746

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 439fe1f140..51e29673c3 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
+sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a838ac1a81..435a97361b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -46,6 +46,9 @@ GLIBC_IGNORE_CVES += CVE-2026-8674
 # Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_IGNORE_CVES += CVE-2026-89092
 
+# Fixed by 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+GLIBC_IGNORE_CVES += CVE-2026-97399
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e4bfce1a3a..becbdfae7f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
