Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3276DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C657040489;
	Wed,  8 Nov 2023 23:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C657040489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4P8eEngllDui; Wed,  8 Nov 2023 23:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF48840490;
	Wed,  8 Nov 2023 23:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF48840490
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 055321BF29D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D3B8201F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2D3B8201F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MU1ytcX6QkCz for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:53:30 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEE1982012
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE1982012
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3594c100735so884315ab.1
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699487609; x=1700092409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I22hu2yCm6cIDiQvw7t3URMAfTXjoWP0ui21BHekC/0=;
 b=ng3ku3hMpz3qpM1si73tAVhryWk36QM6NBLDCxbZrWDCFwx2Wp2k7u53ce1AwMDtAw
 TkcVmmSoLFehPEp4N6NfJMz2vD+8oC06oN9gbJH310e/ne47x71hjsfeLNsjk0qNCVqv
 uJSl2zdzQ8Y91SMNkOT7+nw5b5tS2TDKULHmGrZsooNVjKAk4e9N8oSf48bcXk/cl5Jm
 CyixwCM3xMfFC48FaN3xqhDCSuEtlKKuETRHz+4mQlHoHB5zXQUMkP+6SPgXL0E9toIS
 marwUNYtDKljLaGGxQi/2VTpLaALXyiHH9u6gaAzlDW9LAMW8FoMAvauZo8q9G8pnuGa
 SbFQ==
X-Gm-Message-State: AOJu0YyRoR2biiqOuUnJC7wl/7kvZ2BIVv06+MTuhY6LkNh5eMeXpypD
 Cde+q1/aCScY3AAaE3sqk4fw/baS90U=
X-Google-Smtp-Source: AGHT+IG4vGRsaZT4Awj1hhvlm0hhGOSHBhCZAhi9UVv5QkmSyfPLAOu0hIRLfpdS45fL4177a7/xJA==
X-Received: by 2002:a05:6e02:1bcc:b0:359:31a1:4702 with SMTP id
 x12-20020a056e021bcc00b0035931a14702mr3418247ilv.6.1699487609394; 
 Wed, 08 Nov 2023 15:53:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 o12-20020a92c68c000000b0035903fd6ce1sm3959252ilg.77.2023.11.08.15.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:53:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:53:27 -0700
Message-Id: <20231108235327.3658051-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699487609; x=1700092409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I22hu2yCm6cIDiQvw7t3URMAfTXjoWP0ui21BHekC/0=;
 b=AIVhNs/mtYl4lDcjYCfdt9oS1Z41ADToBmZlCIjZKCqwtZYx3JGbwzuMMXk2zJwW5x
 sR/x4fELpq+WiP6XiQjSonZjUoJU1ub+QZLW2xrr+r91Cib25utE4wa2RwEbcVKkOgQP
 dITNWswU4jpdsNQluUN9wnd3UMZyqR+CP38YgQFb7IbgOqpsS2ndaP96Ggv5Vb3MATwW
 PsONXwCf3MXHGQo2bPIzvZmLj7EzfVRoD1imWZ2/ybbnzVTmesCVesbci2Zbs+27b9S3
 vpIkR4mgGeoMy2PdyDXxZDCM4XfHgrHXBN/VqjrYjmbUOcNU7d953+vVhJfQIOLf0p2v
 mZjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AIVhNs/m
Subject: [Buildroot] [PATCH 1/1] package/python-msgfy: bump to version 0.2.1
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
 package/python-msgfy/python-msgfy.hash | 4 ++--
 package/python-msgfy/python-msgfy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgfy/python-msgfy.hash b/package/python-msgfy/python-msgfy.hash
index 9f5bfe4804..2517afbb48 100644
--- a/package/python-msgfy/python-msgfy.hash
+++ b/package/python-msgfy/python-msgfy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgfy/json
-md5  1727a08a0cf7fb704045168c71993280  msgfy-0.2.0.tar.gz
-sha256  37c907cccb19afe73ce44111a21b410b685be92c9c44496bc4381fd93c5ad7b6  msgfy-0.2.0.tar.gz
+md5  ef3c61804003f4356119f7d00c5932f9  msgfy-0.2.1.tar.gz
+sha256  161024732591444cc05ca3982a010005932005ec861467dead49349447a91671  msgfy-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
index 4100a912b2..8565c2210e 100644
--- a/package/python-msgfy/python-msgfy.mk
+++ b/package/python-msgfy/python-msgfy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGFY_VERSION = 0.2.0
+PYTHON_MSGFY_VERSION = 0.2.1
 PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
-PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/c6/2a/663ef86625f34ee4165da1eb824442cfb1f676e892946d7fe39a8c775682
+PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/51/0e/b78151a63e8c5cab745e90ed7b4a741dba5439a8538636bf6a5da72bad23
 PYTHON_MSGFY_SETUP_TYPE = setuptools
 PYTHON_MSGFY_LICENSE = MIT
 PYTHON_MSGFY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
