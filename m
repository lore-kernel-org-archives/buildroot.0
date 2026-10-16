Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E2CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C8C6100A;
	Fri, 16 Oct 2026 13:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI8vbxM3JGZQ; Fri, 16 Oct 2026 13:10:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5699361031
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156252;
	b=rXtOqT63mlhbh+ZQBZMslMd9x1mAFCe9JOJeCiIFq6LqWLS82XmWQuB78ZTTx7PW2l5r
	 lvmy+/A6zwnxbttOjywAUcpsOmUwTeHoN5dm71OJaRWfNwtxqLnhc9RRFBeha2PP59e+b
	 EQ6c/AputY6jhkqx2ih2y5mIc5LQpSTNNUSjVuyNKyv4c1Soo0osnnMdY1PS5qU3tHPZF
	 0D5E4cRf6kTFyFF7za/DqoHqu1JXSpVwSiaxrx0MGnAQjYwjYjmGqDaocnEpW91A/34EF
	 VLkBn4BlF8xhxAJUBwy5MnQHh+KbLL2fHTl72/RPA5c+tAQ5x6Y8Mxi8dJiFHor9Vww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=621JawYL01CsMEPsuFerpbZZl3rButwuMKRgCeZe8pc=;
	b=KccP7mInUqLn+5YYgRoR95DOE5vwPe5lkzkyuAdkUGnkPa3J49Y1AEqauKHG3oCAmjSH
	 DwLcF6eTPHTcA+28LfoQoNyUSRmC/KKmZDL+VK67TCEdBueIgNClOE6enrPlzhDNjocvZ
	 lkmuLiu+oTuKpOQndkPmdw7tygCqUHmGxecVG4XDnm+RB7JswK1SnmFHIw3Gh4n6KNc7e
	 34O1crlAoG9YJxGDbdAZk5kLfp16kJVMuolg0HxYP04aShda7Fwj4L5+E+695eWnygeMA
	 xD4H+otdBg3s7Ysndx92renYZkgYrSSdnRuBRVn51f2ZkXL9rL8+raLY3d7yyNxWclw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156252;
	bh=621JawYL01CsMEPsuFerpbZZl3rButwuMKRgCeZe8pc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YLVEfHZB6qLG9isKSSPPhb81LT28pAwYvXhm57YdlS2jr5leo19VmOzUU8sNU2tTF
	 iNZlRZgDTNp8BBhOIRDas4SWrPUmbEf6Yab6RiA9q4+5+Q6QH8fWY1KnTXJ2+MBZqV
	 DxUcIm1xwJvVniJkXri6qB5ewnx+KJqYcvx9uo+aoB8b+qvHfWB5B0c3CPybKMRx6j
	 RsOdL5kk7cXr869DTCgWDBOhBpaEkLdoUs/En/kQplx05U3k1h4YiQoONphJKGDn3H
	 ADVAdL/YjXXcFvKFeidaNKGBXeHSPhQVh4xjVovjCtyl1xNPq1DqAlqtTwGwpEncbS
	 2jkH7SGluJcAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5699361031;
	Fri, 16 Oct 2026 13:10:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E6F61EE3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2482581489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mogPxyUELhcw for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BDDF0814BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=Z2HBNoFQO0NXRY8oLwCW85LQkPfOhtMu1ef2MjguWsXfqPgwoqzcs1jtIgtljQUh2dVM
 KaGP3CzADNUJ+ILUvL95n/0ju/PmwfLMrh6/dAzH7ur7bl2nDiE7Abxdq9Dtp2JfQR718
 YfTa1suEwjHhKlxQ9U1zxZOgmc8rSfJYkZoIWR/NDfXrDnoLGqWWaiwqwm83BBIMaf94l
 qJnIwc94XGzA3zD7PzbiZcml0YTzDezAwsKFlumBaG1vbCw9/2AUvqnH2IuVI2FsXxoaT
 d5/N3ILubGZSeiI20SAHL5ASHvgIorfzocqqOD8/WcdLROc1AeA6bFfHCjxalsm+EDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fAu6beVyjRoQP7bnPruhPyifHXi7zJv4LcwsXsgaDVg=;
 b=byu/S3R/tc8mJ+VFraaeZmCdw74Mso8rhDt7g4mhScnvYuASVidxow39Q1fbqkXLS15B
 Qe1ADFDEuy2q7o+zhJTd7Nf0Xik/00YhuUo2GeUZBCf4Qsc7R7ngQMp33cTnDucQ1q6nE
 gDfZfcYU+IEBaKSlPrSV8HvZ9KeOHjwJXtLSDaA/wgd/9yZvdyQzt65dEVVnblT7tb28V
 a78/j2R7yu/yUp6XWm12bE5zTaHYTZiiaeyMW3S7TzsRdRKzyzs0hnJoHJeOA4iFqSdda
 zNvAcVlB+pUsRY38eKxzMIJ5OXK5TDspToiMg2XrpL4tYLaKXf9FEonuRZC7SzrYW5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDF0814BD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEC9B960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a2a640807699ad8cb5161b7c574f4d5aca412fc5
X-Git-Newrev: f8292495ab493ccfe56dbf381223ac71bb04a99e
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.AEC9B960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux:
 adding cfdisk enablement comment
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8442681813299968162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8442681813299968162==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8292495ab493ccfe56dbf381223ac71bb04a99e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This commit introduces a menu comment to users to indicate whether the
`cfdisk` can be built, even when the basic set binaries option is
enabled.

For users wishing to support `fdisks` utilities (cfdisk, fdisk and
sfdisk) in Buildroot, these utilities are enabled through a
`BR2_PACKAGE_UTIL_LINUX_BINARIES` option. This option configures
`all-programs`, which will default enable `fdisks` (along with other
program options that do not have an explicit configuration). While a
user can enable "all programs", there is no guarantee that the
`cfdisk` utility will be built if ncurses is not enabled. Even if an
explicit Buildroot menu option is added for `cfdisk` (where we can
force select ncurses), there is no specific configuration option in
util-linux to toggle the enablement of `cfdisk`.

(alternative to commit f7019acad226cf01c40f278dfebc32dd5e8dfd73)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/util-linux/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 2fec026362..6e6558e0c8 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -67,6 +67,13 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
 
+if BR2_PACKAGE_UTIL_LINUX_BINARIES
+
+comment "cfdisk needs ncurses"
+	depends on !BR2_PACKAGE_NCURSES
+
+endif
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()

--===============8442681813299968162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8442681813299968162==--
