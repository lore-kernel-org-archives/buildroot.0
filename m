Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B2C4167B
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 23:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD7784F5E;
	Sun, 29 Oct 2023 23:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD7784F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NH6bCvemjs5x; Sun, 29 Oct 2023 23:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2507B84FEB;
	Sun, 29 Oct 2023 23:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2507B84FEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1001BF3EE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E6A435D4
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E6A435D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6AsHUllPn6L for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 23:40:13 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0D194056E
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 23:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0D194056E
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-35903f528e8so3164615ab.1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 16:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698622812; x=1699227612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+sFgEl8RaLIQfMQgkNrNfcko27WrGpkjD6NyykrhkE=;
 b=DtmYgMJk7YBWAigz/Zd9tbMOub9p3eXg0+hBCu0Uq4lNsnx9kFlLLHgIMRJRyiWSVr
 47muZi8DkffiPPS+2LAOJ1IeaSk/CrfjxcHKZypZRrHWwbgsJ/vuycDJ5I9uC2vlix7f
 MKyIL/edvhkGzHJL+mTtX3xtIF2TliSWvUTcRTIr1GnPmmRxux9id8H5CKWCJ97cQjRj
 UDDNFC4VK5+QKVHbm65gCY5blGBreJojBZcOqpRi/7PY8G+3t+ODzBpAybKUzY6K7MPo
 Yfr37KNKmGkKJzAlxwGeXL3MNi0d2dGyStJiBRpxVWXgWcWqw4Qekr6wzc5fIYY8+IVZ
 rpqg==
X-Gm-Message-State: AOJu0YyyPU95HNLMfFR3s1/ZWwCsIJe/3/YmHFrWb/pyfQENL11BA4iq
 jJUldj3uhxJFoAOOIwtUpPmed7m/0do=
X-Google-Smtp-Source: AGHT+IF/qb/5uL+7t1IZUnoJ+TvnxhES7qCXccDlLR9MpPh5Or8Tt3bh74+JRTQyRMBEq8kWwPy3MA==
X-Received: by 2002:a05:6e02:1a8f:b0:357:4779:9dbc with SMTP id
 k15-20020a056e021a8f00b0035747799dbcmr10408641ilv.10.1698622812321; 
 Sun, 29 Oct 2023 16:40:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 j16-20020a056e02015000b00357e53527afsm2012478ilr.61.2023.10.29.16.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 16:40:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 17:40:02 -0600
Message-Id: <20231029234003.2606006-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029234003.2606006-1-james.hilliard1@gmail.com>
References: <20231029234003.2606006-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698622812; x=1699227612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+sFgEl8RaLIQfMQgkNrNfcko27WrGpkjD6NyykrhkE=;
 b=Lwt/0goAY8fjLsYKDMQ7lVRAD+MuoIctNK8K6xJtVf8pKgOT20bBFgeP5a+34BGB7m
 Yew7IvYdThq0zUdw9yRfFltDzhcrr+MzpMZdNZn9QfgcQN+9Ay/sA+D1rMJnkXyekHTh
 wD4djWm7Iv8GxzUfh94ZxCIEa2M2V2cuM+m2tlOBkVpQXCDb8gl4KDSIWfB1vWoH4vrO
 htS+gFwyrzcyhkkFUEfIIPuFuLyGfftlkkUfZCRHC05sLF/RzIDi4hIQGB+6fNbzXF2V
 u4yJohOZh8PUJ00STXIfn8PzFdFx0PxLJ0bfw1IHHqS+24QKQeLrKqGhonltofHjuWGO
 dNWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lwt/0goA
Subject: [Buildroot] [PATCH v4 3/4] package/python-msgpack: add host cython
 dependency
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-cython for python-msgpack to build correctly.
This is a hard error when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing msgpack.egg-info/PKG-INFO
writing dependency_links to msgpack.egg-info/dependency_links.txt
writing top-level names to msgpack.egg-info/top_level.txt
reading manifest file 'msgpack.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching '*.c' under directory 'msgpack'
adding license file 'COPYING'
writing manifest file 'msgpack.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	Cython~=0.29.30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 785fec9f00..c0b76e55ab 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -10,5 +10,6 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/dc/a1/eba11a0d4b76
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
+PYTHON_MSGPACK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
