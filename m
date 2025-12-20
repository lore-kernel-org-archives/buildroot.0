Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DEEE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE44260067;
	Sat, 20 Dec 2025 21:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Z1PrMvxSAkG; Sat, 20 Dec 2025 21:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E75E6605D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267050;
	bh=FcSRU/lbgCMpDajHMI5kCtGXVW6pyssO0LIXmWudJaU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=auYP9/myDJ85qHD9d5wpacQnx4kLhP0uwzRMRatGsAYVx+o0I4L2ZzgwZkkyd1wl+
	 ObUY1Z+4llVpEmI2v2KdAk4nLuUweW4DCWJbjjxz0LxzY2sJZwpIEyeIKPKXQ8xhfN
	 r7nFXFaSbxJDN/2+MFvxLFA7BvHu0cgAszj0jNNuqn/S4ZKGe24VcGjjdAmhWaI7oy
	 R2NK41DozpkliC3AvsL84hGDoC1hYwzXM6TiE1EstYsM8d2h+QlkLjR3dJfRi2SRK9
	 PCQ0egQcWmblArxg+rsuddS23HUYOxVmSV2F1IhSmVdRj7bQ2rHWx8L3jIpJDmR5bl
	 fh5GxliPeOl0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75E6605D8;
	Sat, 20 Dec 2025 21:44:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CB223D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D228406DD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6FDDDDZB9iO for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61366405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61366405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61366405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36DEBA4C4D7C;
 Sat, 20 Dec 2025 22:42:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-1Gnb;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:56 +0100
Message-ID: <20251220214206.1089100-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266930;
 bh=6jvlQYWEHm+5QO8eoXikX2gQfsUPKQxiaNvsb7UV0H8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XXjNWywm6i7qzjW0miI6IR72B+YR1aIPEqdqKP2tJ7xgKVDhoOULGS+B3yumbjZMM
 OZcCVqOhnTLO5liKbsj9Rn01K/WMoTvpIeMW5bk8PRQE3IG95J+V81NFSyi+5o3ccp
 f/7iR5HETOZ+jU58ZQ7Hiq5fwC4XllJwtRG1lOP2D2Xo+PQ2dV+ajWLFN5CviTQyGi
 tdoCfQQyLYmybdVllvxjNYhFoo/iF5ZIHmuyZGOHbavfpur6xBqkVQpxOmBrsWXay9
 cmxFcuIxLB/M3b3ApD0T0156qnFSi75gfhzpwOuOVY4WKNrsrtlEf4TkRqJTtHvLCk
 xokhg2Yu5uKsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XXjNWywm
Subject: [Buildroot] [PATCH 08/18] package/python-flask-jsonrpc: bump
 version to 4.0.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cenobites/flask-jsonrpc/releases/tag/v4.0

Switched setup type to hatch and updated license file:
https://github.com/cenobites/flask-jsonrpc/commit/a4031daaaf54b67f002b62de162a904f3f34cee4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  7 +++----
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index ad1564caab..c8027aced6 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
-md5  29ca67027f53912cb146d9305ea3e810  Flask-JSONRPC-3.0.1.tar.gz
-sha256  110295be39c6d6a110063630c050e3f8a4f79c50281898b3f1cb8a18fb3cb84a  Flask-JSONRPC-3.0.1.tar.gz
+md5  f5c5a0364fc189e185ac6ddfd700bf0c  flask_jsonrpc-4.0.0.tar.gz
+sha256  468018215a1363f44e519d9f50248bfd4f3e1f6a7c6e709ac4039fa43be327ce  flask_jsonrpc-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
-sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
+sha256  fffebf4325dbab265f334f5040718822f7784c4d047b20124d3cfc1680f9b96a  LICENSE.txt
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index 2a60d73d42..34e7b7ad98 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 3.0.1
-PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/7e/9d/637a0620802e4c496bd5d48e3766c3a4fd6a03f815f9bcb183bc7a17a5bb
+PYTHON_FLASK_JSONRPC_VERSION = 4.0.0
+PYTHON_FLASK_JSONRPC_SOURCE = flask_jsonrpc-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/b9/2e/74dcb729aa2f5b49d4731cfaab5cb5fbfd867906ba7a0a6e32c66779dbb6
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
-PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
-PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
+PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE.txt
+PYTHON_FLASK_JSONRPC_SETUP_TYPE = hatch
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
