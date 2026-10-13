Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02EDCC6B1D
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86FA60824;
	Tue, 13 Oct 2026 20:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9i1d9-W2tVp; Tue, 13 Oct 2026 20:52:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B271060809
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924764;
	b=n0xOEexZ1zTFVj/rdK2WTK7PUrXr0Pv3hDx3c5i9ng97mciwAwHKvAg0znfu8AUo2LJH
	 dbogoCH4Y0DkEpsn3IWFWcbT3MbFTe40zgDALQC/BoPC+sEeEWiw9R/t9C9kec3W+8ICG
	 vMDJvqTBOpgclj0C9nlPHkG9YH1Y91+lMpz5hLaHE5Bltr/wxvkZXiWT1nEqmXkjAGkwW
	 4jXevyJaotNbaQHNajDCRXVHkh9OvhwmqdNHtPqJunxcSNEBoTx/CzHo5qKhnnV50wX9D
	 IY+YsO22s0ghqKgfKfruaMHpLVxDTKp+tM7kpEPMoWIViZP/c3fuPfAu4RnemsjRfww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2xbFsM58pttPyvn5AcH2QL8IJEVQHC43kV7K2Kgq2b8=;
	b=i3VGFr+FwNVsVkMOXyukwwjr0Xtn5MHUNd6E/CoVFzzt9/YDV4ZlcbRnSktSII14PbuF
	 tjTUTlCpf8NfflcyPInHQkLVs6Moi4c6P5D9mCzuc+MPz5NN+Iy6iacrK0EsF34M6JcI1
	 qrxxJiZMG3qEIKW5Rh6k3iCrdCWJpJU86o/Ktrbf680721R8abmaU1JVDIrryxdu4U86G
	 ZzgGZ1pZBW4JZhQZuBsujxmgLekSrCXRS8KY5cwJOXjkLCOW1Gb6vRcR8GDZUtgfypUsH
	 rp8ornOwNIBPUeD844y1lWjk1mUhv0JLO5DN9xYp0nw5mzFQtUiCWp/and/LqjqbI7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924764;
	bh=2xbFsM58pttPyvn5AcH2QL8IJEVQHC43kV7K2Kgq2b8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IQXcawxtxrZiAgqnFRS8Xkdw6KeWYF6Mp8PpkNJf9OgSPv7PI7ofGuXuKbQHFMQN5
	 PHP6C1HrkuDHsPNtKToKrmZQkbYp5crhhYiKYBXbYTyIteErP3Rn+5Ux4A8M5oImix
	 HMASA+ZD+ULloIbR4JVyHEAcdPWYf/QKe9Sq8vR2lGzVniaxcs1z8MfmG/xgmdT/JR
	 TmF6SfpJMkP6AP8PosIVQ8UhHNVymEF1Om2Q3P8CK82AYvymE6G/wxpTZw1vGvYOtf
	 4V8hiwksEJGmfpaI9ESEw5TX56A3DcW6k/rdynHjdKywJJqSWXzemYhP0kXbxAS96d
	 IGQd6wiv/vAHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B271060809;
	Tue, 13 Oct 2026 20:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C089A788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC47340640
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZRTwZU_KFIW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF15440647
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=cK9FUnECNvBWq8tp/vOkZ7YfLBT9DypZc1bc4Kc8AzVmFviROp79AbjTZdkIdD/0QNqr
 GnbBHoYm6MY5TjLHRk/G22HbW2wije/QogpGuvQnc1xpFM9Wd4lgnPtUnNMipzRYkGq6k
 hb5ZNd7EfJPVMJWgo/YSuVWlZj83rZEvRuBg8SjKN8wpXrtrx0GzZe/29DUxkFAgIu99M
 kG64ZRYqbc9GHuqPHim+G50RkcuyPQy+6z/dccqNmAgu1xf9FnUTF2GJq85tNKa0py9QE
 o4MCx96mnrMEGwVHWC+DOY8Tw31boF+1iYh1TWmT/rhbEyn0cAkVqJLys8hEwmq1JZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=K4oDxHxYWtGDQB/LfdBKKRgK+owC36BkAEFupEINGpo=;
 b=RDuaCACX/jICiAk3RzdqoA5EbZjRXtMSIXtQIRUqg4SMgTYAVaTGiXx50Hx5fwNPixI9
 +iBqxEbr4H38S605oCua5822wHUwD9nQ8CaZyeQ5umIZhb2M9gBgY9mCmbKkZQTA7cW1y
 aHPckrik7v7T0wmuBxuPhKdKwqjeik4uO1xwmd/kUn6TuJPDAyqIxvB1XdnFBAsx+0P8q
 vG+j49X/I5/H2Whwk1cjsoWMBZvTvTJLN1e5RutRn4irfbqLAohl4grn+jrlS97j2r5t6
 DWOI0tirS2i28s7TPYs0JSmR3n/6YTMncq0kKo/+g+xBStFx6FJqIAnENnj4bnwpLgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF15440647
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24FE8956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6344b3992595059b77a28ae7d143df11749682c
X-Git-Newrev: a2f910ab31a22805354281ecf4fb9fcd4519270c
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.24FE8956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump to
 version 2.62.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2f910ab31a22805354281ecf4fb9fcd4519270c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index e157a5aa29..8ed03dd9e5 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  5340972cded7915412d049bd7b0de69f  google_auth-2.59.1.tar.gz
-sha256  ce50fc533ac02f489a2b183a0c156672c376ecb2091b1127bc7efba2975fff27  google_auth-2.59.1.tar.gz
+md5  efa6eb1ad00dd54f257b745beb28c363  google_auth-2.62.0.tar.gz
+sha256  0bef0ce54bdf9ce226c5d66e4264413bd918141c31bbe49fb52eac882f513d69  google_auth-2.62.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 7131da6532..2ec4100fa9 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.59.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.62.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/81/e3/9f752a968e487fbc10b2c2a1dd561b62489f923972911009577bb88fe7bb
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/f5/b9/4b2528f30114b106e3c3a7298ba38d85e682fd1f83fe7c4a5b77c7677082
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
