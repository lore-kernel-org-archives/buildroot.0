Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA5ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BEB60E1A;
	Sat,  3 Oct 2026 15:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOPs_KumwqiJ; Sat,  3 Oct 2026 15:55:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B3D1C60E9A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042924;
	b=dLxy8wSBqdE+diWjMEGOJpP6Uga4/5tnEAxRruZ3DrgJ/+9yjiyOWz5vW3b6cxzuDPDj
	 LNYqdUnNDrdIp6Au1DUqOySVvqRU3Tzzx4wO7whr1vGciN/j0+5A/IDdRxdRbbmtwovYc
	 JOKvYHGnBQizu0abKvOo0dQKQERYnkbrvtig+v9BFbALdLacQgbAheQf+PMsXEZ7IOu4A
	 iVeNMqEUtVm4uHRFhBDBTQkoayQTutlcZCk2JodXtKHZ8o5MUWqG4CrmkKeUHCkeYApWP
	 raAl51CzRgrplEeelhiHWSx2EaldoQkgKuD8RYlFSk/4sX4M0uAsikkL88HKdIXqQiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zw/EJk9P3XGsFSyfZUdEnvV1PcO7wP1+n3z38DJ1PWA=;
	b=mSCeuA99+6JLGtZ7LiD3v0cIoPSIS4OnvPFndf5qDPEBGfhrhOsvj2OBLmVTkGTYF3uH
	 XomZma9ed1WK1CIIvBWH+JYG9JYJctPi6p9cH6DzwXfXpKuH3HMNh6rGZDb9VItCBbZo0
	 k/V+W1I2uHySPpQ4SxKvngY//GxzDQxh87+MxzWJx6rIXdWghozTSGxKMLjfm/TvIBz+r
	 b9xT9tPzbjMlC+k54ctITn58LPqxLrl4xy61jA9gPtuK05+DW6chZlWxC6u9jnp+D1fT9
	 N0dgwFjjmai3jgWLmRb6riynE72TbhxSkae0lFsr0FVDZjRiBNEtXicrKE7HvWhcPdQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042924;
	bh=zw/EJk9P3XGsFSyfZUdEnvV1PcO7wP1+n3z38DJ1PWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CSQHYlCYJX6nzsRagXaEpuGzgUrSXJV8UbSJ6phOx99IXNko74IH1qnZW7BJ4vtDA
	 fxnPMe045Qir9mEIfH0/h2Ou1UH66SwpAeyErrCTsDQUwuxyvo2o7agYPQpmSA7OGo
	 NQP/njzY+lNqXAvg5XsF0995M+vbqPYYpBp737kEacs0etGGHLb6ZKC12l+Gixbouc
	 zI0z5x+J7TYq5Nb7eRQgdAhx1rKtrFrrlIszWAN99v+hnjwpjyspSFFAcYU+DF/klm
	 cZdGR9gTVLz4Uty2aefng2QVS9er02OU9HkPFwE0sVG7qAsTnxHR+Z9qCiLP7YM23d
	 LhK4K0isE41oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D1C60E9A;
	Sat,  3 Oct 2026 15:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E93589DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7C8A60689
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCv_rj9ds_TD for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 092FB6064E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=BDlgXMmhLjdH2f5HVdPj9KtYyYphxPQC6rcEB8KhOX4p4Dho6tBclsmPzXu3Zx0EBtgz
 LR3JpjXZKnHfRW694eIJaOAzAxR2mBQmiEy9iF/SbmWpYnfIccWUjJaU0oJQonxJceQtV
 zTUydSe3K3W3f9gLn21MMqAf237wnBxy3sOHSPMixLqMWbuzW1Yd01Ip1AbG1nB68YZPY
 neiydNnoB+9wmzLcy9gpdUQ+yXeLMwk7o0PIjxDrNKGzOK8jKp9OjmRj1X8FvU3gAfHf1
 YfKsPc6hh407MA//EuvdMawkFkxPBbDhzvBsPrK46Cyeelq3HpFj/FhrFOui6idsdQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5iQNwLLIKJIXuYPnxPv9D6cuxekTMM2w0pPT7NJ9p88=;
 b=bLopKlFlFPtEwMVLcmDIUkoqadPw5FTkXu7ftwUoGJRGr1sZ9WtgtJDU/tif7m5kfISO
 xEPiqzD8CysthZwOZp4N+4marZO50K5rTl7a0nIJUw2Ti5EHWxWHmCzbGtxsEwnHq2PmV
 q4JznTL9enI6JWBFwyx69S5EfuQKcq87tMVQwuydPsYzpKCu5Ux1uJBAmHDebSuYdanJD
 K/IR9g53WXD1Ad0oo/go/djpg8nV7dyoAjk3LePY2wT8RcDMWi79utp7YTo7MidqUxLze
 o2boq0kDSQKy9sh9dAPmL9euVd8aMzj5Mwc6EXEfafkko8ZAG1WPGZq+g60WEJ9zYJQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 092FB6064E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A2828A31E; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 241aacd97ba874feb2869f50488b979681087227
X-Git-Newrev: 8926301d1e9f9918935535c5a46ada42f8a76f36
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.4A2828A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump version to
 0.19.2
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
Content-Type: multipart/mixed; boundary="===============6379949437386027262=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6379949437386027262==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8926301d1e9f9918935535c5a46ada42f8a76f36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Raphaël Mélotte <raphael.melotte@mind.be>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index c7e62ce5c9..c089207b1f 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  e85dd5bd00128d9f138db0d49ec24acd  s3transfer-0.17.0.tar.gz
-sha256  9edeb6d1c3c2f89d6050348548834ad8289610d886e5bf7b7207728bd43ce33a  s3transfer-0.17.0.tar.gz
+md5  b97db752b08e1cea95b7f958788d83ed  s3transfer-0.19.2.tar.gz
+sha256  ba0309fd86be3c27dbf78cdd813c13c5e1df16e5874b99d2535ebbdfb9892993  s3transfer-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index f0416bab90..12d654da60 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.17.0
+PYTHON_S3TRANSFER_VERSION = 0.19.2
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/9b/ec/7c692cde9125b77e84b307354d4fb705f98b8ccad59a036d5957ca75bfc3
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/76/43/35e4d8aa320bffe8287fe8f65f578fa2d2db0a64212f0e710dce58267854
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt

--===============6379949437386027262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6379949437386027262==--
