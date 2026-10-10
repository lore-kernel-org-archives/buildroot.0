Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF5CCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFDF608BF;
	Sat, 10 Oct 2026 07:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpXrd3K4FP8v; Sat, 10 Oct 2026 07:32:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CAE6F6064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617536;
	b=TFVycxWRLmxx5ngDagkOuMIzUXk2WPB8IXUdcUP3PDbAQB9vVQ1YKAWzSd1a10XvxVBw
	 6qp1jlQRqJkAwG4tCCOw6THQxgTNSRDPgYBlIJOip34NWFXX/tiqFR56NVKiqKfvfhNUl
	 yOu9lOr/C8DsmfJxDBgcrjdyEGPsbM9KZ2d7TAfzC5mNe68iUwskm3vfj9SnxXMGWjdFw
	 REUAFb/TWmequPgwUDOSTyzdEanKSLRzNM/KDFkCv0LToxstxgpNABT70yZDvcuAfjwW3
	 fY6znjiHZvp0ZI2znWCzd6AF8l4mEMIidEMaPrQPnZ+KiaMe7bmfe2TgbH+pCW/1UBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617536;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vzxcde0LsFSoTNRKf2ehUpN9t1I1IIHkkt9n7vnwIMI=;
	b=jkNxSfGojHwtXWKTEUhgwwVCeNPr03YIFA+hKWYN2/iEpScIsw6nLQwccbeOt0XR34Gs
	 QA/TzUR6/CN8uCkIEO/bV1bXEw4XQWkcrXqtRVcG2svkOcTKCG9XKUNd3IzdLFVcK04M/
	 0iJSnt4BD1pl+jMxthUTdlJhdw94U/jlLHQmE6+fwSsKO3tOn4ruqm/XneWujg2Wqjs6b
	 Ym6fSayVCvIDbppmGCecPzlmnEgobUPieqABJpv6JkTc/mmQpUNQ3v8tOfBN7vM0V6J6W
	 LZDkJ9TaOF1ktYSt999oWPI69WadQ9IZZay5OcjoZvltglYaS3u3jSgVUQ3jTLhp19A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617536;
	bh=Vzxcde0LsFSoTNRKf2ehUpN9t1I1IIHkkt9n7vnwIMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gkW5QF58yGYgkLeNxnKcob/YR/fVc8GP46wxNe2S3lZ4P06DmVKjeafZYmgO6Iacu
	 p6brvSosS46/XmjVnCJPiHoGfaqab4TR+cTpl/TV7qIzLadCHutnSiO7peXWgmtVHG
	 KcRjjlpk8TusvW8WhCGmH5JE4QGD3vRTRFTDTeG+SWwZPntF4KbZFUMHXJKmJdyutZ
	 fTfAY08IT/aS5IFSGpRn/1oSBKmdrzLz42WziJOQzZFUSsMXUZz3FZOb82V+VRzM0d
	 fcSLu3Oa/Oa+S2LYPMx+mea2qxuwTjh3T1PUEDbIGWbKE/NW0YZysB7JY5D024y7da
	 0iwqd7T48WdUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE6F6064F;
	Sat, 10 Oct 2026 07:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D54380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3707880944
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUVNmzEnew6s for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 306CB806A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617533;
 b=CpChlZZKG0nDGVxf8Ra2AMs6Ikv6dFhgk0UhDw/GtKs1BPdbAfmBSZczI2/qWs1uOYj+
 JzVadWIjWogQdoR1fI0yPBK6T41u/RwsB2B1SCTgwx6YlRkm7K7WDyuIE5wvP2RnPOvPz
 H+8N1Y8gYqgqLPxjZEO3tsXTBLuLAxTcNbRHW2vQSDQCRQDejK83VgXi0LtgOyn9zk1q5
 ac9hnvK2c6Oo4ydikve8J6OBlOBWFe8er9b25RJCZ30c73SBemO9lYqfRzPI5wVT9ox4T
 4UB/RxTyXKm6zIXyxZYix5a2ebdioh7XPGXzOE0MLaiH9bwBQWT2v8q/YR7PFDbSaFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oKRceikKa8yjA1OXg4lj/YUWNFJhJIrdOyqwXAjhLmM=;
 b=lrlkBQFxnc/rS9SBdeyhc0TJ6Ej+BjSAiQP7CnJbckZLguj6RuIij3PyPVbotVreych4
 foVss6LTQG/CvG7lyl20A8rcEG9SXG9wg+4lC8e4gaeh6POlztZ3gA1ed4yoVzDN5mEAw
 ymLIV7Hu68EIzcu0z83ErzXu3f/TQrrghqaKktLH2qLw4qv6Y2ADClbUNKpDT6Fgomf6V
 N1kIebR+RNwV3dOU8Nc74k3CsZ8poVD7OXwhuMfPkQynJ3f6pbVWnvvPLzzKHnMYi76lM
 pmVaobcbVkErkDUIgkHebTqCbcQcjf0zqiDHd8lQyqQvOzhysahRf4UBAs8NIDhv+8g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 306CB806A3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 492C18E6EE; Sat, 10 Oct 2026 07:30:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:24:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9c6725d16fe35dba0ea7a15bdd7c0c4a83d700d
X-Git-Newrev: 978efc055d705d97f36f08352d2eaed76c578b40
X-Patchwork-Hint: ignore
Message-Id: <20261010073054.492C18E6EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: bump to version
 1.84.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/978efc055d705d97f36f08352d2eaed76c578b40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Skip dependency checks as the source archive includes generated C++
sources and does not require Cython.

Update license hash due to clarified third-party license paths:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio/python-grpcio.hash | 6 +++---
 package/python-grpcio/python-grpcio.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index 9441d89389..e533bc1bfb 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  b2b6afdac225e749c4c97284a0c1113f  grpcio-1.76.0.tar.gz
-sha256  7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73  grpcio-1.76.0.tar.gz
+md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
+sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
 # Locally computed sha256 checksums
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index af9817a0ef..bf32da46a2 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.76.0
+PYTHON_GRPCIO_VERSION = 1.84.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
+PYTHON_GRPCIO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
