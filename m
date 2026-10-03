Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B57BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD37660DB2;
	Sat,  3 Oct 2026 07:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzktTa1nqo4P; Sat,  3 Oct 2026 07:21:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E335560DB9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012062;
	b=noKKRwlQqFsyWrGEBSkhyTc0U6tlAU8aV9SVXBxgPUTpH/wCPJLDlHzq1gGLs3V5abHr
	 JsMALPT0xlCB8HYANXO/jQ1DpyP7ybrfTdMbutBB221P5JEvsgrjr7uOOXS1yaDqVnWMo
	 iw3BMzE7yzVhNwqhKZ80Bohfh2gxmomHU7sccXCvTI05pBdlEVAtqyppPv2L+BPFZmdRO
	 Tt9AqEVNuxe5ZrD5q0MDsb17JqScqWDvRXacQwMVz2/Fi8Q7GS88UQ4P11ZNeWfKbwIuO
	 facv8tDq1JNhTbwynfWl0QM9OpCoqwaO/cF5nWbgdpwasUfWxBatJnbOxCnp8eZ377Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=05p0+ZBCoUUC8wOOTuPZ8TwbFqqtO2rO1K4nA4QpBYg=;
	b=T68tkDgQW2eT5R9gWgrGiBVAIyBseeJoQr44t7n66sahz/QjeFT8PW8VoqcI3fJFTrOA
	 dWjZC6w/8GV4TztspgGCSAe1c0edoT5VXHJH8v+Z3yoHBLBJkHUnzFls/gIDIgG1TKLcD
	 V4fc4SNUnSGZuoQybtH+V9++s++3WsQbdhdDqiduhV3yZPbA3izpQg47srpCuZtqfETpX
	 hnkXdBYXwfZ7pg2M2KHaHuc0Aw8FN4GWXVz21JJzTD7bdzwy1aNOpS10P0IdK6ZEO5v9A
	 ZAU7i/U/RPNoiD04PdXust70LNNt+4g8dXCa1ek+qGQhs0i6xSqZ6695cUCDoXmntig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ct7mmjGL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012062;
	bh=05p0+ZBCoUUC8wOOTuPZ8TwbFqqtO2rO1K4nA4QpBYg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=USwG4Sl/1XvAzkdF3g5U8kr46AbtMnsUSq+XJ0s6fCm3g55pQ26woeC82MvdyTEe7
	 VCnXYm/INkI3t16x5tGCPYqIURlt5QIwVzfW7UcauSCsO4VKSw37iDsZXSlShO9QDM
	 ayjs6pIKR7JSmGq9K2vj83gSeDcIA5uYKtYpCXOHTZmKhTrzh64eDekyGqMqN04iuf
	 Of/K60CGlYrxZDAaiMm5diuur788UDQ437kmCHMSEVTGCu9XSBMjqKlLBjy/JD4lH6
	 ymuXgMWnzHIuLTLGxeD0aWGH0q9Jd7wNpY5nL6xhzfIR67ysY1XuZOZdqIw7P8wRqm
	 oaDbutuoyxR5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E335560DB9;
	Sat,  3 Oct 2026 07:21:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F9A179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1293F60DB9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caGxmq16Ui3z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:21:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 16FC060DB2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012060;
 b=DIB5Etx4Q9aUJpQucmJDMFGK3jmp5n3ei+4Vb5UDvpzuJNmoHGZc3N23BqQHpkzNUOHr
 vK2FPHXuPaTuc/KJ+P5OR23tU3nf7ZvnWRO4m9WP1at8v2AntOsVPcj2Q8c0KZfOWDSpD
 lVFzFo6clRacxhgCN4OYA2Y5gclul2h+jpLb7xKBTntv1FdjGDhQbRXPoVOF4lHnthp6H
 bfNHXnBkUY4EyO4m3raJiZsS+TuydsmKsVu6EtloOI+vPunb/JlvnbW1Jl3p3NsV29a6a
 SUdM+jU4e7dRtHynmIwasHnR4vcJ+0xHnBh7DQFHxVI0P21yCs7svk1tnCtfelaxmGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012060;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=D5Id4cEj1nF3aV03b3wwiDmdFJyYDYM0PNi7MUV8LvY=;
 b=c2vp51VCNl/ZvdZpjwXmGyaw/cQELNz+Yq1seScyRZo1odRYmo/JtKcXR/qoujFjSO8E
 dAlpERYTbkyvoKZwvXyi7/IcynGBbI+MfitcvYQYRlNdVJ6xhrflN+vf7pwzZi4pdvGug
 7hxF7d47uJ3dn4eLfoskNoi184xFDIylVOlDcffncANYpZrbwiP2y3j08/XKnrJ0GM5Ql
 uEwR33LCEq29piRQe8UxmZnhhkwxXgiITmNTsj+zE4k0NVZ2ogjnc2RL3Y+nroSRX0cPc
 kx4pplfGW4By2PxnzU49ajqbTsaHjzRdRLZStve70tv+o492iMZyIuKsV4wVCf9VbXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ct7mmjGL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ct7mmjGL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16FC060DB2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010939;
 bh=D5Id4cEj1nF3aV03b3wwiDmdFJyYDYM0PNi7MUV8LvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ct7mmjGLimKzyjWAeVtg94WxxROaidc6nyKwVDPHtNR2UhN7qM04klFyPsYNfHlf9
 av3Dg2iNcG885vCGQFBQsQAKr/V39/YdIf6yyt2NZ4xi9xt/YeBmNA4+yGyh16yQcs
 CaDvRoJ2HFfsUGSAVqmfFcZFlvMLDb6Fc7zXpnS7A9DQB18JOFsqNkkFio1wheHaP2
 OmJv1I8Klk2gkz3yfnpPuC+YYFaRury1nqJkLRXs8ej79UY6iV4Wi96cBY+mJTe97f
 4mUs2tQ+adaiQ8ecZzJ/1qQOXOc9oLMgidiNigtk5tb5q1DsAcNMKa54FhBZjr61E+
 TWjbjFS40Au1Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 CKATIvaW+wKsmUZ0vtj6RTDv4IDXnbOi+01br1CyUQz9hxMpSWEMsSr2gzV81/66VJS6i45be1T
 sxCFS2vHVgySgoo+cnNBm272oe0cNlL5NVuFIK4W9JvoBh+ExZL1gSOsua4jbtVL16hY0315fys
 daWyEF2jUzR/8Tuf3RF+YI37AE8XZ/BHCQ84R8uAh/eTQH08gNzmhgDawPmNgqjjmnzssUkjIzC
 zS0YRQ1v2xor56SGu/CvGQhJ3LYi30qToeSrvwNftt1A1id5WwxkY5fxrA8NrXzDXs3EYqPZMGZ
 hEm4XRo7+TErNlfK1rsuvs3LG4/RmR3RrRlB2LXvsC1vVXZf86KpbdMoHBvf0x0tCiU96ZvPNgw
 mdxkNvh5++yxHwnHPDlMJTLzr0zy3Yy5AYPX1hQtTyPNInbwSvzwx/V5eQVubMIoYm7hyMl5hY0
 yvOOZucRU8fynJXgwrxlJFTm5mF4XOEunmwRmz+nv5gImb1EVOMEj4tsf4EI9cox4anDy9Q14y3
 JojLYJfw7rR2QF5NbIyvKGWJZkAUvyzh/yP8r2T/9tKsx8SJJrc01ELQFyA0J359devHFh3lzEh
 f21LNX7vrjiIIQSYqlP5Bn02PVHmB2xNRF5OjVsafxCyejOCq3yz8gfc25sgmkR7
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F15ACA4C549C;
 Sat,  3 Oct 2026 09:02:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-29g9;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:04 +0200
Message-ID: <20261003070128.1295458-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 032/114] package/python-html5lib: fix build with
 setuptools >= 82
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ImportError-for-missing-pkg_resource.patch | 36 +++++++++++
 ...ace-pkg_resources-use-with-packaging.patch | 59 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch
 create mode 100644 package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch

diff --git a/package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch b/package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch
new file mode 100644
index 0000000000..55e468db72
--- /dev/null
+++ b/package/python-html5lib/0002-setup.py-except-ImportError-for-missing-pkg_resource.patch
@@ -0,0 +1,36 @@
+From a29f42562056cca84108aadea37158f718fc8b92 Mon Sep 17 00:00:00 2001
+From: loqs <loqs@users.noreply.github.com>
+Date: Mon, 16 Mar 2026 22:33:37 +0000
+Subject: [PATCH] setup.py: except ImportError for missing pkg_resources
+
+Missing pkg_resources indicates setuptools 82 or newer which is more recent that than 18.5 so the version check using pkg_resources can safely be skipped.
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/594
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 30ee057..0aa584d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -6,9 +6,12 @@ import sys
+ 
+ from os.path import join, dirname
+ from setuptools import setup, find_packages, __version__ as setuptools_version
+-from pkg_resources import parse_version
+ 
+-import pkg_resources
++try:
++    import pkg_resources
++    from pkg_resources import parse_version
++except ImportError:
++    pkg_resources = None
+ 
+ try:
+     import _markerlib.markers
+-- 
+2.47.3
+
diff --git a/package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch b/package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch
new file mode 100644
index 0000000000..219c5c4185
--- /dev/null
+++ b/package/python-html5lib/0003-conftest.py-Replace-pkg_resources-use-with-packaging.patch
@@ -0,0 +1,59 @@
+From 0bf746e3ed39d8b10b31ad292a19aa2d98e7058c Mon Sep 17 00:00:00 2001
+From: loqs <loqs@users.noreply.github.com>
+Date: Mon, 16 Mar 2026 22:38:32 +0000
+Subject: [PATCH] conftest.py: Replace pkg_resources use with packaging
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/594
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ html5lib/tests/conftest.py | 22 +++++++++++++---------
+ requirements-test.txt      |  2 ++
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/html5lib/tests/conftest.py b/html5lib/tests/conftest.py
+index fffeb50..a1f6b21 100644
+--- a/html5lib/tests/conftest.py
++++ b/html5lib/tests/conftest.py
+@@ -2,7 +2,12 @@ from __future__ import print_function
+ import os.path
+ import sys
+ 
+-import pkg_resources
++from packaging.requirements import Requirement
++from packaging.markers import Marker
++try:
++    from importlib import metadata
++except ImportError:
++    import importlib_metadata as metadata
+ import pytest
+ 
+ from .tree_construction import TreeConstructionFile
+@@ -63,17 +68,16 @@ def pytest_configure(config):
+                             spec, marker = line.strip().split(";", 1)
+                         else:
+                             spec, marker = line.strip(), None
+-                        req = pkg_resources.Requirement.parse(spec)
+-                        if marker and not pkg_resources.evaluate_marker(marker):
++                        req = Requirement(spec)
++                        if marker and not Marker(marker).evaluate():
+                             msgs.append("%s not available in this environment" % spec)
+                         else:
+                             try:
+-                                installed = pkg_resources.working_set.find(req)
+-                            except pkg_resources.VersionConflict:
+-                                msgs.append("Outdated version of %s installed, need %s" % (req.name, spec))
+-                            else:
+-                                if not installed:
+-                                    msgs.append("Need %s" % spec)
++                                installed = metadata.version(req.name)
++                                if not req.specifier.contains(installed, prereleases=True):
++                                    msgs.append("Outdated version of %s installed, need %s" % (req.name, spec))
++                            except metadata.PackageNotFoundError:
++                                msgs.append("Need %s" % spec)
+ 
+         # Check cElementTree
+         import xml.etree.ElementTree as ElementTree
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
