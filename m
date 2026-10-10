Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04BBCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FCE56064D;
	Sat, 10 Oct 2026 14:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGkq641mqy4P; Sat, 10 Oct 2026 14:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 41C096064B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642562;
	b=sKf5b3uPuaRfVBH4We8tioa7u398gVsZT6vs+Oi3rfsKBBKPGXVuvaVNJ1DYe24sFp2h
	 2LdTZix7IVBzXMsolWKmUmfCfc8+th5Z6YF8AjiIwH8Q7JvZ7ClomqD2RzZZ36QQIcxRR
	 gBbDd+3wOUiOsfNNa/wyJQN17bp6h7wzf9t5ORC5MOflZitSuZLxXN63/1aOhTVMam5nc
	 oJBisRU9ZEj8wJzJXtRr3HFnn8+g9p8XTYKKqz+0qR7tXCGyzg6QIQGC5MWNzZVIYo4vB
	 ebGvw2EMMETbHJwFxEXV8wjaA6TWVmhYgV8pupAk62+bzNyLwZcfPJqbzgPVQRTcCUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7JsCuab1CsLSJfhAKD+nECzpyWJGJ/VeE3s/rMC/p1o=;
	b=Mz2h2bgTKlxxTQhHUrXIchoesWz29IGA0ltrnirWC3jlVglHuh/Yrc2RSbwkVfbx6+9a
	 ziag8a0o+4mQ0g/GtwGIUnhcJueyDfqUUv7ZX2crlxHjMgOc0iOoyqkxFlACc7WVGHrWj
	 WD0cD4zk6XNcuQHgdhSYN+dr9uv9y1nCXMMkh5p+G8wF9M8q0NSv/0syNICOH8i98lRHK
	 jJ+LCBmJOBx/ZHKb40YjiKUF38wFmxScZ8yv5yADgXkzTDC+LT8ithO1v01qldieJibs+
	 SuIwYO5A678bLOFjJIujrP4TPz8GKuLuB0ubiHIlFAMrTqy8gUdF8KiArNpThhUWw5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642562;
	bh=7JsCuab1CsLSJfhAKD+nECzpyWJGJ/VeE3s/rMC/p1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rQcxaeBBuBzGN2+16CLHziEEsq0H6FxCynWCn3EdbkVWVtV5q9HNUVIW5IJYvbmWn
	 FbSzpDD+2bp4LtgrKsgljmkImns34evLBrBENj7kjyF476sqiilMzeq15gJtluK5/v
	 EwApFXoroQ+OJ1QnPKCS4QgBYMgr1AVKfykJYammXyuo1xypxQz0M06PvTn4xCrSqb
	 W6ovTPilhWsKbd31x9YyKSGRl6FYjVGNABGCeDKEyfjNRm3KU0q+FuJN4+BZ01ZO9m
	 7STJgE9hALoncUnnr3aiYGimj64u9Hsf5s9YIfJzQ9iB3wTUbT3ks+jaEac+Ayo3Aj
	 cGrManH0Xmjiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C096064B;
	Sat, 10 Oct 2026 14:29:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E30A0317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2C9481216
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok_DWceoM2SA for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DE15781215
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642558;
 b=r67OdZgBeqKx1sO03ZtUg/lc5xh7wXg8iW7bueAaHPjTSygQ+rJKbi2bZnTpBmnjjtSx
 SSHY3Va3cCGAXtAKAWgoV1Wv0CSgMP/svnBRLRI2zfMPe4zyxZ1K6JXkGZ+Usw1RliChW
 qr/9sWAQj4QZ36yFVqFBU2A6SJWu5Hs1jLEY+EjtdyM0zR4V0p59ZFd99hsB0oG2+kynO
 03axEdf/RQZPgdmBdBkxzhOb8Wmb1cGlzaCTbxhjnt4RAR7BlKR24S8aMVsR9phqLwplw
 N1D8SDrRrh84dplfIYe/+3rfEW0KWHzmX5wZdx4t3/QmmfagZL1TqDaDTpjmCQbiHIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642558;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Jv3yQJxj08VogqMH/R4wfKIXoCqi7+Ra3QTuMmLcjbs=;
 b=s951Npq7cU9IgIvggn3UUpjSqqjfLC9GcctZkQC1+GW9/m7SHPgaSvIijiKOG9MTejuv
 WRkWp4A441AvV7TEpd/dJn7ibJsTk18XPZ/L5BERhsI1ByNGzzfi6GATZi0rtsKGj5UTB
 Cr4vZ29fw/uRBfH8xiaCJyJTDu7s+S5pCpZj3pmytPIPAFBcQaz0okFSOI55X4UkA91zv
 vlLsUXcpY6cwRjQ53jCAyj0JjL/bMZZhcVFy9sL+3/rbM7NIgv/UZOgUzyxUz09ny6jYp
 1HtCenaGLHMk0p5gJ3EovEIHvHRIx6eDAUVhBwjRAu/4bZd2YYN1C970G8vOioYqBDQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE15781215
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DC839207A; Sat, 10 Oct 2026 14:28:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93c6c91955de390f435de6e484b0b06f46e97128
X-Git-Newrev: 39235638d171f433b3790c6cf9226dec728cd105
X-Patchwork-Hint: ignore
Message-Id: <20261010142800.8DC839207A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: disable stack protection
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39235638d171f433b3790c6cf9226dec728cd105
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SQLiteCpp has an internal setting for stack protection which defaults
to "on". Since Buildroot handles stack protection itself this is not
needed and more importantly it causes problems as the option enables
stack protection support even when the toolchain doesn't support it,
as can be reproduced using the following defconfig:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_SQLITECPP=y

Fixes:
br-test-pkg/bootlin-x86-i686-musl
https://gitlab.com/heinemml/buildroot/-/jobs/16865965418

Oddly enough, there are no autobuilder failures recorded for this
issue.

Fixes: e74059b39ce2f ("package/sqlitecpp: new package")
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlitecpp/sqlitecpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 95ddc953cb..418860fc6d 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -14,6 +14,7 @@ SQLITECPP_INSTALL_STAGING = YES
 SQLITECPP_CONF_OPTS = \
 	-DSQLITECPP_INTERNAL_SQLITE=OFF \
 	-DSQLITECPP_RUN_CPPLINT=OFF \
-	-DSQLITECPP_RUN_CPPCHECK=OFF
+	-DSQLITECPP_RUN_CPPCHECK=OFF \
+	-DSQLITECPP_USE_STACK_PROTECTION=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
