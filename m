Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F815C5B56A
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 13:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DCA80DC7;
	Mon, 10 Aug 2026 13:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDpG-aR92ipS; Mon, 10 Aug 2026 13:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E43380D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786368463;
	bh=4O2sopk8iXOoP7QnYf/KBQOmsFP8bIIUiNyUb67Ertc=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aAckJFDZqqAf4fl3sNyqrSy7WVDjqE2Nom/chELyQujUdLY4t0a3HU4U+xwwJwJbN
	 5sg4zp6wD21TyZhxv1RCI0Q0TFBlZ4QVnD7TwYrR2P1KYGgt6nN8j2wKAy+3MGrHx0
	 2JnAG9qk0Ruo779kqehX94XfDgmL7rIKsU5hwuMTdtSo5W/+nSJY2i07w8dvUNL1Ep
	 Bv0jZRQv/b6IIu63xzLV+AmaxhDkwaF4TJ2G66tHnh+MTaFdxWmWrOwj12JmoySgQy
	 D3WwHW65qnL8XTuhChtb/8CIFOxwDm3GLsYy7RVrnbju/BeMzmqG/NZQnQsZYC7n4d
	 qbdLggeYOYpPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E43380D77;
	Mon, 10 Aug 2026 13:27:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5FE5218
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C76360706
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIvufpjejTwd for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 13:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D084605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D084605D5
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D084605D5
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:39 +0000 (UTC)
X-CSE-ConnectionGUID: rE0OCgTPQRKFp06RKrf19w==
X-CSE-MsgGUID: zo0/6h6ISaWtlHSg0DOf6w==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Aug 2026 15:27:36 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 15:27:36 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Mon, 10 Aug 2026 15:27:35 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 10 Aug 2026 15:27:34 +0200
X-CSE-ConnectionGUID: SKSwJrZjRwuqiVwhEEnM0g==
X-CSE-MsgGUID: UrGjmgbXSmGRvDQnrOqcog==
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; d="scan'208";a="463495170"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Michael Klein <m.klein@mvz-labor-lb.de>, Vincent
 Fazio <vfazio@xes-inc.com>
Date: Mon, 10 Aug 2026 15:27:33 +0200
Message-ID: <1c264f491bca97b6a782caf58145b26014d09f9d.1786368449.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786368449.git.yann.morin@orange.com>
References: <cover.1786368449.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1786368459; x=1817904459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXlEJ71EhuMXdDlR6FMflv9XUxY0yxOb0VmauFnqn0c=;
 b=LTGfkDVy57zYNbozhVyU6vuQvVpIo3aV7fbAsDIP7uybtCGn7VTXdxgs
 OSgh285Iy7qz46Ij0Rm8yQZxuTRBgjj0BhWpT5YgF4sIKii+SBmcSgqb7
 4gAYkHicRNbsqdJjxNpGzBTB6getKVnpAW+oKGWHuGLmnT4+7fClu6CVI
 zXi0ZXFUv/O4/IgytWBKS1KmiSJOmNuN4zZBhKSYL9srcpCkRE0HwZSJd
 /VgGKQV4KgtuYKr2itDws3/DGzxKn9Y1srvhWissJUeIgbEbxekN4gSv9
 1mXM8V4Z7LThYWBDe1w+y1B7fYQIkgo3Wq4tMi+1yIYhRA3Nhxldhfarj
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=LTGfkDVy
Subject: [Buildroot] [PATCH 1/2] support/scripts/size-stats: prepare for
 more .py associated files
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Michael Klein <m.klein@mvz-labor-lb.de>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/scripts/size-stats | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 79c0dc571e..fdcaeaa546 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -54,9 +54,8 @@ class Config:
 # pkg: package to which the file belongs
 #
 def add_file(filesdict, relpath, abspath, pkg):
-    if relpath.endswith(".py"):
-        # also check for compiled .pyc file
-        add_file(filesdict, relpath + "c", abspath + "c", pkg)
+    for relpath2, abspath2 in get_associated_files(relpath, abspath):
+        add_file(filesdict, relpath2, abspath2, pkg)
     if not os.path.exists(abspath):
         return
     if os.path.islink(abspath):
@@ -65,6 +64,22 @@ def add_file(filesdict, relpath, abspath, pkg):
     filesdict[relpath] = (pkg, sz)
 
 
+#
+# Returns an iterator over the files associated with the given one
+# as a 2-tuple of (relpath, abspath).
+#
+# Supported files:
+#  *.py => yields the list of corresponding pre-compiled .pyc files
+#
+# relpath: relative path of the file
+# fullpath: absolute path to the file
+#
+def get_associated_files(relpath, abspath):
+    # also check for compiled .pyc file
+    if relpath.endswith(".py"):
+        yield (relpath + "c", abspath + "c")
+
+
 #
 # This function returns a dict where each key is the path of a file in
 # the root filesystem, and the value is a tuple containing two
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
