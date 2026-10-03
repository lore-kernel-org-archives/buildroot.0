Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE99CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FB760898;
	Sat,  3 Oct 2026 22:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKvGeoc4a9Qr; Sat,  3 Oct 2026 22:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2CB58606E2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067499;
	b=JAOq4a/ShHHg5EiBLCUs8DCGhJYJyxWQYmGiHeiRZoMVFg7aK4OcQSX3ls/CiP3VSpKh
	 ngpdjIrc6wRR4edSUFgpisOAp+NxiH5IsKQbmZMQDD0qeuFWM4xEDDQmmeu9DSgyJRW1E
	 qPlz7xCMmy0zFQmBTnp9Uht09YqOIDEXHpSG4Zh9fA9O7RnnVypzd5Y7SuPH1pgcS2wLO
	 NSzwL7kO//CkCtSvBvz+8VaU/enf0dYbukegHvTQTobonnCJHOssMW6/dSILa7HBysHL1
	 DSmN9pvYzOxTzSJv4CEaB0KAKzkEf4/8DGx8YFO5o478dWBwLt/iAgqfKb+eXwXuVhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jA8kCs2e1rR+McfDzzHiK4l9NvGvYuGwWkG4s9lIFRE=;
	b=CWP73s33tDXI+lAlM3gro2JEIG2tRcmF16gOQCxc3/gxQHtfwJcKIRMKDbsunZovDYJt
	 lhD2oMX4yFvWV77LJ8aWtJzRhoeMU4Ohaj+v/IWKawA3RbIAcskVus3AQs8Y54Re05FcV
	 j3qBNuyfVXCx/V0qMnRptnwv7kyClt7Acnd0SBONbngzhdcqcc2tTud9TuQZGxRBpruNK
	 MTwoFwa7LIcE2LSHwu+YGcKnB3BnkrMetF5W7dJAlTPv4FGbYCWMb/JtkWPzskXZqGuMZ
	 LqHEsokKwEHLsEiXUT633KJpQKd5TT0NmBgp9xu6pNLzDI2nyiQxCmhEagR3RHbn+Aw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067499;
	bh=jA8kCs2e1rR+McfDzzHiK4l9NvGvYuGwWkG4s9lIFRE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nboAX8NU277gt8KStKaYe6eJ/Z898ltxJl3A1X25quyIgbP6Szfl28GbB8BVJQAIo
	 6+YA9/GvqLW7cklbDjgn7KZYsAE0GR/+O4+qqRPcURIw02cn8Sxb/Vj5oOmmv7FPqd
	 1HIXhPWr+xvrgSoMPLi1uMUWktIHIKPqH5UYOSZxBltpCCI0G2UQtgEoxvEr8Z2GUr
	 TXPb75LYOoEKKWbKhpu6S9tyHz5i2wMgBHSads4PA9BxeZcGV8sJv4mNUqgt/sZvFj
	 u91dDpMBa38+0CHnVNFLQuPTEZQD2g4mR6oNc+h5m1nVoflkyi3G2KGCwIu3lx9OVK
	 t65+QxpwZDEDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB58606E2;
	Sat,  3 Oct 2026 22:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6722263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAC9D40B7B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l76uXnP4Zx6C for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:44:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B9C5940AC0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067496;
 b=UKg/0ngV2pxiG3jBmkKzYmbN13/4FdkmXujaO2lwZPhyxwH6aztHnitSx9RPRe4adkfd
 UAaDAa/fliqlaHOltfNlhjbqb3aVSMhntAI9AKTrUCJPu9aRWYWkL63jYyeoO2YWs75dQ
 HXmDE5yDHnu6YD1u0OUtKquIWleGcCDz9cQ2vJovx/y4c235Tp03F+1ILZ0b7eVFB2QL9
 LdgYN6P2yuiElNn5Odg2fZmDY7WezvVmScoDEIDI+DM5FCr/gPTGwdSlwf5pJzhH4OjJh
 pdaSnOJ3sY0k51KtuD5/bEEKxvt/5c/n2OWXpNHrT7UQYhmo2ViOyLLxqc+JghomM6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067496;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZPjcCmhVliJTOj3MYt8AnGUcXrCZyP4LJVdUgD4lxfk=;
 b=pkLeXNUMA1cc4XJa4EprRHeqkb7E3CMhlhNXn/OpmlAFF6m25N+xNXWB8VODGvbFsdMd
 OMIG/Z5OLLEEVktcvvwwU96bjejQ8BQp1XKLRw1iGmL9s6fUCBpafYcDs9yO4atcYVG0Y
 mgLqziSlTBKb8kZ+QjlVTc/uDjdSinskbNQqfzAwsR4we0YngGL7Olot4xPD4ok7j1lRH
 l4+cVXNgXimi4hp2iTn/CkfCwhrlXLJ1S266C3DfNQHDmFChjDtZF26vD7uVGvXL/l26P
 /LOSnkExgBBiBS2WRXs8hMeXqSSR3HXmTjm1mlPxowlgZb6xJdGXORcv70s49MCNSiw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MrVPXX0D; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MrVPXX0D
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9C5940AC0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:56 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-81ae6aefdceso844496a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067495; x=1791672295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZPjcCmhVliJTOj3MYt8AnGUcXrCZyP4LJVdUgD4lxfk=;
 b=MrVPXX0D8oIqbRpbNhcd3noN59sRHzdNUk8nguQnELVqrTnC4nid314fEy2t6Nr8kF
 b2MqhSfEfSKQ6WQ842dXFwJ7kMRrrOGHb2nBxLblj7Frqkl+uUpq7mlt4UyRg1BuyD/B
 3Su960MGi3KltDGO41WVATWVBBY4lmmOq1B6UiHLyDAYeTApaGytfEm/7rTksUct4bEc
 MSIbIZB61qTUSlA+apP92O3qe5z5CVMOYX/ikFfYeRKZ1a/EMKZKURSx58LjmbaoqVZW
 l1txiWUF47EM7YhHhMPBI3t36OB8TafvlmMEmXUrgkUjI4gfVtwgGfevTyg/btQ0yJyU
 EIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067495; x=1791672295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZPjcCmhVliJTOj3MYt8AnGUcXrCZyP4LJVdUgD4lxfk=;
 b=znyorA9qJlXCp+7Q6qFsujQ3kfvLBfh2MOoNnH4Le67tKggEaB1gu1qbgz8fsAKM31
 nu6+h7qhaRlFGlV8nsFOaUUO8k7sMD/UtVrOBUXyQFZqTmNJrFCM7vWomuEwvrCdpHIL
 6V+4ZxfsmlYkMwjLVoXU3WcHbotw/xiKNZkL66PymwgY2v77Vd+USKA7VmCy0cpibmEG
 lRWkYT1XNLHD/llGE2Coii6Rao7k0nYO4KiJO8N/Sh+4lrpWDE1VgwNmbUCk/DpNDkvA
 15eCjKamb4uCBjtbWbUHK+eWvWC1CwaUl4rQnD/rne9zNPnoMzbOUUY4d2ULCuco+9+q
 AmGw==
X-Gm-Message-State: AFuF++lnf5KuRDWyKiVeDb1mfSKY54zOmPU81avgv7WKXugas2LRDl1K
 YejmiH0NJCi/zk9ShqXMLbMn/eayVYAkflM7k6JV74swZ0F74jByC/SJWk8upg==
X-Gm-Gg: AYBFou0eS2PSR2EKuwhqsQQiZv01qNmyxcQNZS1F9quLKC1jIcNPKsswxTVTajzueEB
 gbmhB9iSr1tYSn7rOkxlAcF8Lg6NKjJgFzIuxLVu0kZC4EpFNokekhAuhka7RicbGr66+mtQViU
 hTK0ME0Tudd9H6WiFVK2n270WJb0PqlicC8cDxB7RZRLaXE+ZEB9noha2R1qQ50zqn8FtxbqGJb
 heLMRV1iYljNhY4b/ycLdHZsEMGJjn2fjQVoe4Fr0elD8H6EiTruaTVL23pGWty1iIstbQ+FLeV
 V735CY62LBz9Kf5b1AVq6YU8ImSfuR4zxzuy4pUs5QiekpqabRHUESjESpXio4AG30SJ0f/cFMw
 YA+pSh8YjrM/nJJYHNA/P+FAl1Hnnvn8eeXAm4ruXDjdv4r6AJm9E+sLMXg6d1GWPeG+xnJxSeH
 xF2x3dVNx00nBYP2gR7AA1iBmdPZ7sZu8VXMCVKvztJSkrs/uTH3avrP2kqmpFSDikoArLVFy+V
 0BmvZhhlL3LQzIcAQ5UWbSkc9+h7P42+df9rkqBbEZLqE2CFOcxbE8JszyMA0vQOw9fQ7+k1AYW
 27MQsCutVoXe5TlhIuew0mfdKWXiuXmCi9DOa+2FsxsotxcfiAVPOn8jo6NfdZTenek4qDu0uGs
 AGqjORJSR/Ohitd9YAHJJ3JXPx/GCoZEKv5vZF2VSmQ==
X-Received: by 2002:a05:6830:661b:b0:815:cdb4:4a7 with SMTP id
 46e09a7af769-823f9d95766mr3929165a34.3.1791067495234; 
 Sat, 03 Oct 2026 15:44:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:44:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:28 -0600
Message-ID: <20261003224447.744966-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 6.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to JavaScript formatting changes:
https://github.com/django/django/commit/fc0a0ebd4fe573299a5f978e77fa3bca8424f661

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Depends on the following pending patch:
https://patchwork.buildroot.org/project/buildroot/patch/20261003033954.462113-1-james.hilliard1@gmail.com/

 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 993b7b0d68..6ec3078744 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,12 +1,12 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
-sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
+md5  130e6e23a095440bbf3e720b932792e9  django-6.1.1.tar.gz
+sha256  7ab93536d8e677aa14554c56426290c69480bf2ee68d7513d4a22f57d6bfeb84  django-6.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
-sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
+sha256  b49eebe24624d23591417ab5b163a27d40bb89889a24b2c1699194e309aba826  django/contrib/admin/static/admin/js/inlines.js
 sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
 sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 764e72084c..26fdad76eb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.6
+PYTHON_DJANGO_VERSION = 6.1.1
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f8/d4/8314b5bdef20832f0ac6ae3b3e4d4924e4759fa3b4af27609dd747e7a6be
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
