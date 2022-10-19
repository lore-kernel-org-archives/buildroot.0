Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BBFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB8A2402E8;
	Wed, 19 Oct 2022 21:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB8A2402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztWyLqf71ida; Wed, 19 Oct 2022 21:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDF9640543;
	Wed, 19 Oct 2022 21:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF9640543
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AEB71BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2499041BE0
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2499041BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddw-KQxqICkM for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8314941C24
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8314941C24
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:58 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id l3so9517502ilg.13
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCxUdL2TuPCHncNdxknmdRQYeAATlVWtUNLULt0Shlc=;
 b=fgShRM4ngFbro81HKGMs4IAwxHqE/4hQmvkCDieG/hGkcfgiJ8Qz7u6mHvILWhQyVC
 GFCHU5GWf8HErRh+IXMPWu29aNN8JceH9myBWbUA65dDTZAxh9/C35THLiUEPVr7h5V1
 0pGV8dPRpGzFgZYMOjBmMdu0enc0/9niGDHA7qPl4raNx3r3sqdgrfu3dit7Kv5eS/np
 SjbffPf0NsXWC5dPUKnd6uZcLxJvixK3PHcIbICEjfPfsyoxMS94KE62rJcu+Ph7WHvu
 tk6zeXxP6N/GeKOTiiwkhvixJTsv/ZIrNrPtlb5rPyOeb9hIoWN2rSvfYcDhR/lebwQW
 /gxQ==
X-Gm-Message-State: ACrzQf1im0Q5EKPT8JTPCR6W0x8jddq5Z8dtbK4zRKYmv8cDNVcvoJlj
 i5iUipTudvjJu52HXAS+1pnookckKuZVCA==
X-Google-Smtp-Source: AMsMyM53dAS+tZUS+h2NHEcx7ECbBINnFNVcksChJJJgMYa/wUVV3+3/D1wZwcyh9I6zR3Ifh0vH0Q==
X-Received: by 2002:a05:6e02:160a:b0:2f9:8a30:c3af with SMTP id
 t10-20020a056e02160a00b002f98a30c3afmr7844395ilu.11.1666216437411; 
 Wed, 19 Oct 2022 14:53:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:48 -0600
Message-Id: <20221019215348.3262192-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LCxUdL2TuPCHncNdxknmdRQYeAATlVWtUNLULt0Shlc=;
 b=H0hZV9ujFDYyfmDF1Z0wxCTqOPniTKGV28BwD0Hi0QKqX+C901sppayiHkfof9JnJ4
 u81SvcXCvoErAjDQNjdyvhv6Xi/l93Y6074iCAU7v2UpwQuuwEzP7kOYkK2I4Io5gvwA
 A8KHVaK8xOdw1a13tNXfixegZ4Oex65fixYOD3wWJkKZwcVR8drs8q48zMtwughWhcN8
 0I7aEuyfVlXZjn6YO0WZaBJMNbynwpF8fbzsYe3R9iE6SL/pDxKeyI87EqAn1B6lCh1W
 rCAlGsVPaRVPtq4cSBZudfkpgVomj4l00gWavprqx8CQgQpmZj1huIa9ruNHBDoW7yEw
 rE5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H0hZV9uj
Subject: [Buildroot] [PATCH 7/7] package/python-jsonschema: bump to version
 4.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to new pep517 based hatchling build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jsonschema/python-jsonschema.hash |  4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index a2766f78cc..d4c2759811 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  c3f7a29c187bf1d038c66a5d5763eab1  jsonschema-4.5.1.tar.gz
-sha256  7c6d882619340c3347a1bf7315e147e6d3dae439033ae6383d6acb908c101dfc  jsonschema-4.5.1.tar.gz
+md5  3bc1f63a74fc61bf2847f22cadb0dfff  jsonschema-4.16.0.tar.gz
+sha256  165059f076eff6971bae5b742fc029a7b4ef3f9bcf04c14e4776a7605de14b23  jsonschema-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 013a5c1293..68a25aed58 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.5.1
+PYTHON_JSONSCHEMA_VERSION = 4.16.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/9e/62/93a54db0e44c4de57868a7d638d7a8abce113c8bc43a20b10b1109b2a517
-PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/cf/54/8923ba38b5145f2359d57e5516715392491d674c83f446cd4cd133eeb4d6
+PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
+PYTHON_JSONSCHEMA_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
