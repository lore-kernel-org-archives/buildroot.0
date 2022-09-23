Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE50C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7272383312;
	Fri, 23 Sep 2022 01:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7272383312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5i-d_orUIiP; Fri, 23 Sep 2022 01:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97FEA83163;
	Fri, 23 Sep 2022 01:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FEA83163
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 668A81BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 421AD60BE1
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 421AD60BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DAMVV06yl1g for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:29:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4461760BD6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4461760BD6
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:29:26 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 102-20020a9d0bef000000b0065a08449ab3so7411530oth.2
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=EdriHtEHpF+SGHUFzwviWxBmnMLix1DBdC3oFtRYtrQ=;
 b=xLZCaMd+Esv9fzzvzxQ8hWFzsWbUt3J7RpkjH0d8Rgf+u4DYmDaoij/A0HrPqrUZl4
 gkzXmhYGwkF9hL3fVdettEjk3faOslfegqx7RfUd8wB/zsmCw33nMUkNqr7Kxv9LoM7T
 WoRbeKMAZnjJcdPy7zks2WFAFdppio/E+54D4rNi6i5/cq4h7uSnpvWczU7WIypSKT2n
 U9c7k7gpA8AnPGeiGRfXokcRY77OMSxbBSYLQzJM9EvtTafnJ671uKePrKVGQ/1+KL5A
 1hILop8hSd+SUcJ8lp+MnrUNbli/vuSTkiQKRzJnGhCiaVyoNSfd3wx2JnneAuzIo/Us
 BPCA==
X-Gm-Message-State: ACrzQf0/GnIl77Sz3yInF9MBLoNRTVlKg+E0WZzjVqoJFANF4toZdPNz
 DTjy3XzJyziIS6+7WLzA3u6k/Chnx3Ooyg==
X-Google-Smtp-Source: AMsMyM5uDesccs6N7VFaggcMce19Te0nXLQRaiecGulnyIr9zSjPUOlPXhLiOj9ap4+ANWIrEuhqzQ==
X-Received: by 2002:a05:6830:1b73:b0:655:f46f:5e97 with SMTP id
 d19-20020a0568301b7300b00655f46f5e97mr3123485ote.330.1663896564996; 
 Thu, 22 Sep 2022 18:29:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056870548b00b001278611f0f6sm3960447oan.32.2022.09.22.18.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:29:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:29:21 -0600
Message-Id: <20220923012921.3513977-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=EdriHtEHpF+SGHUFzwviWxBmnMLix1DBdC3oFtRYtrQ=;
 b=V8inN1BU/T/FYGlJIuFlN4VbUJ4f4JigwA9spJUSofJ/qZ3UHNYK1Z9/Kp5rx9NZce
 hciO15POwLm5RR+3r2g5Nkovt+IotjG2K7yBSe4suoL1OkROBinIxkmGPpWeOMQj1jBh
 CwSNxVPzkDtVcwI+0cOXxx+ciPEVqbToM0sQh/IuqtXjsyqzfrQyHkv/qLvH2FMHgKXx
 gvSuiwMoh1voqqlqYhFyl2hWyVf+mLBXPKIBxFYC1joGda7PGCqWn5l1KXLiBRTTMvmY
 8yntVXhE4fKuro0l6oKsMqB9585HB8V77hyFbA4H9obfEaxcYdx8/uSnHIOqmUg8mjGK
 r40A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V8inN1BU
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version 0.3.0
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
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index 193f7b8869..4c80d3fce6 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  fa3584c0c172a53705d7887e2f4c071d  pydyf-0.2.0.tar.gz
-sha256  06ebc18b4de29fc1450ae49dd142ecd26bd7ba09d0b1919e365fbc3d8af8a622  pydyf-0.2.0.tar.gz
+md5  3afeaff9db93af8b317c909196522ddd  pydyf-0.3.0.tar.gz
+sha256  1aea6c0c97cc7b809efb5427147e168a5404ed76a53d76a3aea590d4ca1b04a3  pydyf-0.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index cbe2733b48..ae88a0eb3d 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.2.0
+PYTHON_PYDYF_VERSION = 0.3.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/3a/5e/4d4f5f77c706b0b871652cb4ccb98a52647ce917168a48e2b8cae742da1e
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/4d/12/3341ead2313889e2bf49b18ab6d65f47f8a8fb82ccb91faaf74f5e51125f
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
