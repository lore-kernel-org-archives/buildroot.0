Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F3DCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EBDB6081D;
	Tue, 13 Oct 2026 20:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqvGhBGc-y2y; Tue, 13 Oct 2026 20:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95BBA60816
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925057;
	b=UAHCzACz/cL02aBqkKHSGHnFPpe82sEhtUU+dD+8E43JCS4SWRbJnBI9G0/UAulPbJhz
	 /z3KJsWhNH/A4UsAU1wip5waKzMjJ7Wh45u0Kd7DjM4cUbHRVKc72kf4uOH3XmTKeqSM/
	 p/2vzEqZrqSw4JU+apaCD0WTvA2GQCe40ueUGCr4LtMqQkrAA4I6dG0F+J5RhpoOHYbB5
	 oudDXIzMAxfBhMWrYsFtQKp0DuhxFoJIi5U+AxgGnZM57H4xfB+blWSrVWLaQyy6/UFRN
	 gOB7on9qeoZXRh5OjBB31ZkvAneaUN2yvgcvqO9mkeGGt76H46LfG02/kmz6JnTABIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UCzq+0hUR1yJ9/jjlpceXsBX9cIWpmZljfFqXB8X2YY=;
	b=RcvXe11qs3jSBok1Sghrnq0Nga/EBJ48U65W3gagpSjFnLMnbUb0G+Fk5FWZwyuZpmRI
	 tez0YDOuSfzvBF8Vo1fEKdQqxNdnK9mA+iQI5Jwp8kMlxuYdhw/kQKmzzSCRR4sM4CvDD
	 xuLfnG8iVLltcoy44B8s6kE/jlT7W/vUIBuMay3b5G+XFoiKJhlL4y6lqpYY1w8cTJrGz
	 S4a6CQXpeMDtk14C//elI0861ZiVkGuAfBamo4UA/uyQmuxOSv9sREpnD1R5yW0eJFDb3
	 vk+SQrDEbhHyIndyaX5SXsBTY9cAeSAu+dYYwcdv6iHPSrV48N4w67MpNbHbCAEeTYw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925057;
	bh=UCzq+0hUR1yJ9/jjlpceXsBX9cIWpmZljfFqXB8X2YY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Aq1z9F9eB5loQqzk24xkfh1PyRXyrLtzVyTNLlR0jfjsYvuYLUEcUHaKu6W0FCfir
	 bYIQ/EsXgjGDH+BdUaIn5B23kPyUGftcewRts8HODWzMSr2dXvvOhOKDliQ2NokyaQ
	 BEGE1wxmHVfQP0sAUTfUlyVgWr82fulayB8ZMR/x1JI/Czm5mDuzMKerhqSawLCJXn
	 sKQLmjinDJBPzVyzNnIz2I7wTNNW1q1y8Mb4Wc64wHcw03z4NJMcWRYYKlNUmI8qRD
	 vlL7mPrx4uHbQ7TrwIg3mHwq2qpUfLpPgPGSSsfUW4fsGVm2hn1fF97xeiddbfKjNY
	 RR6xo1LKQr3FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95BBA60816;
	Tue, 13 Oct 2026 20:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBC12AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED6C6081A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhobzLwipFY3 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 573B060809
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925054;
 b=oYFM/NeoGG+WN29Xq6SBrRr9ColKlpj3DWFwh/VGLDaH7CnarsmH685I0aiZ/4dMZb3C
 UwC3iU6YWUF24oAIsL4JMELuRdApmSy9dZFZOT07JJU5IIj/qqVKjYHxhmgUbK4Pcl3CV
 RIjA2YH2K58G4al5tWguki9CvAUbGDsLjvUxjbAS/quRKyEAQglFLRu2gzsMVYuhl4WRA
 Mc6skdiUg4HLcbv8KGvCfiKwRTyJIxstdgEk/icGwJslHqS3y/f0jroB+zjTH5+ThY8Dd
 idyyeAVHW84BObjI7Do6FykFTkQgvkN+opDRwq2OR2rzBwAJWwHRL9WNPjDBfkSQtVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p975jpAMGL+L1G9rr9lUtxMbvmvX/cj5wkg85M0sQFQ=;
 b=VL96ht4r1XDXRaDbbymckii1nYZN5/4kqQxyMsxYrUzD82gYVDcjCzgziAf9oDp7+PeA
 vFG3nCbIkdmLi1KMdd7eatgU1GwikKnuxn782rilNeVrEGmEbJkg7pIWf6NbSJjQniyDx
 R1EewT4GIZvqRpg63bkBKOx6/g93z/4h0cdu4EulObVhD5J+/DqXYUxeN7W4FXzeldfFP
 XEn82gpX6b/4E2212Tdh0wKd4IePYyZAS4IqwNMrlj8sGCgpVpd9wNKNIcSjKPYcNgjtf
 Yg1CkawvIehyXbOKqszXkPspdsgTjU6akhRns4zN7NS3N859aRvvZTgpFtd5SR8+YuA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 573B060809
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CEC08EF4D; Tue, 13 Oct 2026 20:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:53:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c0905f096ff0bb705da1eeb84b7dd78982509e0
X-Git-Newrev: 75b38bb91daf25c38d0d938e92c7e203ad9a695c
X-Patchwork-Hint: ignore
Message-Id: <20261013205614.7CEC08EF4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scp: bump version to 0.16.2
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
Content-Type: multipart/mixed; boundary="===============5831362346516075471=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5831362346516075471==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75b38bb91daf25c38d0d938e92c7e203ad9a695c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog available at
https://github.com/jbardin/scp.py/commit/21308b89160c31164bfebc9b79aea710d4990769

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scp/python-scp.hash | 4 ++--
 package/python-scp/python-scp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scp/python-scp.hash b/package/python-scp/python-scp.hash
index a82487adbd..8839163cbf 100644
--- a/package/python-scp/python-scp.hash
+++ b/package/python-scp/python-scp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scp/json
-md5  857ce2149485ec591d8c1076d8e74516  scp-0.16.1.tar.gz
-sha256  3f2b260bf9bd4c2b6857f697a1d7e8edc26fa569282b77027e849dfe1e48580a  scp-0.16.1.tar.gz
+md5  0255994570cb8427e4cc842184c4e037  scp-0.16.2.tar.gz
+sha256  d049f9aa77db4042c44b922cecabe97ef0716fb334a95701d68d1c7991684fc2  scp-0.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2455cf0fc78e13772bf10ef5f209e7eb8625706d671b2f420cc8add37d548c1c  LICENSE.txt
diff --git a/package/python-scp/python-scp.mk b/package/python-scp/python-scp.mk
index a2224e654e..868eeddf85 100644
--- a/package/python-scp/python-scp.mk
+++ b/package/python-scp/python-scp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCP_VERSION = 0.16.1
+PYTHON_SCP_VERSION = 0.16.2
 PYTHON_SCP_SOURCE = scp-$(PYTHON_SCP_VERSION).tar.gz
-PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/f8/35/fcef45d52d76a6dc70778c11eea719ff0ab550594bc51e55e66d28b5f424
+PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/38/c3/4d0230664b7c505ba2fa7bf9fe4bee83f6f1fa195e865ad7f92b12917e59
 PYTHON_SCP_SETUP_TYPE = setuptools
 PYTHON_SCP_LICENSE = LGPL-2.1+
 PYTHON_SCP_LICENSE_FILES = LICENSE.txt

--===============5831362346516075471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5831362346516075471==--
