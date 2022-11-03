Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CE5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AB2D81E3B;
	Thu,  3 Nov 2022 00:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AB2D81E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tNDn5f1jcQL; Thu,  3 Nov 2022 00:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9817081E25;
	Thu,  3 Nov 2022 00:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9817081E25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5791BF95F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 589F74168B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589F74168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKWIp-PwtfFd for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:46:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9797141682
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9797141682
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:46:03 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p184so178620iof.11
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvwZwQAb4gf7p3UMkkeDbTf1K9xAvLbk0mpHlICjNjM=;
 b=cBhH8ul6LbmQIWbpSPQTWMbF+EpClhE3rIWK1FpZYpbjX0WDDyyk+m2WQ+F0h8LsKu
 U/sk8lFlZsWX8lpePckDybY4Psy+rUHgkjkZngEE/73tYpc52bF7eRnwaxobStp+7WY8
 +EMoUkh5cVy3sMmCYzisJgdO1/fqJEtSknDtgH06XijlD/nbz3BILnGlqRcVmXOjDrIB
 h/+ZV+zxsBWAOvFROQt4E0sr1fpOi89AmJbt/keB9OZxNUYy5+CfPW585R5En2F58Aug
 0wNn0ZCAbL+bJEELxwFZkJ6lagG9aRUxdNw6wJnbWn+Bccsv+wPQsz9vIslIr7G7RzGg
 fyKA==
X-Gm-Message-State: ACrzQf01fBBSzwu6DkHizOXVbfLfR6aXES5aSjckvv8tJW2XSeJL9Dmv
 NIIqqbENUX1TRGehXLiKcglqWIH3gB1X1XvZ
X-Google-Smtp-Source: AMsMyM7o69A+AIHUFPHZMkwkitqyx5cYbA0cv/86A4JtCfUrFpQcUYkfwxjgFTBD98Z/xwZopm9LBQ==
X-Received: by 2002:a02:290e:0:b0:35a:d680:7aad with SMTP id
 p14-20020a02290e000000b0035ad6807aadmr16573659jap.62.1667436362081; 
 Wed, 02 Nov 2022 17:46:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s1-20020a92cc01000000b002ffcac9d1cbsm1308429ilp.3.2022.11.02.17.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:46:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:45:59 -0600
Message-Id: <20221103004559.3821058-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvwZwQAb4gf7p3UMkkeDbTf1K9xAvLbk0mpHlICjNjM=;
 b=QRfDqTpy+yKB8m5IKg078lNzOi3JdaNRwUSXUkzcL5WmJDG9PCK8aHezNjwn1oAWmv
 K7hNMGHs35CkmSARjBYWXje9/rBOopkckdab/oY6huk4lBWyewOm8b7Y7LC/SW9BzvNO
 po5EZsCoqYbUEpU7aGc6WLR8O7hkX/i+G5CP03P7ZbcygmFM040y4NSHxcpBYZ62Jc2J
 WYA3eSJ7wA0lpUZ0R5OW4Ag9eitxAcp0pplE0Inv9SabAawLuPlF2uuYiqGcKGWam9F+
 mYyYoPy9CM/b/f4HZUWSILFcJMoEPmxluAzfFi6rFhX2wA4urU9qYkZ9odszQQFtKC+/
 tMHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QRfDqTpy
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 9.0.0
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

Migrate from setuptools to flit package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 4e6e7bdfb8..c12d3f5623 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  9930552c4f7eedc00193673d5f7f0f19  more-itertools-8.10.0.tar.gz
-sha256  1debcabeb1df793814859d64a81ad7cb10504c24349368ccf214c664c474f41f  more-itertools-8.10.0.tar.gz
+md5  58f6fe36c3c94bbc569130df546dcfc9  more-itertools-9.0.0.tar.gz
+sha256  5a6257e40878ef0520b1803990e3e22303a41b5714006c32a3fd8304b26ea1ab  more-itertools-9.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 3b9957b72e..734d87e057 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 8.10.0
+PYTHON_MORE_ITERTOOLS_VERSION = 9.0.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/8a/f7/93cf3c81629c95f6f40e509f7cd63985a6ddd829181a66c1c8ef101e55f2
-PYTHON_MORE_ITERTOOLS_SETUP_TYPE = setuptools
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/13/b3/397aa9668da8b1f0c307bc474608653d46122ae0563d1d32f60e24fa0cbd
+PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
