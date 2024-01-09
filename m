Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98278C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CBD42082;
	Tue,  9 Jan 2024 08:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39CBD42082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5c__LR6jwnyf; Tue,  9 Jan 2024 08:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F84041999;
	Tue,  9 Jan 2024 08:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F84041999
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A39AE1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6944194F
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6944194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KD4Sv_fhUr8x for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:36:11 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DBC54194E
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBC54194E
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3608402ab93so12022825ab.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789370; x=1705394170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lM8tiYtpAauYNaCu91PcbzwaVaCzuhgC1WNJhfYipXw=;
 b=LkZY3QsD0YNSYc1ewjAaPp5ZLDTJYEsK7/SF+p1EPEpupQjvhpX+iMhPjEhV5WlAQC
 SvhWAQn5tuizMqAWHkFGjU7mycU1poFxmxXX9AFFmb+cpt/LPqLjbW3agC6C548wHHaI
 wtymlFWWy93/n/bPspQv1pJ5WujKJiTMZF8NdzjrDFVoD7YnO/KOzvDBg0DcG0wemfBX
 RZeYXJ51CTPStcgX8j6IgxpbQ1q9VHKdf9CqUjJPqGjTkcRnOHNO81ZViI2pYecaL8If
 B+N/h5dJkSQyvRs5i368U8cbvGa663W0MZJKJJDLofzZXQhpeNUefGCS4PDj/1TeWPOz
 qPkQ==
X-Gm-Message-State: AOJu0Yyb4aLR/rKhqdvTeHLSzcvt3Mo0Tv4ialRNA6Y3xvdBYPTLGRE0
 vULKly+eUa3A90ciS76swEmxHCz8DN1OsQ==
X-Google-Smtp-Source: AGHT+IHVzl/9HpX5fwJUeZb16ETmxflSObkqimq2UcVhDNfTScNEQ6WtT9h2g9Prj7RSPem7b30xJw==
X-Received: by 2002:a05:6e02:174c:b0:35f:fe58:6ff2 with SMTP id
 y12-20020a056e02174c00b0035ffe586ff2mr5869978ill.13.1704789369985; 
 Tue, 09 Jan 2024 00:36:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 t7-20020a056638204700b0046e08e513b2sm502312jaj.116.2024.01.09.00.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:36:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:36:07 -0700
Message-Id: <20240109083607.4082976-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109083607.4082976-1-james.hilliard1@gmail.com>
References: <20240109083607.4082976-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704789370; x=1705394170; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lM8tiYtpAauYNaCu91PcbzwaVaCzuhgC1WNJhfYipXw=;
 b=aGm5XyHbQ8MC61eya1jhbbWZ4wPMaDkw9xHF8femivKr1WVcCLWRlQxvh9wV7Q0qNt
 aQIwDEGL+9EAG313AuSzDH5pvDOOJseS0GaBVVgVDEL5ByylqcQKOvplSQiBm7/ksrLM
 qLO0qFaJM1NXwcS1cIqbBUwsuauIeszY9dGt+5IoV65RCfrQZFMmOgSstwPQvktfRB7t
 KnxvJgbplPnOnx3iESe5JTT1HcSVQd1BMkH3gf+LpXwXf9szd5k6SWE6ehCxnpn3/fqk
 SAKlt48jb8WMJi5zTRNk/9kJnukYOkgcFtmHlt/gl5fH3Mn1kdK38FXO9C5l9g88Bk4k
 D9mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aGm5XyHb
Subject: [Buildroot] [PATCH 2/2] package/python-ipython: bump to version
 8.20.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-matplotlib-inline runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/Config.in           | 1 +
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index c217efcfd1..87cc3969b0 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_IPYTHON
 	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
+	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
 	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index f68b3ba78c..33f70885b3 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  ac2ff5bad97aa09befdf7f0f27323699  ipython-8.17.2.tar.gz
-sha256  126bb57e1895594bb0d91ea3090bbd39384f6fe87c3d57fd558d0670f50339bb  ipython-8.17.2.tar.gz
+md5  eee726e4cef5fd680110a899b4e5e2cb  ipython-8.20.0.tar.gz
+sha256  2f21bd3fc1d51550c89ee3944ae04bbc7bc79e129ea0937da6e6c68bfdbf117a  ipython-8.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 1335121688..d3c2c05a05 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.17.2
+PYTHON_IPYTHON_VERSION = 8.20.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/a9/e9/c83d1a5756bf44f1802045a54dacc910d3d254c5ec56040993978d8c1b8d
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c5/d1/187474d64bdefcb6804c1a3a1597d9e94f287e71c06f50f7784d56833fb7
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
