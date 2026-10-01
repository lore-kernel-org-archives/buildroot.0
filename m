Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260EFCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BB780FB0;
	Thu,  1 Oct 2026 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYqNClE1to82; Thu,  1 Oct 2026 16:53:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DEF8D80F61
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873601;
	b=YK/456/xxEeLzM2wEHj1Ud+4HFN9gP4cbDali4MfHw7ECII7vHwAFJFuVAe9vseBFiwa
	 TLGgqEWGERAataxnVvExO2hOJtfuZkFfLgjNOp2PNOHcCBubURW0OnKPyR+IC96mBPjMH
	 kP8HikfTs4AP3DOzVaKuPzPoUhkhQkmqPiHunsaWi3CIesFw33aAZUETOx5r6GAR3A9LD
	 eUnUgQ0TouWegn9P4yGF3v+pyuuISsexOkjk8XMEGuN4DHnYYC/dc0h1Jfkarorji2E3V
	 7+aTfm4IjOxslPczzR3s7AScg312cvdqUiSFWZv0ze4Lyfd9hKSvSQkTWCaw7hb7cQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n9I+gqPmvXKN0csrf4c2hYBxiy3cQj4w6N0OLIaU5HI=;
	b=UGUCgiuGLtQDiPX85Xlf+wrv5FpCag+X5kRZ3mV8ppY6lCuzLvMhkf1oN3Sj3KCMR2ER
	 cDFoZb64IU83x1VB9r0gXqcuAGCGH3xOwh0f4WEZ2xqhODpIF2pT6VlbEXh8lvVQdKkgX
	 IIxevZmIAqqvvgCeTsGKR+/9Z7W94MwYkuzWdk1tBx0oF+IKIsDiQ3CvJXS/9KyQCaZTe
	 Jb6ygCDAuQ9skMU721lDl/qywkpAqOjkpPBEhYYFBX0pWqVAkIBvbHzMSTxHT8evXsRcn
	 ot2DYDmHAZGO9yuEw+3UgWfLwcKsx427FfHd6ChjNgFI/SVJ3rj/UVCt28o262jp+tA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873601;
	bh=n9I+gqPmvXKN0csrf4c2hYBxiy3cQj4w6N0OLIaU5HI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S3pwt6zt9hiaDL08S5KI5Ixv/+KdCeZMBc74AGaSMmcdVRAJ1VBLMZPnD5MTzBQJ7
	 byOxL7FHtPfvnT+VOLDv8swINrr+EWusZ8x2k6vxMkDLI8ir+HHaCO9PQg3mmnhaWS
	 0FEeKwtz/wZi/vsYQAvUtCHE2eEBJxcK+bDu2OyGWNu10zy32iRMX5q9XRSLfL2OJ6
	 eQ/5c9WJRQnt1rfNZSY0cbXXmwVf9JreV/PayOoO4m6Ir+MSqsI5Wuz1qjrW7wdjWn
	 tZwemNCQoZi5xJwXnpj8rBF0WKCfox6Uu9y7PN6gQ4By+Mhvgr1qSbf9hja3Eobtvs
	 rTjNZY88wxt7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF8D80F61;
	Thu,  1 Oct 2026 16:53:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2443E282
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A14E80F61
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48-RpY3Iuzop for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 378C280F22
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873598;
 b=UDgJo0EZkhdF2HWn6ii9VCU+WtQn0YTwa+nVVce4ejKiSWIFKrU8iy++CYAOXXo243Ku
 Mi1Ht771Y69KpdeRhO5IuXvpYgrXrUbg2+2CAswSXtUzkilxvZpPFEHW+/mX2mApYUf+W
 hYbehwTHYw9RvBr2LV40MeAa+cVqA7Al8xI/OoQbIb5SXLhqlI4u00/1GzC4XWD1cyOgx
 rRYAvv/7AL2R0aUvDLK2B1s7T8GCPq0qy6YoLNKDnA5TJfBo/e34Nw31K/q4zJ0YjOztU
 uH8mWWTiM4R9aeKKD9qOWh36cfpt+3IdgBIlTpG1nYSoU39CpYPL9rth0Rw3qaxQsoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873598;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pSxV95e8XvWSV4ZDfjvwpx4Nna0C1HItpUn/8PD/7Tc=;
 b=ho+3X5vT7ObQtwFN3dm6tBaBJptqA28sNkogwLdodiX9WV9PL6SW7BE7Lul1uSlx+ifZ
 xSp5zGeXCpyT/F/MiGJ1XsTv/td19Dg937r6Pf4c1QjFz6OXN4U0b35efIaaINStGuRFW
 PnHDZ0kKSJldhHhNKgLIebzNIXw18WYlHup5umFZ4FZuWEkPMO0o00sJhob6RAio7Kjad
 3XqGIq9LUvnSvUqxIGObgqvvvOfYV3EufCuUg13XcXkrghGWWodLtffdicyNjLhjWo9dP
 h94XEUi6GG4l+Ahm2BTL6ZouXu/IQMeat2BLobA9BQFQy58uvU9CqWsayM7i/RTowHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 378C280F22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:53:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64055814D0; Thu,  1 Oct 2026 16:52:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:51:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34964aa111270525811d1bd05168ad5ab19a577f
X-Git-Newrev: 1eb8b44822fd97b5addde3c293fa804af88ea435
X-Patchwork-Hint: ignore
Message-Id: <20261001165204.64055814D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: bump to version 3.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1eb8b44822fd97b5addde3c293fa804af88ea435
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.samba.org/pub/rsync/NEWS#3.5.1

Switched to sha256 tarball hash provided by upstream.

Added configure options to handle new optional dependency to libidn2:
https://github.com/RsyncProject/rsync/commit/f0177d82a8fcbbebaac2bdf556f983160ae03988

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsync/rsync.hash | 5 ++---
 package/rsync/rsync.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 84cdaf680b..3fc2603049 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,4 @@
-# Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.5.0.tar.gz.asc
-sha256  c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33  rsync-3.5.0.tar.gz
+# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.1
+sha256  c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef  rsync-3.5.1.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 391659a33d..af18dbf608 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.5.0
+RSYNC_VERSION = 3.5.1
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
@@ -34,6 +34,13 @@ else
 RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+RSYNC_CONF_OPTS += --enable-idn
+RSYNC_DEPENDENCIES += libidn2
+else
+RSYNC_CONF_OPTS += --disable-idn
+endif
+
 ifeq ($(BR2_PACKAGE_LZ4),y)
 RSYNC_DEPENDENCIES += lz4
 RSYNC_CONF_OPTS += --enable-lz4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
