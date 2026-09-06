Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A6C79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B548980B98;
	Sun,  6 Sep 2026 19:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uadtEaxRioi8; Sun,  6 Sep 2026 19:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A03E80B6A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788721754;
	b=lNGgbW5jm/I+QsN+7IKuk1/HChtbiekIK2S7auytLKs7sVBXJE2ZLJzoV25xEtgi7Qi4
	 jaFQi33lRcI+jQBg4G2B4zai30qjKIrGgytoSzwH94fM1FzCN9hN1t8dawLwF5f2sG4Sf
	 dOs07ygHNyLN5k1s8yjQEzoSuSFgzRqR2NOkLJjTdg1LY5GYsETadtwBJqorLyJ5RX2zI
	 Fw9dcH9RPYQGNXKfPA6dWOEnneOZdG9v8VrUVaakoA7CVoQAdvPxNuJQ4I87xrnL5pMfd
	 OpWDW5afZZEuaXx3j17xLhL4JCgj7TJ8FtJKugGJ0nPAnegoxK8adfgaZP3HOE9qd7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788721754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qoga6oCMiWarGuSuThNdEY57R93Q0m7bFyx89FkyUwQ=;
	b=TcbLK3Fq0xaZEapjoTYySbidD2h97OaDONl9sd+VGmRLc69hs0WrATBX3aOFM7YA07O6
	 3jr1fvc6LG2Fi9xp8Gx53o95s39h2/QVE9B8N0E0vCtHiU6l9Afv+4XG9Dni+7jpy1S3b
	 LPESNiC49Q/rlJ18KWLOQ4R7Gm5xB6oBVVu1esUE+EtkRrr4+jUU/6m5jl50deEthK4on
	 a9icG1X0CpwEoXgqjTdoCi29SflkUvaZrWcoaflzbaGiJGIH+r0m6yTF05966XOkSBdfx
	 GNL42h4vgYzZg0f6ttO2eXVKWxDgjqfGPDdrbQvwjSVK+QBz8Oh1Qu0VROUwkv3voag==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788721754;
	bh=qoga6oCMiWarGuSuThNdEY57R93Q0m7bFyx89FkyUwQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k7gpAj6oIpFxmda1K2XUmofYBD1EEX2syne9FH52xzkx70MNamgMA3q8KygUgJdHS
	 VrygndxnLoRc78ACKg6wvRQT040NXodnXTUd6qiPhMUxpsPX/7j0ay6lMaY/8id0rT
	 5NUx5YECQB+OC8KHL5TQ3kTGr8GbSFazi7DI7FrAjSBDzhcIAsRwl+ELgQFg1VpX/s
	 awt2wHK5EH6TYKSYmuZzSdtD0RUFqCLbnSubLWXiNnrgbSYCInvd6Se8W7XoqQobiH
	 ICHQhCjXMeY9rU5dpbLjwvItvi+xoPCNXMBNx2n/5iPD/VT1rRMolueq4NgDdc5HDK
	 xx6s/yeyqY9qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A03E80B6A;
	Sun,  6 Sep 2026 19:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68BB79CF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAAD4008E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coqS7nQz7SoS for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5210E40079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788721752;
 b=fBsvzCD1/QnF/oe5oZJdBco+o/WbmRX6ohwgde6M1ChigmXHfolr2URfvXEWLf1S9P/V
 nJ5TvILBn+wV6XetJhgtrZHFjY58Z7sLke0x5tp8macmdXZI3Te3oJFs3hpJxVfS1xYyl
 ihMUUIa4M9TYz+g1wl/7/33Rs6cPQg6g3Hp635ZoWfownPx0YOUI0+omuofbEG/EujXEM
 qYx8bbANNg2T7TAFH+zqHlIKpwvwyHPWk3q8W0TF2OoOXKWVw841IGhueG1eWczAgTtTD
 DtUYxRz7h85y24lbfs0h9YD89/4eQlZH/j+qPhmfqCmR7aeKPoM27nYmKJxMnDdz8Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788721752;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aGKT8Kpa/bPSYxBsUOT20wmyBx4HvGWYFVacYffcbmc=;
 b=XJFdV609Fn5gYe5FdOUxl7PuitJjWSOC0IAb5UUUvIjaozBkUldY2kxFzGCF8tzjmdWS
 sxlbA7jg9URro2KwNYN+Mgn0yIgd1nXN9X2jE3+ANJe4Ns6+pTmJvcyMiP/D1hn/qUsjF
 2u6kAN/hw9d9Kz2aqt9erentU83QxlR4J9ELgS828K9L6sUEY9P2gb5kFemM0eQXdOxyY
 Bz2cxEsgGpW5ovLh2VKPaw+GUervlbDDgy5dhTN4eI79nkTzHZxF/Lpp8pCpn8h7P92Un
 ene/dFdlkqUeh0LzkTEu2tNc2ffwznZ8bTfcBOlvU4eMQiC6CghB/8MrHb524GIpA2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5210E40079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:09:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93E0B95450; Sun,  6 Sep 2026 19:08:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 20:25:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9e8462570c5b4698254195083d05dbbb9807692
X-Git-Newrev: f77c8cf14e51b9c2cbe472fa8a9a004315fc0a17
X-Patchwork-Hint: ignore
Message-Id: <20260906190810.93E0B95450@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f77c8cf14e51b9c2cbe472fa8a9a004315fc0a17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_14

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 46ec78bf06..10256c1741 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.6
-sha256  a7de667ca08cf67c3c8af9f213f6aa701a1188a2b3163fb74483858ce5e79fbb  ccache-4.13.6.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.14
+sha256  b093ac5d38204cb4d9f29b0bbd570675aa5a592a78e6675b2c506dbe045234e7  ccache-4.14.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index a7302d6361..0d88545bf8 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.6
+CCACHE_VERSION = 4.14
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
