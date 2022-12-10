Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C713AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B03F607B5;
	Sat, 10 Dec 2022 19:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B03F607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 769QTcK4Dfdw; Sat, 10 Dec 2022 19:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABFBA606DC;
	Sat, 10 Dec 2022 19:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABFBA606DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9E61BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3843880B27
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3843880B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_KpbuY2PRlA for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5DF80B0D
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A5DF80B0D
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:39:14 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h15so1521249ilh.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ySMV//7I0BvWH0hLmFFaCfmsGC2+pZNw4maLvHkP5nY=;
 b=UlbSBa/EO7z+fhbuojo1bISheNYHawL5r1CAPTCWSvHtxTImMrK/0q0Ky+hoX6ugJS
 zPz2tf9+YXHXMoEtw79NeQ2ruyDmm6MdLyQdjthGIum0IBZQp/0YXddEBiRroFTnVi8w
 de78+wNnAR4hvDeIZyPGsJEP8KwZr9J+tMQQIKjHH4mSZy64WhFqASwNJNwzQmKG86sf
 TeU8r/40LimggcMZX9EUP2kVRPpLVsCZkxKME8Bz+8/6gRiaM2qj12PHq/wkWpiIwYTD
 W9SHObAscCbBXkrZrJk4l29L5UISmOZiFf/JKNuZDuaKi7vlJmXiqwC7LkXTebvWF1Ib
 Or/A==
X-Gm-Message-State: ANoB5pnejSr1bU4VH/pj0xoZoZEhIA3mPn+S1Y3Iv8c9GC1A8yt2OXwW
 7TO0Ns8gDGyk1WG/tyDWZW5r2jq2GTv2IAKX
X-Google-Smtp-Source: AA0mqf7CCpueqfLL+e2hCp6qULPb7oNTjsuTPoQElFhWlPB96rN+fKnAOIWhZtzRbfP8V1AS4SIJSA==
X-Received: by 2002:a92:d383:0:b0:303:2931:9242 with SMTP id
 o3-20020a92d383000000b0030329319242mr5464028ilo.8.1670701153290; 
 Sat, 10 Dec 2022 11:39:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 s13-20020a92d90d000000b00302aa2a202dsm1550031iln.64.2022.12.10.11.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:39:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:39:11 -0700
Message-Id: <20221210193911.3154540-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ySMV//7I0BvWH0hLmFFaCfmsGC2+pZNw4maLvHkP5nY=;
 b=l2hBVJZ2TqEK63XO3IfjXv9VoOP3/U9/xMUCbCl/1my3wByqRmDRWLLeSUey0pwZ52
 +sV2okXjUTxAAdc/tG0wiS374eQdZKnZGjmd00jEFu1qO6l49klOMc0qdWjS6di2KKdI
 5KwWhO86m7+Owa8L16WjmrL31KFcLD9D2f4fn6ww9ZCd1hyEOJcR3YLn8FdB9ih/k8Jg
 9Rr09wkniYcT2qJo79ws2nmPvwqnKSeIjZGeOYaSHKEgMHHAHBUJCX/RSUOk4bhXC4U2
 HUuYQ8HtE7lzta2f5EMPezAaxAm/UmexDM1yaFYEBRiExNrk9lIfKRDyZlfERInarfeW
 hX+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l2hBVJZ2
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index b4b3ff94d0..530cbf64af 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  eacf582fa8f696227988d08cfc46121770823839fe9e301a20fbce67e7cd70ec  python-pybind-2.10.0.tar.gz
+sha256  111014b516b625083bef701df7880f78c2243835abdb263065b6b59b960b6bad  python-pybind-2.10.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index c5bee3d0a7..e89d77147e 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.10.0
+PYTHON_PYBIND_VERSION = 2.10.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
