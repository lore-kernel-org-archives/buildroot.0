Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A310CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 080F680ADE;
	Tue, 13 Oct 2026 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEo3ROdcYpJN; Tue, 13 Oct 2026 20:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1AC4180D5C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925071;
	b=jYSfYyhEQfp4OFwdceEvvmLufewY+gn67yPhXF5Rx05ra4KdFeSgBYaECA334Dz8D4OM
	 zPM3hqMaUsn8pZqHXIdW8rdzbBVMTzC8KW9rmUJF+Hqa7UYCPOR6stJ9V8URDuKzfEzBI
	 /jpdbRZdhZuKi4u0XOt5k+04nWiHSiHIjytY+ork/2J2fQDKJ5zm8mOruOVOur2p7WR8y
	 pr/cWVQHYcNbDwiqwKa0KQ6s/Pku3aA3PUD7jKm+akTkiYGANUlQqFQeLA1FOkaVqdQKj
	 k8pPs+PoWsZw9hH5t/tQobjE4H596YcjXew0H5AoBxNbsaPUf6oV9e1a6UlUzb8fDlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925071;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=72maM2WTvit3Y0gd164kdRB11voZ6QukE5ovmLkzlN4=;
	b=s86vVxvgHKVHzKUO3hVoEKcluFSensDkpmLE1KpXZekybsm7oQRa8CV9hsEq8MDkkxpC
	 FtZyN6exLi/ItjHb+ynEorQnRYijfd6iosCLMvk3vbhlQZNBhjebMKWwzSpVypub4ec+d
	 oWqZkJiK4D++67h3b+o8OfZczLxF4ZZID2N6bSsfGi6kbva6TdsK10H5wTclmPah6u4YE
	 soS6FSq4Rv5RFrA/datO+lidn8dy3Xs3CELlBBzZMo+sEvUH7ItXsHtePXz4wpj7mGRxw
	 pBwb/eTF7fr7AM+0KefO/nO4zVC9k0yoPXh3wFX8apbRGc55aCW0rM0N5refHEyZCGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925071;
	bh=72maM2WTvit3Y0gd164kdRB11voZ6QukE5ovmLkzlN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fBdftePaGxDHF25evK5UT4U9Q2t7qN9ANxlHKrJOtCerIgAVvq0VHA/+4uynVFgHz
	 g5cdaHeqJ/nBxH+UOtfTOxfwQ50WYxUYnUSgU3BQ+KnLcrnkWDqxGSJj8XL891PNlp
	 JOuBCS6eUHOvA6SIwnHUFObZ2SD2tieDXhRoppbJFfomwQmBc8hZkNk4PsrwzsEtV5
	 Fa2ulo60inheOCFZTfx9tllMx+7894Oek+hZg2nD1YDr2z1z+fiPBDb/g7THUjqUfk
	 NNNacw6JzbGwlbNOOb2w4PWT97N72e9yk5XKt/S/3bTYU2suCGrsWeM8BP5HCTjae0
	 2LdLWJUk/2+8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC4180D5C;
	Tue, 13 Oct 2026 20:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F922AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9BF46081D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoO64ErUMEUs for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1EBA760809
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=Z2aZ4+BFjaSsWBJtgbiUlOL9QAih59TLP0p9ioWSn8Ev0jflSpDxqEr4NuNooiM5rwcR
 y8o54sSWFkH3QnmQE907HIXwbosIYr+4VDRmvvBHt3kL7OBetFvFoQ6VCxW+gISeEJK0I
 xKtufpvmh4PVNcNROCMdl1KOTM88ISVS0y8HQdtqNvqStLdfq8HScPNom/2sx/8/7msh7
 IsNwbHA0WREi9N/qwTTOEccx2yJ68bBiwZmwZGTGpL5hULzUHLDizhGKuXETJcdYOOeBR
 nCNSvwnIenkXxTWxhS7nvtF/a/OMtVpgNyos4zee77o81ZcjQVnYa9PBIYV+flKtwJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HOIhW0OyRY4RxArSoY7h0bi77gI1V2+TF5qt0lGd6NI=;
 b=D8GMk7559JjRythIvIonqyVoK1Oy9QUeNj/fn/lvdkafHsmb/wYufPnpGxLXdaa5ybIW
 FVBpsJsNy7ybnDGd9qmUfEDQUOGNneKeDjPp9Jzkwp1Emzf8+jonOwkU3OXldCOYBjd9s
 m5tVT2VjozJA3OTklwSmRUaM5zLXlvXQtW5BRK2uB6QKxZgZTtnw/3kL4/Kp5eVpEJaCI
 /CTBWBc6mRtSHJyM2osbzFm2b93xNxKwpNtMhcXgVHQCAsGoJ7PW9w5WGQX4C6f5S5Quw
 1BJ6z+n7x6h48oHbWjJiNS1C60UZ3GNfrfHE6BmyNeDdOyFdJtZXhvA2cniXjM//DOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EBA760809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58B1D957C8; Tue, 13 Oct 2026 20:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:55:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd4991bfe8d4bab0c194c7f31357fde36ebc24d6
X-Git-Newrev: 464c445a4d7f401cbc2fcc48a5698029998c16b1
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.58B1D957C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-texttable: bump to version
 1.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/464c445a4d7f401cbc2fcc48a5698029998c16b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-texttable/python-texttable.hash | 4 ++--
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 538aa78458..628bf4bea2 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  e5d380c04fab132ccf0bbfd4f761bd51  texttable-1.7.0.tar.gz
-sha256  2d2068fb55115807d3ac77a4ca68fa48803e84ebb0ee2340f858107a36522638  texttable-1.7.0.tar.gz
+md5  fb024678d892bd42fec4a3907089d036  texttable-1.7.1.tar.gz
+sha256  ce71fc5928ede6cd7a60dbe3cb2845e6df8f5598fe435252ea1b31722415fda7  texttable-1.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 1e4e7572c9..5bb5b91684 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.7.0
+PYTHON_TEXTTABLE_VERSION = 1.7.1
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/1c/dc/0aff23d6036a4d3bf4f1d8c8204c5c79c4437e25e0ae94ffe4bbb55ee3c2
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/72/c8/c926b35a849405ae0cb21956f8d7bd5e4f2c277c211784ed7d441df1b807
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
