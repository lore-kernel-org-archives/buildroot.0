Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B88C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C97760AC3;
	Tue, 20 Aug 2024 18:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4TeJ0PB42uQ; Tue, 20 Aug 2024 18:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3477760AB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3477760AB7;
	Tue, 20 Aug 2024 18:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334A61BF575
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 18:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2121B81271
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 18:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeWnfUHAto_u for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 18:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.154;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79C0081204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79C0081204
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79C0081204
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 18:52:52 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 09055311207F
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:52:50 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id aVjRvmFdeE3F for <buildroot@buildroot.org>;
 Tue, 20 Aug 2024 20:52:46 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id 8E3743112079
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:52:45 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id 751763172481
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:52:45 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 20:42:34 +0200
Message-Id: <20240820184235.15351-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1724179966; x=1725994367; bh=xTbGB4yRkB+h5Wo7BX0
 ZlCKYJUAmmuHA6dcBDiC5WJE=; b=q+yQ7Z16StZbxtcq0kRVlLT4+1VX/v1zm9k
 odepNNpDcTNitL0k4+sffENm21w2V3ETZvKDY+nXbNtTMYqNnbXNxNwhnJ4VqmUP
 I1QNlAT4sl5qRBf2yKC8UTP/YZn60awx/vATNbM3MybNgg+73N2GccqsPf5JZZxN
 WwvWiPTgZRZG8MazukmD04uq6PICKfN9U8+CDTz1gCkRU67OpjR8YeakVyY3jlYc
 mq+eF6VAJWcBQfseqKzGsIvY7/SjEggsZSSZB5DLctYbPLGMQCuiFDKyAAZ4MxXv
 Hs9PfCMxY5wRY+CIEA1rcJ+Plb3SNO5vrZ0Br9JGm6HHu+O5WRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=q+yQ7Z16
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/shapelib: bump to 1.6.1
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also updating hash of the LICENSE-MIT file (only copyright year changed)

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/shapelib/shapelib.hash | 4 ++--
 package/shapelib/shapelib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index f542ee79ac..dfa7ef3a34 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  19528b24377241705637320c367943031ad5088665d1fb0e1eaa52a71264a6c4  shapelib-1.6.0.tar.gz
+sha256  5da90a60e25440f108f4e8e95732bfa83ede13c8e0c2bcf80ae41006cc8ebc20  shapelib-1.6.1.tar.gz
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
-sha256  67f1348ec73ef6343f0dbb3fa0612c321da4073e1ee68ffc99fcd3f2d2a65813  LICENSE-MIT
+sha256  3f46082162242563bf4f43b091871cb19064bc5a398c6d2b024f6b64c6710516  LICENSE-MIT
 sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index a36a65f80e..f7c3056844 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.6.0
+SHAPELIB_VERSION = 1.6.1
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
