Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88AAC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 15:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C4E60612;
	Sat,  5 Sep 2026 15:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnbhpEaFTPnC; Sat,  5 Sep 2026 15:37:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32D526060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788622620;
	b=OC8c17w5T/ynG/Pf3wUwIQAtaTLQLOPtI5Khv7luX6Te28imN+H+Vr5/JyWClgQ4eOSo
	 hVD8u2iIypWhuX8Sg/x/Zk1h43ck200W9hoMMCPXW1UYhO5xOIxCyJH0bfKBKy2d5GrPq
	 PaX5lyD+ncbE3c14NjH0pfLycq/javdkD4Ih/HJTF14oZ6NSHAXSoeBbWyjoUDofeaPkU
	 HbF5N7s+UATo3OpRA7mXQQzEVLXX6sEqfUpm1DzLchEncSW6GasXXBWXJsxiEHyU8XOrD
	 Rm/Ujd7SiuTeGcOXm9FxhXmzM3wn4J4bXOFOUljHRLsMQmZvak6ZS2LZCmHdRkgrukg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788622620;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KAli5m5/1FLsUHhINTHNHIF3cwK5kf21L8zpBg2e0RI=;
	b=AP0vQPnOvCO5B+Oixo3D/sBYj5BTMljM8kTfZzpwS1rU6bqdM1LrjrmjmC1FKf9jUlhQ
	 Er2pULSNnLt1QXBRmY7ynYDJBeRFJkpVaM0l8N0I+vlh00nX7NAny5AvpIS1nMlZqUasn
	 FqrhJUEGhzMvqr4O3/teXS7ruZ5YzfoBloSYnjQP2ElW0FDpc2+u1pGP7CQ8BpmsZevdt
	 VKTSVRY8yhJnVeGgZ8cVl7nZZbjKS0Z2I3fYAQ73kA7F2dpdcHtN8GCq6QgVolfJOs+Pq
	 becDtD05Ht3qfeXbTSLiVuaBSReHhhTI595FyYKqjUzcYbVsiLIXQy1EmqJ0cOl0n3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788622620;
	bh=KAli5m5/1FLsUHhINTHNHIF3cwK5kf21L8zpBg2e0RI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bFRydQcCa5b6T7bcVr9rYhcJQmynMAN1Yuc3NWc7R08LYz0Jr2bpm+sM4JUSYE5qi
	 5ft1UmWiQiqT04Nm/SEBp54rbA0JBHCsDI5PTZA/sHabmwLmOSxxNGlP+oIZIRoHxv
	 aIRQtQ89b7J0MiHT7GDFAOwjh+9gZzTumdMcMjpXPcRP+3iZz351ApIi1krIHez3jc
	 0V9WbHWY5cjzajM/HlruS692IPNZlbuWanM9AEqDAvB3nsZ819JwvvjlUpp4bW0SCC
	 NKxI7iLzpOts/z/f6ZsgARxEUYrwVt9hLUMRhS40odIC9CSN8iPwHe4xeHbZn5xtE0
	 MV9a6W6X/LUVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D526060C;
	Sat,  5 Sep 2026 15:37:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AA6136A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F2B88107D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77foYjuoqqyg for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 15:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 04D6E81067
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788622614;
 b=LCGgTtHFiQtsQ2lAh8eDk8/5XggH/eDHf4g1uQ/Pp6jjqVyVJ7yndj6BHywmvPfZ6+Ty
 bhssMAo/s/160l8a43haY/A8NWFUWVbMv7g/q7rGQMIDSSmWZ+HWEJHOUoKjOMXdSRe9i
 voubE9EhOVDNiqENP40oAEcGULTLTSZ6ZoaoOF2ol1AFc+6HxEk4TYY/WNDpq2zcRxyTh
 FHB3f/7DM8O4lqCiRTtx0pmmp6MipS71Np3yRGbLT93iYm3BMnOchKrkmR5YNk2NgVeN5
 fuwGFlV9TYJ04/1es/WzSXa+B0A+T7PKi0PsYS+GTEnboVAKy1amPMh1MpbFi+7e6oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788622614;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ex4AKenl/r14pT3StrxxB6S4c+9LFJugYbIW8y+RdOE=;
 b=dUgloVF7iiBE0dvgE/EsDj0qzr/kLVriNoxkjX3G/NJ0l6NaYghVWmzcTNXjru0E1Qg6
 hI5CoVkE/JbnnlMbjIALqkSAvrnO5cvFgdEsVZiJBQ+67tx6xd0c1fvAv3sEyXG56RI0Z
 WhLWcJQ3eo9GBnlxlSyGYZCn7uAzJfVcfnS5Rxwf6OY/kdqK2GJ7iMfZ5obfrhueUQHkG
 X62Kdm7LHHP/sLSFjqJd3DC1kyEUB6jmzvK4aqT92FHqagXNYqz4fEMDJ5X809Ip4czcy
 V+x6p78gvD2p8EA/OABHXXCkBvMwi9NaUHRljTTb0fq37yqFDKnPDL/7R5DmPUrLmQw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04D6E81067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E177494DE3; Sat,  5 Sep 2026 15:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 17:13:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 627c482434e12e8ada6fcb45d482ada09af61f73
X-Git-Newrev: 6910dbda290fbfed0c2ee7e41571b292c19f6228
X-Patchwork-Hint: ignore
Message-Id: <20260905153552.E177494DE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: bump to version 1.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6910dbda290fbfed0c2ee7e41571b292c19f6228
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gpg/libksba/blob/libksba-1.8.1/NEWS
https://dev.gnupg.org/T8253

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index afb9e5756d..7179e01624 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  789ca7db1b1dcb87bca3eb2f53d5e6729810e943  libksba-1.7.0.tar.bz2
-sha256  e1d3a5745911f5a663fddecf526541c4241052a9e4cafbc92dc7f4096c7efdac  libksba-1.7.0.tar.bz2
+sha1  5d24e4c3f9a59838e5c77aaf1346ed197a3df221  libksba-1.8.1.tar.bz2
+sha256  c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5  libksba-1.8.1.tar.bz2
 
 # Hash for license files:
 sha256  078dca2d4a2a5d19788b18dc05e039f7a63cb789f6f0b6f9e3fbe6284e6968bd  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 10ec0ab2d5..a16d78d8b0 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.7.0
+LIBKSBA_VERSION = 1.8.1
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
