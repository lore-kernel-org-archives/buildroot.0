Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87569CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80482405DA;
	Sun, 11 Oct 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uHwFSEKa5Kt; Sun, 11 Oct 2026 13:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 23CFA4078E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726169;
	b=mqk04kcViIydOCZOFcmJVGVkcpM0otJYFqFLwZsE4sTAOvdAnXr4n7+Z28LC9xWpQRMu
	 G7Orlq5UYEZyRT8vJmzkEsswG4sbDgarWVC+OFPInqaXj3LfI2oIM/NMQbDPcgmOnX8Xw
	 eE3smF0fIJJ89RETI9P3/Kf9pwVwbtXFDyrrHr7/XzldujR6ipOiLGbKZnRWoqgBtQlqN
	 kChNvWiC/TPNCYgR3kqZcLC7OQU5HJItVo6N7buCmW9kgIDOQvlrUCMpqxbgz6UpDzLvX
	 0p4mrUr9MgYxNEzCUOrUMbKq5kebem+8K8JdH6tAWSufNBwa7m5APF30gteHPBZvvXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x4U+hO96aDPFTr35z7zDqPaFK1+uTnPk1Z+wToTrzZg=;
	b=cdb06mWfPa3dDR2t4n6CBv6eBS6iCohsyp1geNQznWtKGkIILJmiHkX3PB5myBHYB3B9
	 5x4UD9/Rvy25gnLV+4VYTYTvB9aBEkVFrQxSwiXmozvwsP/xcxPljr8fq5T/WOQgnKz/K
	 f1ADcMTBnAAZWpoUTiKzXAKLzN08N810nKl0D725whCGHcAu9j77GlEW3OAR93IBljcP3
	 sz90N1UIQmHqv/cCtWnYIejRUJnmOqpmPWlAtgQ7wzBeHQJDibv8DMftasCBKhNRtdS/g
	 ly8OriJbqZ9l6IlveAavs8VvOxqZ/qjd7rYv7MjKxMeugdY/1thmx8kiB1XrNA291gg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726169;
	bh=x4U+hO96aDPFTr35z7zDqPaFK1+uTnPk1Z+wToTrzZg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rBK/FQwqMQuEAVYmcpINo7hpYhGzwt0jA527xdNcVQ59dAudSyDrJ9ibNa4phtOhC
	 9N1/H9CoJV2NteOpxcnnHIoVLgnthJLm1fPPP/5rTzlLNaCtM5WUae9WHtWHvcxdrE
	 rquVlF6NznGNZucX89N5cOn9KzduY3wp8Jt0sIg+35hHOl1CJ6/G6QbJvnDIZb5eMc
	 TGua5XGEbaLdzL6XvPBPYXXp38v4Jmd9U43b2K5NR4Hss/sUiuj4PM8fHe7pW5T6Pm
	 s5kMy8vfBAJLIFt/rFVmChO0KqRtUuhgQeZ5rQQ7JmvtYARrTmM/6a67bZ+CUJ17T+
	 x65A0NStpYZmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23CFA4078E;
	Sun, 11 Oct 2026 13:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BF30D5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 597DC40580
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HH9f8ZIa7veV for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 85EDD40561
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726160;
 b=Kw0QPJ+C1Q/wG3QfRk+UlzEgTelHB3uG1Cwck4V+xxWun6IoKu5tRB0HS34Fbwqmc8HV
 Wih/f7a40BrEeME9yxIAC5UU/X40xLwizmFsmojNV/4zjslP39RvFkzX7fb3ITnZqj86u
 Ri36dU4hxZjTWGmPtbv4HsBSsDa5Pn78aYrUqn0abEohSK7FQTzB0FnKbLmGaF9r3atkY
 QVJ737Dj6ajO40Yj9VEXXxjEEeAJSm7wHw9IDoZ6bkoqmyGfHLQFMF+IVi5KofaTGfaWX
 4NXt5hMhZYFsTJmO3NkrGCdLuzAb75RHzEa6dRuRqnjvcl52jMQj1+yhcvKTYSeiwDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726160;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=97NQ6J1/KTtmUDFk9upFp8w2LR5jhbf9Pw6qxhRqbAU=;
 b=VJA+/p967zpykyyEYKA/zBcl/+ZNnnxV5OdydxELLI3E7Z4d3Ld1rVEF+jZS6M+sn/r/
 Cy16wNnwCfzE61FjPk6DThD4qjQQ0VqAu01UqF/YTnsbv/P7rAXCigMCmdLFZDepgVTIW
 L/Md4PAk8ISjzJsdXCX/hWpLaYQgPEkbsklD74LP1zUaB6+u+02U35yISVMsTz9VSadx9
 RWDB+Nngxih00YvgjwSmMKxR3YOuHRwOzJI6+OU24wByfNslMo2nysJdUsjJllLtz4DpH
 joSzshW+TscRuAw2ss1JoA2Ad2Igxe/QjlrlVvfHIwtGrjZT+pO51WDsq3upu41DiMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85EDD40561
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCB808DA8D; Sun, 11 Oct 2026 13:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:41:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 053898a9c10b8b78278aa4d434fedfcbaf95162a
X-Git-Newrev: ca81f734c9d592763b2e9cc31493df09a528d250
X-Patchwork-Hint: ignore
Message-Id: <20261011134121.CCB808DA8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpx2: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca81f734c9d592763b2e9cc31493df09a528d250
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                        |  1 +
 package/python-httpx2/Config.in          | 11 +++++++++++
 package/python-httpx2/python-httpx2.hash |  5 +++++
 package/python-httpx2/python-httpx2.mk   | 17 +++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 15ba968e7b..ec29cc9459 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1170,6 +1170,7 @@ menu "External python modules"
 	source "package/python-httpcore2/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
+	source "package/python-httpx2/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanfriendly/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-httpx2/Config.in b/package/python-httpx2/Config.in
new file mode 100644
index 0000000000..2a24fbaa1f
--- /dev/null
+++ b/package/python-httpx2/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_HTTPX2
+	bool "python-httpx2"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	select BR2_PACKAGE_PYTHON_HTTPCORE2 # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_TRUSTSTORE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	help
+	  The next generation HTTP client.
+
+	  https://github.com/pydantic/httpx2
diff --git a/package/python-httpx2/python-httpx2.hash b/package/python-httpx2/python-httpx2.hash
new file mode 100644
index 0000000000..2570c6df1d
--- /dev/null
+++ b/package/python-httpx2/python-httpx2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpx2/json
+md5  29186979393f62d61718c3a525f8163a  httpx2-2.13.1.tar.gz
+sha256  e48744a19e3af5ee48313d0ce5fe941d5422fae5705ea922a4aabf94d7800dfa  httpx2-2.13.1.tar.gz
+# Locally computed sha256 checksums
+sha256  7e7d6dbaf7fe160d39fd6e84fd02c33cab96bcbea34d36998d545bceb4a19c30  LICENSE.md
diff --git a/package/python-httpx2/python-httpx2.mk b/package/python-httpx2/python-httpx2.mk
new file mode 100644
index 0000000000..dfd6bd04de
--- /dev/null
+++ b/package/python-httpx2/python-httpx2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpx2
+#
+################################################################################
+
+PYTHON_HTTPX2_VERSION = 2.13.1
+PYTHON_HTTPX2_SOURCE = httpx2-$(PYTHON_HTTPX2_VERSION).tar.gz
+PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/d5/44/474bef2a0e9d90f1715d32cb98b0738695ca17ba324095fb2497ed7fbd59
+PYTHON_HTTPX2_SETUP_TYPE = hatch
+PYTHON_HTTPX2_LICENSE = BSD-3-Clause
+PYTHON_HTTPX2_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPX2_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-uv-dynamic-versioning
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
