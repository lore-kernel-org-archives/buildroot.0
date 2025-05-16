Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D04C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7CDA40826;
	Fri, 16 May 2025 16:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZE-yvy-JutG; Fri, 16 May 2025 16:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100E140836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 100E140836;
	Fri, 16 May 2025 16:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEDCE1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB42E80E2C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJtNOT0bS2tK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D97C80F81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D97C80F81
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:33:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AD0486C67; Fri, 16 May 2025 16:33:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 18:33:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82575b3e52b5ada683a3305a275ed38cdda3a912
X-Git-Newrev: f777c7991275c62f2881d1dae0c2aa357a7f1a21
X-Patchwork-Hint: ignore
Message-Id: <20250516163331.1AD0486C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: set session-socket-dir to
 /tmp
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f777c7991275c62f2881d1dae0c2aa357a7f1a21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dbus has a session socket directory configuration setting,
that, if not set, will be autodeducted based on env vars
like TMPDIR during configuration time.

Becuse of that, the builder's environment variables will
lead to an image with a broken session bus while
leaking builder's details to the image.

Add an explicit setting of session-socket-dir to /tmp dir.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/67

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
