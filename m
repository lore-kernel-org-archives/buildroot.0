Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D67C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 04:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B56860BAB;
	Fri, 18 Sep 2026 04:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woNSQCBA1FiR; Fri, 18 Sep 2026 04:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F090160BA1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789706758;
	b=l63NJhs/bRNTch52ExL0KlmbkEu+GVNnl/bEZ1WStP0tYXaWO3wWL8SmUMcHFrLV0v0u
	 /L8LXikOCuNM06YmTmyejJGWdYu0HITvheChEq2p0sx/lcLxLoO1MnW0QUANswZswTDlG
	 Q08mol3tWoV9jgry4wQIsuF+XqtfcarEhgNFcA9fceqX54yn2NUNO9IZjGWAgju0bgXuW
	 73DAQW2S2Bc6PPABVCrxEcQDyl20xWUlID8f4e74nv+xDdwS+uzcngPhOMA3me8cC4lzL
	 yT2Gp4EzUiUDJnQGFQa/8Sqxpd736ns1ewtZFYKDDRIjARZ9DZb+Ozc+YeEhur5+4pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789706758;
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
	bh=UunsYtEIwfU4DZ48dUrXM6S3eYJu9BMORy2csIUU/Dc=;
	b=bGu2htjYT2prCwtxRfz3yx8nIUg8zge0myAwrVOjeM4qAayf/hSivYgZC0vZ/Tmm6YVN
	 hnZVZk0Ga0jpziguPi7Tle/inJwyCRYhPXDbw4wwiNtxAkctJcXTu4Zto3Xa0aNt/tyXg
	 2KoclQGPE/I9on6nMCvflYD8Wj6QTbRcqYYw0dol9jtjxxhhE64HYtevMn+DE15JttudY
	 ljfE2loSShZqsSRJ+zu3Mw65COBNK8AMc06Q8x5+pul6F2+UpuRGclhJecmWM7+fqFnGt
	 yOfrwqrGbQmo5q6qNb/5nG/TIHh5g4t7NhaWJ0OKNoWSfuLj7pTqp/XrKVTCMF6vqvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789706758;
	bh=UunsYtEIwfU4DZ48dUrXM6S3eYJu9BMORy2csIUU/Dc=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjEIOd1Qgp2O/nsDLMtfzQBU8RbRV04souFTGTKF+jcdnyzd+m/6zZevXhR7PVlfU
	 awsMzmBG5A66nvJPQIf4y3zLq/BtlXebd1oRYMS8MDgXCTWQpTHtUEj/XQEdI2Zn2k
	 U2qwZLzXmsD4qCvSMAUcP8U8PEBvdUHjQ0nZybkqbvhG4u15E1FGQpS2egthkXsdsJ
	 DGIWYrxlJxEfNRdeygKqXVLkSX5plvkxHKfaxmxiR//CjloXeueeTSSXW1gDic4y3J
	 eLyaZRCtE4LvnA+27KwqwFBP76KtaIYCYXIkwYmPg7a1WIhCZVWHrJHngUjgJHrcCG
	 DY0BgL6NvqKBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F090160BA1;
	Fri, 18 Sep 2026 04:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFBC213D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 964ED40AE9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzAnO3ItvCtm for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 04:45:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 64F6C40AE6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.210.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789706754;
 b=VG8S0KoyELzy5mUwuaFu4nim4MLxCFqQmbfohwc4OitSxA3UAKPY2O82zL2+YlXK1H4n
 rk2Nx/r/98Mcg0UD/gPAqsb3bstIid8OqZ6x/sYGDzYsoVhdPc3PBa12RSwspXv0osRSQ
 2SYdGi8idbgr7QEaLtFu8w6Bm9YczzrQ2hVSS2NTrHQUfxIz8xeKfbKdpJ3SeAUz5gIsb
 hDfvSwQ7oYuueP456XwlcF5tyzO3wXxhvFP4O4dddy4t8F4ZgrHepo7f4Nab+btsS6jSB
 MdV7Bkzkvvznla5Tsti/7LpG/Ms5X0fbA5kV90b++iQeUx37QiWzOimHuw3Tg8/Pj6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789706754;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=rsfuHxYeTvj05IuBMdL9a2XCkQZbsMMTAmExibZwkZc=;
 b=VEnwLBX6vUXSmtZ56TBUA9xZktPaD2sydSDypFJ0gLjFBYPcpUQtHXKAfmfEZ56Sa/Ln
 2DkwXHjBcJsz5hNZ8YMK3gCBRv8pmInfCsPZS512QFyZo4CMTg2M08E/Kt5UOAbPmJyCy
 flrSuoRL0gG6zS8ZAQ/l6UtH2VulJb1J1dDf0GuoWgo20KRSANdKgmWE9ROzLEuitcLbT
 pvEWuIrphAJctOh9bL4A9p56h1rUpzrd0f+8x3+UZ43WgjVIq0f0NJVHmW/S0TYuWeM0E
 T02Myz+TjY1ZTIOjbjKR/E/O24uoPZ2rQvdBqMGnfU4DTdroG2ZeYaPWfnLC7qwHftg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=XPZud71r; 
 arc=none smtp.remote-ip=80.12.210.122
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=XPZud71r
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64F6C40AE6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789706753; x=1821242753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsfuHxYeTvj05IuBMdL9a2XCkQZbsMMTAmExibZwkZc=;
 b=XPZud71rGdaeyg/Ph+f0WOmAmgtVogXANt+683EAL3P5eBJ5F20IGcds
 g6LucGWURqyXTX07kMhD//ZyEidU+EPcQbXMXi1XEuYaLLg2HCztLO4Oa
 DuB7hSe0NrYuL2cCUh81ACe3ydp6oJlCW13sFukNMkJXT+a15iPNId2bF
 gW28twL/bn7gfrtrKHV3dhNim8YNHpdPQZPFhdYGpg0dTIEJ7xymQQCH1
 /MFShqtaJldIueU+OnV4XUZR6TCs2qLVOBcBe2m909cdyI8LWKD14UuaF
 P93imfeVXnP1arQa5j5SyV7pWzVAy0kyPVczHAx94zMYAj+StamGDEOkU w==;
X-CSE-ConnectionGUID: k8mCZSMaSsaQArHoUVmf2A==
X-CSE-MsgGUID: fU+2UDe+SdSqGW9LcwBgyA==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 18 Sep 2026 06:45:50 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:45:50 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Fri, 18 Sep 2026 06:45:49 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 18 Sep 2026 06:45:48 +0200
X-CSE-ConnectionGUID: HQuMKHioSQG/UqVy/5a+8g==
X-CSE-MsgGUID: CatahRJJTWSXnsiPYLi8ZQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; d="scan'208";a="476098344"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 18 Sep 2026 06:45:47 +0200
Message-ID: <de6e973fcdaa48243eeabe441111d398a5ac2fde.1789706718.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789706718.git.yann.morin@orange.com>
References: <cover.1789706718.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 1/2 v2] support/scripts/size-stats: prepare for
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
