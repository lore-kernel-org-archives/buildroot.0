Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FDCCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A162281329;
	Sat, 10 Oct 2026 12:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5CUbtXi7hQ4; Sat, 10 Oct 2026 12:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9F28481359
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634266;
	b=LJQ5dt3xPA3lLGQhQxSwrHkfTzUBRpUElbT+HomRUcyeRpul2shB43AoHC4s9+kanTZG
	 /Ce/bYD2qmYYuoUsOR0LuzwFmbk0IWoFYxmRofgOP2jlG/B2gULLoRzuzcVnDaurit7Fg
	 k+/43270AlWCZ0erTIbLON1FKfbK1Z3qQf/XXbE500sBiMbYVboQRCNZGxIYwir1LyLHA
	 eHHRBmH3hrryQbRVluGk2BUr7wZR5MTUbQWmgnzbaHgubGaW8PLlkc23ihrTHLzy5f14A
	 Z4w3j1cAy/vfJTbGNn9ulRAh3ACsI7pFLqh3Tmy6uqhJPya0BQhuS6Rh5RRA1MIpAdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NCQRbd+6MG4Q82PRNu925IPwgqFXrFDOkYlOR7xUiA8=;
	b=L76YWMtJ7mIUuTMdhaEf0wHiP3yuck4qnyCbhkgDkkWNsw2/gvLuKqSrz64IBmBeWRIL
	 J0evsfIiRFvVx9Db+pdJ9bIcwTvsQyq6wcmchTEsj4Vc1FwX3FKrFpO03RrHUd7zaYuP0
	 tseL0n8qxes2FldKMZDq1BCiSrb0OedS0l1LnlwSALprOvewx9k5So6xiIbycYlnhOPyv
	 v+m3Oj53DD16acXg9Dl/aKEKaXyqH/E5pSdHUIonmGpIx3I7263hmTAuskYONL50/EIEh
	 DsXVCEyi5M8M5SznMM82GkFm5YgauhHqK5UIu9E6AP8Ks0afPwvcmsIa1emXoM397FA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634266;
	bh=NCQRbd+6MG4Q82PRNu925IPwgqFXrFDOkYlOR7xUiA8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAfDzgef/Y7pCoejrl1jSBwK9DsFLGZFmiZEqKV0F3pUqvoFR41ipSUrn/yKdKg2C
	 adKVnJeEl+UXSEMNrix1MN4E54OTGl2uZQCYt+6kYm3satf/PhloP1nKQugsmCsw+j
	 48I53fhq2bd8TYTq3AVj4xviXRbmo7AX4ocWXVNSTzp0pl6+D/6QoBF4z32ngt2TkJ
	 vo5TNvrw5hEBSBXGAD2vyg62yZmVu84l24unKWyshoeOZoil4HuKbkAek8To8IClRW
	 RsGEFKXr7ZJPyQJBs+TUet4eydz3ieLnIPRZFuHu684+1LEhl0FWI97Y6pbEPTcRAG
	 hGEER4uSNiSiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F28481359;
	Sat, 10 Oct 2026 12:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5365DEF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC1F960663
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cwsaEbBLGX8 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E85766066D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634253;
 b=cqh0+oxS4gWWELA8bZi+yE6PGNO1gwqkuF2kxEKDW5/Kui+3NejFYe90Sfvd7kcxy7Km
 XREesSpjatUlUiBNm2cmY4rlGRQD+5nFWB66Zk3PjkDOQIYLwMk/qgITmh7BsomI8MFez
 H2vhj7gD1NgQIXME19YJUQlvCv7EZ74/UyEvBpTvBWYxZjrep6FxQPSLg0YxlHQbinmoW
 /5s8UClSfHTeD4jElNWJDVaTCLjfBvAKSpFukww3wFFtc6PwkOoBNSRORHOixVkTfZevX
 v8h2nC6ph20OSRhmTLov304fcn3orJW/5uHM9ccS0kHeViQYaiyyOI+ebkFYnSkSzDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634253;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=x5pfhjTXzfJktq4OBFrIrGqJX0jLn06m9DkmOAcL0sA=;
 b=e8hI/K4q610mNMRZJZszENbOr7IDE2/cyt8V/O9OmVf9/2D9pbkQ0927zn9PR43eH5lC
 w2Upl7QurEjt3RebqWKY2zKzbaD0XPTiylIx4lC7cwGr83y3ohRF+9DGRMmO18TxN16nI
 YYYWZ5EsM0EDvQusd4sOuU/E9gpOIStrqfv8G4sfG/zj6LoDeqDxtkwFjmK6e6wXDS45F
 6drn1zps9lnyV+vda49/G3BtNnW703TD9k5c6bn2BhD4L+zDpW1CjaffbfJ90T6ByWXEU
 dqPojPYynzRCSSiIwPcBM8MvAlSRbaPZTyf6Pz3jDx8BFCJNALYZvW3WtopaIzJJ63g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E85766066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B72A291A9D; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daca74ca28da1e89e68b7740649b16b3199d8a21
X-Git-Newrev: 49e16432d70629180168e8abd7aa6f6ca00a7e62
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.B72A291A9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opcua-asyncio: bump to
 version 2.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49e16432d70629180168e8abd7aa6f6ca00a7e62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the hatchling build backend.

Add the python-anyio runtime dependency.

Add the python-typing-extensions runtime dependency.

Drop the no longer required python-aiofiles dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-opcua-asyncio/Config.in                 | 3 ++-
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index 139238b5e9..e51d9c1aae 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -1,13 +1,14 @@
 config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
-	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
 	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  opcua-asyncio is an asyncio-based asynchronous
 	  OPC UA client based on python-opcua, removing
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 0bf137ef95..6fbb632cde 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  8c41793e873928027dad4da9035aaf8a  asyncua-1.1.5.tar.gz
-sha256  d5edac9234fd7f1ed6a923fad1bd709bd0fd3f8a0d41637d645666620375173f  asyncua-1.1.5.tar.gz
+md5  0e7ce8a935969d74a4e14147d4514c78  asyncua-2.0.1.tar.gz
+sha256  f9f73804b4d56a12aaad7a2f062b15f08c856718d93a10c647d82a9f38f787df  asyncua-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index e7da7482fb..15a5e9b525 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.1.5
+PYTHON_OPCUA_ASYNCIO_VERSION = 2.0.1
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/49/be/be6dad2b7db58fc9e92260fa9fdda8604841f2863d60ec2c49dccb1f9661
-PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d9/7d/14830444700e18631853c417b05472c7036cd266e90866e8d0ae4bcd7c72
+PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = hatch
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
 PYTHON_OPCUA_ASYNCIO_CPE_ID_VENDOR = freeopcua
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
