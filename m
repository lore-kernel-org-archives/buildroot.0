Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FA0CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB27760F16;
	Fri, 16 Oct 2026 13:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1lIBFV701qJ; Fri, 16 Oct 2026 13:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F049A6122A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156350;
	b=PIxw6n0eEGnqGeNwsLsWBc4jj+taLM0aSSyiPpj2ol0ytociEs5oj/jxZYfk0ktzPdLt
	 iMeGNfSHct07tcqJMxHhzmggNxCuOheLJt8fCxudvZN0BlIUdQ0A2bWmmxVnpd6oAI9lr
	 m25H9OcxzT8HD+BS7mYmFFVKI7Br6MQ02yqYuZPaduqXEpGCcy8Mb83tXowrnd9FM8ZFK
	 jnlNA5H1BY0ZHn7UjwvZwnbWJdqldz8acx0HXVQhJzIqyKlDeywO6A+gysiHwaGak1ZEq
	 UEmDVP4+Ez0VIkm+FQkSH348Xj6LDVjqAhFRP+oHgDwfrrCb6ZvWKfE2rvKyLyWbi/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sgGNLeICWbHkaN5Ica6zcFRMy9MKfeu1eSJ1ZHTQIyk=;
	b=RxYDrSZdCbS1ovsXl7kaO3qPEqsivuRTHgQyXeIPXQ+Xq44jxO7roo3iCogW2J7xWNSJ
	 9pyGYdcwfw1Q7B22rAL4A5jhpVzHWBDs2ejAFu4wiReBy7eBEHzAF3WnpFhE0mnoNYwrf
	 TvDVIXsFDKEYKIwTa6FYDvQFDKhFfe8tU5ITVbiFllL5qrjXjYBJJc42at7fxMAQFv31d
	 ENFCliihutgdTzlwebSJcBy88tghtD5MSuYiYgk2LSNLA8ILXN/jdDDuMmCqllVZzL1cU
	 IJEUpujh6rirxqoIK+vafCCVjFLvpR9bkGfXJ8Bm9uCfB3H2UrlXLjga+bbk3MqmhsA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156350;
	bh=sgGNLeICWbHkaN5Ica6zcFRMy9MKfeu1eSJ1ZHTQIyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I9eeWAbZLk7ip4fIsg5Ea8QSMU0RWlSZ2Yfg8W91fOwfzdVp5sArTp+rElxmjBl9l
	 u3pLKm7s2X8so4vAqgPPS3r8TJhigi7H5K6i7H7afjavWzcnDjJPaKJHSmHl5yPIpR
	 +drsBp6DUZV0VRGOvDWMD0I14GKE8mvQ762XSvZGYv7mplsWuxYDyiQeL4axCYqUuz
	 KigfqhLrkTUQacydIKcSeXz0NiWLQwNFXHzU3BT7Ksvl18QDVNSH3LsjIy3UMTDYKB
	 1zQkXVayEdkj2c0iOcUV0gvfaI/qLMKOxZ7zotD2rAWf+udkFU6URDL8C2p1Fv8agf
	 nA/lhHpf7zmag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F049A6122A;
	Fri, 16 Oct 2026 13:12:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD1B105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 558AD60B36
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmihtC7fvl5A for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7E6D360F21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=NxdRhpIylkx4utB5BS4kGj9dyvrHDoaLAKXcO/8owMuCpQ9SbdVxwyFeZGOrX5/MGDN5
 kassK9auu+aYziJmtJdTBq+YOO1MkZ9tmQUNbfkOktiLaZ0jjdLHhMzt4rKjl4xJMOxht
 FLhy60vKQSuummiDsCpGEeJKK+BeZFa48g9NnguzUn0MY5105HUQdF8R0+BxTr1qhQ3KZ
 9csZ19sf2wN9P/zIbI6BmdH8f7VDfAcyzajqoUW6qCiMRqwsrh1qtiBRHwW/ux0m/sugL
 lAyY+1P709d/JPTCQ+MMELRGBdFAgncbYIIWbung0EMiP1JtheDgKnxcM29Au0sqm6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2EWUoxX0TPGU1Q06cKw4C1RcmEaelMvAOIK3rkXg360=;
 b=s3vq+pAwCc4ZtERiHXBA+CW0Bsv80j8h8VYXLu3G6j0ET48OR5FnoA4gJeIpg9I/h5JW
 K9aeJVnF2jGhkASGp8qx3jszJnz/3/5gm9JGyGRn4YNpwjtCo4RQt5SWq8NurvRXPRSeQ
 ibJQdqohCWz9zFrYOFgRixozQNAMB2qdoGm0WqsG4NZJQvGiZIN+PgyqEprNeCgEHFCgi
 Sbvwd0o1aBXrPNGvqCebJ9IVYv1zIWS8YR/QSR7rjzIke2KRPWS9FjjGeZuGCbLz1qNY8
 4CYZK2FYQJ6HgXbMl/+MnsbojsmioymZAU0bjaCRqr/GK1JYGdrl141PgHsNeM7w8Uw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E6D360F21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E1D3960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:10 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c3ccc14629a57b7e078fdecfd8f3ce22d64141f1
X-Git-Newrev: 9c0c1eaca1b8ddcef32b729f6837501732898e8e
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.6E1D3960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/shadowsocks-libev: update the site URL to shadowsocks-c
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
Content-Type: multipart/mixed; boundary="===============0679765161111326108=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0679765161111326108==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c0c1eaca1b8ddcef32b729f6837501732898e8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The upstream repository was renamed from shadowsocks-libev to
shadowsocks-c. GitHub still redirects the old URL, but the README names
shadowsocks/shadowsocks-c as the canonical repository.

The v3.3.6 tag points to the same commit in the renamed repository, so
the tarball and its hash are unchanged.

See upstream commits:
https://github.com/shadowsocks/shadowsocks-c/commit/bdc77408cbe86ea90a6415222878ec1cfb2bb0c5
https://github.com/shadowsocks/shadowsocks-c/commit/bff687bd3479aa3b630bba13847f44ef480c9da1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
[Julien: add references to upstream commits renaming the project]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0522d9af895473a34c0a467e72e70d6d6e2a853e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/shadowsocks-libev/Config.in            | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index b5be19f939..939bf5d2bc 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
 	  embedded devices and low-end boxes.
 
-	  https://github.com/shadowsocks/shadowsocks-libev
+	  https://github.com/shadowsocks/shadowsocks-c
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 	bool "connmarktos support in ss-server"
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 778daf37b9..75c0d58be1 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SHADOWSOCKS_LIBEV_VERSION = v3.3.6
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev.git
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-c.git
 SHADOWSOCKS_LIBEV_SITE_METHOD = git
 SHADOWSOCKS_LIBEV_GIT_SUBMODULES = YES
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)

--===============0679765161111326108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0679765161111326108==--
