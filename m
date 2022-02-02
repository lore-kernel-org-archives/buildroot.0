Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 133FF404FE;
	Wed,  2 Feb 2022 03:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7qZ_Dv4bnK1; Wed,  2 Feb 2022 03:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DB0040153;
	Wed,  2 Feb 2022 03:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05FD61BF373
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4CE560AE9
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXUGOfWhomIa for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:07:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22DAF60AD5
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:07:00 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id s18so23729395ioa.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rr0wrJ4Xv2GVg8EXSQo3i7Q/nw7FNYufuUeUy+8BTKE=;
 b=RBFhr9HsinTDp9sCUxTnlPlMDixISy5jNLjYpOWFDpajOWc5CXH5NhBiGXomv8HMGE
 iF4g++SWtHOicUZY2cLFRzTqR+7RoX9J/2z0j5Fyw/SdvtYcyAsdgnVLwfNF0jEYSXVt
 Q8DH9YkeDdFWTDCkpzg2N1ZQQ+QX1a+KfpOTvKrbmJhA5SmoJWgXsrK0nOayU7IoeKEK
 6dWxnV5Qb+9R4tOt6Z033lkN7fWRlYtG8BJWBWfTMFsnuR5gTcGIVh+OZQfM8lwU0DUt
 gXXjZfw7Br5NOdgzy5fHbMFxUsTurSkP5sc6K9E69/GvqJeiTexEGWPhlkmn4FFGZ2qZ
 uaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rr0wrJ4Xv2GVg8EXSQo3i7Q/nw7FNYufuUeUy+8BTKE=;
 b=qVKLY2ZgsKS9J1TG8OtzAuS/2bxybMddJVS7uORICtPtBOrTxk7xqOGXtRMFqL16pK
 UHEOGEqdOZ7LWSX8ulJOvMIPSySZlj60pqKMEBlaZwGT7rqNzULk/2tlMajP01ycKOBI
 g61HwyKZfKjfJ09jnisWm2YB0UMLoxUEPI24Sp7SuvJ+3apxwEpb4IZ8pDgN7U6dLZbZ
 UYcanjr8shqVu9ex3XC3G38vsw7zn9AF/I61sxwdV1TXxFB1BZE7n+lYEXNBvzuDcRN+
 9uD6+2JbhsqlSIa1HoGTGuWZm5LgXU6HyZ33JNeYYSpsHPGybSxEhfjF4BlBZU8O5o0u
 uYJA==
X-Gm-Message-State: AOAM533bjXH31i4mxTH5w6Jaycv09lLXU+RNKUnDLg3C4/rRUnBoIWpk
 roIMWPKm6rdHvkTMwvt68T/LAkFAbDw=
X-Google-Smtp-Source: ABdhPJw62v2jg5a3wg9eiZIkGHVg0DqC5MUtJ9v4GdnjwD24ETfhSMh86m9e3ZBbOQSlJAVbl3G9Qw==
X-Received: by 2002:a05:6638:10ea:: with SMTP id
 g10mr14425141jae.79.1643771218784; 
 Tue, 01 Feb 2022 19:06:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id t6sm21824519iov.39.2022.02.01.19.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:06:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:06:56 -0700
Message-Id: <20220202030656.2175796-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.4.0
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 26a3778756..39ce16f8b2 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  f8b67330e631cfc45a9b2560a6e0fa98  aioconsole-0.3.3.tar.gz
-sha256  47df42d9f8cc3995bbe032dd5f01d32cc5b06639e9078bb9b4e3c55b237f5e32  aioconsole-0.3.3.tar.gz
+md5  56a1e6542ea3627bdbc67f24abcaa341  aioconsole-0.4.0.tar.gz
+sha256  a30ad5276b85dd20a48d235111d0bd26c6bedf7b56d605ffc10ae27124b4b0b4  aioconsole-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index f06d91a550..44857054d4 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.3
+PYTHON_AIOCONSOLE_VERSION = 0.4.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/dd/f6/bbc451ba96c1e1da6aa253f254b181ceb03272b475b27b481b57865d7d7f
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/f2/7a/7628ec23f140ffca532c7f630e179503727b755849b5eab15576bbf7d3df
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
