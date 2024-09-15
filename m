Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CC3C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B054058F;
	Sun, 15 Sep 2024 08:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4jmpNZWfCIH; Sun, 15 Sep 2024 08:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7634F4059F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7634F4059F;
	Sun, 15 Sep 2024 08:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0053E1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3EA1607E6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNy4ztDA0GpF for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C339660663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C339660663
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C339660663
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:48:27 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a08489f757so10500355ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 01:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726390106; x=1726994906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RR0Vr7+pSUpBVhIKWwn3BNay3z97cKpVPLNa9zQKULg=;
 b=nJtLzvwkCJb0pLvvRO2Q8fLz5+mHVim9BZtfijH3l1W0gyj9soxBm/zUL+5ntMphnZ
 jBFD/FCABpe3d2ErI/712tYe2yh5E4COWp0jjrz/gLI0XbaT8HtnOunJIiJLO0q6kXlo
 0uEiHEOMja+09p++Z769nKJa38h4s7c/iFJmr8LvSXCpITCet346HyHUUUTYgtcxj1lJ
 MA/lN9k4B7v1RZk5hFs5sf27dvY/YKmHlqEnWBktFTfjJnOvpCdyHF1LeF0iuWeypr6N
 lUXU7EW71TAzX96FgIbd05j9qN9NiRoUbc3KFs1Ya+0yoYYfh+reIudGJ9O4+vX81g8p
 rP8g==
X-Gm-Message-State: AOJu0YxR/1RRk7hbxMzHAxnvnkYhckeE+bp8QESZiEqOnDjmEmwpY4Iz
 Ov8d3szpaPuXHzJi1fGGYw66gIVC1mfmr5Jlj16hHIAzYy10fNg0UA/fmw==
X-Google-Smtp-Source: AGHT+IGpiS+9Q5A0tvqfCNfg1awV0W8ToofapQo9b19hvP38VgiV1rNf7QACJa0jX00F382mQO62yA==
X-Received: by 2002:a05:6e02:2197:b0:39f:72a3:31ab with SMTP id
 e9e14a558f8ab-3a074c62c02mr136255145ab.7.1726390106232; 
 Sun, 15 Sep 2024 01:48:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e72075sm9190685ab.64.2024.09.15.01.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:48:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 02:48:23 -0600
Message-Id: <20240915084823.1582752-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726390106; x=1726994906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RR0Vr7+pSUpBVhIKWwn3BNay3z97cKpVPLNa9zQKULg=;
 b=MTrYwCNidDM93BkXMdRVMiQ3cyfz+VK4C+WWQK7jy6eL3WEexGs4xGQ5gWQkeif/Sf
 60UvAmQ6WBgUmTGi35SmS55WXVO8KaVQdia4F5tNB0R6TvkEWhwX7oh0E14kaohT6xFH
 bWH9GqxBrno9RtpbyFoi+lf+YB7QrLejxk7E5DDmvXd+1oSmbJvMCLr6GImvQe94o4Rj
 lN0zV7Q7NJ3imY7GnKC1zoPltkyDTcJk72Lx/JRiqkdNCRBCwMU86/EAxBgT99zWEP+H
 Leu1qnpv2UBliaw0FdC0mDtdD9QpOEVXiRfuhjAabeMnWvbg5mfAYn58GKr03eWZtfU4
 eoUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MTrYwCNi
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.27.0
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
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-backcall runtime dependency.

Drop no longer required python-pickleshare runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/Config.in           | 2 --
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 87cc3969b0..8ab5516910 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,11 +1,9 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
-	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
-	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 33f70885b3..c8001362dc 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  eee726e4cef5fd680110a899b4e5e2cb  ipython-8.20.0.tar.gz
-sha256  2f21bd3fc1d51550c89ee3944ae04bbc7bc79e129ea0937da6e6c68bfdbf117a  ipython-8.20.0.tar.gz
+md5  cfe2461181c5ccc92e0039011898ab12  ipython-8.27.0.tar.gz
+sha256  0b99a2dc9f15fd68692e898e5568725c6d49c527d36a9fb5960ffbdeaa82ff7e  ipython-8.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index d3c2c05a05..d88d1ed5af 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.20.0
+PYTHON_IPYTHON_VERSION = 8.27.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c5/d1/187474d64bdefcb6804c1a3a1597d9e94f287e71c06f50f7784d56833fb7
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/57/24/d4fabaca03c8804bf0b8d994c8ae3a20e57e9330d277fb43d83e558dec5e
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
