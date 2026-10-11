Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D140CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E9D406F9;
	Sun, 11 Oct 2026 13:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKpJzcQMJqew; Sun, 11 Oct 2026 13:42:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B3DD4065F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726165;
	b=mNEDK3/bDpz9hjslZCZlUtF9rNWZ3D8b3vViq2nBLwBVNhy+fsvTpf8BtwdSikR5sys6
	 t7MLDKMSxTji0xlIGUKN1AB/lIbZqg8/Fk5NOIPNEN0hqwNgQ2hOupOLa6Zl0yrOd9Wsr
	 bcAe5dLBGd1I7/4+sd5BHABn2x+NUZZxe2enQXmFu5wvSlD64veGAsGRm69yB+gpvDkIF
	 tTci6ilWyBX/5qqeVVHdR+Av0FYqoWiaUQ7aonDBf8V7uUXUw/vwC52gpn+7ObqazNeQG
	 h1ehKClwi9rA4V48Cb/c985I4qO3pyOK51hyM2MVOKfkg3bnkLwJyvuFUo1CwS09d/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GvYvM7p6G8fGXtgaUPP7t5qNKoE/cVVYguVK9Cw6A1I=;
	b=M9pn6TQV6aaRUa5BiK82YHGTscu7SQCV420ASK+iSn5YHFSfP6luvbrcDRP7Gp8RF9Ns
	 MWdGWgX51WPHL7rEMQcdf+btpTniMB6RCX4wQb+eq+1bFWDzWYo2CPaB6XSg6vdN/Y9QM
	 J+3SWHIA3KOycHk6URXL0KLdkOBr4Awxhvw8fFn2KJksQge7EZ7Irr2bmWTstkgZ7u2sq
	 tmpObE5tVOWR0fyDVF1/1nM753HyxkX8gB9CrcxDXfXXNJQG0uDLORmnxBEHYCfUCdxXl
	 QiN9CNkD+VEF5Bh7pN4v5YVxj31LHdj+Zv1TqjZWBeRPiQA3Wz8Z4I/UecoNXBLY3Cw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726165;
	bh=GvYvM7p6G8fGXtgaUPP7t5qNKoE/cVVYguVK9Cw6A1I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WAuInzwBy2QJTEmainnHbo2u33Usoav1tkzvZidz8qL4Cs37tpm+o05polPtd863R
	 pfKjWZium0RJCoqt1n+T1h2gJsj6rcaN8OWU8qwBCe0hbd6vhoBA6CbITUiW38uoKR
	 WjRld/yh8lt0M8FaJ7BMIX8/tiKcYHY8cRje8efz4yy/Kdoxk5rCN8R5Xo9uCu5f6Y
	 +J9VsI9Yg6cRmxNRgJEHQE5o5fNan9SiU0MaWCi3F4Qe55/eeTSJIrBN4vFbeBWSed
	 u38IJ3Mc9H23TzFfTNp/SQNL1UF80jaiyrQoeH5hLnMMk1JPLqWTa9wzFrARhZtK2I
	 i5QRLWvfxbR6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3DD4065F;
	Sun, 11 Oct 2026 13:42:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ECBDD5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DA0840071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93xBmfs4Jai5 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:42:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9F5954002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726159;
 b=tMPO6BiILCu0dJFFxZdtTPzmJwSYQFu4uUSiV4zGJHMz5aLz9L2yDQMMNKt7RxCTTDbq
 rdfPsCYKIkYglhF9vEAiXS7ZHIXCoCAl5rOhU2fAuzaBoSOHHq88CKyi2purI1d/HJzMA
 2tovkIgZyyK493/HTaxYseXkTOTk8Wwycfd1owPcJ9htSwCY1fJTNWR81riBz4ByQt1iH
 p/6cylCW2Targwj/jt70czD1waKLQLDysFAYAfeTbEAm0mnBJaD6Adu3B7DrPLU/BhvhW
 i6QpSd/ewMsU7iLN+ACILQ14BN2vGVZBxEaChxG7ZlqCbOttHEqvGz0tv6mbdp5JnDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726159;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0ROTcV67LCuEoO+yy6Gnrd/qjOSk/B97gd1hjS70TSA=;
 b=TR6z5CvgVBYmut4QRzT3isiavNvjmCKQLP/kP+Pi83kLjRoWsn/55XU6fK7w9Gff5LEm
 mRe0H8nP47+m+eo0dRl1xv0MHZpMg7L7Msfk60s6OOncxL/4//9+OX1uakn8dcZMs5Nx9
 HvW0MLH0LhK/aEb+l5AR/xDHaibtI2poniJ8Dh0jg8OaapixyygjutDE/Z1w6FAzXFtNv
 T7m4risnGSujklc3cMdPkSmNM1amp+Y/3QHqn1m/C+LvZMhS/YHg1gMMtgVykkSerIQjo
 lt50qdYv8ltszopYq/EbfxoLzts9hMO0ZFoGSijZs9S6J8i0bxt5Ht8V73rSoPnJ6tg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5954002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE88C94C6E; Sun, 11 Oct 2026 13:41:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:41:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31fd7de7a84f3859b007b5b6a20a72e74238a9e7
X-Git-Newrev: 3eec85390148ed896c844ee9d6cdc183fe92acfd
X-Patchwork-Hint: ignore
Message-Id: <20261011134120.DE88C94C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-truststore: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3eec85390148ed896c844ee9d6cdc183fe92acfd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-truststore/Config.in              |  8 ++++++++
 package/python-truststore/python-truststore.hash |  5 +++++
 package/python-truststore/python-truststore.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 740872a0d2..407ba05d4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1488,6 +1488,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
 	source "package/python-trio-websocket/Config.in"
+	source "package/python-truststore/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-truststore/Config.in b/package/python-truststore/Config.in
new file mode 100644
index 0000000000..48fa79eaef
--- /dev/null
+++ b/package/python-truststore/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TRUSTSTORE
+	bool "python-truststore"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	help
+	  Verify certificates using native system trust stores.
+
+	  https://github.com/sethmlarson/truststore
diff --git a/package/python-truststore/python-truststore.hash b/package/python-truststore/python-truststore.hash
new file mode 100644
index 0000000000..6c18984eeb
--- /dev/null
+++ b/package/python-truststore/python-truststore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/truststore/json
+md5  d66211e2bd37f6852bd6009728170313  truststore-0.10.4.tar.gz
+sha256  9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301  truststore-0.10.4.tar.gz
+# Locally computed sha256 checksums
+sha256  33be7b7e8fa4fd19b1760e1a8ed8a668bdab852c91b692dd41424bcb725a9fca  LICENSE
diff --git a/package/python-truststore/python-truststore.mk b/package/python-truststore/python-truststore.mk
new file mode 100644
index 0000000000..5ac2a6b563
--- /dev/null
+++ b/package/python-truststore/python-truststore.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-truststore
+#
+################################################################################
+
+PYTHON_TRUSTSTORE_VERSION = 0.10.4
+PYTHON_TRUSTSTORE_SOURCE = truststore-$(PYTHON_TRUSTSTORE_VERSION).tar.gz
+PYTHON_TRUSTSTORE_SITE = https://files.pythonhosted.org/packages/53/a3/1585216310e344e8102c22482f6060c7a6ea0322b63e026372e6dcefcfd6
+PYTHON_TRUSTSTORE_SETUP_TYPE = flit
+PYTHON_TRUSTSTORE_LICENSE = MIT
+PYTHON_TRUSTSTORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
