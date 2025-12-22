Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC3E674B7
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 14:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712F8406F4;
	Mon, 22 Dec 2025 14:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHt2TaBIzjrM; Mon, 22 Dec 2025 14:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8AB40708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766415232;
	bh=GU6SgrdgFEAWKjf8yI2DXvs1wDyD87Bnk0rGDRw94Pc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Bjh96A0aAZkO/vmdzcYA9P3wePshlPprwYVdM4A4fF57fVrUHZF9vuk6us+RCIWUB
	 ESTBpNU284BUzzfQNYaCYDHIJaHRiu0Gvtfz1ZJLd5xb5WLMPAb8RQRZaIK4YVwd3V
	 MnFrYwzCp3oNxuLTuTuhESDOaoKnikUhawKQRydERYnAA/xrm+pX0Al+BPX5mgA1Kg
	 THqwBOO2LYpmvP6+YSYGRsaQ8AmtjV/rfHeqNKo1unw5WpdIeMTTQIwMb3co4pxB0L
	 k/5uZ+je3C9M2Zyq8WNGTl7bc8mhOzlEFBRzzxvzqr8f/70gpu9Dtv+Sl7jU+6irxa
	 HTKW+GhRzprFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C8AB40708;
	Mon, 22 Dec 2025 14:53:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4290F195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400FD82238
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_CCeXPKCC_W for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 14:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93C2C82236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C2C82236
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93C2C82236
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:53:49 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 598AA2C80CD5;
 Mon, 22 Dec 2025 15:53:47 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 15:53:49 +0100
Message-ID: <20251222145349.440661-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766415227; bh=Q2nmSRWq+jNV6IsyrXgwqjj9BRuOMbNIY6D8/acAzu4=;
 h=From:To:Cc:Subject:Date;
 b=cKEQq6LN7oDQx0U+kV9g92gpbmtybXU4NceLHAQCyJuhkx9SP9rhFzYhJ9w7dJl/Y
 zg9GfZCNetgmyRS2T+oTTcaWwZTacqe6VrZ/5hQRlx8utCOlvcfVs0oW1Scwdxryjk
 LMwzMDQd2NlCSobseSc//8+KyzjZVsfbmIPu0DUE5h/5KD1KylQX6CyL9mdUqfiSq8
 UMzNZ0X/C5plgwfkvrQUQq+se+huFmXhILr7GPBEr4CI386CFab2yubfYd5gVZOEnG
 OAlM9199xvRpGFCj+Tba8PBQO19MIKQYDBvOIBtTqsCVvDJGEChcPb53GUCmWEoktr
 UskDRLXqCNVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=cKEQq6LN
Subject: [Buildroot] [PATCH] package/python-django: bump to 6.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://docs.djangoproject.com/en/6.0/releases/6.0/

A few changes in the license files and an actual (sub)-license update:

* django/contrib/gis/measure.py -> formatting change
* django/contrib/admin/static/admin/img -> svg files got uupdated and
  the new ones are licensed under CC-BY-4.0; separate LICENSE file got
  removed, License is now mentioned in the readme
* django/utils/archive.py -> File got updated, license (which is only
  the header) did not change.

Remove the comment about django site having an inconvenient download
URL. We download pretty much all python package from pypi.org, so doing
that for django shouldn't need a separate comment.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 10 +++++-----
 package/python-django/python-django.mk   |  9 ++++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b5b2460d2d..388b9df82c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,15 +1,15 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  e7d89ddfdca79542039dbab31e4bede8  django-5.2.9.tar.gz
-sha256  16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495  django-5.2.9.tar.gz
+md5  2f0e8520f6cf3cd6bbc81ec4226f11c7  django-6.0.tar.gz
+sha256  7b0c1f50c0759bbe6331c6a39c89ae022a84672674aeda908784617ef47d8e26  django-6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
-sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
+sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
 sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
 sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
 sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
-sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
+sha256  6e3bedbbf4310061e026d1b0b99beb390b845bfd29732455c13dd320db1feca6  django/contrib/admin/static/admin/img/README.md
 sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
-sha256  9f37277d682cf06369041e60fb6fda5a85dfcf118d9176489087a3d40293f015  django/utils/archive.py
+sha256  d1046875a3eff7419a4e55b254fbb68fd58dfdbc701626bc8f57da76a5120cc4  django/utils/archive.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 7aabce68ef..d6d9bba0eb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.9
+PYTHON_DJANGO_VERSION = 6.0
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-# The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/eb/1c/188ce85ee380f714b704283013434976df8d3a2df8e735221a02605b6794
-PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/15/75/19762bfc4ea556c303d9af8e36f0cd910ab17dff6c8774644314427a2120
+PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
 	django/contrib/gis/gdal/LICENSE \
@@ -17,7 +16,7 @@ PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt \
 	django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md \
 	django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt \
-	django/contrib/admin/static/admin/img/LICENSE \
+	django/contrib/admin/static/admin/img/README.md \
 	django/dispatch/license.txt \
 	django/utils/archive.py
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
