Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E7CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D8C6104D;
	Thu,  3 Nov 2022 19:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D8C6104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_mAXJK3nqcw; Thu,  3 Nov 2022 19:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32596103B;
	Thu,  3 Nov 2022 19:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32596103B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67EF41BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EB9561034
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB9561034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lb1tdnXcBxX for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:30:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C0D605D6
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9C0D605D6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:30:07 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h206so2194606iof.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8pD7KIREBXwKP6N53nKSp3oc19iihqqNjQwwNWBfkw=;
 b=DgvulWHagS0pMjO9CRar3oJdEvdNThuM4xYQi2zOLid6K/yTCg7/SEgp5SmCvOU3Fv
 sOFcJSt833jPALLaNoFkWtSgGUh2DXTszguT9k0gvijteWwkepoOwx5xUmmTb0nWNHFi
 5ZB21MZfxpfhZ0G54eAp8QMNEplkFIbB1gfeifIacETDzIz1/HdW6PSlxhykglNQptjQ
 kwFqeb9ioMw8DWrrzMehtbeb+ivHzxvywNH1U/T+UDDaluul0x2wCsSf8B/2AFEIl2ep
 U0Q3h0k+0LULdyDjv+b3Hi4EjnxlhPI1xKi+SZID/nsQB/gL0O9bgav6U1CWdhcwg1pT
 BWOg==
X-Gm-Message-State: ACrzQf0aWolhEhX71oBD1PH5vQ2IFSoKFm8K1hZAOArqxqe1a1at7nNk
 u0fF7Lz/UWtqjsw8PnzlGL7KDZi2zGu3vlSE
X-Google-Smtp-Source: AMsMyM7CFj+6jCDfSsTpys8bpNuXXznBoYwnPD9Ymga8AnTDbsgJ2IPpAhTZQFl1a+R7F017k5QiNA==
X-Received: by 2002:a05:6638:e8a:b0:374:f6c5:cff6 with SMTP id
 p10-20020a0566380e8a00b00374f6c5cff6mr20228266jas.187.1667503806662; 
 Thu, 03 Nov 2022 12:30:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r10-20020a02b10a000000b00374fa30a0d3sm475555jah.143.2022.11.03.12.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:30:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:30:04 -0600
Message-Id: <20221103193004.437008-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8pD7KIREBXwKP6N53nKSp3oc19iihqqNjQwwNWBfkw=;
 b=LxerWSVjelA3JtpaJgyYYXPiBeUe2niVB4fdzY16yG2a7s05l5OFvpLwOn3BCSo7uM
 PSA+f7peLpvXLQTuLvkIlZE3krEUe2RvoOvy8ZbWfjOakIvNQnb7Q6rVnfKjWqbyh+nC
 e7jjjoo4f8m3Lu3lVEH/wARRmuiHj9HgN8TgsHkUCoyMAd9ARRhlqupNBzmxe3Ss/o6/
 pgME6WXCWhWarKh2bKoQpbvI3FOQ/7gTixgDk0UoOwFdE7RWLatys0QXk2Xyyx5BpqZt
 +rBpwkqzTBLkBWiPe7jyPRO1QFbrgrME4rBbjg0KQylj8+R2gUuPAA3MRQmE6iA9ab72
 2oGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LxerWSVj
Subject: [Buildroot] [PATCH 1/1] package/python-socketio: bump to version
 5.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 40e74cef96..abdcc3a5b7 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  0507825ca4bd6527cbaed81ec5767bfe  python-socketio-5.4.0.tar.gz
-sha256  ca807c9e1f168e96dea412d64dd834fb47c470d27fd83da0504aa4b248ba2544  python-socketio-5.4.0.tar.gz
+md5  e63369252a9d383cbfc503337b864733  python-socketio-5.7.2.tar.gz
+sha256  92395062d9db3c13d30e7cdedaa0e1330bba78505645db695415f9a3c628d097  python-socketio-5.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index f23342b776..aecff55ef4 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.4.0
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/72/70/9b992f4b8adfcbf0724c079c18629d83f20b36fb0eb64d4fdf874054becf
+PYTHON_SOCKETIO_VERSION = 5.7.2
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/ee/56/294629986bf6cea96e0edb3933a7f2fac7a079d12909e893903a2effc670
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
