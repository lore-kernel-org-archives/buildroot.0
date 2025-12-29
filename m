Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBB7E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 11:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A1E040510;
	Mon, 29 Dec 2025 11:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebT2tkxsWV-i; Mon, 29 Dec 2025 11:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E885A404FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767007536;
	bh=WwBGJiqVn/Dbg2q9ItUeecKV19XwllJ5AGpH3QFEM6w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YOtP+7PRko1u78UvWa+3kIm1pzf2YH3O9OZ9wQ71AR2H3+DlRQZMgSVcb/IyVZ6q+
	 OpT3Ch5jtwmoLoy87pbnf8TjyIz4mHEAk8lNwrBi66vaT5YOWOyHW2UdqaLeIH/yun
	 2M8o7nc6hnW635hZeoZ5wyzbKn1cCpJ9YsWzyNf9edSLMR36ZZ/uvxAqa0NhcJi+nO
	 akQTvY9ri/tvuOgOX6w7F6MPacpD+9kWvVwwsSw83n7itHp3vtgrWt3nf5XXPb/BnM
	 Jhlop5osFtqnof11X7kpErHnawmKj1g/2X7a6eM4d4s+8ORS2EFrfhrFdeqSplAztM
	 ydK4Bwb/4jC3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E885A404FF;
	Mon, 29 Dec 2025 11:25:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D114D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F2C540459
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnZl_EqrXmgJ for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 11:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CDF0400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CDF0400CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CDF0400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A066A4C244C;
 Mon, 29 Dec 2025 12:25:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44552)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaBNG-0000000055A-3Oqg;
 Mon, 29 Dec 2025 11:25:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 12:25:16 +0100
Message-ID: <20251229112518.2317328-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229112518.2317328-1-bernd@kuhls.net>
References: <20251229112518.2317328-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767007519;
 bh=fPv2tVNbVXEweP9IJhBnww+RoV1Aid9Z9+IV4Qkv4NA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=stIZWk8LkKZnAv7O7zKVSf6J0rgJuEKcugcMkt0RGBbktm64zZvAzstWLuIA93x5v
 PjHaI1GdngwU4UQHALQQZv+CE/JkUVPyFlgoUZbOlLaRlvqPOmzLJo7zOabf5l8ur2
 2UeUqPXhG1MOgaT9ov9do3sY0RTSWyx9sEYMGjbK5DYV3x+hw/SwE17QZdSIk3LzEZ
 Z/QjATwZKSP9Au+uJg22Qavj0WBeuTDYrXv48ULEdRu+AYZ8xtWk1Kztq58v/gg0tn
 obZPNsxDXRS1nR05FoDvvY9St4qwC9NtFVDHJpuYFuJ+e55xK9jA0oz79O/2ILegli
 MiEJQS89Wtikg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=stIZWk8L
Subject: [Buildroot] [PATCH v2 2/3] package/opencv4: update numpy include
 path
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed after bump of python-numpy to 2.4.0 due to upstream commit
https://github.com/numpy/numpy/commit/923f219077c8aa3ad7d3792d8c06cba010b70252

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: new patch added to series

 package/opencv4/opencv4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 9691eb78e8..ff4a1efc94 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -400,7 +400,7 @@ OPENCV4_CONF_OPTS += \
 	-DPYTHON3_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DPYTHON3_INCLUDE_PATH=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON3_LIBRARIES=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR).so \
-	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include \
+	-DPYTHON3_NUMPY_INCLUDE_DIRS=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/_core/include \
 	-DPYTHON3_PACKAGES_PATH=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV4_DEPENDENCIES += python3
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
