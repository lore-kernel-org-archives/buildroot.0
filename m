Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18FCC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 643F74066F;
	Tue, 13 Oct 2026 07:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy6UQhGJLmiL; Tue, 13 Oct 2026 07:46:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7692A4065D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877562;
	b=csZTM8Fj1AhDioxom1JjpwMZT/h4xfHDYXKvFOk0L3by+xcu8gLPVVgR7wEiXC3TqOCG
	 PpJ8Aoo7NVZObN4Ci2FYrNlg13dFsfiZwL3+unuZZJA4LncdP3YWIt4kDvS9dzmWZUJ7j
	 gnOlB5l2m+jJ0DgyXA4ytS6GSR9OQgrhtfCEqvl6ZK4uChW/DY9PrVq1x7wJy3FRTGFk5
	 G2XA14JyNnNiInLFUzM1B779P1UWWopsNMOp6t+n16CytwrlgJnufeCBOz61n+Eg7EHtH
	 WuatbwcfDn4LVRn2eKfGGYMTubTbcoNx5Q1R8562ijsQfU5UxOrBt0s/XbAHINbvquQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0nrtyXRmyFvKJ5Mg+mnt12AW/CI9avX8mrx3hbb7F4Q=;
	b=Qdu5qSkuaHpVfbb8tQrWKrYVLMOAGg7zJwhZbzaa6qQpYku5+mUhvq8Ajq+jZC57NFpQ
	 NQ4AsjiZP5C6QwqvtDBigf97mkxRZT31ELA30EovnXYsToIUrbYDGBVsxEUYvol7Ws4W9
	 gfvNcGcVzJ8JFZEi+4oBGqYXp9KHIq9PTp6SAHihWrwpWFtlo9raMvHVWjtrYur0TEbkj
	 YPr5BCzDtmdCBRzymA7TbVrdsO6mOaDxObcR9z1OMtCq5CCIFWicb86u//R9sYPoBJUzw
	 R829HeAch1bJjxlwIFbTwvJnp4SvkGnumFEQaHITNr0JyAm9PL6GRUuS1zFoKsF6oaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877562;
	bh=0nrtyXRmyFvKJ5Mg+mnt12AW/CI9avX8mrx3hbb7F4Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y1iMYbQrzRwGteA27voNUI5fqaFFjEHuqTVExlujaGiaLkWYmNssc30dJmxFnMM4l
	 QLG0AG1u2NiaM5MGbEvI9xG6SAYam5Ogosl2KEZJmYjpkwNuFzX+RUFhPbwInu+Fbj
	 m/9BNeRU5csVAfP0zrgaBk2Ea4JS8nmayYU3m2UaEfsNr5kN4OwSEHAia7lBAvhOhn
	 gT4YJuEZWnFjI0SuESZTxESmYYwSvIB3cBubzNMsN651wX/k+jF3x9O4AbGgkCLxBB
	 eHVZJ67oQ7t4j2N5fyXIS3JuBNfAj5aMBMDcen6kZpZySN0kftGPNGCTXoi1Tmzb57
	 kSYgivAzVA8Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7692A4065D;
	Tue, 13 Oct 2026 07:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C50139B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D2340259
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OzSKYwm0AAQ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7641B4005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=dO+XU1LQUt51p0nlMt2n4x3O5IX+TxBE5fMYB0qNyHnDR5xQ84kY2iia01COFst3psWQ
 djFvVEFdIqT5JZEZBLf4iSNIYqry3W5n4hQOkgBI7Xn7CFQtFrgx+GAzOyx7zTNMPJPPF
 RhpLNJSNhHfCKWzJgQH9xdxe/4uthxSinGxm+ilEd5n17I08Ps5ojtLDy9y6wtBRUqZnY
 WMPTTPwWBydbgX7gdopwr7jmI/gDMkHMRt/J1p1dcSMxWFXZQhFsbvH3lud50nZnM0Hsu
 ug7Lcpp2w8MZhJ6T6HFpZv0wSKTaBBSQjsIheo27MDdgB0r6v0OLsfML+KSM3DvdgOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pZxlKLDAygQe9WXKhIaOcfqxkMRI/8Kdfb9+DAifK3M=;
 b=OSQWlIVvEFthjmO/SddvNhc6GKhb6zrgtmMh5IYYOX2F1lxqEWRvZyCYVGDmmBdF+MOT
 2CRAzEBssu2ZFUe6HswGxv2sEvEyogAcn40O8lfnFCPUi40GKZpCrODs3/IE5v4v2+gqH
 jHwWen+fGTNMX4idH0NFWq86RLRMKN3/RS5k8MJ5CLYG+RF+OFZsd/tUSlbTM8B9NCXRB
 JotlOsKVCdZGcCWujccAa9ygGxSl6WxeFh3zmSjucOl64spEgv5GPMKQ6viDcFzMgcyI3
 Eo4YZvMc1K3aTgbFYXQ3JD8o6e+Vnt8BKp54DfwG1XAp6ISQvDlzeMthrG9lQP85cRw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7641B4005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECBC595441; Tue, 13 Oct 2026 07:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58bfd1a7a9685e0a152edb182993dfbd8da27402
X-Git-Newrev: a0550f417d52a820c4e1c446c53836c1528caa85
X-Patchwork-Hint: ignore
Message-Id: <20261013074431.ECBC595441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mime-tools: bump to version
 5.519
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0550f417d52a820c4e1c446c53836c1528caa85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mime-tools/perl-mime-tools.hash | 4 ++--
 package/perl-mime-tools/perl-mime-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mime-tools/perl-mime-tools.hash b/package/perl-mime-tools/perl-mime-tools.hash
index 0b3ce379f4..f2ff461f1a 100644
--- a/package/perl-mime-tools/perl-mime-tools.hash
+++ b/package/perl-mime-tools/perl-mime-tools.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  dbc3c9f982498c35d8a103af17c5b5c9  MIME-tools-5.515.tar.gz
-sha256  c1ba1dd9f0b2cd82a0e75caedec51e48233f9f01dc29a0971bdff1cb53be9013  MIME-tools-5.515.tar.gz
+md5  1d8ee049452cac8ff313a7cb4096238e  MIME-tools-5.519.tar.gz
+sha256  2e465205482a4c5938ee3537f215ba22ac96b22c7a42b4f7d32d0f77fa1a49cf  MIME-tools-5.519.tar.gz
 
 # computed by scancpan
 sha256  151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93  COPYING
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 1b526be91d..50c85d2fea 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MIME_TOOLS_VERSION = 5.515
+PERL_MIME_TOOLS_VERSION = 5.519
 PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
