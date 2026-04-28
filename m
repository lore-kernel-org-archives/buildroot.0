Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D09FF886C
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 21:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D444082F;
	Tue, 28 Apr 2026 21:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcMbEKVylabF; Tue, 28 Apr 2026 21:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1CC40830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777413355;
	bh=y1GaKRTF48hpjN8EW+nJ4MRiBBW2F8cMd9WfA1FETKw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H0/x2nMIAKHBj6EE2rvZxNQF5KeNp341OEC+/AiplDdOzpHnAkVUkNRynsrLP6aeN
	 nQkZfsKZeiK7fMiz27j2wPqH3EzkVznuN8cfewNdvf6eSA03Z0pKiDpllWdWEcf4bB
	 +AvQ8VjGEFr9DvBkTsPK0iZwOXHhVpQuDjft0N3EMgvoyL9s32T9o/TK7P0uNWVyLL
	 pEUakyP+wUp4+pET7xTHS1eYKwVAyoZn7/Ax0NEwYt07okIbON972P7gbtuxwKwdKr
	 WUoueV4ohH/nGP2IdPkvWdK4KO57SEBVK9kKiNLm5Twld0OiY2kp7hbsUQXIJFkDvx
	 Js0uCTQbHHrAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1CC40830;
	Tue, 28 Apr 2026 21:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37661231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 21:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2930740369
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 21:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rD1499z2oFS1 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 21:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47063406E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47063406E7
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47063406E7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 21:55:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id HqPDwnFFeiOfFHqPDwblgx; Tue, 28 Apr 2026 23:55:47 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Apr 2026 23:55:46 +0200
Message-ID: <20260428215547.3059152-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPq3RvdJfCWHJyFPh2o7XdA8pXHC0OewxnQcS32SPsnctxViA0XVsCmNfAArYMxxmmMRJaHJGrb83P4hYS+b7DJJWVyJoF8qxfJw/kpyLleGr/YB1Sy+
 tK8d61qQhUQsNcYHQbECtSIxezO+0suC8VlexaTdCnMliKILgYEr0AXCEnSmX1qapC/K6d2uu1AHg5ug/qQ8LeGbE1QeyLjPMXAMcIYCaC0oxBPZPG60oyRn
 fEzspYyDuqQ6hTR4VbyfQqKw9xbFXXZfgmumJf+2m/dOiFM9ACiy+17rYh+hV3w24yBg0O2ScbUY1qBzlu6Cgw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777413347; bh=+72WgXsvS9EHWfIDGOA4iOPBItMBW4Z+O38twmw+slE=;
 h=From:To:Subject:Date:MIME-Version;
 b=DkK4Mza9VR36Y9iQ4jqIywOpxDh6qy4n6UkmKwtGLeRB8nylWWd5+cxnXsfjPKCOM
 xXu0C5G9a1Xh2DzeYkn1NT8trgefAs6VK0Uabo8K+QAuHgE0fjM4GOZIKypIWj8pZU
 XmLH/Cl1NfMKRRkES790fZLbWIN9qCACU4olBtZcMU5eOF5Gq1HbnCHhkDzksflGiA
 sKXZ+XPmf2T9rwtlbaTFCvRO6Xg3FJ/Ciuh2/TcHRHW8uHmsUAJ+F3XhqYmVszQJKu
 zRqXq4fPrIvKUGE6MYJsj7EYKlh8geiboz7Qxh4fTA0Bt0sdmMx9HCyCbKY77eCGnm
 WSnxc02TXVwSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DkK4Mza9
Subject: [Buildroot] [PATCH v2] package/erlang-jiffy: bump to version 2.0.0
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

Release Notes:
https://github.com/davisp/jiffy/releases/tag/2.0.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed LICENSE hash as pointed by Julien Olivain
---
 package/erlang-jiffy/erlang-jiffy.hash | 4 ++--
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index b5cbb99f0e..615bd02104 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
-sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
+sha256  d4ef3fe9a231f4fa3d2f5b4be905c2d2a116b96d56433c66b5d7bd2dace5d52c  erlang-jiffy-2.0.0.tar.gz
+sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b0839210d6..55fb14c000 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.3
+ERLANG_JIFFY_VERSION = 2.0.0
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
