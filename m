Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9151EC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98613405F9;
	Sun,  6 Sep 2026 09:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04a3vlkW-L8p; Sun,  6 Sep 2026 09:11:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 12D97405FF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788685881;
	b=lWf0ui8oD13JmMlFgc8IksGXfnSpJxIXdw91HhkWzuxmw4a8e9YT4EjT2Zl8HYdsAnrL
	 GvcCGthWMifvkWet4zicY+BFuGYOK6Afh8tStn3Mrh2mJaIgNZQ5kwrC+2tm0k9DusEB7
	 iYdZ26hhBxmTwWMdSCZcGyyQWqYBFmuI3XVF6sNO8iSAXPrt+zIea5TDu3jySm6bqo06E
	 rh5ztF+BofcE1QfHX4Khq1XqLjiit7fj4TfB2grKfNwKTOo3blIY6HOIRr0VzYDt6Fxp2
	 yX4lo8K+73r3HzzBY9bnxh7YAR9U9PmVd1gPHu3Wl/EYpO+ALY7U7NLOXzjjCQ9gUiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788685881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/GL2dIHjRYIdnDB9bAfcpFmtEh0IaocIdPgTVscALfk=;
	b=THq49UPAuac3ZOs9cw34+C/SaQ47IZTSQTCi74nBJIM1bpw8R6P5168JQtw6cxBE5qpt
	 0pBtUa9BqQi6Kq/yKBPswnjBTfHuOHWnZZFUFUhmGp138xRLcInPdrq7Nb+GjAqJsxIE4
	 XL2fSMucv/sY6lZGuWOsTrcR6E17ILrbixAp0U0hKIn9gh3nnWfOM+FORpe9zXiGRe/Lz
	 2zSSnXth8OR+Da0egQy0KIlp8/3uYO+lxTPlU7wDACzo1hWj2zYC5RjZdRltike/s47Ed
	 oJitNtgKYakEqwQcCx2Sf+kAic7X0aTgXU61KMmeS5zX8/OYW4kVDvSF5j2maIkbEzA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=g8cLn2+3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788685881;
	bh=/GL2dIHjRYIdnDB9bAfcpFmtEh0IaocIdPgTVscALfk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H0GKtSHYlJUafkP6xee4u6rGmyZsMTszu2sKCjBW9PZE33JJIm1NxUmJBTHFnP9sg
	 6WIjrfxY2ZCownRDm11jZrZoc3bS0dmFIYD8QKSk/trBouGSJ42eHfzY0RMygwRugH
	 lb9YtIj9Mhkb/25KkOIvMOW7SnzApIAZlVmwAIOljof7AOewDmyPHaHxVrYPza69D7
	 cL2DHFCTkehFjVZbPGe/MjSOYqGXkELRn6qJE16TidE1SXPffQ1gVrPXwftrnlSQWy
	 VffdpboiONkGn+gytGutP3IqYy2DCXuKjU1PyvN26JgvFNVo8RV6WPBIQyP4LHwdfj
	 v6udvg7sVYxHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D97405FF;
	Sun,  6 Sep 2026 09:11:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B01672C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CF97405FF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8wcypSotB6D for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:11:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7EC0D405F9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788685876;
 b=EzzowqkV3xMqX4T7WGs5U/lPMI8/xjwc53DffcgXs5cRcLD80amVb60I7JqaaOXgZJFZ
 LwcjYwOwW6LDx3MBtC16rWxWNw4+XEdjehuntm01O0QfUj4W0Wv4MJmIxMq4iy5/J2Nlp
 jLrnVH+Z4VKiQZOJsLFTzu8PGJaYQ7hIKppBgjV16Ocb7mPG3MrCNedt2pCukFkS/9M3v
 Oq0gOg00OZ2dHZvrlAlHAkno0zCjptV553c1HoVhZn6SH8flWoCuZmxJUmBF1Wu+mmD5D
 mF72tAGICUlab2uDD3b/vGYItMMRfNsy7JlMyny2Tv3deYdjli42gpatqDtwYh3xErQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788685876;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=RSfVKHb+z7/w4N5uIbJ0F8Nxu9rn30oa88y/Popu4Fw=;
 b=nWc8eF3Qnf1bYIPhYdouqK1WPsSqA4wBmeA8KQwlmcTj3Y5VTP0bllkOKxb7SEtGT0zF
 6kgzzAb+5wZvJGNzhCgrqa3HMyhlonFvaUtsoYYtJyfovSPSUx5yjjhpFItgHnn7CV/58
 HI/B41tl4fBcdsg/Otbho9rLxndGTDmwjbK40U1nDiGpBbEBn85F6Qo0JX9w/YTrn1huR
 aLGhzsth9Wx/2uvCKHCCHS51O7tm3p3HHpL/kgze5/yN2/d18Uc/xKOeQ2fDMWp3JvJco
 ba7gLO9cwQeK9g917GQDxC+rYMnACPMfHbuRYNYk0gBRNjPJz/QlkXcev0+3PS5/Pqg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=g8cLn2+3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=g8cLn2+3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EC0D405F9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788685873;
 bh=RSfVKHb+z7/w4N5uIbJ0F8Nxu9rn30oa88y/Popu4Fw=;
 h=From:To:Subject:Date:From;
 b=g8cLn2+3TFG0rms8gHhgQrjHJrF3kNpgkagnawa4wz25jntm2CIM58TLlcmLpjybV
 +ZDcwVOMgHuURBpE2bZdcqn4qr1feEnhUboaYiBNPajkUfK+dWkOdhwz8/u7tZJqWT
 I8M9NgkPVgipB1BOtb9nLkv+3sNbfYkz0mqI5vHmNkceZLlv1CK9jH4YnXPNoCGnzT
 4gwv6hQrFjDOjhuUlUF/+/Q1rW6CyRGW97HRSFoNlR2lu/+i+eMNVHkeqit+OzPUXn
 2V8b1xkC5g3EBU6NvHAXjcnUvf+xw4Ew1pkZV6UxTpiAjhT7Dw6zwVQyANNfu6bTVD
 lWE2e3LV8EIEg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA5E9A4C202E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 11:11:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56544)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x38u9-000000000nk-2qIo
 for buildroot@buildroot.org; Sun, 06 Sep 2026 09:11:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 11:11:13 +0200
Message-ID: <20260906091113.3583868-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/softhsm2: bump version to 2.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/softhsm/SoftHSMv2/releases/tag/2.7.0

Switched repo to new standalone repo:
https://github.com/softhsm/SoftHSMv2/commit/2355064ce4df21cda919d1600a7299e762918338

We need to use the github helper to download the code which also needs
autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/004d36da66d2292a01275835ef9cfe2ef1b88da4

 package/softhsm2/softhsm2.hash | 3 +--
 package/softhsm2/softhsm2.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/softhsm2/softhsm2.hash b/package/softhsm2/softhsm2.hash
index f59f0bf028..78ae2e7c2d 100644
--- a/package/softhsm2/softhsm2.hash
+++ b/package/softhsm2/softhsm2.hash
@@ -1,4 +1,3 @@
-# From https://www.opendnssec.org/2020/04/1602/
-sha256  61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2  softhsm-2.6.1.tar.gz
 # Locally computed
+sha256  be14a5820ec457eac5154462ffae51ba5d8a643f6760514d4b4b83a77be91573  softhsm2-2.7.0.tar.gz
 sha256  230cab7102816e99f7ce03ef476352fcad09d742fcbc6580d44393db6280b64c  LICENSE
diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index ae44b93bc4..5e10c1ef46 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SOFTHSM2_VERSION = 2.6.1
-SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
-SOFTHSM2_SITE = https://github.com/opendnssec/opendnssec/releases/download/2.1.14
+SOFTHSM2_VERSION = 2.7.0
+SOFTHSM2_SITE = $(call github,softhsm,SoftHSMv2,$(SOFTHSM2_VERSION))
 SOFTHSM2_LICENSE = BSD-2-Clause
 SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
 SOFTHSM2_INSTALL_STAGING = YES
+SOFTHSM2_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 SOFTHSM2_CONF_OPTS += \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
