Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43A8C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 22:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33872404F0;
	Tue,  8 Nov 2022 22:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33872404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8q7dSXb8Orsv; Tue,  8 Nov 2022 22:06:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60EB3403B7;
	Tue,  8 Nov 2022 22:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60EB3403B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 234F21BF4E4
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 22:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AFD403B7
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 22:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AFD403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSpYv4NpgzuD for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 22:06:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF10640138
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF10640138
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 22:06:43 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q21so9718375iod.4
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 14:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTFCB7qR+Actw3E35UlAOJoIi/LbrKVS7gU8MIWY9Gw=;
 b=M6RIOA53OOSLpoklmjG8A+QtPqFkKQXAyF8b9qpESdz/hFDtIWR1nSdpUg56+Ww6bf
 A2yA4cqthnLNfXmvdafa52ZVVJLY4Wmvj5PW4PIosRMYBoKPzOakaK/QTSFEDlYZINtO
 Mv/4jJ4IADEOuH69L84gB800eEoe9VHjxfufTL2u3UwsNS0ZkuQ2v4SRMERPviiytWpY
 XgxTecwkZjy/Eg7e5tpI+e2yOUjlR2ZpcQHDQKG3r3NB7ue2EEAUO1LUfKiPAFrz+Izt
 ykOAcfaz8H90PJzwVukiqy9e2u9YltAyxKp0pSt7MOgqijyMAALdfa7ARR87Lt2YbIT5
 k83w==
X-Gm-Message-State: ACrzQf2wYmJE7xAswglVrkNN5lxtnOUGMTEizFJd5P8+ni2OzUsxlqLa
 x5Dsu1vGSAajUB++yzuyDSkAslvHy1S2GQ==
X-Google-Smtp-Source: AMsMyM4UVsNmJGzxU9N69uapmyKVvuAKmIIybR3gSXNNJdclLrrVcGEFdG6n2N4NzS4nFX6kRc9/vg==
X-Received: by 2002:a02:6645:0:b0:375:2859:7ab0 with SMTP id
 l5-20020a026645000000b0037528597ab0mr33336694jaf.276.1667945202626; 
 Tue, 08 Nov 2022 14:06:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e10-20020a02210a000000b003754394cc3bsm4083901jaa.114.2022.11.08.14.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 14:06:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Nov 2022 15:06:40 -0700
Message-Id: <20221108220640.3570995-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UTFCB7qR+Actw3E35UlAOJoIi/LbrKVS7gU8MIWY9Gw=;
 b=YgwYVnLcmwuqPg8fXvDJReyU+PpaY/RYcelQ/fyUpAQk24J5bAXaod+D7uVU5PZ/2Y
 BISAo4AojYc7rO8RpHg1/KItfmwff+WJ9X1nkL039cUyWhEfzSCOH/psNo64XM+vc5pR
 lu+GOo6gzvCoe/QMvGw4GhfUOle25+VJK4RccOd1nSn8nrou81XWfDqcfB9/zyHZAZbg
 x9CL8wfliJx86UX9uklV0ULkjvS6tvdDICewJpf5fCkjXaaSxUDuTvIDPAq1XlKcmTBg
 OPYX9qp3zQ0SPqMT6G2P7+Ke3GPGDxG8DEWjVpFcZqNkxtUcF4lr9/dfMhcWc+GyKL88
 zxOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YgwYVnLc
Subject: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to version
 1.3.1
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
 package/python-aiosignal/python-aiosignal.hash | 4 ++--
 package/python-aiosignal/python-aiosignal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index f2a09749b8..061816a66e 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5  011700c3acc576a3a38deade6a4860cb  aiosignal-1.2.0.tar.gz
-sha256  78ed67db6c7b7ced4f98e495e572106d5c432a93e1ddd1bf475e1dc05f5b7df2  aiosignal-1.2.0.tar.gz
+md5  2a15f4008b899377590cef4773020902  aiosignal-1.3.1.tar.gz
+sha256  54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc  aiosignal-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index e0436e973e..ffd581cfba 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.2.0
+PYTHON_AIOSIGNAL_VERSION = 1.3.1
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/27/6b/a89fbcfae70cf53f066ec22591938296889d3cc58fec1e1c393b10e8d71d
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ae/67/0952ed97a9793b4958e5736f6d2b346b414a2cd63e82d05940032f45b32f
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
