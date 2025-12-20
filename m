Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F84CE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0345B60E17;
	Sat, 20 Dec 2025 21:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w56Lxe0yvMA; Sat, 20 Dec 2025 21:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24AE960E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267193;
	bh=7tV0NDMsHaM1w4iWs+UaK8orXFxTzw19SLCqdT1vFcY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e1yK+zDHEfFArRGNvUppW0kKBJQL8gdCvH7LZqFcRwLKCsrrsyWqHrimzKdC7Bfwt
	 dX8SNcKEmD0/feGISsHAFuOsv6Z6ahqbPkSNKelhFYTwa1yOYGfUydjXCw3L0YbKz9
	 HPpVD/npyYPxOkdmDyK5im589OI+V4LXhMfDtuzNB4tvytuDLHz88Afu2yUfDg5KP/
	 j1E2vDDOA9DjSRJTJGVEbvyUTaLy68habtdNaXmgFqBJxYO8FrJ3CNyfJoXnokSCXF
	 stRdjAnDnRqobtAM+3oGG5pf2JV8M+6dm9a0juNKe1M+0ugBZasopSHiKV8Y+qBZ+4
	 fS0o666X/RtJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AE960E1A;
	Sat, 20 Dec 2025 21:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ECB1293
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C66B60E47
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Heh-crFvVdJv for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09F5A60E17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F5A60E17
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09F5A60E17
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F5A7A4C48E0;
 Sat, 20 Dec 2025 22:43:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4jl-000000002VC-0UeR;
 Sat, 20 Dec 2025 21:43:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:43:39 +0100
Message-ID: <20251220214340.1089315-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766267021;
 bh=xwqSOGzofbaW5dH1nZEYKRHXg7dsGrPpdJY9YkM2wvg=;
 h=From:To:Cc:Subject:Date:From;
 b=u45b8OMdsswwnOelhJ0SCe7EAVi2WVVGTVxuQtIro2bTqvrCRJziLuEWjGNXxUS3H
 GchI9K//Ggk9HYP02jF2bINLwBY42BZw42q/UC18QUTvKoOb9DxKT/WK3nPqVBGB3d
 +bxaG3SZ1BYUnRjMlvWEQezQ9RXeXwuoFk47dAwHuzdaOvtBSDSqingxiZCSZayGSa
 629y/rl3NA//LxGD9ObpEEIjl4/N8dNOUgB42r4mxwLdZX7TKBe+Dx3QIfz0udlHJm
 yCvV3GxpXGC97a50C+oe44o0rCg6leoiugn+KIrgx0rXL1w2MumR1BAJGuSjnYL3Le
 IYE8Q5sLGZG2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=u45b8OMd
Subject: [Buildroot] [PATCH 1/2] package/python-librt: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed by upcoming bump of python-mypy to version 1.19.1:
https://github.com/python/mypy/blob/v1.19.1/CHANGELOG.md
"Mypy now has an extra dependency on the librt PyPI package"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in                      |  1 +
 package/python-librt/Config.in         |  6 ++++++
 package/python-librt/python-librt.hash |  5 +++++
 package/python-librt/python-librt.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-librt/Config.in
 create mode 100644 package/python-librt/python-librt.hash
 create mode 100644 package/python-librt/python-librt.mk

diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..8548487910 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1204,6 +1204,7 @@ menu "External python modules"
 	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
+	source "package/python-librt/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
diff --git a/package/python-librt/Config.in b/package/python-librt/Config.in
new file mode 100644
index 0000000000..1e29629680
--- /dev/null
+++ b/package/python-librt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_LIBRT
+	bool "python-librt"
+	help
+	  Mypyc runtime library.
+
+	  https://github.com/mypyc/librt
diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
new file mode 100644
index 0000000000..174861151d
--- /dev/null
+++ b/package/python-librt/python-librt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/librt/json
+md5  a181c98593111a5844bb6465ececef94  librt-0.7.4.tar.gz
+sha256  3871af56c59864d5fd21d1ac001eb2fb3b140d52ba0454720f2e4a19812404ba  librt-0.7.4.tar.gz
+# Locally computed sha256 checksums
+sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
new file mode 100644
index 0000000000..72a0610dd1
--- /dev/null
+++ b/package/python-librt/python-librt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-librt
+#
+################################################################################
+
+PYTHON_LIBRT_VERSION = 0.7.4
+PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/93/e4/b59bdf1197fdf9888452ea4d2048cdad61aef85eb83e99dc52551d7fdc04
+PYTHON_LIBRT_SETUP_TYPE = setuptools
+PYTHON_LIBRT_LICENSE = MIT
+PYTHON_LIBRT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
