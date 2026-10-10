Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CEBCA9EC3
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F5781359;
	Sat, 10 Oct 2026 12:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SO_3WaQJGzxZ; Sat, 10 Oct 2026 12:11:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC54E81329
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634272;
	b=jCtyGM5U5ixMzmCuiqcQZgHralsG4ClSl1PfI2hPo/MHZ7Bh2RwykDbcnh9t8EdzNYQ9
	 DL/ZlfmX6L0jzw2VcQs2ZHT5C6NWlO5SGP0Q/q5lCVCAcecRGKzSiwq6QTMlPoLk/FJeW
	 ME8U49UQ8BNSlV2HbOzrsxfKgSeXq/LmAdo5NZscQzaxXQ21wIqUDAuwtIQOufL2ic4z5
	 jHYnLWZKLV8sj3K2GVpRArCeVZevuHmGa9pWw6r3E4e4WUUYgjgAfsZ5Y1MwbymnOuIQM
	 qPqYevNcmu8wDd1LQW+h7/392aDOKnYex1354p3XZVX/78NTCcnQ/bpvsZSm4si5OqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tlauz9+YnhBhsnuEo3OKCxHrmutI0K+HcXz/FwdMt5w=;
	b=LSAYlh7xzzR8NRPGLwzEkitaZJzk99GWklzTpLek4UbROB8WOwXfGELB0+mpqXWcyD0o
	 e9LyxYc2oVQ9IOtiR/xGWmyG/idoSMwrl97dJyWyQ4OGbYLEenXL4hJgyzA/FqpbMUMl9
	 paKpTF82FiJ+0HAYlGIIHnh9ed+dv+xM4TDxZbFrgAezG6KqqJZ8tgfeRH9/mFZxW0pVz
	 sBhkqP/xr+gAcY6YAStG5IoUiJ5MiDU5QmdL5mvqCvUD6I73LRAbyzB/ceIQfjnKQx9fb
	 AcF01RFCKT3uzTbBfK8Sotts/Uo1z2zU5AG4ksy3LQL42LMVRE3zQn1hNmSNCVbMSTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634272;
	bh=Tlauz9+YnhBhsnuEo3OKCxHrmutI0K+HcXz/FwdMt5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=irdZUIpKFZ4m/FPbz2AO7DWIDL4gKPgKYZuk1xH7jUppqRC9SSRP6rmo5VK3mHSWN
	 MuweA3fSWN3MtPZAxlQ5omSP7EY9tWpmZKRcOyTCkrgJpFPGoJ+PWXZC5aMaT7NDJh
	 s6fNQagxbJ4ahLczWdB8yIuwVgLoh01UiXwRgMjqYGZ/ggXlaQEJ5U2hJkMXwPV1P9
	 JfZvLCFHPHbLeMk4Abr5RK+jq8Gs5HdRnF3MprfbIReWrLvnY3BUbaOC1qpraG0QqY
	 XI0PTgjxd6P3U7Gat/YFT61k7XjyWMLcCQuKj5ebHlj8oRRUQ8zRISTAxe8FEveQDs
	 gYYh4AQS2vDng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC54E81329;
	Sat, 10 Oct 2026 12:11:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9283317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E665660663
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVFRmX4nrujj for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06EB76066F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634254;
 b=m7YMNHt/HSN31oS85SJ2QvMwNIVnbJ1KDrWR3RRgtibSzfNxqz6sRLLhwOlroDWnh3X8
 FFK0Qte666VPXcdfUQeCOiumNcx5uDf0bvVxOsY275qLrsXuX7a4DMO9qnxBrksxb7287
 TscqHRUfgbsfG9o1zo74ZDA3CCae/HSNGdOXAf3gBMHWTgdcrxSY6gtY5qlC6M/CllNLw
 xkknQDd9+7E8rHH5kaEVEPHwX87BerQupLVG9oiogLYiGqvmwz22AJbApgjYsdwm84rSt
 rP9Zh6TcTc1o2XaZzgl6gKSFoY1PK8nMB77i7evLxQ/aSjb9Ythno0WQYeT+wxOapqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gQ6+uyhE2Fpt30HSi3wYRCU2EakCK4ZXtB3HDFO4P3c=;
 b=pEKYB8MoAVahPoZudq+Jy14R6xvyQopxlkjvoeINpXvVhU8jAfh9wClzlSJ6S6KKEgat
 +KJbti6LICcZzq5ISu6PJxrPmjWDoBTstjOP5tdDW6ckJ2D40MCvNwjraCjZvubXCKg/a
 cQnmMgcpGn8FaQhftbsaBpojCznna5uqXPAtEjzKtojtTsT+qcHdDikoIwC5vi0eY+O3s
 mlN5RcErZ7P2Dg7GkIYrH50TVPMEWkahtbs7hdj7rbWWz8EURyZHLPaDgZpjET8/c5RyG
 W+orqYYVF/dvrWxigO6oFXR36Sk55aKwOskGR5I4+LjM3IfhEZB5RbKEDpKFdvmzr+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06EB76066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8077919E0; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b6b90b7747fa667293b0da0554e809f01f510aa
X-Git-Newrev: 5e40296d38326a9e9e754bae7f5cacfa7d586d1e
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.D8077919E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opentelemetry-api: new
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e40296d38326a9e9e754bae7f5cacfa7d586d1e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                          |  1 +
 package/python-opentelemetry-api/Config.in                 |  7 +++++++
 .../python-opentelemetry-api/python-opentelemetry-api.hash |  5 +++++
 .../python-opentelemetry-api/python-opentelemetry-api.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 33568a1b16..25bf81ec52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1274,6 +1274,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-opentelemetry-api/Config.in"
 	source "package/python-orjson/Config.in"
 	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
diff --git a/package/python-opentelemetry-api/Config.in b/package/python-opentelemetry-api/Config.in
new file mode 100644
index 0000000000..bed9bb84c1
--- /dev/null
+++ b/package/python-opentelemetry-api/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OPENTELEMETRY_API
+	bool "python-opentelemetry-api"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  OpenTelemetry Python API.
+
+	  https://github.com/open-telemetry/opentelemetry-python
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.hash b/package/python-opentelemetry-api/python-opentelemetry-api.hash
new file mode 100644
index 0000000000..914a0f830d
--- /dev/null
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/opentelemetry-api/json
+md5  7ad5b73590259f0da66c9d9314f1af80  opentelemetry_api-1.45.0.tar.gz
+sha256  711ede81773c8025c2c03dac0450bc89f3d30aea6eabcc815c570d4e35a963f7  opentelemetry_api-1.45.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.mk b/package/python-opentelemetry-api/python-opentelemetry-api.mk
new file mode 100644
index 0000000000..84af11bfb8
--- /dev/null
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-opentelemetry-api
+#
+################################################################################
+
+PYTHON_OPENTELEMETRY_API_VERSION = 1.45.0
+PYTHON_OPENTELEMETRY_API_SOURCE = opentelemetry_api-$(PYTHON_OPENTELEMETRY_API_VERSION).tar.gz
+PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/1f/dc/e12c1fe1ed8a7b7149777127b1a0e12ce5bd5a81d97408bedc2128c260f5
+PYTHON_OPENTELEMETRY_API_SETUP_TYPE = hatch
+PYTHON_OPENTELEMETRY_API_LICENSE = Apache-2.0
+PYTHON_OPENTELEMETRY_API_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
