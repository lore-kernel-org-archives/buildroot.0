Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56794FF885D
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 10:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E6C60776;
	Sat, 25 Apr 2026 10:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7mXHuLBwWr6; Sat, 25 Apr 2026 10:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48A6C6068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777112134;
	bh=9+SW+Lp0gGbJbncc+IfhzFB/yNJcoTKC1Gb0sW1jvBM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NmHfAWlj+/jBwIt3+Al9YuEM3EVKENZ8z5ChcdeY+I6j+T4A5QSrvf+RJVaQozNK1
	 vEmKiD4T3pg+wkVNQNhG2jwkG/z6Vcr75gznylUqLlOeU2rP584B9YCws8HuV1uoH8
	 BPI8z59d6K7Q5W5q05iLdDfhi9xrYX+uEz8AbIzfzsrtpLj6qljCpNtMdumHBjDMl8
	 FAKzeGuPqDqtSs3i3pYIHEfCZz0XAHs8s+mYSMw98Md1jjITtCRJzMoZoGtbX82Cv4
	 8SsZCHJX4vEKm96Q+3qa+zLe4BnWjKagS0rrJzwRQ8cFISKHv811+a8c3QJ8fIf5e6
	 r7XPGomqZ35bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A6C6068D;
	Sat, 25 Apr 2026 10:15:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F342DF
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 10:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD9E406C2
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 10:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIPEtDE6H-Ht for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 10:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59CC9404D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59CC9404D9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59CC9404D9
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 10:15:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1w1F1d1Hjs-00YJVp; Sat, 25
 Apr 2026 12:15:29 +0200
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 25 Apr 2026 12:15:13 +0200
Message-ID: <20260425101513.784747-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ldCZqfVCwIKxiH3JxMRqSr/BG1QMwtGEm07K/doFwQuBdGUykRU
 cNru98u9NIl06VBx7UU4TWkYGBEVsf7GBJD8CR6jTqgUzm14Ue9BBWAxgukjQeqPcRXe4V5
 jnWF/nB5qauEevj6QiX4ggfkyOU2+f79LsN3ateCrMjujiNH44dCmjyv+QBKUkzZiNM44De
 FwvrjTUUOe3iFdk8107fg==
UI-OutboundReport: notjunk:1;M01:P0:L/Cnb5XUEZQ=;Oq6uyx39YXBzBWSdVrDJ0b9/F5U
 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
 GdbuiQ+/0NYJx+uZ0zCyabGEjGs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777112129; x=1777716929; i=fiona.klute@gmx.de;
 bh=QyR/wzqODdrd4xqBwpMVLV/xnPZLXNRJR5cD8CwlDZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FNoPCAq+yzrEJ26N4SzLapn4K0oG04ilzaWzWoFBgEnCdSWSdLwqR0R7glFNmmeG
 wq4MnYSIjFGSJH7TII1y+7lTGVqhd5TrIpdOfVmPgXGMg9gt13sXqtp/mL8Tjxr32
 QlMvncsVvzreiQz2ybX3Kok0tirrugwN0icNZh5BYGCRMzAlxeceph8DPz9HBhj7r
 O41Fdf681VZrWPxGrJQkFyY2o+J7tpXSMQ84xpvO7H9VetBembTuZsOkA4pa8O4GV
 ZdFSSHJzPnF34jOtMkMeWH4Vb8kllk9zPy7vN+4FQOorCZjBTfRKkcewTWWDmsZwd
 Tqn0WFKLKhLF/U2ZKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FNoPCAq+
Subject: [Buildroot] [PATCH 1/1] package/network-manager: drop obsolete
 dependency on host-intltool
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

NetworkManager stopped requiring intltool with 1.40:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/56b51b98fbb8627c4c09a483702e18fd8aee7ce1/NEWS#L434

host-gettext is already an indirect dependency via package/libglib2.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I hope Marcus' series to update NM to 1.56.0 [1] can be merged soon,
but this patch applies either way.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=492286

 package/network-manager/network-manager.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 76f4b09fbe..763caa6754 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -16,7 +16,6 @@ NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
 NETWORK_MANAGER_DEPENDENCIES = \
-	host-intltool \
 	host-libxslt \
 	host-pkgconf \
 	dbus \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
