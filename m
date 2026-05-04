Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3573CCD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 16:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F035361547;
	Mon,  4 May 2026 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rV39AxCTw4Ar; Mon,  4 May 2026 16:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD366154A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777912177;
	bh=vcwGRIF4EmXIZaHgQIZbRwwdWSH26Y/iSEPn1svizqs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DqZpnrmfIbIbUxOIdt40/UPpCbWp0d+j74dE4AgsVP0ynHJh8gYAHhkigt/hXOL0u
	 h58LguLl9THE5+UwgGx1lktwL6pRCWIzPId1ZsGfTrW1dW3317ou1EZ5Q4pnc/XQnp
	 Z3UmL/xnMI4MOCHwvWKXjcB5v0DzHiOa/gtIYUAVJYvoAF7Nk14U5BIBKD2eRO8jQD
	 HrhZAcZKUIY33rSR+gxgeAqNuHsv1QhtHnP1knMXOsKjBtPJTxQQCOGaDB4X97nhuf
	 J6m20mS6RA5rIT6Hi7PmROB/Hd0O9xFB7tuKqcXIbXuaMzKrqWfNDv5A9z01f9Nrb6
	 6+DtzVrPwwTcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD366154A;
	Mon,  4 May 2026 16:29:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 761A7204
 for <buildroot@buildroot.org>; Mon,  4 May 2026 16:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64491844E9
 for <buildroot@buildroot.org>; Mon,  4 May 2026 16:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DisXZq0sqHFY for <buildroot@buildroot.org>;
 Mon,  4 May 2026 16:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3127284451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3127284451
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3127284451
 for <buildroot@buildroot.org>; Mon,  4 May 2026 16:29:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1167064752; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 May 2026 16:29:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wJwAl-00000000AgL-0QEa;
 Mon, 04 May 2026 18:29:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  4 May 2026 18:29:27 +0200
Message-ID: <20260504162929.41045-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fDvpCloMFddURb54Mgbl3RX8niDRehtkBHkELVXpfPKgu+QB3/Y8oYTlTVlWJ/quMk27E/4Wzk9fcRTIkRlSXdVJGXq8orpH2CbXE5M7RP3A1hyq4w5riBRmvQGrUrr2W19ZintLl9nP6hN1Fchia9/6HxsuuE+9O93jodUBVoX/fKQ8n4BLJEK73+BAO5IASjiB1St9617oFU0VIGd+gWNxuwSgVq7JYYXmz9g3TtPkscBaQb3/QfDpZ43ldbV360PliJFJI6X8cl+DcBio5Ig+kuYhmPoXfOha+Twvh58vafZ8t7td4o7orSd7F93vcQCXDTpLuGussFWoFmW+Gw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=nwYHCH0t3dgatinBWSkIurJiTYE334RM3WG3MktpMTE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=fDvpCloM
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/mutt: bump version to 2.2.16
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release fixing crash / NULL pointer access issues and gsasl
authentication compatibility with Microsoft servers.

Mutt 2.2.14 was released on February 20, 2025.  This is a bug-fix release,
fixing a couple possible crashes, in GPGME and with IMAP when logging out,
and correcting a small issue with unnecessary encoding of "." in attachment
names (2231 encoding).

Mutt 2.2.15 was released on October 2, 2025.  This is a bug-fix release,
fixing an IMAP search/limit bug, a compilation issue, and containing a
workaround for gsasl SMTP authentication issues with some MS servers.  A few
parts of the documentation were also improved.

Mutt 2.2.16 was released on November 22, 2025.  This is a bug-fix release,
fixing a resource leak when compiled with OpenSSL/LibreSSL, which could
eventually result in new connections failing.

http://www.mutt.org/news.html

The 2.2.16 release is not available on bitbucket, so change to the official
ftp.mutt.org location instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 72c7924e9b..4fd71fd6ab 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb23faddc1cc97d867693f3a4a9f30949ad93765ad5b6fdae2797a4001c58efb  mutt-2.2.13.tar.gz
+sha256  1d3109a743ad8b25eef97109b2bdb465db7837d0a8d211cd388be1b6faac3f32  mutt-2.2.16.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 9a6be6d4a0..503f2d283e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.13
-MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
+MUTT_VERSION = 2.2.16
+MUTT_SITE = http://ftp.mutt.org/pub/mutt
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_CPE_ID_VENDOR = mutt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
