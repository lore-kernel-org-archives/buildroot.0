Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A674ACA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801B38113D;
	Sat, 10 Oct 2026 07:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMPGgf4MVj5X; Sat, 10 Oct 2026 07:32:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9492580E31
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617541;
	b=DEcRqWpWZ5ECp/Yh2reJlefhfxxIIUd9QzXII/H1ZTqIRCCvRhyf0I0NT+CJjEbHsg7x
	 DvsNQO09GGD3vrcRLRUyVgz0Ai6bSSXZGQ8cjSd8pj82om0FYXta0UIh+p1p35H7FerOV
	 HbNNScyFAH+KszAUwPxNmSEpnwemlERLkrIZjcQn+2bnI1JMzrSIbp8TC8c8CxYTbvedh
	 gdxCEN87Yj+Y5mCd0iac0+cjPEPISE2paRqsxByXNqHLkIxH20vslM+e5OPo2FuPlKZqk
	 +A0HW6yELGEc0eBWPzRX3Uj1XPELjy2OC8PPA0zbLtQy0IEVJ8lxcad9CtEn+TE7n4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6KZqXzEBZhsrGgsxhnj/BCIo1NzagHbYhfd9VsUnY4I=;
	b=YxlC6NnYi7ijtvqlAari7p7NHhukXaDOJt8cAlP3/srBJTpATYCkbRnlMhvPbGRWbzAN
	 p5SC2GSkPPP+O7nMdX5VDoPHkjT1ODkuTyfaX7uasTRA0X8jKr71ngp4ygLNRqpHyYKEV
	 zyua/X3FsD1fqNm/wnjuN8vjGxrCcvGxjoFWdk5/3jH7cPvRJYqScXNUSiB0EghbMw5rP
	 K4WyHQaDOpuDrzQJaP78Mo/yJ81a91U1yVf9s3jyl8gOGAU76s5BUtHBcE3fdjk9fg6or
	 A6QGUyHtnUEbfnfk7AVu0XRB4UVSCVmAJ5Ztmttsc4jloU965whiGFDVofrxe38rxDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617541;
	bh=6KZqXzEBZhsrGgsxhnj/BCIo1NzagHbYhfd9VsUnY4I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KF7AxVR/ODcR5iNnFaYU0qhbJg9zrA9cYmciW6fq30Ha1+vCO1bUS4AcN7pJ+iD6B
	 GQcBSVeQYZmzWLoK7r755yuNSJhxml4hUrtLchpDVN0XN5RP94eKglda3+KDLf5M8J
	 VjQsb3rjeFbOVfmL7kTZho9i9LBpbQ2oSskzJOofxuANUVrlgWxux6L1nlSqlaoUTA
	 1zkcL4rH+3k0ttBeT47tRPyToEyyK8v5TdT/Dvak60uslxZqiQ/vs3fJj5IaVp9W1c
	 AXxi68ewqQbN2E4UEim/yDba19N3Ze3b0T/t9YzifdzM4pQyUUSQKX0Tx4L/81/sdQ
	 ifOE/i14ANLow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9492580E31;
	Sat, 10 Oct 2026 07:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59907A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6AC6064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ey91PJAGrwiD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 43E196061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617533;
 b=Jc7WqDU0phLOhXXRxJ3zEN0Ult53Z1vLgw7Y/ykMT+HpeYMBsAFMedKh9/+ipfG12lzX
 zBmDYvyQLxhjHbPq6SAKF5JHBfE+ywF2Vnhn94VP+0TUDHoEUIQTIB0g9Sj8avcWuEGn7
 k+gH0gKwolZ6GwwNFc7rocpbnqEHgpxCE6Ly40EX2g332xU4kEbh2U7DpcGlZ4uIt/BH+
 wL1mfFunPM/VlCqbf+KfK9MR/loxxOcGcQ48S/Qf1v5sIAjDpXCtMncX06NWnUTbSGG0i
 lMv2gTmhhxbjFhr9Ez9A5opCJYrEhR/jVhabXSFM+YVjA8mKgPa/QvCcyokR900Oc2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/JshZRr71nts3Ec/bxFhUL5LbUFCar8nSlIO0RI0mvw=;
 b=RqBqu0l8BtuGARHlrjeCZnq7SN1/+BaGsFXSF/8DUFgtXdgFOqfXDfoAluD1PND3QYOG
 /YVu+jN5YDOOJfYntdmZ4gooXBzYO8XYMz/Zg+Gx1Il/HGzw9MHpbCO5Kk2hOrCCK6w9I
 S3TgXqvcny3Pb58EBoZIiZUrgmIcCK/UQlVXgnMofiwCJlO1TQxZlXyWZH+TantKykzio
 bL0SADO8PPCi8zbac9dLova4ZZdBJ4Wur0/uAlRFMs8ao3m19Gjc/bhdwb/TYoaPS0MTV
 wEoAXllFLvca0eXV55EJ/PVdS1tAZagjKGs6+F0U30Jtgt90RKm1XcpU57rKv1XC4og==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43E196061F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 254BE8E6F0; Sat, 10 Oct 2026 07:30:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:24:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 978efc055d705d97f36f08352d2eaed76c578b40
X-Git-Newrev: 1b3321fa8fb14ed55965cd95b5db10ca2e8f0fb4
X-Patchwork-Hint: ignore
Message-Id: <20261010073055.254BE8E6F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio-reflection: bump to
 version 1.84.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b3321fa8fb14ed55965cd95b5db10ca2e8f0fb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to clarified third-party license paths:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio-reflection/python-grpcio-reflection.hash | 6 +++---
 package/python-grpcio-reflection/python-grpcio-reflection.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 26045afec3..9d00dc378d 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  56a49e3d124061a79c094b053d29c778  grpcio_reflection-1.76.0.tar.gz
-sha256  e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1  grpcio_reflection-1.76.0.tar.gz
+md5  45379372e331e398a56919114493ea61  grpcio_reflection-1.84.0.tar.gz
+sha256  06bf3d7d8cef9afbcc721ee52191652b4483831774255e174404b0e0551741bc  grpcio_reflection-1.84.0.tar.gz
 # Locally computed sha256 checksums
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index b79ef083f7..9218fb0010 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.76.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/10/767f9c2719c435616141efb3371f6e158f95cdde36a34876ae1d08ba7440
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/6e/8a/94af17ae0738cc4508af96d5f107f352e2b54473eecf32f0ed9bcdd895da
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
