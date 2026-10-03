Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B33CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E9D060E85;
	Sat,  3 Oct 2026 15:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrhL_rc3tsJU; Sat,  3 Oct 2026 15:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6722F60FE5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043010;
	b=s9umeAQk+asLDg/JF68zedx8etii7pzGsJgUA4IdbQG4B0MG42vHCWy5vcVzn19pmAVK
	 J9qKbjNLr7DdtzZuAfDG9wUPodPWsWB5lTHqkIvpBbSn7qOq1fssmGjzfbaAfsIXrMeqW
	 HHl9XkS+0pDmHW1EdHoC9TUMHo81J5P6okfjei7GUNTQJf0fSy1YwSOz6OsM1MLc2JHQI
	 b4wcZeOFf61Xbcso2II0NRVnPS03VIR+BgQD9rtjzZbGCrX0RzVKO+/O/JAIxDDbcfCnD
	 BPqaJ5Icg/Au/d6I+a9m+jCmNei+cPjSTUxemCZYuGSzW1rVa1tpxwQKIWrPXs8IykQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IBUb808N28P34COHcZVeUtne+vzsQylwpWPZ8mmXJZU=;
	b=XB+ZAAFEOHLa2WCramO3xGEdIscJ3CVWd3jy37Apf406BsdsIHRpJTC1nu+rhAmbptKk
	 bMj2CI9YoFy7guyHjIGw+6TgoJ1EXs4CImHmCmHLZ0nC/h7eQ5CDHZDLU7DxF4C1mYOIr
	 JbyaGYPoc+6USqjldq7peWQPuvRSQbu6qlWA5aQbWR9D0r9nfY4NepscNesi8qBTN2jic
	 nKffSNoqKtapXbsZC3zRwGNiAfZbEyWPylwQUj6IdzM02QVCExb4oBFmZ+bJdKxk3Lx8B
	 7i8FN4vz0hauOkZECgpbAruo6Axo7vA6E3CXDBWSGlpqE956fB98YCXUYTdYxQB1xZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043010;
	bh=IBUb808N28P34COHcZVeUtne+vzsQylwpWPZ8mmXJZU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UYKJgfWCvZe1A9vpI9wW+nD8Ip/ouHzdS8zQ+qB5TbUJQ/bVIWGjX1cmGv9dgq4Ty
	 Dsn/WjO43dY0NQBAahwJ6OzV19v6DndgGwsslkaaSu1Rn8UMRdwkB+z9uvkW5I4Fow
	 2rqsMPmqMUtRDCKA7IWQbfZLy298Yu5MmOGYlg7dlrBuiuVhtGm8iM4qjuWhm+Zn6I
	 M8PLJXm1Fxh8aESOMwqb6ZiS0JgkEXekyOHDo4DxWSQ8mb0u6Xt2sw6PG3U4pN+s8j
	 i8HJEvLdVOxg/whJhsZHrpoytjNkaCem+YJLgPtfF6BCWsYPU9F+iMj1d/KAHeV/bI
	 51yHjgv2IJi4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6722F60FE5;
	Sat,  3 Oct 2026 15:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F72F1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 003476068B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dclR7BWsRzsW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 94BAE606C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=guDSenOkutlStxU9b9/waa4/WgaVMp1EF36cmmtt6P+NCGEs1Z97fxM+A6CtwUvyQoL8
 mMkhuJPvVGOP3ch7/3EJdVe+hLKO6vcXVVM3PX1xS/Z7hU3UAHCF8DtPtKLId5VE3KBYO
 vhwJ2O4n8IvhM/FppGPdDB9EsyAvRYmCvSYQSOS8i/V4eQvj504n9mHQJrU37XnfCcY+R
 Cmvkrd4hkAeFA9qHjrX/hcmMS4PYgozQ2QfvcEwHlWHNnrpXYVMf2DPW4ylWsUwnesey5
 Rd7vHUTHx4RHCkBn1xUIzye9DMx8OFM+rlL+38CfP0/eALHEYCSv3N30QJ6z4b9K9yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xs9VuuMfQsdroRlm2sPru46NjumNXc2uni/fC89HWWQ=;
 b=jHESmimlo+VLJiQpIhIO2yuwODxW4QN13b0PpGQnqhIUAFsxRyWH9l4MMoOhieHn/u4s
 +dshMMwfNdv9bhkfNJ3NQ3cjfP190YCfcDF03Th2ocjeUg8AnH7Xv+YxER7OLHmsKxYF4
 24jc0RoMSuLuOYh8nDOBdRz95Dkauq6TS/G3S8lnjjEjGjCCsFt5KD/uNxYqMSMSVdFx/
 L2Wncav8sJxV4tL5WpboLxsrJwCuu2tiTrx9Dlp+JRmkcXkMdF0RL7a19pWL2X96TpSd+
 Mup5UYXVLGAUCS7R7RRMRfz9Kp+VvCtVXJIjbW0a2jTYqPFCBan/27KYZ47emk/poFg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94BAE606C5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D60438A574; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 869410a5a42dcc86c1f357132b2bca3606622b44
X-Git-Newrev: ac84f36207a8e1d5bf50ec17f67bce384d5d7300
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.D60438A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 bump version to 1.75.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac84f36207a8e1d5bf50ec17f67bce384d5d7300
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-googleapis-common-protos.hash                              | 4 ++--
 .../python-googleapis-common-protos.mk                                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index 6a67af9419..e25d4cba33 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  6f61f5d3d898fff893450a597839ed96  googleapis_common_protos-1.74.0.tar.gz
-sha256  57971e4eeeba6aad1163c1f0fc88543f965bb49129b8bb55b2b7b26ecab084f1  googleapis_common_protos-1.74.0.tar.gz
+md5  e67910a98d106e703ba34483626c4538  googleapis_common_protos-1.75.4.tar.gz
+sha256  4587babdc82a8d7e5a3d4f5a6697e064bf44a598b4d08341c212b68185eadbcd  googleapis_common_protos-1.75.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 5fd2513d1a..baa2b5cfe7 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.74.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.4
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/20/18/a746c8344152d368a5aac738d4c857012f2c5d1fd2eac7e17b647a7861bd
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/4b/13/f83676de1dce4f8106bcba91725b3f3f4baf6ca1977685102b008b8e0097
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
