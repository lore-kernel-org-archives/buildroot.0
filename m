Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971A2CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67AAB60683;
	Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdP_2WsUiZyA; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00E1E606CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042848;
	b=rMNV4VkeTt5jbz67OC69qXTE91gtyNFgF1FY+Bxyi1dkEIPdK4eOU9S1eLW39qHubb1l
	 VVjojYkfG1WPfiYwbCttUjgWvMzzHUXfF9AUTUs600G4k2+ixdZRU++MU+BqJ/QPE9wJn
	 klAfkqQa8u/SWZAlhQj9md8VG19YW9ciBVCjhOUWdBttkIsoW57ALSiYTGhmkIAobxuSu
	 EcdpuHgaffYBqGxVHg5iVTzHGEmYbL1CV/rhneavsPLQdkaNcaVYZmp5XVT8awYJSjXZy
	 aQdCyhUTtaWhL/vC1iwmQLIMqteS+PcM5wjj0HEH8tvsxU9fyF/n8fS//JyoztET6kA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tEUp7LtBJhJM7N11MQQwTEka5N3tzdQ/dx8/2GVXG28=;
	b=qplQa/Ul3xdGUwxwWOKeYJjbaEWe6CU1LJEZlo4rFPz92AlfYZwq/gOGkWuruXkj3EH3
	 uY2YCY657hxF1x0yRl9uQx9PjnXGnWwdkAov/XyCkfOxZHVK2enMUMJwOaX9R1X12mNSS
	 ODAfSTAUcRY7snwOCMoM4B3bEzOANORs+l52R0qvqOixW46lhqqx7xlablHoINFkvxVXk
	 eMDIMWet4OovnkUC+ENVU7+YwJlq1cELWvDNl7fRjvgFZC4xfZwc9uPOgUnw5fTbPYXrM
	 IBqSCPihF+BqtJhG/niYG2mxMmZhOx8Ncd3WNTw+5Q/ZaHJfhV27VNN05MV6FHp6EmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042848;
	bh=tEUp7LtBJhJM7N11MQQwTEka5N3tzdQ/dx8/2GVXG28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dNN8AGqG2dToCMyEFP7zme7w9kun8lqBWHPywZ7i2HFe+q4IaoYJHUs1oAmId1mya
	 IB3qNqYgGAJJLSQgnG+IE8fNZo+bQupDsjWOg66txtXCq99r6WEUJkcuJ+AFWN0HcL
	 mpr1ymvrqQ1ZA77ocjU8PIoG7r3yMajSZhPofvhsec+mKEPVAqf8ZNFxfDVrTc6hie
	 MDtGEodMzohoEQesCRdc3VOq/TKvcm6yT8uLrNmPJFNE83PNRT6O+CRQD4XPynJyC4
	 e4gaRaceBlfeWi4voDxCVjyMxy6ydOfybu/rlHeypuex0rlYjRQzTtO49/7IRFYAle
	 dEsPbthNwQPeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E1E606CF;
	Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F11A1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD3A40FC5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G137IeUOdWpf for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F87340FFB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=otiQGc+YCzOnfZVre0fNN1lxsJyIGhiqPYl/HYDwaUk12U+41q7SxxAE8c7kmpC42++m
 T8c1V8qQ0ycpnRTx+kKlMNX43HrPEgRI3zXpa9SSghdxsIUtQrgDNb0wkskQoNWbLMjD3
 SNR1Qp2VDu+OPOqIBEq3fjEd3IBuDUDShEut48vApFVxyhHyTKs/qTZTWu4RDIQGkbZlQ
 Tsa455RrdRCI9Nv8biAlpBocZn/vMoX0C4EEdnYkdjL+GolgBJsIpQhRv49NPNUIpYn0x
 jTQPQ1v2r98vWB2l1UZFahTVVrcCKRizsdPvbA5LBcGrLrNFH2hrZQXdskGrIe/i1Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w8iqdl+9UTM/jVOXKPYqbtN/q43G6Ccc7M+HhHzcnOI=;
 b=TX0sseG0kJv+LBsOi/pR5nAdhwo/eziLoxxZhd6lyLUpDiSDCb0RJ4LlQ7WN4A+7AyOr
 RAoO2Q1+lOMvHb7S46PEbagTkmaKKsUtbukVo/IOerV0wMKOGL0RqL460KVAe4mzhthC1
 G1x17kKXv4YGzBxIH1AeoelkjJMD5lIbXlsp759l7/8kZewqEgReuddsaNmxmgpN/0LH7
 Kr+3bflViGysPu/HQ32K/7Os7KhSj8Hu9yF7elGdIxQ6DJB8DIbO9i1fomjU/vzlYHYqH
 D0uTfDBe8cPp5CSDsjlyykntNaoqETchkNDLUpbWmWTGCLi+tyrBSnvWrFMn6mTJX5Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F87340FFB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 800108A4B8; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddb5dfeb65085d32fc46afa3d756457c46c983b2
X-Git-Newrev: d85cf95077f0f450dadde6e9d5e44e7b2121023c
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.800108A4B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump version to
 1.43.103
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
Content-Type: multipart/mixed; boundary="===============4977552831281493222=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4977552831281493222==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d85cf95077f0f450dadde6e9d5e44e7b2121023c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Raphaël Mélotte <raphael.melotte@mind.be>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 0a620aff21..b35394b8c4 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8f6916a7e50632593cdf56b5fcdbd365  boto3-1.43.1.tar.gz
-sha256  9e4f85a7884797ff0f52c257094730ed228aaa07fa8134775ff8f86909cf4f2a  boto3-1.43.1.tar.gz
+md5  e756f77886a1aa59d916de35340da68a  boto3-1.43.103.tar.gz
+sha256  524821052527f6446d249bf710847b032d9b12135e346c9751777a0a2811cf04  boto3-1.43.103.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 4a88e115cf..8390e8d310 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.1
+PYTHON_BOTO3_VERSION = 1.43.103
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/98/36/028c12ed6ed85009a21b5472eb76c27f9b0341c6986f06f83475b40aaf51
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/46/59/012898d78087105e9c20fe31605d3f1999921745e1890ee0f0d993846e2e
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE

--===============4977552831281493222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4977552831281493222==--
