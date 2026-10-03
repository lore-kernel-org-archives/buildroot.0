Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E021CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A78606E6;
	Sat,  3 Oct 2026 15:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3sPFD3O18Jj; Sat,  3 Oct 2026 15:55:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4657760E38
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042905;
	b=opHjNaiHT3b8e2MYxDAJT+T0z//I6qjunFhrQRDuwpTsctY7LIe7dgTHrUkFWizQ2e5Q
	 0a2KVpPnal/xqQGZbRxlv6v357AiOmPSWnTIUDYF6j6g05Rq7cMQuIxWUxdC00Veedty7
	 3falyW3nHEyjyydsBqKI1yUYbZ6mh/c+5mCmqx68EJgb59ZhnNOsJG148lYO7NWE31U/M
	 B+for3ofy3AI3s7iEoX5gDrMPMsrdCmKaJMbcsNnGZvdfJi+d1Bj0+n2pn3b12sMQCmQx
	 6uSHkdGxbXeVVIqnwjoLp03LHFTH843sbgMAo+FQjxa+0ihC8V043S4GXkIz7hszauQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=o7QYOtD589DRrFM0pynFJwcAHlOp0PcZuN2Gc0kdM1M=;
	b=Ch1JNtD2lPFi3pU3viL/QS98jNQ46b6DWu5JftD5gumXLj8LxfzR6tv6O43MSqqs+gtZ
	 Cb1CR5eWiSl6FwXdgBW4DI0eqcJV6xLeWmeo476SXfwkHnbwHxt5Kyb3/nlSFSMWKzFC/
	 RDHHDLnfDaIrZ+/dALRQ0hC8OBaNQxU2WYL23fhluBeHwMsI2LHFxztyzizChvQOfATbd
	 YHslD7j+0ZMyTLbGHLlDBw+ITPWn/5zTZKFFnURkdsS4L0zglcUE21J9b3AV8d9NYwI9y
	 DPowrVyj9HaYT4tbcfAf8zsBYX2LycEQiyixC7T6yhWzj5Pe60CJ25DgB2fAAFDyHLg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042905;
	bh=o7QYOtD589DRrFM0pynFJwcAHlOp0PcZuN2Gc0kdM1M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i3AWNC0faUYtkEXGyElH3+2N8+0n7BCUoiF2gx0BzZFy45ufCvdqBfKdCRiH+cu8I
	 K57MuPHi2uSprqxbD3C/hRatdq2j85MZdPOwS4BikGWCROkBAeIOtHRp+PouNpCdou
	 AN6v8tKQ9ZYSHgqiBQpi5wGovHSed/zYC2K4zf+BKuYoXwFUXVZ6QJdA/2w+BPOJC3
	 aXRD7Vo/9bw4msy/d4uyu/TBoT7A42r7FAjbBgu7kSSPJtM3ObsMY36w1LfkUL/GXi
	 P1pFiSNwc9FXtcjTa7gWKGaqA8y3N5UZXq2IYKFPHJ1GasIVqLFb3am6JNAQ0Izn+V
	 dqg/6+B82mHxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4657760E38;
	Sat,  3 Oct 2026 15:55:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70695A0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FDD5400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxfIMK2mxKEN for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7D81040049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=VeampXrx1tntdkw1VdAy50rzNgceK+J1sJLq5z4r/y1nUhH0JLh6WbKDpc0Wu3UztoGW
 xzIR5JA9gxwzskfGoQReZc0XN8iuFQrq1PbB0hLq+ZLfRd0hIxfaUSOV7QRyeAYgf/XXt
 K0U3RY4IZwLdBceJDwe3jnZeDQtmLzGfbIgiMJ70DXIVpZkC0TQGZCzAB0jjPKYl2OXBB
 MbJiL4nyRACgSJFM+M/sEuyrf3n+yxbjFw/hh4YJuxZFGga0acsRFVTJ9DKHg4ElnEA0h
 zOl24T2Mis8jRDQ8Gt+Yhe4AB9pzruD1QiKBCC2gLrE7nU2RCa0/qUvyj3Mpl/p+xMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OzXNlK+9aVcNYFDcSWp/2B/tMoFGeXwEmR8AlZVrTHs=;
 b=SYH0ov6uNuaddXOqkd7iaDyne7cdPfIkebSzpAQvIeJdkEfSKq80Y8yi7zrI3QrIb9IO
 70PHj4LxkjMdd/Cwm4SNbyU4hyhFjC1goo7C7GkWoD8Yx1kaavPozvvqFLbaqExLnJ1rk
 HQGqVIme0AQnDqq2rJm/6ukGqjrW6wwMJTD+HYLUmQDu6OYBy/7nsQEJg1fe8kGiEv+Zp
 doUffHvoVr+dIP0AfvqmuvS9Gq+LJdO4IHRwhYJNI/E+Jq1QykGn1e3zexmlSGiSJNkZb
 L0pInGBV4O4zkMw/xKa46d7xwpX4NkKYRvNjh4PpQSoMan2v9LzfpILbrxuhm2XtgoA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D81040049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE54D88806; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c23c414f78170d023be3c4d33286cc9bad7e3b33
X-Git-Newrev: 691ec67d3245ae3e2c539fab9cd71204849e81bc
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.BE54D88806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-thrift: bump version to
 0.24.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/691ec67d3245ae3e2c539fab9cd71204849e81bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinicius Tinti <viniciustinti@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-thrift/python-thrift.hash | 4 ++--
 package/python-thrift/python-thrift.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index c6fea735c1..452bb7176b 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  d900f4b437b1ffba7258c58c3fde40db  thrift-0.22.0.tar.gz
-sha256  42e8276afbd5f54fe1d364858b6877bc5e5a4a5ed69f6a005b94ca4918fe1466  thrift-0.22.0.tar.gz
+md5  521e6b4fc5d135af2d16f7198dcfa0e2  thrift-0.24.0.tar.gz
+sha256  9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c  thrift-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index d0c7896f8e..182139015f 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.22.0
+PYTHON_THRIFT_VERSION = 0.24.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/b2/c2/db648cc10dd7d15560f2eafd92a27cd280811924696e0b4a87175fb28c94
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/5f/bd/8f90501b11206e545da3343ed0e5740fc694be24a5f637d7dd7e4e3af927
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
