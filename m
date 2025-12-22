Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6F9E674BE
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8331540728;
	Mon, 22 Dec 2025 14:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLnmSnvq3AN2; Mon, 22 Dec 2025 14:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A09D40857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766415272;
	bh=GU6SgrdgFEAWKjf8yI2DXvs1wDyD87Bnk0rGDRw94Pc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=S7v8Smb0jQqqRdsf/OKA6pGIxLDd6CrpWF7giHFWPkrBixzs1kdtlZy6I7StHaetm
	 yJJKEuKyHyWO0bASp5KV9+2mwc3BCM6CCcMC5lHzfoF3UurytbC0mPL9la8DWXdO/Z
	 4V7Aty4Qd6Qyq9fBgzQJo3rOfXL3qaCysev2bWleo0hoj/xF2MtKx30+pZ4ECQAPPu
	 pvmRQrNgSYJOQdVCHTHM/qgng75mDYFMgzSr0rlNDjgLDVM0Gb71mHX2RwSV49zz3W
	 CQ4T8aVn5q9JjKoLQaFyHeOr++wbqy6ieUzMIwW5jgmmFB0Qex1+fBI/T0ocUS2esk
	 J1vHVIczk/b6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A09D40857;
	Mon, 22 Dec 2025 14:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20524195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1304F406F4
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQGGf3qkpaYU for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 14:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDEB040708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDEB040708
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDEB040708
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:54:28 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4EC972C894CE;
 Mon, 22 Dec 2025 15:54:26 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 15:54:27 +0100
Message-ID: <20251222145428.440712-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222145428.440712-1-buildroot@bubu1.eu>
References: <20251222145428.440712-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766415266; bh=Q2nmSRWq+jNV6IsyrXgwqjj9BRuOMbNIY6D8/acAzu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VFFrWk1WeYn6t1IKTjraFf6z5/4hgNego73iMjaUarwxzeqdrOSEgw06QnN9rsQbw
 574yU4H/5mhtgp8ToykT6X2lStsTnXww4OWnVcG6xPS0yBJjk6ZE7f6BAyxRXCR5NT
 7pWZzAk0c0GQVQDqk5tb4ZClrimh1ia7zeFWMVv1SUgC6Czj+nY0GAg1w7T9t4PuOn
 ztaEviuGrj/OAavjWaOOXZ35+pAkl3AvPyFb4UtF5aKsmS4v7oHfQdYHKGcQgiZTUP
 iYPQ6WAhZ2C/SvRydRFOCIcmECJHhJEckTvteiW/cLcD0gZM+er688jpYw6NeDcvG4
 S1qY2bBb3oBrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=VFFrWk1W
Subject: [Buildroot] [PATCH 2/2] package/python-django: bump to 6.0
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
