Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF14C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 12:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7574033D;
	Tue, 26 Dec 2023 12:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7574033D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TU_Ob9dC3wCZ; Tue, 26 Dec 2023 12:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DFE940360;
	Tue, 26 Dec 2023 12:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DFE940360
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746621BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 12:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BF50408D7
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 12:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BF50408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aemXaVXJk9o for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 12:03:03 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6295408D5
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 12:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6295408D5
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-555144cd330so668524a12.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 04:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703592181; x=1704196981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UccinxGXzuOFGUbUh3QTCQZTNL7l6HKVfZL/dUTQxKo=;
 b=SlvHzPOCO6gNGpIp8peyl3qkyemptywROuq5Zg6KonmGc28pUQr7Poflz+xK+Vs0ei
 nIECJqkUJ6TsA41SuL91cV05DW8R9LUnZghETM//cL9O+eUYlwRXCWniR1S5uvWWEcLC
 8snMzWuZAzl92S/zG1WRUm5ssaZdkJYK6/mQkegqPK3mLYfb+JBJrpGYth7ZNxqrt66j
 7hC0nsLWFULaefFNmjc0YHMTysVnAJsPucii7EII+98HKibQjIFRg9mHewSxQQFYMM8/
 HGarUOX8cDsaXqtDuFHaTYhIOPwbFYsapkD+fyzC6jtirtA+Fk2uIBuO88kpsuDI/8a2
 TJ3A==
X-Gm-Message-State: AOJu0YxaBQtRlkTnJWVi27R10SZnLJBHRXrCy9nk9sjYiobbgMIGcYKC
 VkWC+Ol0aMkiIaAWrEf5tMr+YgHqgRVwfw==
X-Google-Smtp-Source: AGHT+IFONpK4XThBmYlmkgVa5bwNiLOg8iCRPGGFOHDZMfQQzNs2kKUdYpy3jnNydDBJo5ARVHU+xw==
X-Received: by 2002:a17:906:5350:b0:a26:b71e:f75 with SMTP id
 j16-20020a170906535000b00a26b71e0f75mr3274060ejo.5.1703592180373; 
 Tue, 26 Dec 2023 04:03:00 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a17090791d600b00a22fb8901c4sm5768243ejz.12.2023.12.26.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 04:02:59 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 13:02:51 +0100
Message-ID: <20231226120251.693371-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703592181; x=1704196981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UccinxGXzuOFGUbUh3QTCQZTNL7l6HKVfZL/dUTQxKo=;
 b=nGTL6KJAD4S2wGhx0rXyAd2VJibNO1gl5zU1NCy6/4PqXt8PE38eXYLFSJ406X7csO
 KL4JInLazXlFsMNg8Dh59BZbdX5vrnYKAdYcBZyPOOF/X1QsXQw4uow3q3cwOaSqTfjE
 /6mDUtUUuVryKDAdU0JLIJW5MDh8ROX7Yb6JSztHbBaRztmeW1XazB548DGMC0H4VRnn
 u3JuLnKKjmZP0+aDukfOjUUI+8vUUhwyiB+QqYL+R6/2gSPA7BZUSjFDuo7/IWxOuZ4m
 a7xiVOQDRCbGzNDiunv2fpH04N/7ND4m4xnjZfo/3H7VEPOO74J4HgNXub+5vG4gU+Fh
 kiJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nGTL6KJA
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix IPUTILS_SITE URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Petr Vorel <petr.vorel@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream in release 20231222 shipped self generated iputils-20231222.tar.gz,
which is signed and thus has different checksum than "Source code (tar.gz)"
generated by github. Therefore different URL needs to be used to get
correct checksum.

Fixes:

  http://autobuild.buildroot.net/results/e9b39e142d5f56bf589253a10ed4722dbbda375c

Fixes: 32da4422f9 ("package/iputils: bump version to 20231222")
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

I'm sorry for this error.  Although I tested package with utils/test-pkg
I probably had cached package in dl/iputils, that's why I haven't
noticed failing checksum [1]:

>>> iputils 20231222 Downloading
wget --passive-ftp -nd -t 3 -O '/home/buildroot/autobuild/instance-1/output-1/build/.iputils-20231222.tar.gz.nEeIiH/output' 'https://github.com/iputils/iputils/archive/20231222/iputils-20231222.tar.gz'
--2023-12-25 14:18:12--  https://github.com/iputils/iputils/archive/20231222/iputils-20231222.tar.gz
Resolving github.com (github.com)... 192.30.255.113
Connecting to github.com (github.com)|192.30.255.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/iputils/iputils/tar.gz/refs/tags/20231222 [following]
--2023-12-25 14:18:13--  https://codeload.github.com/iputils/iputils/tar.gz/refs/tags/20231222
Resolving codeload.github.com (codeload.github.com)... 192.30.255.121
Connecting to codeload.github.com (codeload.github.com)|192.30.255.121|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: '/home/buildroot/autobuild/instance-1/output-1/build/.iputils-20231222.tar.gz.nEeIiH/output'
...
2023-12-25 14:18:13 (13.4 MB/s) - '/home/buildroot/autobuild/instance-1/output-1/build/.iputils-20231222.tar.gz.nEeIiH/output' saved [546838]

ERROR: while checking hashes from package/iputils//iputils.hash
ERROR: iputils-20231222.tar.gz has wrong sha256 hash:
ERROR: expected: e3ce5e1a1f795c2d520985463b90e20f9388b7060796d54ad64509aa8e4af775
ERROR: got     : 18d51e7b416da0ecbc0ae18a2cba76407ca0b5b3f32c356034f258a0cb56793f
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
wget --passive-ftp -nd -t 3 -O '/home/buildroot/autobuild/instance-1/output-1/build/.iputils-20231222.tar.gz.1wDgdq/output' 'https://sources.buildroot.net/iputils/iputils-20231222.tar.gz'

Package which buildroot uses via $(call github ...) is from archive:

$ wget --passive-ftp -nd -t 3 -O /tmp/iputils-20231222.tar.gz https://github.com/iputils/iputils/archive/20231222/iputils-20231222.tar.gz
$ sha256sum /tmp/iputils-20231222.tar.gz
18d51e7b416da0ecbc0ae18a2cba76407ca0b5b3f32c356034f258a0cb56793f  /tmp/iputils-20231222.tar.gz

But file which can be downloaded from releases page [2] is different:

$ wget --passive-ftp -nd -t 3 -O iputils-20231222.tar.gz https://github.com/iputils/iputils/releases/download/20231222/iputils-20231222.tar.gz
$ sha256sum iputils-20231222.tar.gz
e3ce5e1a1f795c2d520985463b90e20f9388b7060796d54ad64509aa8e4af775  iputils-20231222.tar.gz

Previously we used file generated by iputils, which has the same checksum as
these from archive:
$ wget -c https://github.com/iputils/iputils/archive/refs/tags/20231222.tar.gz
$ sha256sum 20231222.tar.gz
18d51e7b416da0ecbc0ae18a2cba76407ca0b5b3f32c356034f258a0cb56793f  20231222.tar.gz

In the package I used the checksum which is generated with uploaded
files and uploaded with them [3].

I compared the content of 20231222.tar.gz and iputils-20231222.tar.gz, the
content is the same. But the size differs:

$ stat -c "%s %n"  20231222.tar.gz /tmp/iputils-20231222.tar.gz iputils-20231222.tar.gz
546838 20231222.tar.gz
546838 /tmp/iputils-20231222.tar.gz
548875 iputils-20231222.tar.gz

I suppose the difference is that I signed files in the release [2], but
files in archive are generated by github, thus obviously not signed.
I suppose this is obvious, but until now I haven't realized it.

Kind regards,
Petr

[1] http://autobuild.buildroot.net/results/e9b39e142d5f56bf589253a10ed4722dbbda375c/build-end.log
[2] https://github.com/iputils/iputils/releases/tag/20231222
[3] https://github.com/iputils/iputils/releases/download/20231222/sha256sums.asc

 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index a8f93488bb..bcf440ec93 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IPUTILS_VERSION = 20231222
-IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
+IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_CPE_ID_VENDOR = iputils_project
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
