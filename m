Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8870DC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5283B81327;
	Thu, 24 Sep 2026 18:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7Zv-dKaSsVN; Thu, 24 Sep 2026 18:58:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 540AC80ADE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276303;
	b=TzGYxkFs455L9ZUH5UeZi3cmHSojpWTOdAarWs2AmL6mbDU6F60CrFGGT78WKab8YD+x
	 wf6xoebR6tNyQZg9inm3vhqlp8+P4NoLMurkp9ly11A2jwsAzMLOvbHcEedM3aecaFu9G
	 eQYnEf2A0yx4Kfg1xB29B7A0sUhdqaf2nnatySrWKWeEfQ54r5EEcFSZGM06cRuRVP42q
	 uKGD2x1xNEjWDDHUdvs5N4CGOK/+fg3CP6WEvvswsWhm+3Iyh2OwzYwKaebJ+2W2ebzM/
	 OKwoZZ2FGrxrbSv+6QpTU1oYykvjlVWLI4FQ/+71wdlIJKMthFEMGeOn7hwFPWCszIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cw5ggIKqsVKAzg2eazkfLkd/1VxUpTEgtrMh3ekt680=;
	b=ofcP5hGiiV/nInSwl6JGip+F9xu6jUOZPvuMxTHTRciHcfjm+SaMoTrzndPfvPuvCs7v
	 rdTX3Wd02fT/D9KwtgTf8nJstMK6B2mp4WY2TKZuuXwvqSF1xB4S2njHpZRaHQXMcQ1qt
	 BMc0daf+qtULX5hpnVIEq9erACXxOYdh2DYWNmp/NtQ1a0lN5jn4SfhLBeFQ0vrXtZOLi
	 Q05yQ4yydZCY5CZLzUWjt5sl4er9ASn9/qSIByj82qXJWDVw00DulaKVw/K6FyndId4xX
	 bNdKASSSbLm8aeuvaEVoF2FKRRtzh5nQqi/OUbtZVolZIQM5Egkptgy4RN5v/wym1Ug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276303;
	bh=Cw5ggIKqsVKAzg2eazkfLkd/1VxUpTEgtrMh3ekt680=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mfgT4awFlKhrLth9UQOlbJdpAl/VnoVWR6BVJriC80tvIDoL0Ds5QzvfL2pagVec3
	 13g9RSybtLpNntU8ZvO8gJv8uaeK26WP5xB7Blh72lOeS8NjsHJ/uAtKk4m+aVwAr7
	 9s8P/oYWfpjKkNNGSbaZ8nS3GvXgko0ZScS6aWkF21qzuOe2NsGZYS83WHhiAUtnHF
	 2D9ue4pA5AgixBDVAq0O8J/+2LEQg0Lsn2sFeI3CYL+dGw1/M/O/IP6QFefmZ7MhzK
	 +DDxNV+vu0MgQnYkNGVvqanR8OOmezVaK7sNax2DC3DcmJNfS9LaSxzW8OMNeln7pl
	 v8QQlpa9EX4RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540AC80ADE;
	Thu, 24 Sep 2026 18:58:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01242332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E711981230
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J237Q-AXhLE8 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C26681218
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=ckUXS5pcQVOhOSanajDTr6cG9iM19uhTWX8ycDKzMkTQmEywXD0iuFp9+go6tXR162MI
 y7sdXG3pUYLIZP24FOHt2C35XdgNijNczkYdyidPET7oMJoFszfjQm1oXDT7QCmfYfqbb
 G6/oUiEbvU72oIvnjccYjyFCOY4JKhO6zVJMeJMHVMjTVi3F+yQsUE6ZUE+YHi4sdQh3d
 LXcH2RLDDr93eZ5YNnizcxTrc0ZgE4vAHTbW7qQXm+2+tf3jgSvPQiRgP/w0Qh2OFhAcK
 TRpeNDcPk9zZOLkz9MvTM6V+4e12cmAnv4BBd3fJOW2dMfKONoIjfXIdXKrxZi98uJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EYDHyKrlWZ1JK4fTNclMZJ7rd/2zXT96nxiOv5gldns=;
 b=n1N6FCKOk6XXQwvQbiYxKcPm/uK3K54sH1/Eac5wiJ3Dad6ojwKX8UWfb8hx78tl6bPf
 cneMyTCrz3wD0eqL5ol301pjB+zRYqikmdaWWbs826GYjqitshmI3c8bH1ETben+rFvz0
 X0TfYhvkFTkUJnaL7zCRUEk5vO+P4uzVXqM8d+HBCpt/6iP7HYcJoxdVh7QWOP1vi+Yi0
 SCk+/KZQm6/3dyxFH3X9sFGKMk431nslWlihx3BU/hnaXujoptQ1PwIhIaeaA7zhfQ9tz
 xjLTNuR1tJIRSU81p4mpiATGKBQX+nioCXMamBbU9d7QelpzoyWz0F56rYycbNWCECA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C26681218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3B48976B0; Thu, 24 Sep 2026 18:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 16:57:51 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0e9a175cd201f44a3608e80eeb4c6a7e8154d6f8
X-Git-Newrev: 0597fd1ac1ed817e6da77dba11a55e2075c9f925
X-Patchwork-Hint: ignore
Message-Id: <20260924185539.B3B48976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] {linux,
 linux-headers}: bump 6.{12, 18} series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0597fd1ac1ed817e6da77dba11a55e2075c9f925
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update the latest kernel releases:
    - 6.12.110 -> 6.12.111
    - 6.18.52 -> 6.18.53

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 2 +-
 package/linux-headers/{6.12.110 => 6.12.111} | 0
 package/linux-headers/{6.18.52 => 6.18.53}   | 0
 package/linux-headers/Config.in.host         | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index dea492b9b5..fc203c9097 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
 sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
 sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 116991105f..3e32af81c2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
+sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.110 b/package/linux-headers/6.12.111
similarity index 100%
rename from package/linux-headers/6.12.110
rename to package/linux-headers/6.12.111
diff --git a/package/linux-headers/6.18.52 b/package/linux-headers/6.18.53
similarity index 100%
rename from package/linux-headers/6.18.52
rename to package/linux-headers/6.18.53
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a20933bc86..8b77aa398c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,8 +476,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.52"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
