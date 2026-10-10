Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE94CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91F640877;
	Sat, 10 Oct 2026 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhOGUOOmfRwa; Sat, 10 Oct 2026 21:05:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0DD840878
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791666335;
	b=BrAswn4bthR97peX1ivEqjjJLN7dtH2oQevRXlKwnqMm/RC3lr1mJ5V4P3qIj4W8QH3K
	 KmQkR5JKuBKYqNc1BxyEehRLd51m13vRLnhacdC9mPXnXo8p7p/hq8F9qTQo78z0EYBJ/
	 He6mA5EaWTs2aVkM9eyfbWc7ZW+lP2r6ZMLrFpGmW0TvUHk5gxHCCx57/TVirO6IH9DSt
	 dABfMKY3hBIBR4JkjiYQmxbX7oWFR1zoIcrB0vTPosKKjpIF8eMZ/tFZgzlyulI1lmnkp
	 tKWjA3MSQUkMLvD4akCS02ZRwIuHSumD+bC81IiCghTZZ/6lcm8ud3wTF1sMQ7uNA3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791666335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nK+G5f0EJxvpA0mczoQkGvfTaPenBxEEcBn25aO6Ua0=;
	b=ghIvqNCqd6SZqK5CYi8dQStfVtFRYfJISs05P9zG7v2MjCrXb3PG1y6R7d4hBLGkaHRc
	 Bb/Pkragxu+uxOYP6xtJUfkr55DBhMqMu45COAgbZL1vWdh3KYiy8/qH85j+1KQuWK6Bb
	 RW44ZjXZW008myrmmgO8MP1LZzikAit6WCs+uP/H4YW8G+K5g9FmOsULSNhoHTqBJKpPB
	 ZOZm5CvoPOLoP2I6QserRAM2Tk4TovQf1upU18WU1MR4eG9Zl7lUmWmyuFfe8rxkqdy6B
	 Yy6+1bzYxwVbwuTwydA2Q7d73neHKS26mZ6laG+vN1liJe5SJFslPulYhVnLmLENhSw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791666335;
	bh=nK+G5f0EJxvpA0mczoQkGvfTaPenBxEEcBn25aO6Ua0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WEGgtrUlO0lZYE1YY4eeNFutv641zdGDd4c6LAmY5ShWFcn+DoKnfHl7o4D/ewSap
	 5fMZdlQBskcZ00Hm8JJXL5caODu/c0976jhX+dvfYvum80NYPzB2GgIGo6kuRIjjQc
	 IHI91ZJbADHqFLga+Xhq6lRozOyJM12dhyMelAAhP+QB0TuR5+rt3OnDviWcXHoSFK
	 xERe/ttPVwvTYB3/pN3OkjBhjyOZ1f8a9q1Y/1IsK8/nY+Yz5mr+42l3qzDO24mG5v
	 C9BVDeEVZSS9JxUNuV3+PiDp8gcO4Q21nU0FYPANlx+BbwilHPWzy7jdiGZDsuSjx3
	 /TXdB6DU4YZHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DD840878;
	Sat, 10 Oct 2026 21:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD8719D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9314A810E1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mr56iYLvQtWx for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 21:05:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3501810BB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791666330;
 b=e/BFJZmtGTMVoUn32rtvGpCR3x9uvvZSklJmTDof/0L+sp8qd/JiY1NFppoFVZbAKTPS
 RfGbF8kfS5Cdsy0bLmVEaiEBJAOy59F7Ud5Gwf7oqh2L1P0cshPcfV6NOxBVurgsoFDvT
 6DrPcMhhD3vgvGM5XHTAzFzdGdjuFWvVjH0DUVxqGFyPDS26DkBhtekdMclxUX0Pi2OUy
 2/aqrslpPPZAAKNB8RIfvPxyEm4g3IP55QLrhWAd5TFGG+Mi9UV096vehaXNnSf8tg292
 kteHxUOH/umANknfIMvlyNcK7jTwMer5UwVkcnTbXCd0GFv00G7gtqr5RH2DI3MvwEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791666330;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fK9dxHPEO/awT+NV/Ucx2ShWxdrMu0eYMNNiUu77hq4=;
 b=RWKALcMiAx7cIfdAlc3lO5IdPEk6tCQCVe0QtN6ZQwmTgsQCzQxM+GeXQUVz+sGmJz+Z
 CTXLLbH7tBiV3DLTsSEadJytWlMjXouULxiMsLn1SIvISUmZ4ty5RJx/RDtKMN8aeioCg
 JRz8n97e7xST27+gH+4XpffY9sWh5KbAmXBKTTP7QBZM5qbLc2KhIgIjSJSQl4FQPhKLU
 NYXzDImW0hIwxvxavqwJbt/yf5q0NDakAjlCq0HRJivrt23di13lSGqhuZxD0wGuoKGQU
 O+0g4SicuqUyKebBEXBJQjZmbbwkfQx/3HtEESBVmrZJKq8GQTB3trOlQZc4srQWRJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3501810BB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 533069356F; Sat, 10 Oct 2026 21:04:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 23:05:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c198828a636c07273cc46e8a82413ef464507c3
X-Git-Newrev: 2e6f9749b17c220afd6f1dcbdebb037106a193ad
X-Patchwork-Hint: ignore
Message-Id: <20261010210412.533069356F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: allow using slang as
 an alternative to ncurses
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e6f9749b17c220afd6f1dcbdebb037106a193ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Both cfdisk and irqtop can either use ncurses or slang. We currently
only support using ncurses, this commit extends that to be able to use
slang as an alternative.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in     | 2 +-
 package/util-linux/util-linux.mk | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e6ee4c3ced..5d60d00e3a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -177,7 +177,7 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
 config BR2_PACKAGE_UTIL_LINUX_IRQTOP
 	bool "irqtop"
 	depends on BR2_USE_MMU # libsmartcols
-	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  Show information on IRQs
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 2824d27cc5..9ddf48a343 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -127,6 +127,14 @@ endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
+# if ncurses is not available, try to fallback onto slang
+ifeq ($(BR2_PACKAGE_SLANG):$(BR2_PACKAGE_NCURSES),y:)
+UTIL_LINUX_DEPENDENCIES += slang
+UTIL_LINUX_CONF_OPTS += --with-slang
+else
+UTIL_LINUX_CONF_OPTS += --without-slang
+endif
+
 # workaround for static_assert on uclibc-ng < 1.0.42
 UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
