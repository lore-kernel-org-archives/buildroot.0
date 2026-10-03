Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFB5CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4644260DB2;
	Sat,  3 Oct 2026 08:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-QPJVQZIV20; Sat,  3 Oct 2026 08:45:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6500860DE0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017130;
	b=iEMu+n3ux934xTRI4UNBLU3MnwcUWCJWmXEkURDuaBbEKUP1IFFLSIrTpPs8WKLzfUZe
	 DdxE2N/+AjzJHvEnd8JGZ6QroPx+pzEXjlVMxnhKlluLzH0LVtYwIAu6Boi4vkCe0HsCk
	 gjClE5UX5DsLhV+mFx2Dt6IPLF870h7vnBzSepE6+VgktobMlqjrrMeMfNqtNLv9/hyGl
	 a5eRphwwB8wZlhNBPOvHXr6dFSeVs0z3HjZkeuuTELeNmlMbSXOqo5UheDsKIk5Uz4VDl
	 DW0T9rFhS/ezHw7vyRdfbp9ZIqto0Wlh1wYOdVDtjTd3dpR7edosoeteYB837ydBclg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q7Os04TGKfGriFXq/+IDGsKjn71RyNxOqKWetDKhRqQ=;
	b=RpitVezUcun2SWrfTi/yLUFYHuxVBQZhefuSoekvqBnH/gTD+ra1MsF4VoYQe5Q0IiG/
	 AHCPpTMmy0PNjb5KSIXcl0yHx3gTpd+amBYik39/vptnl+wz5AuINYrC2rOIEJ3QPeA/y
	 pQNfgJdU4ORZ6wcYH8PfFPftxp04zRZAeWnCqy8omxlne8tszWaOetHoIznJf4ikfvEh8
	 MOqWfA4ewf45iWHeZRgrNcy5L1n2YbNr65P4cKEE7Qe1Y9aN31b2fzotTeUWPkII3Q7VB
	 R9xGgN3eXhzSXh3tlnNvESMp9jiawGmz0HOorZZOcMpdlyDLRKU67H1xFi/Cww5Id3Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017130;
	bh=q7Os04TGKfGriFXq/+IDGsKjn71RyNxOqKWetDKhRqQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IeNTxTfSlkJaQPWX221wu/oQUbcWxQUQ3W8PMjLZqWU4jSwq3TVqyR4ckuCyQ+Als
	 QPjmuGvHnfPMWAUhWXxVmsPJICMKoZyxecXiqpsa7tQ6YUtrcKBSdSs1wSW105Nxwx
	 f58cUvinD2IPo9VRKmzdoPvbou+lOik1sxGOdm+f2jgdMHgXKfPEMTo0Y5ophW13lV
	 jkDQan1xEGzC1xkGdh5fZZgQKmayH4vw+XTNPF3na1AAejkiAEuBe5+k+1Mj28T610
	 QJ9k8fHUcnrcybd/8d+qY3lS8qRkhiruzJTixEONL8g6LxA9yKAnPEF/unStqOuG34
	 PL3XXcKyCbgKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6500860DE0;
	Sat,  3 Oct 2026 08:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B17892E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BC1A41012
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0e_tJKuLlxxF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6384240FF6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017126;
 b=GQYa1Nx8RyYXTE4AiTk5BbngcBBCzTIyi3i67MLw7Un3gK28PcwWJGKbtuhq3/Z0pcMN
 vHwdpybvtwJGVEpZ1ilXe1e/fuEtzCQKWm0aHTZahCOrv9hqLdrV3cAm4Ixjr8fl6O32r
 QcUnsDILQ05IlALLFI/4dMAmWG9qDJsGLcaPTwR+OOJJcdXurbB+Q8HBOxQnysJvaNbKH
 4OgDZhDLwq06UyQ8hOiVh0rN1/nFkQOdI+TKIHdXz32RoOwzkvskxN4+MLtxdQ1xsXJRI
 Of/DlzynbO+P9/mdfUQXqe1++GtvBuipzgJ9j5hgLTokBd1yKM2SfO9vmil1k8u9qPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017126;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=rdsaAvsQ4U29YXKyr/UH9cQeu0pinTuwSDQhHDlxI2w=;
 b=WEWKMsawJhYwBUuOK8Dzf7c56oRPqBohNavfsKTKN7pDCoee4/WV853hqXI16EhngnOA
 1jc4ZFgm50ySMMKxVj8awqyIuKo8Zu4Z1tmkel3A9vDAc++QTVveojKvV/hLpRWwIf9m9
 039BnVYuLqLjs12f5Ql3V+E9RhJXLP+ZOUYqiLU+4zrmVjTfSvXXX1Y2W7t0KxpAZiqOV
 W4ISMWw+YiC19WQqFwc7LJvQDyPFjHxVRdvsWm5j28OUkOU96Z5m0aasZTR/d/JARI/wl
 wegHi38IUpUB8Hd+5MYLKOIIcYQ6i/mzHiajqjXptNMBdJwkiaxvQEaOdwGpvNCdBmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ACHouMqp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ACHouMqp
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6384240FF6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:24 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8243e4db9dbso126668a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017123; x=1791621923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rdsaAvsQ4U29YXKyr/UH9cQeu0pinTuwSDQhHDlxI2w=;
 b=ACHouMqp+S75+U2j9PcFvKabdzcVlWiHSjzjvN7vQItaK4HTLqTABjCu0CL9oiGjYw
 ZwVysTTEypLja13F/3ZjSFqtSmneY/lfm7PfwGNBNs86ck5UZdsD0fYL32wMldsuXL9J
 SgrtZjFqdLcCcOSMEwqZEQr/nlUwMfhXlno80JbGKAuHyUVcID3Pw50QTAhDu6uh7UqU
 8x9tDi96zrbPoS+gf9fIal3jz0THlrlwqYYW37VeFaCcUsgZSGJGMiE6xPYfchzY1xwp
 rP8bw2bI/wT2gvIaU5HJ++9NWkkL5OXEiU1n0lXmYCvEjGRXEi56e+bkOTGv7qdTOVkg
 rezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017123; x=1791621923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rdsaAvsQ4U29YXKyr/UH9cQeu0pinTuwSDQhHDlxI2w=;
 b=SNrNT1Kmqq5h1t+SSlav5rMe2/54bwdwBINdgyMXLFuRqohDg4thvAHJgKU/MazZPX
 sJSSjyFNGE4fm2uQ3JIEXNIBAyZYW573BJmO3I2d/AxTrXGKv+GnzYCYsuIJeL0mgCCV
 1w/cc8tydlsgmKEXWItfDw00w/sNyrm+7yB2nBNU3FXYJmsdXRlX2LQaWAE+pUTWL6Jz
 he6fZcObTma/ORDdMqL/2dkIv53ZfX4VmWfI6Dpm4wyXAW7vRyswIdhHLqMBjNuN3W92
 Zb4tYI3Wrtjrrvn9dPBWwAXDtsm+5atIN/3udTV1pOxxekll9AEti27VcxJKKGZpk/dS
 9DUg==
X-Gm-Message-State: AFuF++nHflq8BLZu0LT2VeMSVGu9+AhEsHqtchxl9t007gSDz3VP6lsP
 yk3JE+otxnjomWptDXeJHLo8ibCBD9tag7ebQgZu/imM24pznl+J3kfLAWrRjw==
X-Gm-Gg: AYBFou36fGvGtDP6p8YpaDJa1qq3+tKG2V0U1GdT5ja/FWjahmrFJdTd+KPxvOEiQYP
 TZmVtfnOCaqPR7epo0mUUgoHb9/EudT0tRfKejShRHV6t4RLF+Vtjw5xl82DLK066HhDHp2cOik
 vXXAzjD6k06glUm4BFV1O+UkITDEf0wMVET/cT8ndZT5KPw/hlMlN+aBwtg47ZrlDPSOyZ6puO4
 85IaoRu1Fern4P99IbXtHTx7l7Ngl9njd200Vhw2rzyOovy99r7lJkp+PUYVaI2zmeFek2iy5Cv
 LciWMMH9YTyWxkZycVdTnEzcqjr3GTkCr/ZqGnfGTiOdVYlsudQGjR3crE14EjRMonER0xmxf9l
 Aga4FZOxlKaK2DzQym7rVpB/0V7H9IBe1ow2eYi1C5Lhb6aPK2er4HhZOKt+WfDhss+VwXDpGak
 5qBCr9oPn58maw4fLycS7au+jN2FlBwYLx3ddDvUuem73k9Z577B9DWBh8NxuRGfebyCNkc6xSL
 wGjGv71MNG3QnStl5m/hcF/oQRbd+x9nZzt1PMNHa+LTAZfA9rYCQeB9nm5D4RnspPyIEBAPlWC
 3L23HHrVMveSp2YocN4rdVcwm8EaK63IYBb0jVLmAjyixuBBXXYXdcukdce2JLoUdyw2B98pNx/
 gwJSF1E5pBSzCTcF4Xay5ML9B9r1MwmTBosl1KVFc9Xo=
X-Received: by 2002:a05:6830:f81:b0:81f:92c9:1f80 with SMTP id
 46e09a7af769-8228526192cmr4926913a34.16.1791017123627; 
 Sat, 03 Oct 2026 01:45:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:00 -0600
Message-ID: <20261003084453.545653-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index a933e98416..30f375c702 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  f4973afe56c872eb2b8e7a930f566bb4  libusb1-3.3.1.tar.gz
-sha256  3951d360f2daf0e0eacf839e15d2d1d2f4f5e7830231eb3188eeffef2dd17bad  libusb1-3.3.1.tar.gz
+md5  3a67d341ce82d41111c1c95000a550fd  libusb1-3.4.0.tar.gz
+sha256  9cf5638506d54f21bf36550d97ea63189111a23c4d8078f630103a2052135f45  libusb1-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 10a727a7a9..9aff93467a 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.3.1
+PYTHON_LIBUSB1_VERSION = 3.4.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a2/7f/c59ad56d1bca8fa4321d1bb77ba4687775751a4deceec14943a44da18ca0
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/89/35/f9d2a990d092d647b47540cd229e1d68432c0f51183484ca189612a4824c
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
