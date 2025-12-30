Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC99CEE4997
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E6E608A0;
	Tue, 30 Dec 2025 17:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkxhScuHWjXd; Tue, 30 Dec 2025 17:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E01B608B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117483;
	bh=sLInRoQF4pqIJfWYWXcgQ4yV9D4qfBkdNwz5e/tax8Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aadRH2r0cFiyFKHMimBmI6zG0AIs9/Rw2YAlY2ZOAQXJGOU7L34U4h+wHEV/li+QZ
	 u9HBE/5LU7AMaUqSElznMX5qL/uY1XwN1DwIEAN1qJhVHUf27CvehSPLhArPmCP6vd
	 4bgIQOgslx3R5VMAG1vV0HUb8yBR811WU0pc20smFsLn9k3Lcx66+PWaMctU7WeTvf
	 iUwminA4S645ETDOMXNyyBl/ce9hRLt0vQqVeCSb2mV5b9e5LRmWkpip+sqGgCRpad
	 wMAxTAK6o/Grt1ZaW33ukQA4Ht67Y4lXEC3J9hz5gzCasWt5QChEVG9KO8f/AqM+Q4
	 cUJ8KNvMYpf4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E01B608B3;
	Tue, 30 Dec 2025 17:58:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFFFF177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1883608B3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySA__4Fpbpyy for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CCA9608A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CCA9608A0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CCA9608A0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.107.189]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOA3F-1vHBKJ1emX-00NwQC; Tue, 30
 Dec 2025 18:57:58 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 30 Dec 2025 18:57:38 +0100
Message-ID: <20251230175738.267463-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230175738.267463-1-fiona.klute@gmx.de>
References: <20251230175738.267463-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Aml212RPtsOtGGgMemG165iFw5Y2m2K9pJx07PyyBrpoxFjbcs7
 oDdugq1zFd9ak3mzrUaxa0xmEDJvi3D12yMW3Dyr198FJJbvUhDM9dUeUgFCaXMds5wEd9q
 p0nscYGKQwvvPKeFSXCkClmJsM0qRFYhXA7bpAujhfQF92QRQd7eAPqFhMIPhidhkU6eCUc
 rg4xXRHPpmY0z04QU8HgA==
UI-OutboundReport: notjunk:1;M01:P0:ytukGUufhps=;dReEQyiuRpUG9dnnqTWQTlfjJJi
 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
 y7N3OS/A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767117478; x=1767722278; i=fiona.klute@gmx.de;
 bh=DW/eGhdgzNXNMS6PheoMr86mLfOqkiwtcihmQjoCAGM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YKqNF182jahWJbITDF19zChY66/fnzmIxUgtKPJwbGhWFTzdSL+Hce5mVNPHI8ny
 Z8Q+9uLuqYrH5uY+9wstPa2S1iEz8YiphwF5dPQQkfnKiMMqlaLOd1fAlYoPISzMh
 hgDsYlTQeUNWOuI3fnsAsPuI16cA2udKP7YbaoSfITtGvEyOeqsglTAjM04YtaZEp
 eEz3WwyjzprsKhr6H1dUBZvYV4tuOridT0duWwG08LdF+JcwybVIuMICTNIjWhtdx
 C1VdC8gHEH8AlgpYYvRGzSxG1ojm//Rbb5jtMwvUvKGN50c1rf1+CfIcgwzvyJB+n
 xHJKQZAamLnzLY9WBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YKqNF182
Subject: [Buildroot] [PATCH 3/3] package/dbus: move PID file to
 /run/dbus-daemon.pid
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes it more obvious which service the PID file belongs to, and
thanks to the /var/run -> /run symlink fixes the check-package
warning.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I think it might make sense to allow /run instead of /var/run in
check-package, but that's a separate matter.

package/dbus-broker still uses /run/messagebus.pid which seems
questionable to me, but it's an alternative implementation I'm not
familiar with, so I've left it alone (and it doesn't have a SysV init
script anyway).

 package/dbus/S30dbus-daemon | 3 +--
 package/dbus/dbus.mk        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/dbus/S30dbus-daemon b/package/dbus/S30dbus-daemon
index 3331b11ced..d41aa3b1a5 100644
--- a/package/dbus/S30dbus-daemon
+++ b/package/dbus/S30dbus-daemon
@@ -1,8 +1,7 @@
 #!/bin/sh
 
 DAEMON="dbus-daemon"
-# check-package lib_sysv.Variables
-PIDFILE="/run/messagebus.pid"
+PIDFILE="/var/run/$DAEMON.pid"
 
 start() {
 	printf 'Starting system %s: ' "$DAEMON"
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 061a341363..7b97c7604d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -33,7 +33,7 @@ DBUS_CONF_OPTS = \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
 	--with-system-socket=/run/dbus/system_bus_socket \
-	--with-system-pid-file=/run/messagebus.pid \
+	--with-system-pid-file=/run/dbus-daemon.pid \
 	--with-session-socket-dir=/tmp \
 	--runstatedir=/run
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
