Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6235C88E50
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 12:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB85606BA;
	Mon, 14 Sep 2026 12:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXy88fp3w57c; Mon, 14 Sep 2026 12:48:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 907D3606C1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789390135;
	b=D1GtOtiFJvfsdgVDW9pJvQXDdaaagKcAy+B4/z128WKI/tut9JAd9EuyTQevteEJIUGd
	 8MW62mGlXrL2ZVii+bRpBafduSyTsRG/4Oxk3hoG6XPp3o8k28T208wI93ix1ZZm2xntk
	 lb5rZl+eGLv2wJ8liaPNirmy2y8j9G3oUwW7bJLo0jSL/Tw+UkKZWxogsksFYYisOkuv3
	 E07DtIbfMqbGIo/GB5tgdFmtY4x6mex3V6vTgIN9rC7FwaTsstTOT/CGlqw3hBuPHu+m+
	 yLsY94PNWYAzHJGBlRljJilVoNP43hwNSFn5mB/rmrvUpvI/vgqlrnHwqI78RGJTDXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789390135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PLYMYfIPYeVSAfC/NnTu98onHK4AvFLf4ciN1/W2byU=;
	b=nqjCCFPge1guw2MSypl3eeGa2uaI/TODmaRbXESM3O7AxYagaJMjF1/q55f2DNi41FzX
	 Nr6Auzs7CPM27hr4LgTFcQpx66O2GmkRjUUGNzbKMEkfhFbmjheEOsmxFUyBAnx5htkLo
	 qeLdU3jk86wnbTEqR8bKQdOmRI1GUYCg5Ps9tdK2xmUlFIRk1FpuEfkxctcpITMmV4a2W
	 hefijksaXx6E6n9EMDPR5ztEEp5gw1wE+0HsrC0Vhzjazd7fDMVKjWAY6xWdsuC7gb+Cu
	 wstV2URRiopz3+CS/PkVkp2Nyfam448QOg+7aw00de5ZFXOkI52B0xccJZSupW9YQ8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789390135;
	bh=PLYMYfIPYeVSAfC/NnTu98onHK4AvFLf4ciN1/W2byU=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ryj09r7PqxX5QIC3po5GOR3AzMGfspUohjFs/4OxAu/40fsN83KXElWLgQbCaF3vr
	 vtYmAMkjVtV8LfghAZjaKFJ+51il1PBwVqiH/hd4sPz04Jc0mqsxaa9JZdYEAfkeox
	 8fbekFQRPiVnXFA/s6D16GCD9vyxq1P4tCyujnk99a+WSV+lnJKRuDTi/ZTt6IR1nf
	 7BWDPyqjpjosPTsqMXMOqugtJysWsSfdpURCyVkdBpq5CgybmBLx6rsYsf+uvCI3my
	 QadK/C6CqIWuL4grrQi7+/7ReaKhvH7QmLH8MT9u+/ZQJDTWoRd/MilJ4yQE6gToIh
	 sYHSXDmZ5vZ3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907D3606C1;
	Mon, 14 Sep 2026 12:48:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5631BEB
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 539DB405E8
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Swqngq93jqMf for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 12:48:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B86E040573
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789390133;
 b=ldsdNXcbIHrLQrTuzUkJN1wfs+Zx9f/dtbpEk6t45dVBbjBnEW5ML6vQV7praORClylO
 //4XYoUQ7MATRCMZ0Gb1zcqvhuzKY79mjxM8djNc0mX/hepiUAhiV9FRbrdminY2TYq74
 y6w/rSI+DdOt6j3ELIf6qCqO02JlDbzUo0gGbA5CgoY02RDC8nof7hTNZ5bza0dGV/a6b
 Ve2zN4ks0sVdWlONe84rhxdozCSroBe13aH/ZIYYTKIxcvY4CtrlJPixG27/fd82EoIpO
 jl7/o0D2r2bxrhyOyMGgu2lyaP2C8b+fHVphcpMQF4/iI5QMrfuksbxwI7gfa/o3gzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789390133;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=8bS7yHTiVsya7vuEeDQxvHqKTvVKpCxC3ECklI9ywRg=;
 b=ABOEfrYkjwMuY6hIXyCCVnJN1hZ6zSa/3mUP1Pe59PUpwiPBVCGCIEKfi5h44sPqvFTF
 r4pIFDi8k+MjrjJPdtLiDhWEslEg+CQT9HBMLJlKqN+yzBJ+IITO1qsICINOFc6soNuBM
 36cxex31Td9Q98BK3Dlvi2a6qOrYtVSSPmz6n57MRmYgynApZ9G91JBtOJTvFGdUeQ0tU
 n0EWEGtQIPGCK7HbSQVHrjUjqb1r05eyIAuyLoQInrYk+OeJtDBqvkej/A2wu2T/AlY8T
 BYh9r5lVWgh///GnzD31mIJFq4EvzhkvKxlfpS3GI0p0bWRu5Om8iiXZj/wAlaCBR5w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=c3UAEvMf; 
 arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=c3UAEvMf
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B86E040573
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789390133; x=1820926133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bS7yHTiVsya7vuEeDQxvHqKTvVKpCxC3ECklI9ywRg=;
 b=c3UAEvMfqDqcyoBK8xLTUKrezCIv/R5qjRZ7JYFdezB8NbnGDof3RfO4
 0XJBrkZ4sZunwjV+WIX6PNL+CrKOI+wqVGSD3BL7zLJwk10V3Bu7Bq+uV
 L/7++DMwBcDqLTFDKmyscHHmPUgT1ZubjWWYgDhe3oizBWOJBKGkghhF7
 TZltSAR3/dha1FxbYiNY1rxLMtw66OM8dVIL6y6ukEYaXQA3ZbCoU5ulI
 cjBeB/3OkYanGlbfj3iG3XGfk6b+Ff1GqrvWhCU8dxxQUpxg1p2HU41wk
 Z6lxRRBqYzvhzb2mjEut5AUwCdvqImBTl+lnxTvHf89zQtMswY7AQUPBg Q==;
X-CSE-ConnectionGUID: yNwb6uV7RcmyYHkszay+3Q==
X-CSE-MsgGUID: OKazwFyuS2i/zuSOCmmiKw==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 14 Sep 2026 14:48:50 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:48:50 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46;
 Mon, 14 Sep 2026 14:48:48 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 14 Sep 2026 14:48:48 +0200
X-CSE-ConnectionGUID: ++KcqoNgT8+kbBLjr/0/ug==
X-CSE-MsgGUID: GKRmczq2Sh6GuQVh4geaSg==
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; d="scan'208";a="467941272"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Vincent Fazio <vfazio@xes-inc.com>
Date: Mon, 14 Sep 2026 14:48:46 +0200
Message-ID: <9e49dfb4368becd006de1be4977695caea90c237.1789390115.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789390115.git.yann.morin@orange.com>
References: <cover.1789390115.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 2/2 v2] support/scripts/size-stats: properly
 assign pre-compiled .pyc files
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
are located. In practice, this means that:

1. BR2_PACKAGE_PYTHON3_PY_ONLY: there is no precompiled file; this was
   still working so far;

2. BR2_PACKAGE_PYTHON3_PYC_ONLY: there is only the .pyc file in the same
   directory as the original .py file; tjhis was still working so far,
   as it uses the same legacy pre-PEP 3147 layout;

3. BR2_PACKAGE_PYTHON3_PY_PYC: for a .py file /foo/bar.py, the
   corresponding .pyc file will be /foo/__pycache__/bar.pythonX.Y.pyc
   (where X.Y is the current major.minor python version, e.g. 3.14);
   this is what is broken now.

Add support for this layout in the size-stats script.

When we associate files to a package, we only have the original name,
and we must construct the associated filenames. We could construct the
path to the .pyc file manually (like we do for the legacy layout), ut
this is brittel, and will break if/when python changes the layout.
Instead, use importlib's helper cache_from_source(), as suggested by
Vincent.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>

---
Changes v1 -> v2:
  - use cache_from_source() rather than compute the path manually
    (Veincent)
---
 support/scripts/size-stats | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index fdcaeaa546..c54ef7bc2c 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -23,6 +23,7 @@ import argparse
 import csv
 import collections
 import math
+import importlib
 
 try:
     import matplotlib
@@ -77,7 +78,16 @@ def add_file(filesdict, relpath, abspath, pkg):
 def get_associated_files(relpath, abspath):
     # also check for compiled .pyc file
     if relpath.endswith(".py"):
+        # Legacy .pyc next to .py, or .pyc-only setup
         yield (relpath + "c", abspath + "c")
+        # PEP 3147 layout
+        # importlib._bootstrap_external.cache_from_source() works on the
+        # path string, not on actual files being present/absent, and so
+        # it also works for relative paths...
+        yield (
+            importlib._bootstrap_external.cache_from_source(relpath),
+            importlib._bootstrap_external.cache_from_source(abspath),
+        )
 
 
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
