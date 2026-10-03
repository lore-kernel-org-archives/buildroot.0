Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81902CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C4361005;
	Sat,  3 Oct 2026 15:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kPs-uYxZJVF; Sat,  3 Oct 2026 15:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C833C60FF0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043000;
	b=L7TcmrbJfRUraJVm5vArxLi28JKrbcD3fMuLE2+utC87M24/k74m8CSKzEd8M8hF2pfA
	 N4gdQuDZNXz043pUhahOQh8qtaqh5lVXNcSIB4gaR8z8KCCWFQXmqfC02EwOmqvQYt5pv
	 /doqC8XSO/XjWxMoizXecpy01qGz3Z5akHroIvmoaRrCHQlyKGG8heBi7Lkpw/k093FyU
	 LBpWbk+2cjxrxR96EVD//yUkgfQiTq5mTjRnAZlF1WSuerinZPcc9K2tGO20dWMNzFglh
	 FZiqAbkDjETW5pJMk1oH/RSU6eoMjuS6zGlAVS276oK1a7XN1FT2909psE6sl7NqwDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043000;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ERqCtToP83wK9+dPKyRGeMlYwo53jXgfIi9UTDGW10=;
	b=cOsFvFyXF7GVdihH3qERNehTdRsKq9RMqLecfQ9rIj1IXdjvIhupk/fhOH2bb6d4BA+B
	 Yw0BPAK+9Cj7AyM9QTU41ZmefrC+iQ3RnXNtxz9f23x1w1orXWll9mgyckCagVU2MpaqA
	 T4j6VSUF3SKT6roQ9JAa7P/lHAT1in/YmefhXuBuiq+6vd7BD3pVJV8l5LxDp0ShXrINX
	 Xmvs2rXdFt1MIy1XK/l9GEqBd/bqe0g05p3f7ZgATkiJit6oIv5YV+WltnzL7ikOuq5hW
	 uJd+loOo0doNGcYXu4P+cMdmKsi6brPUvDzvh1qwFjVQIlvg8dh+xTLOBmtnWn3t8TQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043000;
	bh=2ERqCtToP83wK9+dPKyRGeMlYwo53jXgfIi9UTDGW10=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XfvgI6thpkSOdnSP6EXwJdbsSH18S5RhW8lOyFCniJjEsV3ceq2/JNMrOHmzB2nrX
	 B6nhROfzTp4Z8szSXfu8OhA+BMm7WBZHerKABJ5OsyGupe1IE12ERDA7q9RFmKcwIn
	 hbQHRHmEsoQnoe+Tl0GRl9x5yFsLSFFsYGygYjPjh6ILyo/nDgqt5gkF/wlzjPrc1Q
	 fyh1krJcdPvsKw/wDK5gklU/9PM7ZH84RKhNkt8VQDB+wTW08Fbv8ifmmLjUg1hznV
	 kZKCFYOPMOgpukh7LscHnbFBVEihwa1RgVigNY1SHNgdsvTZLtKhlSRTlLzgDT899T
	 /c5lF54g1d7ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C833C60FF0;
	Sat,  3 Oct 2026 15:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E92335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D52CB6067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yi66F9H4krC3 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D8E3B60652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=aiPILvC9USUA58XQQ0g7lh6b0hXQ3otXq7uSgq4s/r1diOJ9nol4P+ALHq8VRVS9EppJ
 7jn0WT5OU1YhQUyHotQmAl8uZRMP+SboYUGMUGZBXiQJdyvKp1VN52/EaILXHPcKXYTh6
 P86hRXHQSAvDoFHB4b94kYYGdKTx9i+mj2zEyMcG1l37le8h+9RHMmyBEAmButC8t53gb
 x/dmWBr4IMcsNJWFZ/Rj6jvYPKCW3mGv39WMUWw0n6iic/Wub2cNk/hnfRcPxBT1vlS9M
 4rBHokwS1AJOauNC1F0WeKJ9Ihz2jHu773QSokpxWpWjU8F0Sjs/Xn8py4Zxq4uaTwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=G/P4SqUxf0eDJ8D1ekBesNb0gMnIZ1RPQJEfkfzHGV8=;
 b=L1z+vlLGZGPNu+sjbQzVm3bxJHsI2Vx7ZTMcVOF1OjPIwc87PFpEN8TBJUN2ntqhf3A2
 yw00u4IPtByw5+wG/UuHaqepnGlzTmZGt+4DGwLMOfN1BiykUqRnoMMHyNNeNU58RocDJ
 l8vdqsNzI7BDHJ3AYrMGykB8SnJ8nJoMrpnuCMyzc0A+GajG0aNd5qBuv15eH2FzhCbj5
 H9vNEBXA1EP4/3Yj1J/Jse0LLE73Sxd+Algz1bVf+b7c5Rno3fE49bvL/7PtcwZZd3hf2
 hw3qjxHGPiRPLV/tMxXsd56GZ+VBsuDCgtvNKjGR5F1OYV3Ut/np1EsdBYwXAJiEgjQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8E3B60652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2565B886C6; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84999ab9d964af65c3378e9bc82074dbc2c3147a
X-Git-Newrev: 6d01ff11ed9a5db050fe6514a4c79b6b3e2b4c97
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.2565B886C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanize: bump version to
 4.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d01ff11ed9a5db050fe6514a4c79b6b3e2b4c97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index f1ed743cc4..03ad44a5ff 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  65cf3c77127d6ef9159e56c4ca728c07  humanize-4.15.0.tar.gz
-sha256  1dd098483eb1c7ee8e32eb2e99ad1910baefa4b75c3aff3a82f4d78688993b10  humanize-4.15.0.tar.gz
+md5  4e367e1d34263e88451d0ff700a6a6ed  humanize-4.16.0.tar.gz
+sha256  7dc2244a2f84a4bfb1d36c37bac80cd78e35cdc5c119206d87b018e1445f3a3f  humanize-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index e314fa5f78..81dac19f2b 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.15.0
+PYTHON_HUMANIZE_VERSION = 4.16.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/ba/66/a3921783d54be8a6870ac4ccffcd15c4dc0dd7fcce51c6d63b8c63935276
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/0a/ea/13a1ef3c12d12662905801495283530251918b70d62d368f1d2e0272c70d
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
