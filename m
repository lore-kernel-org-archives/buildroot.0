Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE5ACA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3424411E7;
	Sat,  3 Oct 2026 10:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGPP5bjVvTcW; Sat,  3 Oct 2026 10:07:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 97AE5411E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022069;
	b=abthhuTCP0aa+zWgXW/KaNcBbIIjuZsqAcu3R6ILFD0rMJMRzeI2JmVD/OdMYm996Flv
	 nmo1SrudAF+Jno6AQbWm8HSLVUOUzeyNkHPVKPRaLCQ0sMHVyHmlOqnUEIiUuLvf7iRE7
	 Mqzh9iSJqk1Th6o2C0RlNBG7OY3rYBcmX6onK0FndF6zloAziNBwfJJu5oyk3JUkw2hKd
	 aaCmcubskASCBIj+DsXvZehSzlRnPpRjwAQAWifOMEW26VBaWhEqr19KV1NFc8MluXvkE
	 oyT3vgpRnuFuXu7CSmTI+Cum9bia5r4W6Vzq1n2EfjxeUnBbb8pG3hJucYLLh4bkeOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7m9KL/BictDh3WoLFeeP6JBIX9PIrdknVVYDVYr03e8=;
	b=XqgZ8AUHyukCWmPS2cOtlPVzIuJBO7bufNI27WE9W2TitOb8SLIm2k6zFTPwTZIN3yzm
	 D+Mti2+cW+xErEXtB9LDpbPLWScnKQbXIfrecfW9oXpCplbrqB+YBtfMxZJdczNIPPnyp
	 N3f08WLfZSEkdx1ij3Jl8Wn/GhjQEvuxSFKwQypHss0XsLMcD3s4yO4ULrJ9FSUADR/Vr
	 aO14/89YBCxF6gsinDUtJiYe+vBvq5gdm8TW8jjM3Oqa8/bZpCcVvTAEGQIkP68mTmrcT
	 gef+cYlj9TMfwY7dAVCKUDihemWNKmjDebqCtfNAe4qdvpA0MbzLjIMQSA7ITh0eSbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022069;
	bh=7m9KL/BictDh3WoLFeeP6JBIX9PIrdknVVYDVYr03e8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XJnwCgNYPBEjWkRHznG1m7rP1ll9EpSOAp3LZ8WI8pUZJHF8VPyonUXn+zVNwo/y+
	 xaMEUrjNeRSTDpiGOTPf8qecP0YlJACDs8c1mIP6stfbHMR8efg5Kq8IlEQUuk5RC2
	 KoAzsVAQk5hhEIP9dBf+b+o5CluzQZBpiClA5t8oyo0xebievc366mpBxnIa/B3XnS
	 j904slwezYwqqGhtDKa0Etmk3Gs4TMu3Z+Ew+ug98KeV+WYoaOJkBYCdf3oIKmoNw+
	 afknd3gIFLoMk4LzmG/ucq0SvaJshp0AIDY2+XWd4I0pzEqa9gaPntePAxzkABauQ5
	 3P/oCbVFHReIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AE5411E5;
	Sat,  3 Oct 2026 10:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 250039DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 144E060E7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvQeabpcbHkE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C231C60E86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=tF2lSD7EfDqyULHnW2f4stMqLyxDf7V7KJUVp9GGmKamFv6Z7g3InYmL2pJwIBr614e2
 Vzjng8+v1w0qCpZ6GEZI7picElEv75dOEPGarT11hiCf6nkMRbx5RgtgCYxL72xALnodH
 ZUlZN7+0pq0O903WQusSj73/+6JBgQAFn0IH32W8twR5pq1n09EKxHBUs6+nVh5ct8txj
 CjTD4oFj8nlo8AnM7r8xIm/qWK5D6k7gNL33G2JBP+IOK5rMKnHWg216jXOApjtbFojCT
 nzKlmietTtllxYrTjULY07Lgo357fXtedYxm5opjdE7inE7InzgTxT991I5FBbjS30Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iLrRftrmdP0B6po7hVggzFhAeIQzlWCCF1Oryek7hdo=;
 b=b7OiSX7OpMBUV6DA1I+68qbwGuXMb3Ab3Sh0PoFP85Vlz2q5J9kDfTVpc+FhkFf69krL
 BJVhgr5Xgk7fSNlbJN3vuNj+Iv1CiUVsHhrT5vYD0N4tnaF6jh19PWXJJII4uz4K7BOe+
 jDwvPLHYxySnExulxvjYm/J1VQNmpArcQxDcIYRMefJUtYeGFEjG8z3wG2apHbNS6r8u6
 VB9F+gIzuryq/TsSKunQh0OqYspyIJQnSJFQrv9uJD2K858NBgBl26w8B012dxxqrzhdJ
 68uhMez5dzFvimMeuHdi9tiwNtoimfKtPkRGi38yS5Jtju9NkFJ1xOe/08W6p+qM7ww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C231C60E86
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C90E88801; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d48aa711e2e2ae6794f65e0ccdaa31d821b6eb9
X-Git-Newrev: c4bb4d8cd854eedea47920b92b236e2cf610e131
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.2C90E88801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiozero: bump to version
 2.0.1.post3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4bb4d8cd854eedea47920b92b236e2cf610e131
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gpiozero/python-gpiozero.hash | 4 ++--
 package/python-gpiozero/python-gpiozero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
index e9266886f0..f6bceb9376 100644
--- a/package/python-gpiozero/python-gpiozero.hash
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiozero/json
-md5  ed36bee070df2a8788c2038d585146db  gpiozero-2.0.1.tar.gz
-sha256  d4ea1952689ec7e331f9d4ebc9adb15f1d01c2c9dcfabb72e752c9869ab7e97e  gpiozero-2.0.1.tar.gz
+md5  34e34fcfd092693308490b1cfe56b6dd  gpiozero-2.0.1.post3.tar.gz
+sha256  745feab6df463ac2e9de10c67e2dd9f396e668ba4e281e92381d6c460100a8f7  gpiozero-2.0.1.post3.tar.gz
 # Locally computed sha256 checksums
 sha256  b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b08fa5d0fb  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index cc06abc118..d8c71f9a1b 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOZERO_VERSION = 2.0.1
+PYTHON_GPIOZERO_VERSION = 2.0.1.post3
 PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
-PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/e4/47/334b8db8a981eca9a0fb1e7e48e1997a5eaa8f40bb31c504299dcca0e6ff
+PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/67/63/864a3c36842cf7b05808aadf906763a024a1b13f2a4c8144e3163de91255
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
 PYTHON_GPIOZERO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
