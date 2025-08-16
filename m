Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79767CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 13:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C79383DF1;
	Sat, 16 Aug 2025 13:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIG2LNfYRvUc; Sat, 16 Aug 2025 13:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B5B783DF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B5B783DF5;
	Sat, 16 Aug 2025 13:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E35C961
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7329261309
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZsienhbA_sg for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 13:01:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6927860EA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6927860EA4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6927860EA4
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:01:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a15fd04d9so23127835e9.1
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 06:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755349267; x=1755954067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6e9328WS6kLSK5mOKJvmBb/DaZuOd3ATlT6WCwhSLBU=;
 b=asyKbM/NIf0S+zlVqkFz8RGtatqfl1YaSPWebKBARBdGjfZBWcp6VUl8aar1gag1gP
 vZTL8KA1X49J1CxFaRKJqnrdXGyo8uSWIEemJwhfBmfyfuOieqAOzKrbWQ77vEgzaurn
 6R0CJ8F8kvT8ZGr2BGqYWWTbflZfFUxKkhBjxXvEVdvmR/CkFM2ijBeyGtahlKcquQew
 uYPp5hev4z/edBORPWbAtuSzofYlCXdgzBc4LiaKcqci7zSesgvy/SMXklzzLoyNUw9A
 ZhzUSDkniNA/gEy8k7LTh5rCUZ803owOG+kDob2VFFz35BHJUfY6/owFB313u6X3A/sf
 ENRA==
X-Gm-Message-State: AOJu0YxpQAlWU8ExkOfhtGUeH+JeJO+zGYeizMDqVxZlk541nq44gpxe
 HN0AaKk3vk9oiD3MvtCL7QnSntqV+wUzlfxD1p9Qg9iqHzKgs6nLz/7R1HrCCFBbFmrbDmn1gTV
 JvoGQBVM=
X-Gm-Gg: ASbGncsHgCMSK4dgbPIOmZ+NDU4OGWhO048PaWQRRVHrtYTUJn/gLf/HdAmlLec7/Ch
 6HHmuCC7vwimhbABzo7wzNZ+sAeC2y/xhQHPSigvbcFQu7fgIhcw4SN8E1sSVOOy1Y9PMeZYM6s
 YVrxtjSlnm/Ov7CH21K2l2pTEolfaLaZOmNjA3Wr080wYbHzFQuRbGWOkawXFU3ms0bQs60Y12J
 UKiwXmxXBFER+uN09CYjZLb3hAqym5QyP0VnStIuT0hFedeNjEYqreWtDb9nilSqZ84iXa8UGaP
 hWsHRJgJOuGQdIPcqU5wRrUWU8adgGxnFm9/aLxFz9BctTQ9lfJ74YowDdifhmLbskxG9nNH994
 ipVAv1Ly1+PqQ7w==
X-Google-Smtp-Source: AGHT+IGNDqF2sKpn/tzTXtFVzS4dQ7LbA1IzAs478Z5PVuQHifMgzBP3NusKaoNoPAOYFIZXPfcj0A==
X-Received: by 2002:a05:600c:3f16:b0:459:d577:bd24 with SMTP id
 5b1f17b1804b1-45a1b677a70mr79820095e9.7.1755349267003; 
 Sat, 16 Aug 2025 06:01:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm16668395e9.10.2025.08.16.06.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 06:01:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 15:01:05 +0200
Message-ID: <20250816130105.3359292-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816130105.3359292-1-thomas.perale@mind.be>
References: <20250816130105.3359292-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755349267; x=1755954067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6e9328WS6kLSK5mOKJvmBb/DaZuOd3ATlT6WCwhSLBU=;
 b=iK2Ya58F3CoSEd97q4jrKpf7I0+DPj3cxC1cJ5NWNd+07DEbS4t7m5hCT3jxjUH9iO
 +ERYUiE/m7IbYJ+OeEbqY90cT6LeYXtQumjIgm9jAL2EYelZC08txDQFMCgutpnjxisE
 VBfIenqPkBDwZEe/pyRBD/1xBfZ61xJLeqk4cFTA4JgVYufP4XNG/4jUwYb7WeF2EL+2
 WFUafjrZlPWtYGq6GwMxzJ6S7rQSEexZeXPFraBeyT29ZrpznFePrS8AdPveQQNGkhmi
 MA/z+8n91SKnM2Ud/nWm006cGOzgE1uz6gK8gvL1inqmMzdJdtXsn1uuLtkw64e6PIpv
 A2iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iK2Ya58F
Subject: [Buildroot] [PATCH 2/2] python-yarl: bump to v1.20.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the python-cython bump to v3.1.2 (see [1]), python-yarl has been
failing on the autobuilder with the following error message:

```
ERROR Missing dependencies:
	Cython~=3.0.0; python_version >= "3.12"
make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/python-yarl-1.18.3/.stamp_built] Error 1
```

The cython dependency has been addressed in python-yarl v1.20.1, for
more information see the github issue [2].

For more information on the release, see:

  - https://github.com/aio-libs/yarl/releases/tag/v1.19.0
  - https://github.com/aio-libs/yarl/releases/tag/v1.20.0
  - https://github.com/aio-libs/yarl/releases/tag/v1.20.1

[1] b536caaec0 package/python-cython: bump to version 3.1.2
[2] https://github.com/aio-libs/yarl/pull/1514

Fixes: https://autobuild.buildroot.org/results/d36/d367b69b85a65fa94e923ecff3ba03723b2a6e88
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index ca2d42bf58..43ba31f81f 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
-sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
+md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
+sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 160dec8a1b..4f25394c8b 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.18.3
+PYTHON_YARL_VERSION = 1.20.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
