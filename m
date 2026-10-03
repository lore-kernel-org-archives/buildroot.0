Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DFBCA5FEA
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36C56068C;
	Sat,  3 Oct 2026 07:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FOljVJLgN6g; Sat,  3 Oct 2026 07:15:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 144EE60633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011704;
	b=oXHof6K8IemT8Aln7F+YUxHRJg88DcWV0REb0gZ3M2QjejILY4y6CEv7KQcpiV2unQ5N
	 QxJG8cqSOiL1ZCgPIvnpR/lu9mFm3T+Q4SleRadVEfjGwnVLDjgDQfyzxOOm6weyrToiK
	 wOhyaWIPIBgajEy43otQhhwTkCHskgF4Eb99Gk+eBPoi96CzyDYB+qAtNIe+YbaQd/Qca
	 FW5NJ0xNbq0yGgRfNMKRb/L1jFXLJ1emXeoKwIOG85Njhtf/rQ2CGYIHT7h+jYsKNIwkz
	 G134FVZ7a8+p17I6H5fsSXH7nhd+0OysqhN8Hsy6pbkpBUgeEdFlKYeCKdGzADhIO3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nt+5ntEDa+ossM5z33uUrVw/ALfBWWDjJGbsNEcQxns=;
	b=Yg/935Hv+S++PwvEGJt4+FUs2oCb2Q3+bJqQAkhV7wR71s2lNKzkR4jZiBtIkkAmDDJx
	 8bxJgVz9YnwG/lAziDbpbgEJHvE+HsCSJayHTNJZ3z/hsN7W5I3m732jtUQOVLArnWTyS
	 ZTEMYniy+TpIRc+UWBrjRJG6Xed4O6DMGNnL3XVvF/BjmEhQjz+0va4AneiwO7x7S2aea
	 uwxcXq95NwaAOFaxcOw+YVEoaQPgGeCoUQvRgqayu7msqML1B6/kexZSR2RH3D+dE0pBn
	 gs9KAeyvdzn4m4AmAu6hNryw2GGObpRkhcjxsg31Gxk02ZrQ1Jc/nWtnt/QvECHYZwQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=P4SlfWO+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011704;
	bh=nt+5ntEDa+ossM5z33uUrVw/ALfBWWDjJGbsNEcQxns=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s1k2hBPhIbfkEtCmICCDl8uMJW3OgbY28cOFpiFSZaw1o/muqJRU4FbAUdh8A6rOr
	 CQBlVzHCGseD2Jr1GpLSTDkebzQsZ4o6hJbWZmYUMYzOXBSSss9mcwsC3UeURmG5hP
	 rw+1yTwI04FifU6bOhnBvvOe3Equ6bZGE6nfs7xyawfmFbsnQyuM93KoiWGdL5/L5A
	 chR83TAxMiRT/CuHrU0ajb1xXNIdwhL6TlhbKEY1JKF2mvGSs7VZekVIE9z8L/edT1
	 twJY3q0ExzTyn0utdMJPMJiiMycnkpTJtk0Iqh9humpHQ/HQo/QTseWaXiIZIImzOm
	 DEQmgEvvbqU+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 144EE60633;
	Sat,  3 Oct 2026 07:15:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 673751D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64B9660643
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 361bqN3iY_za for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:15:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6196B60621
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011701;
 b=nF90z/sq4EyrdkL8Vw8ejib2JHLgPGRx9tWzlHwOxFAxs5OJ+sJwN5uLFmjj//WAuVLK
 8DHk5cA3VGI9LeAsQ00qisZ1BpMFKhQwT3RFeKnuueHZmeUiB836eeM0+emssuvuGGhuM
 OBvFAPstN4QhpDD6/YrS6X6tvTsR9QasCSawdq9mpviBRN4lxmV5dFe6y+QBMiu36ByQx
 piCCss6iyCKNv7F515FRE89odOq9WDzPvEi8l81pW2SvPYJXuinUAcjKGfzvmsaztUAt/
 R9nBOMyGdAAoMY7DG32NPGmGbCvdI/k/3BLdgFdWz0o2PqdCObzVywMed6CMA6NMV0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011701;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3P0llgoy+Fh0LDN+g09EXjQhu7ckz3Gfn+7kfz8wL6Y=;
 b=gLFjHMUdpWeIauFDoG+nFE5ycTT2DQVIEoWnCzunf/rG3sn/Hru62/ZczdmJ57iIuyoc
 NsQSYpiOCpsRIoaFF73PvsBmVqg2puU/xAIz8LNQqF72fdiXvlureUr6dqph57fcngqQ4
 QiAide5WZQ04P8SuxdqGLmLv4fKqXXlpcKggmKp9VHyytEJ9PWRe/RNJcaZOowXuE0AFg
 EZSI8muv9gF78wO0bgFRy9TCfxPXlhNQRi7QiIIBW5YxKuoSHGFfurl0cQStW/NRT4Su9
 e6zu/mJuCnrWYGl7SX2HXVPfOUYJXVnjHo6uhQBMttfEfJFNylJKKJJd+/BC9Z3Hb+g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=P4SlfWO+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=P4SlfWO+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6196B60621
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010933;
 bh=3P0llgoy+Fh0LDN+g09EXjQhu7ckz3Gfn+7kfz8wL6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=P4SlfWO+M3qmyai2b68UEsJgX2ytd20ym6MDso3ejzXVKV9OdkL9pfdY5zklkMOWm
 4ndWv875AwyBlwL+MfIrAF31NUBQbTmSZ934v7x7dlgm9A1J5p3iQA/smjAgzUUocl
 HWywFehraI0VG1F3iIBNEzrmAiQSWyd1dIspGcsjBcPm1mgW3Z5JBXJshrTQVaMh10
 +hj5HAoPGbD6EbVL1YMwSAKbPLlOiQ1wf1q2SvtN6J1E7+t/8UeCjbruIMjhybf2rW
 /qaxvbHApIeAFdhOLwe0MVTtfdUzUWlcPMikk2xizLKU5x0e1CWbaYIYYMDxKtLGqp
 P3i09o6Fmixqg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 bx5eJY/eYUm0SU7mLXOnHxL6gJbhZ6QSe3PuCs5Ib0jttfMiPsdG7WTJiaOrt08CUlgrkaXx3L2
 NgsdTpkT6RJf5PxwgPD6r2lEqe0C3299x12RX07Lcpk6t09zF4V21s5EYzm95/jDs6za8hHHcvV
 8GM+Sbeo9g0X/Nd8FBCPx46DFm1qDv9AOOWOU0MkPysuuMm9eJ00mkBNXjDr8tTg30bE62Yf+H7
 +9ZXDTweE37ihKx0POw3DZ0WreOT5w0FA3vdJ5tbrtUYnH2VJn4+cJ/xZU+mTfOiHyOqrevGz/r
 SGg0tmwjrjhPwT0bnmdsGnFpJEi5Go6oFyFsGzmt2L0C/m65lOJIX/syiJon+ukPCssiUzn3EG5
 XlLO4BmxWv7HyttuUOM47mQ4UgDKuoDqjkTgHe4gWLSDYFXWSHNkWno52jrDCkfDZVnrp/CQS39
 84393pdpPdo7rWAJ99AvqtpVHk+G/7/5Mm7fipvz3qp5f1PgwMPr9hbi4mDP8WlJVhDDJJ8kGZh
 3cAAfTIX8tArKkGSY7VsV0rF5sdWZobiotRk48cWhnDt1DP/+eJakGVVXfuSzSGmJ9Y2TRUJJA1
 PL57Ts044EbV/6d3Hiz3h1X0/pYIAsGAeYla8qM9CyLe1Jrmfbi/N7+T4HA9zXVw
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F10E5A4C544B;
 Sat,  3 Oct 2026 09:02:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-0NCh;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:15 +0200
Message-ID: <20261003070128.1295458-103-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 103/114] package/python-types-setuptools: bump
 version to 84.0.0.20260812
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index c0b0867998..6e330831fe 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  156a454caa6bb356bdab546a1cfa2526  types_setuptools-82.0.0.20260210.tar.gz
-sha256  d9719fbbeb185254480ade1f25327c4654f8c00efda3fec36823379cebcdee58  types_setuptools-82.0.0.20260210.tar.gz
+md5  9a93e89b935a6a02dbfb4a143fbe0ccd  types_setuptools-84.0.0.20260812.tar.gz
+sha256  09bedc248ebbb7a232c9419dfcdca329706e61bf2aa5743e9424d027f1d956b4  types_setuptools-84.0.0.20260812.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4759fae2cb..d0cfdba1bc 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260210
+PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20260812
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4b/90/796ac8c774a7f535084aacbaa6b7053d16fff5c630eff87c3ecff7896c37
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4f/cd/3b2a3362a526f91c33f785a291462b2ec448ae531101c62372fc30a21f53
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
