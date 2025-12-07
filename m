Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E2DD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E7BA60B5B;
	Sun,  7 Dec 2025 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDycytV5cyc2; Sun,  7 Dec 2025 14:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DDBC608AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118593;
	bh=s8T1/yJ3M1UqRrewTbbAnHLjKMvvS8zWuB9ZENKayb4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QBCwpkZms/Ai5Rv9De2QBlJKTCFZLrZOb/615Fz7nJNyiRqbiab/pAkKy7LAbuDts
	 6gsU8z0eoZJpYx2ieIO3J6xRVpiqxv5IfD8rdOO611jafI1o1JlTuGM/DRfu8Yqjff
	 yzio6CgMQ7wxARraipgC08rFqp5hxo3e++sGE1BBPHcBttvzdJJpgImjuSqJKkQ5aP
	 ObLgspSqqW/yA9nUqxgV5N+AeWUc7TU+kM8t5+lIEM7/s9KCZDgZeuKhBGHkgDH/RF
	 arsKjVaC0iUDYsdHcK8k5s5ui4SO8C12McE4aHMD6QJ8qQWj/yaYeNDDnEOeLEoOcU
	 y1D9fD+yCBnNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DDBC608AE;
	Sun,  7 Dec 2025 14:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAC942CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACCCC404BD
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T8DhKnsr29A for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 896DC404B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896DC404B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 896DC404B5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8653FA4C0935;
 Sun,  7 Dec 2025 15:42:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyF-00000000416-30dD;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:12 +0100
Message-ID: <20251207144243.3696572-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118564;
 bh=1XEOstPaQTJgOxIieW+Tlvo9qCbOeANHntRe5V8nqko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TVms/mWn6Y5vpEyUcHbZ0oJE/lXhvdq969sDfUcRf/biXP06IqWGa0f+W8eOINvh1
 7DxFE1RdOamGzmoXi/Z4DVrdhUt2YTUkPhtf4kRQKBgwqOdMlAxUPBZWHBclZfKbSp
 pWZu2Jeu/6wNIKcCLgop2FLG9Nw5wpKPfFry+n6aNdnbcMGy2RTmQxHsrwzz2dfoNr
 PFHy0TqleRul1+EdC7GHv3l8GPmD0thJX5RuqkTPnpvrKNvp4yBehNMc7QIF+po4vu
 0xg7tX4ixtXOoPmtoesWF2Ek35Rg1vliD1sADBiSvT9jX8O5tmMIx+tiQV9quJPRr8
 pyuOM34okf9nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TVms/mWn
Subject: [Buildroot] [PATCH/next 03/33] package/zziplib: bump version to
 0.13.80
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/gdraheim/zziplib/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/zziplib/zziplib.hash | 2 +-
 package/zziplib/zziplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index 3bff51f07f..1918f00029 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  319093aa98d39453f3ea2486a86d8a2fab2d5632f6633a2665318723a908eecf  zziplib-0.13.74.tar.gz
+sha256  21f40d111c0f7a398cfee3b0a30b20c5d92124b08ea4290055fbfe7bdd53a22c  zziplib-0.13.80.tar.gz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
 sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
 sha256  9418aca218090f0bebfa91298c8145c7342de095eced3d72ea241c178df59368  docs/copying.htm.md
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index ba902b84fd..3624d5840c 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = 0.13.74
+ZZIPLIB_VERSION = 0.13.80
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
