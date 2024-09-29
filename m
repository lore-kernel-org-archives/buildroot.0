Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA54CF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 16:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B63540353;
	Sun, 29 Sep 2024 16:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EO0XfC9s-TUy; Sun, 29 Sep 2024 16:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AEE640345
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AEE640345;
	Sun, 29 Sep 2024 16:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 885EC1BF29F
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 779A981189
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 16:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-TiZ42WkuOX for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 16:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DC9D80F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC9D80F73
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DC9D80F73
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 16:38:07 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 71A9AB00571;
 Sun, 29 Sep 2024 18:38:03 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 18:37:52 +0200
Message-ID: <20240929163752.1493752-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727627884;
 bh=G0ZZ4JFBmhPkle6HpS/6S2NEvyYx+i8Q/8hQZ87KXVk=;
 h=From:To:Cc:Subject:Date:From;
 b=jmuksj9FcCkIvyzt3GJV3lVDMEXqP63mwY4yluoTOkS/Bn/HvHluSUOShwjQHQqua
 mQNPPDpAaS/nI7fVat+tVz9GFgEDjXrkg/JZ61SQTMYrXBpik9zyP+oxNanCss4yFh
 itNltEUT00Rca/GwvYivF4P2JUApjiiFYmdCWKge7uQCYi+Q7Oba1Q7w+XOCyDROcs
 aqtoMHpCXgybwdnsRFLu7kd8HPZsHZvK/wqvUr3EJN6XlsABaXiXW41MrWWUg+tgZb
 k2uAmSJpE0Zztdi16l7jsnRO03eTC+mQES4uAsoZJEmbKK2ujMfBxfT47DI17btqep
 rJ+U47+ifvTGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jmuksj9F
Subject: [Buildroot] [PATCH 1/1] linux: replace host-python3 with
 BR2_PYTHON3_HOST_DEPENDENCY
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit abce4a2b3 "linux: add BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3" [1]
introduced a Kernel dependency on host-python3.

Since the Kernel does not have any specific requirements on host
Python modules, or recent host Python version, this commit replaces
the host-python3 dependency with BR2_PYTHON3_HOST_DEPENDENCY. This
will skip the host-python3 compilation if a sufficient version (3.4 or
greater at the time of this commit) is already present on host. This
will save build time.

This optimization was suggested by Peter, in [2].

Note 1: this commit was checked to ensure that Kernel v6.10.9 arm64
defconfig (which does require a python3 interpreter to build) is
working with Python 3.4.

Note 2: BR2_PYTHON3_HOST_DEPENDENCY was introduced in commit b60729784
"support/dependencies: add a check for python3" [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/abce4a2b365276a7fa081d327289e5e6d8bdca7e
[2] https://lists.buildroot.org/pipermail/buildroot/2024-September/763967.html
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/b60729784ab1c2f75dca30f924f4dd3176713ae8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0a213d17b5..111a21f039 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -139,7 +139,7 @@ endef
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3),y)
-LINUX_DEPENDENCIES += host-python3
+LINUX_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
 endif
 
 # If host-uboot-tools is selected by the user, assume it is needed to
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
