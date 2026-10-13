Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6530FCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B225D60751;
	Tue, 13 Oct 2026 07:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAKTPXTooyxM; Tue, 13 Oct 2026 07:45:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0CEEE606C1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877554;
	b=g9r/nlrzbyTirNFZIlK8YGt7Vwcxt8m1J5iDKOqW7j7pGeUr+nNzbEwi1fVKLbfeXPOh
	 3fin/JFH8iNIoTpHVghJUQLhzt7M1sctxWxsEY2wQBgLxuWb1nI5LC3+2NBxy5cFa+QIo
	 iFXCKH2AZHn/vgzgZUvpBaLgpJ1U3uC1czN16eFPT9Rf00VmfJy8mPwI85QcKgaz1BO24
	 RyEo9e7xh4o1cOyiO8ghTlVCPWcLDe+m5slBPAZwOKy3UHpG6Y0wkSrWS5qkYex+ztbNO
	 Mb5Np00F0OXKMkB6MfldnRcM/YTBKzROhGOowzXAnuY1o8cX8GscuqntxS6/7Rg3wzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4v9iaPuLEMi0fos0lesHU4CAKjeGsfz1a/9g2tRib5I=;
	b=VH9P31dJcwtg1xW5RjIyS2Q+qKzndMb9bOVE3E4iJFdTnsOnwUvzJvnq1Nh+SrJcJVr0
	 BWTyz1RogJw9uqsFvGT6DZzPSni9S+zgUwWbqJmTpyOjEckI9bRzweH1QXtrq/dovANwg
	 USXjx/n0cwTv2gO3RKkGpyvtagMfDNPQrKCQIhxVqKGtOdm8vo/VUolrFPAHluVgEaKS7
	 +LQuW5utGrbCgmtVnhJFI0Yc1qfh4H0HoE8j6itgIler7CVm0iFTHS3ct01cfqVtuFcI5
	 87SJn2jf/zFTTNto+W4MXbP7qLGsHrSqrjTso3K2MqG6++dhihXfM91u3fNMt6gyjVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877554;
	bh=4v9iaPuLEMi0fos0lesHU4CAKjeGsfz1a/9g2tRib5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eTmnCgXZGeBEtTDPbRXWmr5NXcMd7bbP7j5/qIc5vzEn2RvQKJ1337Chfq0Obf7so
	 HoN9Kl1jeVz4jfhWor/LVgNbyPEIuuDnm9F2HwduTbiUETvdznIEsLG36Qfj9QF4cg
	 NVQkWas0c15y7dsWQZePulYmu6ZRXoAfIq2XV7R1riWeApbIcU7U0bkt8Dmer/7mFc
	 KvZXHmIUs/1jpFykVtToUmdeimIjYza/HS3DXbsvbwzAgVGqmptcAu2jEyY9Y+dKt1
	 Wea4gAgPpikpZsjKoZ5CzwaP5AHthjTKiZslvzjN1IFrEZ8f92bvdrtAZgaFZaBPgG
	 ySWoM7A1pvWqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CEEE606C1;
	Tue, 13 Oct 2026 07:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E441788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C24980C3D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4hJzBWG8YFV for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 58CE080BE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=m6V08m1lHs76LlpzNd3U0Hm8s1OcPgY4TaFvKF7zjFosHPivRD6MbJFRfFkbWsq+WBlb
 Ar5+d3vBR3TIzeZWMej0xODdGUjC86CAhRVuhkCyMIlnvlgF52cq8cHn/3O2CCKbw7odN
 Xx+6AevpenxqmFIuW0BDS9Mlo5sZx/1yWuFRFTq1+evU+FYY1hpJWgvD+NA0uPGyHuLTO
 OXr0yVwPsp4ckSGbVYI1os6Q6GNKmK5/al4NSPJtTTcRUdiOI/I/5zaW3PBvxf0F0CnoY
 tNyQF2tDwDEgHwQHFq3Nh7NGxeivXD/rIZwhoVloxOc7dXsWtaU3NFlnyha6uxfMoCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zr61luvGXvAzNDdDIYfCf19NdP+kFc7UGK7ApUti/2U=;
 b=XuiFLB5VypwKOkS+N2f0E643jmoqkcrZilI680RWVUaawov9qHWT/Al/W1w7uzbENuam
 0dHcoxIi8emV2+PsSwg1JWolojFaDR6Oa/jqn+cvOx3Ow3b9tL9YJlMNTcJzwbUp3LUAo
 U7tppX7OlRBQX5uOwf/R8t22tsP5BtOu1hk8+xj+GWJDzGpOgvkJPOoH/u2RAzjWXDw/T
 n5aDIEyEGFUGJOBLEFjGIPI4RuwXPYlGBYZJBvZn9EeRGeksyNExFMGfXjlBpojJL+PrN
 v2PafC2ExarMnpKSwraxEnHZqkz5ivalwbNw6ldTGz4DRqv8fErFNKzRbFbsHEKS1Rg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58CE080BE9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D021395443; Tue, 13 Oct 2026 07:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8424f5c956826aafb286b660885ae7d7d7e61baf
X-Git-Newrev: 6d1d80b796c024cea88acac2e6b8616cea9074c3
X-Patchwork-Hint: ignore
Message-Id: <20261013074431.D021395443@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-devel-size: bump to version
 0.87
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d1d80b796c024cea88acac2e6b8616cea9074c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-devel-size/perl-devel-size.hash | 4 ++--
 package/perl-devel-size/perl-devel-size.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
index 8bf9d5d4d1..1c1011c101 100644
--- a/package/perl-devel-size/perl-devel-size.hash
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  1a7023c3c595a50443f9201a3081a0eb  Devel-Size-0.85.tar.gz
-sha256  292f98b13edd1aa4a544e3a5cf1d9f2d7019f75c7364d2e8fa8a35ea5451e73e  Devel-Size-0.85.tar.gz
+md5  ee4589a77f854fc582380063dd3d2d0a  Devel-Size-0.87.tar.gz
+sha256  c89fe04c9d0e5ced6c1d334311d576de609f3c8a41220919d4551e9eb0191f47  Devel-Size-0.87.tar.gz
 
 # computed by scancpan
 sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 7bab097c04..9b4dab1ec1 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_SIZE_VERSION = 0.85
+PERL_DEVEL_SIZE_VERSION = 0.87
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
