Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF957C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 04:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8946640B03;
	Fri, 18 Sep 2026 04:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfhcQ7x8O24d; Fri, 18 Sep 2026 04:45:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3119E40AFA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789706759;
	b=sZSUbeJCpxSp65LLuysOsqCUUKthkH2TfoJkRflotxwZFUFrUkcCmpUF4Iw54tUX79Zp
	 6a1iQclTunk1962LkkrW/qxy+aSuuVEin4OQHMmCxATQnl2ugEWlecAfaMcePuAV/tJ0H
	 G6u9TdEsEc4zAv7Lj5gVBEyAAdJ7mvkWb0qDth9CbSwe23Fxvqat+nV3TVG/ASXoYfcwm
	 hpxcByDnpixSClnVAowEQbRtPTqBrH9nQG9wAUNiOrJpxKi/BA1QIj46IjP14P8KhCN/G
	 HS3cy2r5Au8Le+304NpZC9KtIIGq1/gpHiIFLZb2sKk1X4xuu9NgJbbT8OrNECRdNFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789706759;
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
	b=fCYiz8pYdxI8dDnlFK76QUr6mmxJmxUBDtzLqqXOVdwtsXdWLdYht2cNtsKyZ2Ss9QxZ
	 WxGQ8HjmBtcVBF0fU5v5q39wxNZS+SedXfiP+rx02Qi7wppiVeDOcL3GWEqQclkOZuAsl
	 hQ0WZaFqXmCY1qqVtqtAXg1nkDDTIID/y1p3PaFll6GQaPAudIptYs7penBwAsPbymqko
	 8KvydxQPh0mc/6+ynaMFh67nO8XALpiKwX0BFHi1BS7vHgbkpMIMLMzW6InPCW/TFGQBy
	 bRyReygevzW5gj7CDynz+LcrK5N9YfXk5TBfBS7dQN6tA8nX4GTu8xPijLJ77286rig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789706759;
	bh=PLYMYfIPYeVSAfC/NnTu98onHK4AvFLf4ciN1/W2byU=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLcn9uo87cd5RPm24PgXDKmR6ySeEpmBTZheS5D1AZXnEnO5Y4fwlHpJGDap5pfTC
	 GQOEBNj9zSTtUJsfRw6Ns6FMtqgGjUefCJIOGdgxzj3yxNW8ofEPEPsC5YXihyiEVA
	 ZMps2xYRti9EI2afEtGwFzBTxx4uHFpvLfPsOBjx2hrh+NcZMikLeNXqHd4sPbQYxE
	 wQT+elvS8r74faoAoYOm2wdaO6HnP7fKulYZvaoFjQrJEknyo1EB2zP7Ck+0USbvgU
	 Nkjzcv3aGeUL5R7/4FE+h3Ren5m3zALJdlP+5P7LeNgqYgDkUvAbAkF5HAtmYe/Syz
	 KJdXQRwmB5L5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3119E40AFA;
	Fri, 18 Sep 2026 04:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A94B03AF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9051B40492
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_zn4jLOI7jo for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 04:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 548BE4008E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.210.124
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789706755;
 b=oI9A6bE14WdEA7IdRx4iKxQCGngKjQ/ug6dSrm87mJq9JzPsbcYbPWfy7h3hfIE+/C9N
 kXgHI2S5l97Z/Ug6ZJs4Cn74eHBFPnCWqkO9DIy+IT9Q+Tx7LT7VWmNmUQ4e1gtzzDzGe
 6ko4LE7pgU7uXiSL21OKG3z/j8telltm2+SXlO+dcH+2Rw5RETcEZ4U7ImwA/px7QlemH
 SBwAYAEnKgjWPAR5F7O4I0fARYkOPeZtTvtMDQQKOI4CI/SugEwvU7TE4Qmq9kBQjHLEc
 aWiqGkz8PXqdfvzTp87qJnoFVjQAJ/kfZu2HAH0TTfLckXq5hO4Kuzl170k4+r54pLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789706755;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=8bS7yHTiVsya7vuEeDQxvHqKTvVKpCxC3ECklI9ywRg=;
 b=XYQTqhNEvJ3YDpxBIXzN11PnRJvPm0o6usClagAIE5gEQjc0SuhSVA6FcM4Ax10Tn1HP
 GYbi865XxywoU9dWEDdkrwvgFDluHIAzZubIlxWapKzRW8ylXqKL0DUIPdjvEGpnD0XPx
 7j7E0iS+eV3fmrkEtZEKliVrfJj3xAkm3mhKgO5tKKHPJEm4Qc9vRey83ZBvWqOzR06b1
 drhufj8+sL7Pg/JcFFJyv+6QGFezDTvvoCHKS0jYU7zdHvZqhh+CcyJhCpduC0iWQSXWc
 gajBKcadzf3AhKAKmvgeQXXbSGBD2/c38Xv/bfM79rIC4DasKIBvSFsOG1CBswr2yfA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=NJOaOKJ6; 
 arc=none smtp.remote-ip=80.12.210.124
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=NJOaOKJ6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 548BE4008E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789706755; x=1821242755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bS7yHTiVsya7vuEeDQxvHqKTvVKpCxC3ECklI9ywRg=;
 b=NJOaOKJ6x4wBz612lPBOUOIS+ep94kcnAaQLE6Z9c/9t7tJbV5l5ZZ56
 MXlpgQQjzMsrPsaqoxJChsJSAZXyU7N+vOGY1hX4xZXqnNU/ngb03pwlu
 sNDvfChVe/U7iNDLRkPi0njWc2KVrFmJwpswAqb4epSHZenozEF36YBoQ
 byhWJXIU8JVfayz+ltOzNI0/M3mNds2tuZKqQH9w2LqBdIfGNN9qTN1z6
 LxlrMjDWZKQ9Wo2nlJdYZmbylIkhLnsxYUa2AYxiu3WZ5Mo1g9OqS2TBN
 NAnp6qw6yGr0Z+TXDk80J156cEX1/7WofC9UCXF/LWYjbrjIKfC8x+ToO g==;
X-CSE-ConnectionGUID: w3TgT6LgTXStxQyFuMmF/A==
X-CSE-MsgGUID: GiNhuiHGQK+IC4c0iT1/pg==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 18 Sep 2026 06:45:52 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:45:52 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Fri, 18 Sep 2026 06:45:50 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 18 Sep 2026 06:45:50 +0200
X-CSE-ConnectionGUID: sWnXAAkyQRmUJYfzDPf9Ow==
X-CSE-MsgGUID: ISheDwrNRLGSlUkyirx4oA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; d="scan'208";a="474346809"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 18 Sep 2026 06:45:48 +0200
Message-ID: <71588ea1ac7d7cc7f5f5f30fcb9c02e84ec12ccd.1789706718.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789706718.git.yann.morin@orange.com>
References: <cover.1789706718.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
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
