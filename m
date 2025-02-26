Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA01C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 12:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB44411AD;
	Wed, 26 Feb 2025 12:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0Cx9FRcf0Wt; Wed, 26 Feb 2025 12:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA8F40C49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA8F40C49;
	Wed, 26 Feb 2025 12:13:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4035068
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 12:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C1C940B9B
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 12:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9MJbvsFXt2w for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 12:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A0CF40C08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0CF40C08
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A0CF40C08
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 12:13:28 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 53D982C88FBB;
 Wed, 26 Feb 2025 13:13:26 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 13:13:24 +0100
Message-ID: <20250226121325.2511167-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1740572006; bh=lLUH3HNHwgmL9ajlxn1N5lRE/+b/oRMYSfDKZZEeNDY=;
 h=From:To:Cc:Subject:Date;
 b=ogllElkrKahWTJn+NcPvIBExeMgn4yVgxmFwlsXji4sRy6OmDwwrEi2+J534AzbWy
 PAy60znKYKrmKZ9FtB/IyI5uZumpZrbb+RiyykacMJ7WwLzqjKK2uw4H6AGaQY7lxs
 uZ/JAeq3x9frrwwbGsd9NQEo5MJLwrbEcYcKRnA0EOfK/HYH7QiDL0R5pa1odu8MSz
 QYB2KQeD+cpXU2QPLoISLm1MLREI3zh7EuwYQWlDm9IdWJaKK6SZLf4d7fTz75bdcs
 duvQnhEhGFyLVf3wQzrX+L5xYhF3TUkh5EWSITWMucp+W9XBi+gJyCYtjSNL5d8uKr
 m7qAP6v9oMjUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ogllElkr
Subject: [Buildroot] [PATCH] package/python-diskcache: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package imports itself in setup.py to get the package-name and
version number. This doesn't work during the buildroot build, so we
replace this by the hardcoded package-name and the version number stored
in buildroot.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                    |   3 +++
 package/Config.in                             |   1 +
 ...n-t-import-package-from-setup.py.patch.swp | Bin 0 -> 12288 bytes
 package/python-diskcache/Config.in            |   8 +++++++
 .../python-diskcache/python-diskcache.hash    |   5 +++++
 package/python-diskcache/python-diskcache.mk  |  20 ++++++++++++++++++
 .../tests/package/sample_python_diskcache.py  |   9 ++++++++
 .../tests/package/test_python_diskcache.py    |  12 +++++++++++
 8 files changed, 58 insertions(+)
 create mode 100644 package/python-diskcache/.0001-don-t-import-package-from-setup.py.patch.swp
 create mode 100644 package/python-diskcache/Config.in
 create mode 100644 package/python-diskcache/python-diskcache.hash
 create mode 100644 package/python-diskcache/python-diskcache.mk
 create mode 100644 support/testing/tests/package/sample_python_diskcache.py
 create mode 100644 support/testing/tests/package/test_python_diskcache.py

diff --git a/DEVELOPERS b/DEVELOPERS
index c07837e431..6676f2cf31 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2257,13 +2257,16 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-diskcache/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
 F:	package/python-waitress/
+F:	support/testing/tests/package/test_python_diskcache.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/sample_python_diskcache.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec4..7e9ba87e30 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1084,6 +1084,7 @@ menu "External python modules"
 	source "package/python-dictdiffer/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-dicttoxml2/Config.in"
+	source "package/python-diskcache/Config.in"
 	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
diff --git a/package/python-diskcache/.0001-don-t-import-package-from-setup.py.patch.swp b/package/python-diskcache/.0001-don-t-import-package-from-setup.py.patch.swp
new file mode 100644
index 0000000000000000000000000000000000000000..6b122f4a32ff89be9f4841dc6be41d0591d1de94
GIT binary patch
literal 12288
zcmeI2O^YK%7{_b8ETXI8g5d4hQA|RoJN=T0onU0fnbmbQD7#Svk!*GM(@8r?SJPF|
zSrNU6ckvs@eh2X)eh3fZO+SGmp1k<<%Zx!`y(;q*`KP+-ski6XbqV=L?%S`<VC;B;
z$`e9-|Hrq>`{Jp+rw^YK8(GF%T?HOo%=Qcu^~U_cqlEaRS#VHdq4XfyX6vL>%GldN
zn-b+_P{{aHE^$!YGb@$bNv2O@8Lx2Qx~^v@)Me~!Q>fC|?NB={)yCFnwuMvNa|&tV
z)xRBs<4oX^61XY?-*c<vpV_|-*PeXql5*g*nE(@D0!)AjFaajO1en0(Bw&g?@hPSL
zP@Dd<ZN2xmx@~gB1egF5U;<2l2`~XBzyz286JP>NfC>B$3CKi<`;Q3m`lEDs`v3p@
z_y0GK3-LKgl5A3+)FoXb{rs2^Kasv8eMS0`^cm?c=_S&`q${M~uL|)S=~vPZq_0T@
zX->LLx<#@`S4h9m{y&nwAZgM&q&aCus?PQri3<~80!)AjFaajO1egF5U;_Uk0>0xP
zkdxT9K|odHmVCVBwDU?Sa|5?9Kh>Rn6I!c$xkymQWmcF><x?^MCmU>|yMfLL*?{4=
z@&N;_T(@MNK$@))B61940tJ>j(*|jm+A!?UHdb|l52^sIzJK71oM6B0&E*EC`xo|N
z>b7?WUj&@RqFrFIXvfr3cL$ivtg#A1?LzK~HuokUm_qe{rBhYio;W-N+YkC7SiVQ!
z)ci0rD^LaI-OlYBM<=rzPN_|&517X)$@1m2vo)z5c6uOnyV#^*m|#j2a=Fev!iB0a
z>aNCh+M@yST51h*b=IAuHpgnSA!t=V*rGL2!$ls|p(`hKlY>!et(~};;ux9^jq4if
zXFA5tlK+@^KDNeD=Ub;6^hZ^;^)8t@A5`TnEX#suaBkwJ>tlobtC{5qo<TGmC*wGD
zoHTW17zW_E?r1m^NtUK`EtZ+tnX|i^0I#_!@k-`PO#0wMmTN4lTc^8LuMa~=aE(pd
z?zJzH?Bwt<jKH$!JcNuS?rfv?F*Xx;_sygE@y+*uEa{yKIISgp2PCZ_PNcyJ%(qzW
zb5xYzyM6$^H}S%W>x1R`t}9+9_7j-ZetWp7(v)6S4lgu*d1uvj94fQIa-*CCU#zD<
zG!9cYjzT%cP!10Q>0yAwC>+JX0X2t#KaBjb9K%fIa0d(Uo(I>R)E_#C>xn-BYQt|_

literal 0
HcmV?d00001

diff --git a/package/python-diskcache/Config.in b/package/python-diskcache/Config.in
new file mode 100644
index 0000000000..4bf6c57406
--- /dev/null
+++ b/package/python-diskcache/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_DISKCACHE
+	bool "python-diskcache"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	help
+	  Disk Cache -- Disk and file backed persistent cache.
+
+	  http://www.grantjenks.com/docs/diskcache/
diff --git a/package/python-diskcache/python-diskcache.hash b/package/python-diskcache/python-diskcache.hash
new file mode 100644
index 0000000000..4befb40a4e
--- /dev/null
+++ b/package/python-diskcache/python-diskcache.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/diskcache/json
+md5  d92b4afa944bb70ed38c84a622f7abb5  diskcache-5.6.3.tar.gz
+sha256  2c3a3fa2743d8535d832ec61c2054a1641f41775aa7c556758a109941e33e4fc  diskcache-5.6.3.tar.gz
+# Locally computed sha256 checksums
+sha256  583546baa3fd93607d845126570677a401f508e228b5044fefbc3949af179672  LICENSE
diff --git a/package/python-diskcache/python-diskcache.mk b/package/python-diskcache/python-diskcache.mk
new file mode 100644
index 0000000000..676508857e
--- /dev/null
+++ b/package/python-diskcache/python-diskcache.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-diskcache
+#
+################################################################################
+
+PYTHON_DISKCACHE_VERSION = 5.6.3
+PYTHON_DISKCACHE_SOURCE = diskcache-$(PYTHON_DISKCACHE_VERSION).tar.gz
+PYTHON_DISKCACHE_SITE = https://files.pythonhosted.org/packages/3f/21/1c1ffc1a039ddcc459db43cc108658f32c57d271d7289a2794e401d0fdb6
+PYTHON_DISKCACHE_SETUP_TYPE = setuptools
+PYTHON_DISKCACHE_LICENSE = Apache-2.0
+PYTHON_DISKCACHE_LICENSE_FILES = LICENSE
+
+define PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
+        sed -i -e '/import diskcache/d' -e 's/diskcache.__title__/"diskcache"/' -e 's/diskcache.__version__/"${PYTHON_DISKCACHE_VERSION}"/' $(@D)/setup.py
+endef
+
+PYTHON_DISKCACHE_POST_PATCH_HOOKS += PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_diskcache.py b/support/testing/tests/package/sample_python_diskcache.py
new file mode 100644
index 0000000000..8ba34daf6e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_diskcache.py
@@ -0,0 +1,9 @@
+from diskcache import Cache
+
+cache = Cache()
+
+cache['test'] = 123
+assert cache['test'] == 123
+del cache['test']
+assert 'test' not in cache
+cache.close()
diff --git a/support/testing/tests/package/test_python_diskcache.py b/support/testing/tests/package/test_python_diskcache.py
new file mode 100644
index 0000000000..d8618c1681
--- /dev/null
+++ b/support/testing/tests/package/test_python_diskcache.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3DiskCache(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DISKCACHE=y
+        """
+    sample_scripts = ["tests/package/sample_python_diskcache.py"]
+    timeout = 10
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
