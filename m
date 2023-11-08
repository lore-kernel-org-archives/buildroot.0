Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BD0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88DAF40490;
	Wed,  8 Nov 2023 23:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88DAF40490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5EZQ7o7PSmv; Wed,  8 Nov 2023 23:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70FF640491;
	Wed,  8 Nov 2023 23:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70FF640491
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8171BF29D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEEA760FD7
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEEA760FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFBu-7ycpkf2 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:57:07 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A146860C07
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A146860C07
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a93df91813so10753039f.2
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699487826; x=1700092626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a4rZ7mf40EVGJTIY/DHDTju0LOWiKKlIEtyQOIxzVjw=;
 b=oIosUzVALHm4lW+T2nakiR2aeklaK44twyMoauHlr9EnJofae/nFBrtZ+fQ3hbvsiE
 846OuiXlF7+9TpkE4i5y3k3mdahkNijMGC/XdBB4alOZ4j6Q2CVNtOXzFeA6FzXRKczR
 oldbkNbZswvJZaNOSsPlqNQoZSCYdb4Z1SggPib25sfB9qcxrblKxV22rlTRr0FmUTXp
 5SC9hqQxsT2etGZL+xQLflpxT/JVRpeUWkHxNhWJvSGPerFApnpCqiWjRMvqOIl/Jw/Z
 Pjfq60l9ZgYF1pxgynjvH2ufS21MaQtf64CEdCqwn3snd0iz/V1iXm5NhrEIvmYh9In2
 J6qQ==
X-Gm-Message-State: AOJu0Yw+EybskSYoz5UIY6tBdU7VPgXMqUfwCwO3CBS6kNKE3lDFW00j
 rw5/d8UJvnM4cwWYrNn0cGX23RXXyPo=
X-Google-Smtp-Source: AGHT+IE0y+qJ0Z+ITQJq3y1er1LFBbDX3iG3RpRSjjaAqn6kIC4PFvBhfGYuXcNyMAgITL8zxuyFDw==
X-Received: by 2002:a92:c56f:0:b0:359:3ac2:5123 with SMTP id
 b15-20020a92c56f000000b003593ac25123mr3902315ilj.23.1699487826335; 
 Wed, 08 Nov 2023 15:57:06 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 a13-20020a92c70d000000b003528256f3adsm4031340ilp.31.2023.11.08.15.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:57:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:57:04 -0700
Message-Id: <20231108235704.3660435-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699487826; x=1700092626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a4rZ7mf40EVGJTIY/DHDTju0LOWiKKlIEtyQOIxzVjw=;
 b=ISQ+SZivT0X7gyFTvC+jO3VZK6WG3VYsGxRbA3MpJsWeTASJSbNg7+WBmwRhy89yhw
 YY+c0alCTqL1j1z9pal7RY//omqFBrj3htkyMyH154ez5pE1hosecZ945KRlFnWBNyfD
 CR7fU1qHC1n0X/H67YPeHps0EtYl2YyVi0jVNyvAjw0S6vXF9OMybxHCJ0g8ug2lzfoe
 zqt2ZtHZVSylg3/fmeigMSZDLclkJwHdd885W+ElHAZcbgKrF3Up548qNfu9GljAZayO
 5uC0CIr9B9SPcbTEWLCnaIkv/Qv3u0ZJJjartcIr5j9eTRDd3FXJPEsK2fOWMX/9MEIv
 5hHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ISQ+SZiv
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.0.7
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 9a2ec9c9f3..50462db8db 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  da12a9f0a65a803ec005219f6095d0a3  msgpack-1.0.5.tar.gz
-sha256  c075544284eadc5cddc70f4757331d99dcbc16b2bbd4849d15f8aae4cf36d31c  msgpack-1.0.5.tar.gz
+md5  a5a4172b2e89812ec28267dd8942b77d  msgpack-1.0.7.tar.gz
+sha256  572efc93db7a4d27e404501975ca6d2d9775705c2d922390d878fcf768d92c87  msgpack-1.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 785fec9f00..061ff5a761 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.5
+PYTHON_MSGPACK_VERSION = 1.0.7
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/dc/a1/eba11a0d4b764bc62966a565b470f8c6f38242723ba3057e9b5098678c30
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db1571110b5b51647aed4b56dfbd01bfae789fa566a2be1f385d1
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
