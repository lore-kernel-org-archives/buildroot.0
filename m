Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB52CE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6483680F6E;
	Wed,  8 Jan 2025 22:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGpVtgxfY-Sc; Wed,  8 Jan 2025 22:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC87E80F7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC87E80F7A;
	Wed,  8 Jan 2025 22:43:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 705E07AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67F1A60609
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyCeWk6KD2hU for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 768D460596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 768D460596
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 768D460596
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 866DC1BF205;
 Wed,  8 Jan 2025 22:43:21 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Jan 2025 23:43:13 +0100
Message-ID: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736376201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=K9HOVQQwly2R1MofGnPnHAb41dRd3vLIW7a1Vl5oU+A=;
 b=dHn+M7Ixg8egSOtc4w52+EKETVM7ogYsZ9RDae5jJua3SJSgpUCRXUaFZ961EGTqy7Tzrg
 3FI6ZdIl9XNIfw9bctgj92XJbrQVw64Bft2mipTKzV9mFpIdWBIuSxFkitNxZKlS5GGHWv
 EqZJ6+3RGFjty7ADQQCjzFY20kj/phWB+CvLj6MBHlpxzdNjnjiyxOcuaBwT6OKlJrE+ta
 5GQmzf9xN79u5CnZpdHy5a0cjCIrg0QpDnxUvg+fNj3apE+klFJ52Y33E7NIRaO8jhO/DF
 Y7A3jGbulbDYRKd0bAHEWnFqsZ/GWywKHM4BKRh+qxX+3DZVniDPhYdezNiYSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dHn+M7Ix
Subject: [Buildroot] [PATCH 0/4] Use cross-ldd for dracut instead of
 prelink-cross
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

dracut is the last user of host-prelink-cross, and host-prelink-cross
is problematic because:

1. It is no longer maintained

2. It requires host-libiberty, which itself causes build failures due
   to conflict with host-binutils

3. It is very complicated for what dracut actually needs.

So, we replace host-prelink-cross by host-cross-ldd which packages the
much simpler "xldd" script from Crosstool-NG, which is in fact even
recommended/pointed by the Dracut documentation as the solution to use
for cross-compilation scenarios.

Thomas

Thomas Petazzoni (4):
  package/cross-ldd: new package
  package/dracut: use host-cross-ldd instead of host-prelink-cross
  package/prelink-cross: remove package
  package/libiberty: remove package

 .checkpackageignore                           |  1 -
 DEVELOPERS                                    |  1 +
 package/cross-ldd/cross-ldd.hash              |  4 ++
 package/cross-ldd/cross-ldd.mk                | 37 ++++++++++++++++
 package/dracut/dracut.mk                      |  8 ++--
 .../{dracut_wrapper => dracut_wrapper.in}     |  2 +-
 package/gdb/gdb.mk                            |  4 +-
 package/libiberty/libiberty.hash              |  1 -
 package/libiberty/libiberty.mk                | 32 --------------
 ...c-Fix-TLS-offsets-computation-for-s3.patch | 43 ------------------
 ...rc-execstack.c-fix-prelink_path-type.patch | 44 -------------------
 package/prelink-cross/prelink-cross.hash      |  3 --
 package/prelink-cross/prelink-cross.mk        | 16 -------
 13 files changed, 49 insertions(+), 147 deletions(-)
 create mode 100644 package/cross-ldd/cross-ldd.hash
 create mode 100644 package/cross-ldd/cross-ldd.mk
 rename package/dracut/{dracut_wrapper => dracut_wrapper.in} (94%)
 delete mode 120000 package/libiberty/libiberty.hash
 delete mode 100644 package/libiberty/libiberty.mk
 delete mode 100644 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
 delete mode 100644 package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch
 delete mode 100644 package/prelink-cross/prelink-cross.hash
 delete mode 100644 package/prelink-cross/prelink-cross.mk

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
