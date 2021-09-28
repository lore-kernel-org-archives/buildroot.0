Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBAEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E53E60FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E53E60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC7660AF0;
	Tue, 28 Sep 2021 11:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id js8D8sBgiiN2; Tue, 28 Sep 2021 11:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05BDA608CB;
	Tue, 28 Sep 2021 11:02:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A27E01BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D14E4012A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3FeXoRfwv3Y for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:02:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3598C400BF
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:02:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v17so13881332wrv.9
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 04:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHmf3eVF+4RxfGn+vG275fTfd//n+/HwIm1JT5Ait6U=;
 b=h0l9Zs5zplQQhUWa+YBz/RgZ5NGo/e+Q0LDU5WaqG3XwpdFf6XDnfy7BseK5Jcleja
 X9yhiLQYjpPehwv/b7NtTyvnYUOL0nh6y/tJzTgpSScsfrVjvcNtMUth0JeGPyCjjKET
 VcjoZ7spH0zwVU9HZ8ujjPN1vJPn06kjN3vAmQqXgwiTYgJpJlax+BeMSMuGUYSh2j5F
 GCKaGIz4+QL9oSftwyikGXPcCFSssvZwWuKHIWLPAXLQXEVDijm9gOxAGq8UF8iN16Be
 VtksGHCjHBqgR+caPl7SbVFLl1VWRGfp+nax1KBp7An4ybYlkL7TJP5+slbFPHRqfKIW
 yQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHmf3eVF+4RxfGn+vG275fTfd//n+/HwIm1JT5Ait6U=;
 b=VlbIoj4kcp13ISYGLMBziH30OsHfQ8pm4Hv8Q8R98XWVA5ORUXK/QPQMujDPL441au
 mYXUmH+rPrG1ogSC3imqwk9Mh+y6MsXaRGOjEeRnWBqGXHUYMNxfKOrN1zVu4dGd17oG
 LA+YvTtwp7D/5VM9F+5XEa/TSrpcLJzWTSz0gI/yyOjNzHruk4T46nAzzIR9Q1PLvUWb
 iklPlboPWWC0jifXt3+B7yj3XKf4mbxlhvlNug4vsbgWXXrwCbW1F48PmQfj05099LAR
 CbDraXHYSobz485Pjr02hZ9O/Xs2jy3Ltta/yhYpLxaFPfPTtmzWRo8RR+YxAARWDHjy
 I41w==
X-Gm-Message-State: AOAM532hGVhxBtW3H35q8/au6y6kl0BUgW7l4El71nW6qdRdLlE1iBaq
 gGehuywjDYqtC9ClIEAcKmVOfzuAegM=
X-Google-Smtp-Source: ABdhPJyXw5c9RifYrZnUvUCDotpzfkQUSerzCkhEYLYvt0RTOYkO6TYI3TPsmWL33+Us1EQfysG+ZA==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr5658734wrs.262.1632826938265; 
 Tue, 28 Sep 2021 04:02:18 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1254:64a2:465:81e0])
 by smtp.gmail.com with ESMTPSA id c4sm19432155wrt.23.2021.09.28.04.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 04:02:18 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 14:02:07 +0300
Message-Id: <20210928110212.596939-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version 5.6.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pbr/python-pbr.hash | 8 ++++----
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index cca9de0178..8cf2a18d36 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5	477d2aa285ad97250a172b199f4060b7  pbr-5.4.3.tar.gz
-sha256	2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8  pbr-5.4.3.tar.gz
+md5  62565acc6bf3e7e10b082463421f8b46  pbr-5.6.0.tar.gz
+sha256  42df03e7797b796625b1029c0400279c7c34fd7df24a7d7818a1abb5b38710dd  pbr-5.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256	5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
-sha256	eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
+sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
+sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 12b5b56811..3cc7ab81fa 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 5.4.3
+PYTHON_PBR_VERSION = 5.6.0
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/99/f1/7807d3409c79905a907f1c616d910c921b2a8e73c17b2969930318f44777
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/35/8c/69ed04ae31ad498c9bdea55766ed4c0c72de596e75ac0d70b58aa25e0acf
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
