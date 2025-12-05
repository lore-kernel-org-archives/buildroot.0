Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB8DD37485
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD4481006;
	Fri,  5 Dec 2025 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkW3anmdMh7u; Fri,  5 Dec 2025 19:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1862380F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764961783;
	bh=TauoqWYeyB3JgyKUITd+ngxwfgsHbGfYzRdDaQKhjbY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRfXs7g5q5i3tTonvfiBxXxOr+G59he0Ex9jpLM/ZFaZpvOHChjSTPucH1JZCUJ+y
	 vgLWbpIS7rj31l90Kdup7MBKUtdmkas5pl0ReX1lDIEEzO3z2BXt6n8xFHc1K8lPTs
	 /UB2QUBg7hKl0JHki7Q1GQ4/f+2y3RzCy8WTllPfAU0gpBQAho5QUWQGp1FFlQXYdj
	 f99V8HeshABagBkKpqRltpdP8G0jqjGrROJZ6oPZH0hJRXjqOotzGP1WGMPUWojynI
	 HKJIm2wIEEao4lrwuCMpQtOAgq4KiudukHW1fBFW0cTFtiXBcAUnRF7OoDk1vaZBYv
	 8GJMq+UwuvZTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1862380F1F;
	Fri,  5 Dec 2025 19:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8DB11A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB27D40176
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meltp0-L5dLC for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D102E40109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D102E40109
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D102E40109
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:09:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E935DA4C7783
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:09:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRb2f-000000001Wf-3hnr
 for buildroot@buildroot.org; Fri, 05 Dec 2025 19:00:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 20:00:34 +0100
Message-ID: <20251205190034.1839192-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205190034.1839192-1-bernd@kuhls.net>
References: <20251205190034.1839192-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764961778;
 bh=RkcuObZDKJXH7CyhmnojH+Qib3ma1A/41/xjBhn6FxQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=MpsHc/+iUPTlU9HIqE89BSGjLRCAx2gAXSWXEiTkgJyF94bW9HGCm5aHSd3nvgO2t
 EZ/C0a8huu7IbygqJJhA4Db0Sq5AIlFf8Kna9i6kZ/rWdJBjIHe/EoshnBqvroYhv5
 PCc3+LGxaoQXQwg+zIHSPYRb3Qf5PlBDMkQ/eUsQ7rsO1FQehJkeQsFjG8B/b/B0a/
 XHnOBAfcVaAxFRyZeENZUzHZCOpJh0cO1WD4YKc8w9kkdYKxpaQnRNhFRLLaSAQDOq
 0NbcFbTZxdu53IF4PUQnoYUUJf46vQILB4KrEX9912oN29C9XbD5KQKccTcy3Fpx1j
 PXNzjq6/fc01w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=MpsHc/+i
Subject: [Buildroot] [PATCH/next 4/4] package/matchbox-panel: fix build
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

No autobuild errors recorded due to download errors with dependencies.

Patch not sent anymore, original project has no updates since 2010:
https://git.yoctoproject.org/matchbox-panel

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/matchbox-panel/0004-fix-build.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/matchbox-panel/0004-fix-build.patch

diff --git a/package/matchbox-panel/0004-fix-build.patch b/package/matchbox-panel/0004-fix-build.patch
new file mode 100644
index 0000000000..01e0c092f4
--- /dev/null
+++ b/package/matchbox-panel/0004-fix-build.patch
@@ -0,0 +1,15 @@
+Description: fix FTBFS with stricter GCC flags
+
+Upstream: https://sources.debian.org/src/matchbox-panel/0.9.3%2Bgit20100816-2/debian/patches/fix-build
+
+Index: matchbox-panel-0.9.3+git20100816/src/msg.h
+===================================================================
+--- matchbox-panel-0.9.3+git20100816.orig/src/msg.h	2020-06-16 16:04:57.000000000 +0100
++++ matchbox-panel-0.9.3+git20100816/src/msg.h	2024-08-09 11:22:54.986036009 +0100
+@@ -17,5 +17,6 @@
+ void msg_handle_events(MBPanel *d, XEvent *e);
+ void msg_handle_timeouts(MBPanel *d);
+ void msg_cancel(MBPanel *d, XClientMessageEvent *e);
++Bool msg_set_timeout (MBPanel *d, struct timeval *tv, struct timeval **tvp);
+ 
+ #endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
