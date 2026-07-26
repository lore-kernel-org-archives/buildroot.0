Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A4C531F9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 09:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0593980D3C;
	Sun, 26 Jul 2026 09:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgiTepQ5hHg6; Sun, 26 Jul 2026 09:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281FE80D15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785058057;
	bh=ogyqz+psEkwejsGVfKQbdlUaMgIQ/SVmtL8k2dWA5vM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YmTHuNePOJjxY53EkKHcANu/0WEgbPXfua+V7in4GC6//pllRO+806Pt9IxvAPdOZ
	 u7KbgquKv5bwUN5Yooeag5bmQkyRSITOe5QPpoTRQxVVgf18aNTdhy2kklajDXu0Ga
	 GzxVqWWbIHhk84aMEKNOSr6YZNFAyUteie4Mb1Qb7dH3yPN5AMK86fyZEQvhinikzY
	 JTpnJVHFKSH6tjeeGg9eu97yjdzQAqf6XSoXxxPnolZQ7H/0X7OlRhEFr9s0r6UWT9
	 hP0NAQzC25QCrRL3prejcgmHfFljYfOors5330fDsSISTLOUofNIjwsrMcZ1aap/7r
	 yBq5tZ5+mzcUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281FE80D15;
	Sun, 26 Jul 2026 09:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 953D9490
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9334260631
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhBW9jABkpRT for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 09:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7356560623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7356560623
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7356560623
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:27:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CDCEF60132;
 Sun, 26 Jul 2026 11:27:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 26 Jul 2026 11:27:11 +0200
Message-ID: <20260726092711.212660-2-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726092711.212660-1-ju.o@free.fr>
References: <20260726092711.212660-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785058052;
 bh=yP5fAEapbc26cClnGsc04t4v+0MeP1wUsOtamIKVO20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ehm6nVtWLE2FXtbvKfFGVPdTOwqZrxMhSyCWn3dsq+5i0nc0dZZpx95yaw5zpOkOh
 8sXgWmr7VfSK06eB3vcBGQaanLlpap6dvJSHOfEC1+HMwN3TAq4dnl7ErukZsWeWRy
 uWIWsl9oO1BGJURsLbfbk4OC+jB+hYYDGLSoy1zns4axCUbJt7RwvENiMW4Zzrqj8y
 DzQT5qCV4YDvG35WbNH6izhuPFd9vvP8W3BSnO2h6x1bFPpTlxYmM19dv/EgiqmEtu
 Y/r/qc+Kuy8ktgJUcvxsuu3UG78rzgizgPQnyeayT8pexI5VQBR/DHnwXFYg+ANjbr
 eCzGfNNOAucYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ehm6nVtW
Subject: [Buildroot] [PATCH 2/2] support/testing: python-pydal: new runtime
 test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain <ju.o@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/15537803280
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_pydal.py | 11 +++++++++++
 support/testing/tests/package/test_python_pydal.py   | 12 ++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pydal.py
 create mode 100644 support/testing/tests/package/test_python_pydal.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f2713c7239..4f741f656e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1857,6 +1857,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_pydal.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/sample_python_sympy.py
 F:	support/testing/tests/package/test_4th.py
@@ -2006,6 +2007,7 @@ F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_pydal.py
 F:	support/testing/tests/package/test_python_pyqt5.py
 F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
diff --git a/support/testing/tests/package/sample_python_pydal.py b/support/testing/tests/package/sample_python_pydal.py
new file mode 100644
index 0000000000..269fbaffa8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pydal.py
@@ -0,0 +1,11 @@
+# From:
+# https://github.com/web2py/pydal/tree/v20260313.1#usage-and-documentation
+from pydal import DAL, Field
+db = DAL('sqlite://storage.db')
+db.define_table('thing', Field('name'))
+db.thing.insert(name='Chair')
+query = db.thing.name.startswith('C')
+rows = db(query).select()
+print(rows[0].name)
+assert rows[0].name == "Chair"
+db.commit()
diff --git a/support/testing/tests/package/test_python_pydal.py b/support/testing/tests/package/test_python_pydal.py
new file mode 100644
index 0000000000..b0166c7a8a
--- /dev/null
+++ b/support/testing/tests/package/test_python_pydal.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PyDAL(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_SQLITE=y
+        BR2_PACKAGE_PYTHON_PYDAL=y
+        """
+    sample_scripts = ["tests/package/sample_python_pydal.py"]
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
