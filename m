Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632A5CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9F540920;
	Thu, 15 Oct 2026 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UZloKrmGXJS; Thu, 15 Oct 2026 20:01:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F5AE4090C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094489;
	b=E2XF5o0YAPlrAdOI7JPL4quwzQ33OIDaceFufrHxmnMWA6T4/gyYev7NiMiTUQKio1a7
	 ETrHVCs7DedO3himuyNEhf15JmWR0IvwJ+mNVLW2iJ7BS+9DMEVmIAhMqy9k371fqXxD0
	 l4CJuxHj3ucwPIxWA2UmVDBe8X5TFYZsVJh726aSduR0D8gN0LaFAPA7tEWaGI4Z9ei/t
	 9sCz2ZZFV8nwuiJRB/M2HzYwK68i7o7EJaIJX5RabzCU8kFzyV5uKfecfa4Ns/Gr3Z/xE
	 VBw8y2ZcbA/SkLgtNq742Ful3ERtz+hUVlM9K4utla7Scc0aZs2oTLv998+QKNTFTXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UGoAU8yf81WCtkisM14pggIqYuCledwMpo5Z7KsWtgs=;
	b=ASxpp2Uo+nJx7llyTo1rYyjECHkqnDeOMFl/2sBZoANg6WVCAdYFubum05JyIc61GSZK
	 LZptxAbYagvSc3fu7uB2JpyrhdC8Ib+/UH+C6b1vKJMozSPj+98k3alt9a4wk839Qd2AF
	 dGk4Ji9qR0g5Ha83WWKMgDlhdCSGDZO6WJetVpfV+r4C+cWiHibBqo/fp+ASLrVALFFsi
	 GeJzoPp7xgiepWMyaJ3541MrK7/eIumBJ3n9R0/4usCVbble0ABVUJwb0m3rsec0dLe/x
	 5RzPITwUdLmcU5JYcZ0fWhCjvU+Rznc/bEiUG7Tffrnq2AnpPckr0TmTTUCGCNvpmlA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094489;
	bh=UGoAU8yf81WCtkisM14pggIqYuCledwMpo5Z7KsWtgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oyB6A/KxFXG/HLESalYTQ1llk/ZVSjIGzizL+KQ6wMRUOiA7zEHV/uBpiG6g3GASd
	 eP61u09E9TAZSCoe5jWvCUtr8kIM8HTYZPuvh8pJXhTBybOPwlCs570aBeQ9S0TXX8
	 mA/pr8WOUDvDhMGiD2IP2aQuGyocQnvWvYOuKnEttamgu7MWyffVtUkqZWYsIxm2US
	 u2rOgI0yt/yGQegknyZiDI1xcByLKC8qvpkYeBlmL6hKF3Z8iee6m8E3fisbaRR74c
	 whfeB1vdwmWcWJOpZYJrTV37JDvgVcYQUUWveanWPcYFCit4vK1xH6IYHUA+4OCL+a
	 y7v29eJJASEtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5AE4090C;
	Thu, 15 Oct 2026 20:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DCBF920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2463A60A70
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQXIwbUbpAr7 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6347760A48
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094483;
 b=TB2d3fSMA88lRz+1pXrPejAc581mN+EtWWE0Py4RQyF0DVKeD8KNcIytkWJ/XlYOCgnd
 Wfy5LB7unoWTNx0PdnTuZ+z8+DbnGIDhGC1Swhu/2k2DS6sw83LUx9b8RD99kdZEKtnla
 1jR+dsRPLB20S5zDOLy8d6sdT1FlFn2BuSNlR3FyGnsIpFN/8WJ3uwuH5jL4VXgO/HFmU
 ktYZqzj1jJCYfAVhk8wl+h6PzZmjjZIR1nm+3GOqruLHU6KaCWLstpzty9cXpsL892wDI
 +bat7EgyWS262vDAyTESJ/Y78Ki2U6TfFLA3cCZ9vZlWlAut8yfLvxrHPvDVzgpOiSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094483;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pBrxXSwOiS0MZB9kFm6slQ6jApwoebTiRwUvhM9RRIg=;
 b=kokKgZI7vj/Y3RIuov0/xmKq/vIT4xwuJ7qsH7Uzh4BA3gpz+l7QUn8lXCjxQ00cTk/v
 aMuSKUXrlSbbdvkaeEUcMfZqEiC3LKi2rv+aMF7AGFE6BZv5g4A/9MGJduKGybbElILOt
 EejcVJx0D84vjST1o0L7xKAh7U0sQAP2OS9979pf9/pRCENgfbv1uJW1tjybV/hehXTzs
 13myHgaBhKVL3Cdaxfqcb/A5TQMoKi+CcXhWKbCUXXUsDKsZzObNC1YAEXoizvNfHK6Ch
 FQrJ0zr9Yuuw4QoTQXzXPvLKg8uttvb7wwG86qlzdIfb323OyWGNdFXYLVWybTNRgOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6347760A48
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C13095CF1; Thu, 15 Oct 2026 20:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:00:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed40a20a0248cd78f4101bcc23061f3bb8e7dd7b
X-Git-Newrev: 112fd25dc6240ea69168080fda016970454c1988
X-Patchwork-Hint: ignore
Message-Id: <20261015200002.8C13095CF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump to version 4.2.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/112fd25dc6240ea69168080fda016970454c1988
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index ae77f9c047..c9dd8be04e 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  d4a8797e31d5ae93ed24df29be0188de  urwid-4.2.4.tar.gz
-sha256  a4bff322e8b8e407d7809e942e63177790509f5a2a740d27199ce8368f36f113  urwid-4.2.4.tar.gz
+md5  fd2c6a87a26c1f753f30edcc2047a27c  urwid-4.2.5.tar.gz
+sha256  a1fea3a551953fae4e6b727536334233bbb8b88c45230bc91d9751b402a8c16d  urwid-4.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 40bdbea8f3..e60bca01d7 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 4.2.4
+PYTHON_URWID_VERSION = 4.2.5
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/5d/d1/cb25a9236e6a6a53321dbf8538982134035dce940046e63ac864a4418151
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/3a/df/eb5dcbdf1638c38618096382b4a30b0423ed7d2aac97fd9469b51d6de43f
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
