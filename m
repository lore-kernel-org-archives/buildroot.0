Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9EACCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2AA860634;
	Sun, 18 Oct 2026 14:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQtYwW3z5CSj; Sun, 18 Oct 2026 14:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0C4860670
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333468;
	b=jdNL0G+7gvyR3o5ply7WOy+z6mbk0kOvGl1VhfxmomdObCUiCW1FZtaM+SLKs9Mk6XNh
	 uZybo0H2yNfX0eKHz4LgRilYIMlTLv9yrMOf9WKKfyVxkwtfA5jQq7pQCYbtRWvS1/iMK
	 ZVERfAQE1LLCz3Y2I7ZttW3kQKqtIvpgrYQJIEaEjjqvhdm+MqexoRb3vCTGs7RFd8o/Q
	 VFOA0A1YJ/4JYP2/V68LZZ8UvKSUZCJv9uBLMyPS18/pP0VpwElJ3hZst9yPEYNKxTfut
	 lM+d5I2ufIzhfoaHzG57slPUTP7Pnwx9XDD9hga4VieYRitDam+mEcrHJvZkTAlSTiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333468;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XPo4IDGJyW4OAojw5Kxt70QwYV72zL36wZhPWZI0eYE=;
	b=dnuiy8EImKepoN+x3g5AkA7GYX2KzessH9hnrogaJIu2GRaMwtRVZdPZll2dokd78kQO
	 5KKLbvyY9Q3P390JSkfU6ZBgRc71+NDvo4uPjqahq9Vu1Q29/w37L/+ZezBxjD127qiNl
	 mpomZo5FHlc48tCDdP7CMfmTtBqSRmRemINHQ3BaLcHF1pMczdiDH/WX2D6cIkR98y7ic
	 gC0MvmxxUGOvQSk3be0kNqFA0TsDvPUgo0pKgq2Oc647N+GGJ/9xvRc++scnLo95sdAvn
	 CXltpcmy2tsX79t5oH8jze4BqaCZbXH0wZHzPREme01zqN13ThKRkSlubAZmra0Ztvg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333468;
	bh=XPo4IDGJyW4OAojw5Kxt70QwYV72zL36wZhPWZI0eYE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o5/goULxvmtFuFZ7HEa5Vq6SKDmu102AL6kRm49NAOwPq3xHbth7FFyo3g3lX1p3K
	 vVzhqqAgEJPNiBtSYRaugWUxHRXd6ds/NWUAhKVYCLV8+Nx8IafEPS9MPIGnn8tEzf
	 aW+2AWviNx0nppatejHZK1JUOXcEGH30fpA115xj2rUzAPiZuYBVdvuWPGTWd49DO8
	 JCWp3untfQzw1huMJZZslmPXoXqxmSsMFTGvorFdYhtgylM3LbNCOvQAd8KsoGUgHK
	 Y0HRPHul2iD5MLA4h2cwtu3hGQW+ledkLtprYfdoSIXMIDH9f/t3PINvpUAf4t/M33
	 yifU7cChw8fig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C4860670;
	Sun, 18 Oct 2026 14:24:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6FC255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 807B04070C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TF7MckZiypH0 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9EAE9406CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333464;
 b=Wq4GLsjRozdH3bXCt1Gz58s550NlwWPRu51VdxE5zK2Zzf1CYA8RzYd4ifp3nMh7zjZ5
 jM6lI54+tZL+Zne71aqCkGRSq/QBRxLTOOiqiGv4uVKpOzxBiOaSgTUKJT1Ij/op1n4Jw
 J8xTPB6d3tZxgY8SkpHLXId0358/ZNjZmZTAQHZcF0VSze6TtfoVUv0ozE0Zz5HQwkzjz
 jnl6edaD1GpHPC22rFu1pfA5K/aKgxPi4YtqFlWadw9/Qk4KRx0kkTVL/vxLExCaSpEGt
 N32YvnMfbcVOjAMzQQypnXjGWp8UmlytdWU9Ovpt9CxFNRWm+3VnCdJK2Xvn9PXZzoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333464;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1vkeHxwVP/93gwRnhO7cRYnKQbSzdoEQg7xLOR0xPyA=;
 b=V21nqsUgDacVKbLqlPPrGygjP0MZOPU93H0fVHr3J9yZU33TKo72BCq8Ko5xPbpdsU0C
 Bi8M+GdqjO4XWvWQ6j33kaE+ObOndIRWaAogDd+tduoL3tUaUYe9dXSxtwbkSubL0+hxL
 EmlY2ExrhHbq3CQBrIAVq8NLWV877ayQ/8tN5ZFgLvUIcgFeZhf9tOuweca2uEnO4o7YI
 R0va/gVzY0+cxuvssZAb4il8YqO6/iFcau4svKBfsqhl0lAbAXgYjf4GaKkm2t46q+1qD
 MPRY5p8Rt3a0x4v1JXu70hPIFO3Qfm9NW9nXJmQH7bsyIGHX+TU0HSsyqon4D+0qxpw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EAE9406CB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 684C398283; Sun, 18 Oct 2026 14:23:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:56:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06bc55f817c3b22583519a2c455deb2b548d9558
X-Git-Newrev: 6fbaf7df1629140acface1fb4c27fa2cd0cc0186
X-Patchwork-Hint: ignore
Message-Id: <20261018142302.684C398283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump to version
 3.12.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fbaf7df1629140acface1fb4c27fa2cd0cc0186
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index b9ff325312..41d9c1389e 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  0c5925f54da81648a14ec51368134c27  bitarray-3.12.1.tar.gz
-sha256  b712ea178c26c00b60b14bfd17fd0bab6138a05b515884b0ce418c0f6fecd2f3  bitarray-3.12.1.tar.gz
+md5  29c4785c85eac1d397d49fb27c4b1cd2  bitarray-3.12.2.tar.gz
+sha256  940b64a0701cea18c0698ef23ec2d9a038e47103b0402b19cfb298d71817d27b  bitarray-3.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 4ebd26e593..40dd9cb2ca 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.12.1
+PYTHON_BITARRAY_VERSION = 3.12.2
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e7/af/9f136a8191822bc9277fa6af9241619ad6a21e0638b694bcea1b0f8d0d88
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/21/46/2e429b78a594006417d8a5f8971e027f3e6a2657c288d7875cf9bde64295
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
