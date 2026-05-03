Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8D9FF885A
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 23:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6276410C4;
	Sun,  3 May 2026 23:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mQuZ5QNNyUD; Sun,  3 May 2026 23:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20849410C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777852608;
	bh=fwjBIZ/XkJKfrQNJY9zEd/0QEi31RiplM4JPxwMuEGc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R3C1V1cezBspiEumvmaCcgseA4hQ4UAbV9PvqVNDJLB0ru2fszR9dLb332Ou6ElNT
	 f6FXjxNPclLGe5AaPrSz+nVyZuFbDwFWgF7KLcIeC9adMQZdvvNeCzap/N4bRzsZht
	 JOhYR0GbrHNKvc/QXtxztfcXlezW+K84m6LDJSZdDXs8jSVq9ZMy/SessA8VeBTJwu
	 0UTMvgYRVLWOsfs0pYPAtfLM12GBOWXDMp5p0S/ME11W0/r+5R9vFhcpsTf3IMOj1T
	 w1yYErW6o8AiY9HYf4nneK1ie70+yIa6ClOzae7Fl//zyVZk7Oc/JDsnedR+UXXQzm
	 FjgmAHZleeCEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20849410C5;
	Sun,  3 May 2026 23:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id D11A225D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 23:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id C229384311
 for <buildroot@buildroot.org>; Sun,  3 May 2026 23:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 9eMQuAXbkNQC for <buildroot@buildroot.org>;
 Sun,  3 May 2026 23:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=143.55.232.47;
 helo=v547.v5f06b487.use4.send.mailgun.net;
 envelope-from=bounce+4afdde.7f991a-buildroot=buildroot.org@drhouck.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 947C88430B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 947C88430B
Received: from v547.v5f06b487.use4.send.mailgun.net
 (v547.v5f06b487.use4.send.mailgun.net [143.55.232.47])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 947C88430B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 23:56:44 +0000 (UTC)
X-Mailgun-Sid: WyI3M2VlNiIsImJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIiwiN2Y5OTFhIl0=
Received: from dhouck-linux (unknown [73.82.189.57]) by
 fa2e5fd908529bee335d09c6daffa1fa7da7448d87d2767b8f80588d27478f7a with SMTP id
 69f7e0bb3cad8a93d6a247e8; Sun, 03 May 2026 23:56:43 GMT
X-Mailgun-Sending-Ip: 143.55.232.47
From: Daniel Houck <Software@DRHouck.me>
To: buildroot@buildroot.org
Cc: Daniel Houck <Software@DRHouck.me>
Date: Sun,  3 May 2026 19:56:37 -0400
Message-ID: <20260503235637.637991-1-Software@DRHouck.me>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed;
 d=drhouck.me; q=dns/txt; s=krs; t=1777852603; x=1777859803; 
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject:
 Cc: To: To: From: From: Sender: Sender; 
 bh=UOKuHbqgOjxp1/Ltirt4lkd8RBa7cWgbWWC57TuzxNA=;
 b=gVV5MxFXV2DkwI/+PaqOVWam4skp578Jp43TBcL7ViQ6HHpxj2oEkXlOHtDnvdBRYM7lIUnGfdejDiqf1oIe0F6//gV0VwB8HesD/vQbdkwExJ++yDHhk/wdnCbXHODiORr4h6FgdMEDX3eHPD4VIntptvsxhrie3xfSJ7sU7Ew=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=DRHouck.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=drhouck.me header.i=@drhouck.me header.a=rsa-sha256
 header.s=krs header.b=gVV5MxFX
Subject: [Buildroot] [PATCH 1/1] package/make: fix build with musl and
 gcc-15.x
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

It builds fine with glibc and gcc-15.x but conditionally includes code
with musl that fails.  See eg. commit 999fb19d4b.

Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302

Signed-off-by: Daniel Houck <Software@DRHouck.me>
---
 package/make/make.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/make/make.mk b/package/make/make.mk
index 1d1a976eb4..7120548bcc 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -14,6 +14,14 @@ MAKE_CPE_ID_VENDOR = gnu
 
 MAKE_CONF_OPTS = --without-guile
 
+# Make doesn't build with C23 in some configurations; see upstream #68302
+# gcc-15 defaults to -std=gnu23, so we force "-std=gnu17" for gcc version
+# supporting it. Earlier gcc versions will work, since they are using the
+# older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+MAKE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 # Disable the 'load' operation for static builds since it needs dlopen
 ifeq ($(BR2_STATIC_LIBS),y)
 MAKE_CONF_OPTS += --disable-load
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
