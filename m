Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0E4D6ED3C
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 14:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB5384496;
	Thu, 21 Nov 2024 14:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTEigHDk9iAo; Thu, 21 Nov 2024 14:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F4984498
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F4984498;
	Thu, 21 Nov 2024 14:01:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B40AB69
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 14:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DF8440169
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 14:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Fc2X37y2xob for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 14:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.189.117.5;
 helo=relay161.nicmail.ru; envelope-from=kiryushin@ancud.ru;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9296400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9296400E0
Received: from relay161.nicmail.ru (relay161.nicmail.ru [91.189.117.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9296400E0
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 14:01:42 +0000 (UTC)
Received: from [10.28.138.149] (port=56158 helo=mitx-gfx..)
 by relay.hosting.mail.nic.ru with esmtp (Exim 5.55)
 (envelope-from <kiryushin@ancud.ru>) id 1tE7kX-000000002Fc-44iR;
 Thu, 21 Nov 2024 17:01:38 +0300
Received: from [87.245.155.195] (account kiryushin@ancud.ru HELO mitx-gfx..)
 by incarp1102.mail.hosting.nic.ru (Exim 5.55)
 with id 1tE7kX-00BOlg-2f; Thu, 21 Nov 2024 17:01:37 +0300
From: Nikita Kiryushin <kiryushin@ancud.ru>
To: buildroot@buildroot.org
Cc: Nikita Kiryushin <kiryushin@ancud.ru>
Date: Thu, 21 Nov 2024 17:01:34 +0300
Message-ID: <20241121140134.3476-1-kiryushin@ancud.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-MS-Exchange-Organization-SCL: -1
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ancud.ru
Subject: [Buildroot] [PATCH 1/1] package/dbus: set session-socket-dir to /tmp
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

dbus has a session socket directory configuration setting,
that, if not set, will be autodeducted based on env vars
during configuration time.

Becuse of that, builder's environment variables may be used,
which will lead to an image with a broken session bus while
leaking builder's details to the image.

Add an explicit setting of session-socket-dir to /tmp dir.

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
---
 package/dbus/dbus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index c60bf473cd..2002e707f0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -34,6 +34,7 @@ DBUS_CONF_OPTS = \
 	--disable-doxygen-docs \
 	--with-system-socket=/run/dbus/system_bus_socket \
 	--with-system-pid-file=/run/messagebus.pid \
+	--with-session-socket-dir=/tmp \
 	--runstatedir=/run
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
