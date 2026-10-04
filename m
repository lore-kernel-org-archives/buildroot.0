Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41C1CA5FF5
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AEA880DC5;
	Sun,  4 Oct 2026 16:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu5HoTfGa9rc; Sun,  4 Oct 2026 16:08:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5D77F80D7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130083;
	b=tVEhAY1kXdTIqxkXgzurQSKXOdN3mlHjkkDzl3hcLr9g3kEsTnlRLTquuLp13s41zotZ
	 qzxim+qeb/s1PXZ4ENJUgdAfSpuPfnGRYM2WmVgJtdadoATAfa52YQ/TmfkNlLGBINxX7
	 DRt+P79xBWc0Dfu9PEJLs6u8LFDMlDRwtSoc0/Xl1zW9UlVvfIVQ6C4i3d5DtUwr+IZto
	 KOBaT4gggyn5VmX8m2PlObpZzQDjPZT80KIBC8kGOoCHx5sqQu0n97E0jlv5CuKtSK5oP
	 mfkG/LVwLv8JQRAmOK71kmkQ70mOUytDD4MZZ37JcGXDaqKRVprzsbU9fOCb5OzWwWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130083;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kYHdfRUlpu7bYhWQBz7dR7cy9WTsGP0mvizrGC9se+0=;
	b=LyaYJx2jpWjfyJvlQvSSjIo3TFa8SU/cUnShZlPpd/0Q+mTkZ8x2+Jjz4eZrFxvXm2/2
	 d/lhz0W3yeipONLjXKq1vD31/VegJ8VDffuNEt/ggWWTVa39tD4TEhVRiJWFCL09SylTl
	 o3MRNzhjGKLbYERzkCf13ln8xuEZQVkYr5Wjt0GUs6cDhQEsB9mWgpNTXfZ4pxZhV+dVc
	 ztx+JfAquI2QE4i6zQexNjwU0xxNqV/Oh3wSRv2kEyVGOKBt26REjUwcylOW9S3RD63Aq
	 57iA0GIZIuh8UQYKSFiPWB7EVSQtKQ0giNa1ammsY26r0SgiaZyH981qOXi34mUBhVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130083;
	bh=kYHdfRUlpu7bYhWQBz7dR7cy9WTsGP0mvizrGC9se+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DCueiXzWPnRR59snDeJape/nUByYDlYmsS55ILm5/5OBmGLWTS/g/WoDggqcYOuiV
	 Snwd26dvbZQ8oaYbGkH7oU9RVb19Ud80rKgyzu0hHHAlzJ/CP6GzY2k1dU5NXhMBTm
	 AEqkPPRgIuus2/MV7cJi3RjTtTJ5utZbml4ObfzUKfjQ+kPwq340fIbDU2dcrd/PJ4
	 BmjQeOo7iT4CS07BaPml6YR1675s9d6OuJvEOlI470NA1/5D5vUanuPg9QYwAgomdL
	 pz/yPGr9Pe9LCfN3GiXeQmSTJ8tvLqE6edFBkh4EDrExMlE/AtxJvzDCrjH+vAGRV6
	 RPtCb/Ezbp7ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D77F80D7B;
	Sun,  4 Oct 2026 16:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38916498
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2929D406A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W6iFY4wnU5g for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7FC48406A5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=rvJ6p8vF+13Z+97J6kP3xHjnugfevvPPwJaGi6UOa9iohuzqAxdsBRK5LB04RCrFBKyP
 OO7Y5q9HlfvCTi5seH3RrH4d97N/AmUymHeevZrYzJMh89cPWVR++LAAvGolmeSr1K1ZM
 kbguUwvi70jHKeSTNfefgyOhrbNH9XjGguc48bbqYGmjj/B0594jUhtD6+o/72NIr91ng
 FelznHdLEkECXzBTG2EswtkhCF86Z7jn9MP+Zjq5LOBLQagR3qxunJWN/uuJ7qAn3vi7a
 etLtz+QdS+mOQ7SggoEFm2BmM1uddHLsrqkEUv5alV2TuK/K+xMU+yNAsuRZMbWyKRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ozUvHeOLMZ1HLU2DHQYvhCSADsXZMHHhKEWXBqij7fk=;
 b=QrtKSFzF7d5Nf3h6huThFqsAQdTJh+tKPt8UKAgnqC4UFCmZJfRhce45qJE6vH0Q+OfV
 eKnt9dfNdROVAeMg412bCQTBr5G3f61jHD0UzmxOqeAXpmsU4vpTEq+W+hu3Va/FzfdcU
 vysbyQg6l4W1lpqUBA27QQmVhrrG6SA3sH4vBcumS2J/95y6Cu3Mz0CrJN3Ax4klRcyHP
 pyM9UcEj7gFEG0vbJalMyty7p9AsRNRXiPP+1oDTBuhHgPgRRFHcjrj64d8jCCbZj9Cim
 iFbrarpKeWS5zrP8LNGVGNubt0lcaDmktb8PxCdDXHy9MzAjQq2qeYk0TifIoMTXPSg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FC48406A5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4437C8D236; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5914a445d925a2e233c910e0ca20c47690b1426a
X-Git-Newrev: 51de4cb8aa533cce50daf7e8f18f57396ff2870d
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.4437C8D236@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplejson: bump to version
 4.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51de4cb8aa533cce50daf7e8f18f57396ff2870d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 2601899777..86aff48b00 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  ceb8e049dc1d531998d321f6c1bc4e08  simplejson-4.1.2.tar.gz
-sha256  6ae4186f90362e9c03c80a1cd5062a20f3a11ac9d391f7ee0ef0701a0e2b7394  simplejson-4.1.2.tar.gz
+md5  a6aa722d12683cbdc7329cfa7b8728ea  simplejson-4.2.0.tar.gz
+sha256  55b121b70a560f4610bd3a355ab2015aca4f39978f6a82353f24d2013fe85861  simplejson-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 8e6024bc45..992bb79884 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 4.1.2
+PYTHON_SIMPLEJSON_VERSION = 4.2.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/f1/e3/1cc7dbf4deebc16e9dc42db37f473b5b612d021eb10e69974be308425171
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/2f/f0/ea064bba6c9afda0168ddb834f1c75a93351031e25aee35c046108e7f292
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
