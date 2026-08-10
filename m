Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374F8C5AE49
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 13:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A866D80D63;
	Mon, 10 Aug 2026 13:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vbw6taFKjTNQ; Mon, 10 Aug 2026 13:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27B7580D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786368464;
	bh=127gLJcxDBYlhBnNBYc6fC0Z88UV82OD0jlY+xbbP1Q=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2szpLK7w5aynz/avwhxqD/wHy0+LAqIK70xF5XknxRCyxQtKO25VOVOpwwDXBUex
	 hsGzVY88P3r6QPTxCYbT46GiAmi5MXkLUVay9T4Ml1Xiedpm5IcGloEAFcptnFMO5R
	 7DfOCmmNKrLOLm0DkRID78G82M66jX87UsQDQxWFbCDYuggcsT+wLAngjgv+4LMjF0
	 pV+1LYu5gwq3FTcSzlEETWQwNEuxriZwhfJjVYdQ1JjFpzCW0uDzMGy5D1VS6JXhi4
	 lRuq77wdsP0GiBeqXksQj5bab716/E/vUznRFxCxuKZ+yKGASwUiLvBPJPvRw7eahm
	 ZLPBLc5nDnedQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27B7580D77;
	Mon, 10 Aug 2026 13:27:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06AF110E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E14AE6070F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHLvYg793LLN for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 13:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AC7D60705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC7D60705
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AC7D60705
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:40 +0000 (UTC)
X-CSE-ConnectionGUID: GXGAy4n+QLKeva1lv8YqNw==
X-CSE-MsgGUID: Dl8scj3QRwe91E1nNYoOmw==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Aug 2026 15:27:38 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 15:27:38 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Mon, 10 Aug 2026 15:27:36 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 10 Aug 2026 15:27:36 +0200
X-CSE-ConnectionGUID: LF5BaGoCQbiJn2plxPXcEg==
X-CSE-MsgGUID: 1g35UO8WQGyZtOphurh2Hw==
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; d="scan'208";a="463495174"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Michael Klein <m.klein@mvz-labor-lb.de>, Vincent
 Fazio <vfazio@xes-inc.com>
Date: Mon, 10 Aug 2026 15:27:34 +0200
Message-ID: <c45315df9f1084fe0f6f932e1523cfa9c4e6d992.1786368449.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786368449.git.yann.morin@orange.com>
References: <cover.1786368449.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1786368460; x=1817904460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28OfV5C7tp/zBzYb5FVJIzokyCcaP3MJt5Jj/aOl114=;
 b=ZlSRcsjvuuBGrTzNBm1tnCFMYMyY3TKQSePBgq153iMukMthpvrNhRLV
 wPwhrIR8DV/usc2yw3+DZU+Fo3/2Ln2UM50NWcg9Y1/THZIh72VXucvQO
 e+5IYm2nXtqRSs6jT2TTF5fX7RFPuI9IhjLkJR4RCA4FB3cGE8g9LpPAu
 z3ednyF3ntJ2GtFk4vZLxyW5cCoTPCpsp5zE36DADnHYVdi5o51fQUCrI
 AaaV39zsea7lArNvihvPW9wHpRINebHcCAZV5npho2FjTtA3HYwgZte6v
 s2ScvhuoBfYf0lUjde/mIZ2wDjQ7nUD4Xn17DF5Sfkl8Ml3EsdNb3BpSn
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=ZlSRcsjv
Subject: [Buildroot] [PATCH 2/2] support/scripts/size-stats: properly assign
 pre-compiled .pyc files
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

Since commit 3fed42456693 (package/python3: use the provided pyc
compiler), we abide by the PEP 3147 guidelines on where the pyc files
are located. In practice, this means that, for a .py file /foo/bar.py,
the corresponding .pyc file will be /foo/__pycache__/bar.pythonX.Y.pyc
(where X.Y is the current major.minor python version, e.g. 3.14).

Add support for this layout in the size-stats scrip, which so far only
supported the legacy, pre-PEP 3147 layout of having the .pyc next to the
.py.

When we associate files to a package, we only have the original name,
and we must construct the associated filenames. For the .pyc, this would
require that the version of python be passed to the size-stats script,
but this is not so nice. Instead, just scan the pycache directory to
find the corresponding files. This is not much nicer either, but at
least the wart, if bigger, is in a single place that would be easy to
chop out or rework if need be (e.g. if we need to add support for more
similarly target-finalize-generated files in the future)...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Michael Klein <m.klein@mvz-labor-lb.de>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/scripts/size-stats | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index fdcaeaa546..9a0aafbf2e 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -77,7 +77,23 @@ def add_file(filesdict, relpath, abspath, pkg):
 def get_associated_files(relpath, abspath):
     # also check for compiled .pyc file
     if relpath.endswith(".py"):
+        # Legacy .pyc next to .py
         yield (relpath + "c", abspath + "c")
+        # PEP 3147 layout
+        basename = os.path.basename(abspath).rsplit(".", 1)[0]
+        reldir = os.path.join(os.path.dirname(relpath), "__pycache__")
+        absdir = os.path.join(os.path.dirname(abspath), "__pycache__")
+        try:
+            for fname in (
+                fn
+                for fn in os.listdir(absdir)
+                if fn.endswith(".pyc")
+                and fn.rsplit(".", 2)[0] == basename
+            ):
+                yield (os.path.join(reldir, fname), os.path.join(absdir, fname))
+        except FileNotFoundError:
+            # No precompiled .pyc files
+            pass
 
 
 #
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
