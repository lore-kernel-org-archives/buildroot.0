Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50AAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 16:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335E18322A;
	Tue, 31 Oct 2023 16:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 335E18322A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0Mbwl1rOiZ5; Tue, 31 Oct 2023 16:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF6182DDE;
	Tue, 31 Oct 2023 16:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF6182DDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7021BF39D
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 16:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1445341E89
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 16:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1445341E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFLjYmThzyhe for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 16:06:36 +0000 (UTC)
X-Greylist: delayed 954 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 31 Oct 2023 16:06:35 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829B441E7B
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by smtp4.osuosl.org (Postfix) with ESMTP id 829B441E7B
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 16:06:35 +0000 (UTC)
Received: from ubuntu-jammy.. (unknown [223.102.86.35])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3XwhJIkFlFJnxBw--.11487S2;
 Tue, 31 Oct 2023 23:50:33 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 15:50:29 +0000
Message-Id: <20231031155029.2689-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3XwhJIkFlFJnxBw--.11487S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4fCrW3Gw17ur4DAr4UXFb_yoWDZwcEyF
 1fGr18J398WrZrWrZYyFn3AryrCw17Jr1kKFnrtrn0kr40yan0vwsYgry7XF1fGFy2gr13
 Jrn8Xr1ftrW29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRf-P5UUUUU==
X-Originating-IP: [223.102.86.35]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBdgsajWDkpt1r+wAAsF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Eer+n
 8DIDluYRWv+1F1UIO9k970Rq/xY6usA+WGxE4Q=; b=kZc1wNjAbJ+lmQHl1XFYK
 sLBVZIN5wcCYYskxGT3dZ7yAdwy4RTQqEf/1Cp+lomzB9cKHapvrWFUPe7HmckOM
 GH8kwYz9diy08ZXRS7hefmIYJehjXQyCdINTkyJv3CGdVh/UZiKIm+7rkdeYZnqw
 Lx+qVf69IV8Xk2grZnePjs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=kZc1wNjA
Subject: [Buildroot] [PATCH 1/1] package/tini: move docker-init to
 /usr/libexec/docker/
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The docker-init is not intended to be a user-facing command, and as such
it is more appropriate for it to be found in /usr/libexec/ than in $PATH.

See:
https://github.com/moby/moby/commit/6caaa8cadc9e4f1e122b7b2bb4451500bbec6086
https://github.com/docker/docker-ce-packaging/commit/5a998af6f53d978810aa6f5b566a484911ff4ca2

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/tini/tini.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 9da54f8a25..75b6786cfb 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -31,7 +31,8 @@ endef
 
 define TINI_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
-	ln -sf tini $(TARGET_DIR)/usr/bin/docker-init
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/docker
+	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
 endef
 
 # Tini's CMakeLists.txt is not suitable for Buildroot.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
