Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161BC10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 13:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC04D40FE8;
	Sat, 14 Mar 2026 13:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNKtFT6A8tm6; Sat, 14 Mar 2026 13:50:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB5940F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773496245;
	bh=Hn5Js16bP9732/UsanaBIISVhAqKtcmgxoFnctWBDko=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GoH5KKTeZCS9VhGHoJ0VYO1gJl9+4YOhgnBT0WS8oNRLbpHs4DduaTZcWvtD9JQZr
	 PQ8Igm5NXWjg/n0GJRiYDGbSyYzAsz5W3Ec3rkbZnf+auM1v6OUKcGubHrzyjGZhzs
	 4fOUnRH7IrrBgXoMVWnk7Evc43ehK1pNZj9H09z13xUxJPOJjjnStBBitXCNRaXFlB
	 2G83HISH2Uh2+6w0Wv9SKdIhfsxlq6wa+b0ZosOxJpktPzJ7pyNoWsVettorVDnGdQ
	 7MmcEmA/rREcvO5Zrveiqqp4ouRgrpMA3eyHwQhni56WKKeLAcz4N/5HcqyTpbaHR6
	 RdneBw4xuxWag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB5940F6A;
	Sat, 14 Mar 2026 13:50:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCD603C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 13:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3C756073E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 13:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPa9Wwy-vJ3a for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 13:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AF3660771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF3660771
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AF3660771
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 13:50:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CE86A4C082E;
 Sat, 14 Mar 2026 14:50:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58590)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PO3-000000000gz-0onE;
 Sat, 14 Mar 2026 13:50:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 14:50:39 +0100
Message-ID: <20260314135039.2939013-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773496239;
 bh=fKzYtADO9hyxzJbdmaLDVx39nAshZsvwFIqHHTlLV4c=;
 h=From:To:Cc:Subject:Date:From;
 b=vo8klHATaSzLT7pPXFrg+XQBX0FdS7CvIPlwMQqquBVGVJTzKpKGEz1ckQVeOIfv3
 pAGuZoQKonq/WqM0QH/vcJO7L1iaNTJGCXb2uDiAb8eGfHwZW0s6IMyflai35MVsJb
 ObobxkRI5yXU0kiofmAuUmFYi1A+0xBpihaQvxdngHLt00IiZD2+uWIBoFIeiizwsV
 p6pZ+PAUKKxDwLNW+43DB8zjPyzaGVyw5VKcvJPIUEjfr9L71N8d+THyS5HqqabHOZ
 DUkYyXOHzvfEer8XRexWcJAwABF1j551eYtaqMa9GROKdnZS5O+o09+xODIAbkrt50
 h5T2m3vaHpnaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vo8klHAT
Subject: [Buildroot] [PATCH 1/1] package/python-html5lib: fix build with
 python-setuptools >= 82
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

Buildroot commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92 bumped
python-setuptools from 80.9.0 to 82.0.0. This version removed
pkg_resources: https://github.com/pypa/setuptools/blob/v82.0.0/NEWS.rst

causing build errors:

  ModuleNotFoundError: No module named 'pkg_resources'

Fixes:
https://autobuild.buildroot.net/results/eeb/eeba81aecbb01117f7b7af24d0a6c02f3c32cf6e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-handle-missing-pkg_resources-import.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/python-html5lib/0002-setup.py-handle-missing-pkg_resources-import.patch

diff --git a/package/python-html5lib/0002-setup.py-handle-missing-pkg_resources-import.patch b/package/python-html5lib/0002-setup.py-handle-missing-pkg_resources-import.patch
new file mode 100644
index 0000000000..1bb11476f3
--- /dev/null
+++ b/package/python-html5lib/0002-setup.py-handle-missing-pkg_resources-import.patch
@@ -0,0 +1,36 @@
+From 63dcd5797d9b7c92d9b605c08bae19dc5c1cf221 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Mon, 9 Feb 2026 18:36:08 -0500
+Subject: [PATCH] setup.py: handle missing pkg_resources import
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/592
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+[Bernd: updated patch w.r.t
+ https://github.com/html5lib/html5lib-python/pull/592#discussion_r2867665876]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 30ee057..0b7a2c2 100644
+--- a/setup.py
++++ b/setup.py
+@@ -6,9 +6,10 @@ import sys
+ 
+ from os.path import join, dirname
+ from setuptools import setup, find_packages, __version__ as setuptools_version
+-from pkg_resources import parse_version
+-
+-import pkg_resources
++try:
++    import pkg_resources
++except ImportError:
++    pkg_resources = None
+ 
+ try:
+     import _markerlib.markers
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
