Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF142CCF2CF
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24704061F;
	Sun, 18 Oct 2026 13:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xM2gz61FQhWN; Sun, 18 Oct 2026 13:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B3D46405CB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792331678;
	b=tHH7SszTWRcRMyVC+6EbXB4Gd4haXbtGFrEDF8kIDHqHAnihIdZFKdKNZcuO4tdb5l0S
	 TfncZHCjkgteNm97b+/E/t/CJ/7VOLjxbUyLO9wCay8IercXfbHYY94RvNLEjT+WQ70Hl
	 u/Zhb8FzK8JQDPRG6DQr4XpXMhUDOWt5EslZplvKCRD0TpYC77I2xfR623qXQ9fAIpZHl
	 +CCIzKZoh7W/KG7tJNQRhgz+2WkNcA4SxXrmnj9fT7tu2F6z2kU/2UAV37YVkb8QllDCj
	 SZFSzWZmVYTeb35gefaUZSgeGfg+PeEsuwkbleuDkfNaFF6XlyUay7ub7x88Z6A4TGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792331678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=im53AObPxgSgaTPh87uVUD9VrS8ZLY8FZitcGBAiusY=;
	b=X+ilK4tXIXyAqsONW1mXMiwbfjSc/peHSsDE91DoKUj6TFFLDbmgbzF82+0g3wtlEAp8
	 qWKFtl52QRLFqWCuZjlgnYSr7CjO86W/mV0TCjDlnXetlfYXQuYLkfI+v9xBbF9KMOjUf
	 mztaLnqROOLfvdXiV5ClBejiHbXfZpBBLbApos2TluM1Yrv3Lfj5fq1Pzi7Dd09t1TPyf
	 unb+6KmsMkYjRrJE0X431mTa4zoAFYEn2L5VQQyhDD9+obH+FsuGzgPAJ4XTJP/1EIVk5
	 wryKCBoaIwiisqtfkhlz+xkPymsJz+Sti/i3Q8K6gZI51QiJf/g+vYthFPt6kiEFrfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792331678;
	bh=im53AObPxgSgaTPh87uVUD9VrS8ZLY8FZitcGBAiusY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qaCh0/7nofj+O2CH1hEmLoer2qkpCKBay3d5G71ZhrmJDtjBQzj/+FWE+8Rbo0YKM
	 YzsGqB0Lb1pyRdf9DkS/0HhHB3OXWyBrk68G+H7ahdFC6Wx9fCGEtKKMK5FHsTx6ZA
	 94n2Ho6Rf2OeHWhAsdejABGJyeAtWuZwFVQdJ4pzD0EC6aBx5Ggwlf1efGB5YvU872
	 xSfSMAQt2IVFGzcT/2WQMq8yV72jhgK+4rLmeEyojQDj0M1TKMV4GlVA0IOv+SgXhN
	 OodJXutgj6hPce3wTREyEqvGjRs5GfF500Q6yOZD8/YYSMyYz1p0DzQubbiHwhhMLD
	 NQFPYFxItkaLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D46405CB;
	Sun, 18 Oct 2026 13:54:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D112A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A1168104D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgUNks4gbiDs for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:54:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 615248102A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792331675;
 b=D6LlNmZxfdHsaX5eT5OPpTBViMQIj0DuH+2enyFEV9w7eBg32zkoGZhoDKRqms6JQDZV
 VXHWn5neOu/js2vIEnp1scn+r12xnoE65CGtQDT1Dr53LhvibyTNqCP1k9W+JYrO4dzyd
 lccKCHb/Di9LBxgjCFBClBZgf4YBqUVrpoltAF3hLulOo40JroLp6eIn83u+CGpesax/E
 ueaV6O/XI9Lk8oLKQKqLKf9xsNdTRIx4I2ddWnYkgtkpQbrVzHnLZy1/5Vdy5zjb4Ozad
 boH0pd0wqTNMj5RcTYUlh1LMSQDB2U1V07SYYR8Uq2WR/3uUh/jJkaQVvvI1tJVpIfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792331675;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A99nEqLRAnK3jX644GY8btdIlbXS2zQjUvTnLiKbReY=;
 b=OaMiO26r5K6tdoRGQTWN+F/mGIqzjs7u7QUUp2wGVkl0jJ8R/EL1rqJPfVuraHFuHNgd
 yKF6tojTMaVdQN4FqTDd4KkzBcNGSh7Y7apSBtn34DpZftCgtC0Vq/rWgsMN3RzUnYtrP
 vB1kFQaQhgOVKcuGLFxS3dg/FxO/D+XkfzW/bSh6n/unVi93V59xOxv5qF46eH/PcT4cA
 77H3G0JIOcwrhWqEFICrhGKJ/BDkqY6jUhf/vUJLmuYb3MNfIE1ZfJAz8EUnr91Yye6n/
 73yXO/Y61fv+hNLdlSblw/xKFOzGQuTLFZptjfhXrgZgX1QxZE2bTb1EH+VLfT1qXsQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 615248102A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:54:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45A9A976B1; Sun, 18 Oct 2026 13:53:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:42:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d56efd0b179f6888ef8bf18cfe1d25397c7edf02
X-Git-Newrev: 06bc55f817c3b22583519a2c455deb2b548d9558
X-Patchwork-Hint: ignore
Message-Id: <20261018135313.45A9A976B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.43.114
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06bc55f817c3b22583519a2c455deb2b548d9558
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 13a242c8da..af7ebbfe74 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  f1eec360124da94c8bb9b36f66bdfde1  boto3-1.43.108.tar.gz
-sha256  03341f089158368acf83e921aca98b706095322ca52bc4c039a616940aa5ad41  boto3-1.43.108.tar.gz
+md5  9a5cb05d8aa6985ffff5be9c5f711bd9  boto3-1.43.114.tar.gz
+sha256  be704857751564a5cf69c5bbaadbfa01c22806409815c73563db42fbffe583a2  boto3-1.43.114.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 97b263d8d5..7a8ea4b329 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.108
+PYTHON_BOTO3_VERSION = 1.43.114
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/48/59/fb93b6ebd9ad43eb9a58c7a6da51a0fe24ab0c04bc4d534a0bfc5eba7f59
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/e2/8c/f6f884dc947789317e73ed6fce85e18580d22e9f90e48d67c2367b02667e
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
