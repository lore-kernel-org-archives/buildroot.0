Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DACC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AA340B12;
	Fri,  4 Sep 2026 16:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ce4_wVTCfppT; Fri,  4 Sep 2026 16:22:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20EEF40AFE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538940;
	b=p6Ezqy4cR3yXl5Z8QgM7hwnYWTIwG6CWZrw0sb4jHAEskKIxr37lMjHjTV4znXhBubWL
	 dGVC1b350Fzci5ggdqgbueHPUvXHFx8JiUtPJXdOZiC3vh9tipU1f3LTAQGwRcaKDWIfQ
	 tB+gPNHnyOS0bYQqx2/e9iMjwvl35jcF5zOqFmtvqUfp27lf8oTdWyg741lTRS4mrnKe1
	 /Aly2UyA+Y2Q7/GIbJuxcqs0WjqWY9B7Er6rHf4UvT+m8tq7w72krwVudDWbiFvx7r/qu
	 ONSjvwGk8sYnHc2OoQat6f9UIlA7/1tTvu021E2I2h/I2P7+cnR8lEzrwFfwZdeiwag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538940;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OZ2Fl9MGit4+XkefSFZ6TRrSm2I5pB4xjpob6ProGzA=;
	b=b29M7fSTsd20Sk2ZSuLpqbZSSRrZ1Eqd3yen8vg67/PiaWsmnvCKq3PAbYywAm9pG7Q+
	 u66wuX77BRT+ynyF9zqTZYQf6gKbTYYeDol8qCdxfdPcxhWtd+EpYneKtRhnDdGGcxC7z
	 CHYzbuUWmyadguj76SPFpj5gubrGYJpYwJCE7NqdeVd6sR7A3dBUnk1klJN0P3xAXuki5
	 olfKBBThBt6ckPoshU/dJXf/TH0pT90J1t2Lnr6TNL1kBTb58b19L9y6n+QZ5KScRJtar
	 A/VGPdZcXw2Thv0zBSzpPB9lNKd9s3ctBSpxl0wNu/+WnUeBEmM+po0nc8KaV746Qvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538940;
	bh=OZ2Fl9MGit4+XkefSFZ6TRrSm2I5pB4xjpob6ProGzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VcU1Y2WB+SuDetY2gISNrVCnVYpVA2hM4tFYMudXi7Hphsao/+JUyjNLBdurCOaER
	 aRJ88eujORSi2ZANGzUhn+sCgrjdRYW0tpXsBu9t+myjJy3KbETGoHK0IHVZZPgBXh
	 p61+pMiIjqin1PX7o7vRRVG5F3Dy9Thlbe28Nvj75QZtXX3TDKKHx1YM2RvfK+zfAJ
	 f1f5fQo3Sq0kvuAq0PUo1TLAc/0NutIM0/51gPTucsfqZhStS1ns7hQq07/Sw0iUbF
	 YysEoUr5ep5Kym1UsQM1KNpdQnAe4sBAsDXWgKDtyoW0qGVCC2Dtas99W/NHDLaHS/
	 QAHON3v8ObY2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EEF40AFE;
	Fri,  4 Sep 2026 16:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 293673892
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 162826069C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmuj9UHBTQJz for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 03A1D606B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=pmTcNBiHMd5VP2O6u9ZwPIrUcj7K+X4PSCnVqexpgQbkKQPI3CEBnJk7neQ1r9iQEFOo
 Iog53RmyiSReC4x1j3miyGGGYKo0amDRFcwmGitBVAY5XfqCIGVhCT2hJ8WDdfnFMrzBM
 hfnh2nZyuYjK2e/sHXVzjHzOJnyEmyjtuMi024/rTTfbguy00WdFjkNp0CecbO82bBy1P
 W92zL21D59wn0B81IOj3kVPFKowzwjGagFylKRxQ4c7Eyhs7jTMNvEqpDeKsmffXB7UNo
 L71FB8CZ89eUTarHhGYksiddLLw+ypN4lDL2ENE5xqO0XHX21+gACX2vShJosjgzQgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FLVIcqSC1GnUs5ECNx/bbP3nYowjxm+JjNDxufSiQPo=;
 b=RqbgjwpAmbzm/pgZN7PxfBSpDc7sfJOCra4Pz6EZvUZoc1IHYfcA+JGNIndDbvBNJtgk
 o2jkMB/yWxFvvp/JZNhOWxQcNWk19UbzCFhZQsQxbGwajo1lwfNJInGIOv022zKD1skC8
 H9dJMxOd9Cr1SExF/lhZ/QkmpiYwJKGhulpKQXmo6QESZr6Dz9Yny46XnRK/jtE0Q9p+F
 WWCqzVH/e/Ic4G9hhEvvLP65KsRSCedMc+pGNz/S04lPCfTTWfViUQZOuc/s9k8p7HKIm
 5ntaFKyzz1V4TUl07BF2LdpuMYfgn7shhuzMvazNLctt6bAKJ52T8Noi7DxBYu4XQng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A1D606B0
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5451D94CD8; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Aug 2026 12:45:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a91e760f467a90b0f0acf00ec76aac011b241f1
X-Git-Newrev: bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.5451D94CD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: bump version to 9.20.27
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/notes.html#notes-for-bind-9-20-27
https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 36ff7b2d0a..2131f51978 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
+sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 172bbf79b5..2b42e87d62 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.26
+BIND_VERSION = 9.20.27
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
