Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B774C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039D684AFD;
	Sat, 23 Jul 2022 13:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039D684AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CBn71ROA2Oa; Sat, 23 Jul 2022 13:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D5D84A2D;
	Sat, 23 Jul 2022 13:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D5D84A2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 709B01BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A48840576
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A48840576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gbd6FZIdR1rl for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81294401A4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81294401A4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:04:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso5548545wmq.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g7jysaqwF2reIza4ESUQE9C3IlPlrp/ag62A9vea6O8=;
 b=ylJAf5gSZcgJL3dtYfYyyxGNriaAewh/5yH3dYtalDWfxMZQh7P7y+LCNrUmiS7IyF
 vlQEx1VogVgxwB6Zj3hrR8QHWeFGVOYKQOJxHtqxr10gBxTLR+s3Qp//dUmbR6wxFFiZ
 gHMey/Et2bKK8OWBvORV2MJr5c/0tyt3so5k38GtRh1MiN6BwpwUmVwuF+eiavn+hrZ7
 TffcIA4+1dNXCJPQp1gYhBjam1Ahrxg5e/1dP7WDfonf4HmAYUC8c75vC3etR473ZIh4
 lzl/hu/UO3W3AkBt39cDqKi0LPo1LkznJktKoBVj0PqDkq/MP0rvgZjjKL8X9pqgOf1y
 WQcQ==
X-Gm-Message-State: AJIora+79v4NrKTmX064LzY9K8yVfB6RMN307ckvupyt1EWmnDxw9vKK
 alay7YFPBkDzO35u1F2i5KuT56V2UBE=
X-Google-Smtp-Source: AGRyM1sPOFU69brpi7HSZR0eWDM1xigUNjXV4vVam6Aj0gTMWBoQJdrEexag8vJqjnpmdugcJiqqrg==
X-Received: by 2002:a05:600c:5114:b0:3a3:3f7f:27ec with SMTP id
 o20-20020a05600c511400b003a33f7f27ecmr2827074wms.93.1658581482671; 
 Sat, 23 Jul 2022 06:04:42 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d550c000000b0021e4fd8e10bsm512075wrv.11.2022.07.23.06.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:04:42 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:04:40 +0200
Message-Id: <f702866aa31de62195057f681f37db05e97edeaf.1658581474.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658581474.git.yann.morin.1998@free.fr>
References: <cover.1658581474.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7jysaqwF2reIza4ESUQE9C3IlPlrp/ag62A9vea6O8=;
 b=M6F68GlXI/uP7VlJXWqE94LIpRF6sarRelJaQ8+fsSp0inIEnahLE1J7LUxnj8o+Ps
 yCiQMYyQw2w7VgSDWgiVHJU0ASG29tfehvwHyjGWH6sSUDs4MhnS5r8h2C9uTjK7+cST
 eJwMOONtVxJiiL7MYk17grC4vv4VVRkNmMP5WIx7r7DnC7K591lK9t2LBpNgESvyIJlZ
 6Ph21V9WC9JRDGISnui8lj1A9vtkXknjFCyhKtfac9HIgE+fpiUnrPwoUjlkSwCuHSWS
 ZHIwBTmVSItGOWOtryuIJb06wsMwVhoK23KxD1xDozfLMUikY0PkzoukflwlIYqNiB27
 XyDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M6F68GlX
Subject: [Buildroot] [PATCH 2/3] support/testing: introduce py-only and
 py-pyc tests
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our current python3 builds only tests the pyc-only case, so add two new
tests, one for py-only and one for py+pyc. For orthogonality, rename the
current test.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/testing/tests/package/test_python.py | 32 +++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index c4f5d66d59..d6f69a83c7 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -39,7 +39,7 @@ class TestPythonBase(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestPython3(TestPythonBase):
+class TestPython3Pyc(TestPythonBase):
     config = TestPythonBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
@@ -53,6 +53,36 @@ class TestPython3(TestPythonBase):
         self.zlib_test()
 
 
+class TestPython3Py(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_PY_ONLY=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test("Python 3")
+        self.math_floor_test()
+        self.libc_time_test()
+        self.zlib_test()
+
+
+class TestPython3PyPyc(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_PY_PYC=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.version_test("Python 3")
+        self.math_floor_test()
+        self.libc_time_test()
+        self.zlib_test()
+
+
 class TestPythonPackageBase(TestPythonBase):
     """Common class to test a python package.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
