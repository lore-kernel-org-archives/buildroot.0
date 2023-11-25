Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FE4C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6960160E4E;
	Sat, 25 Nov 2023 06:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6960160E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMa8Ur5QxqBD; Sat, 25 Nov 2023 06:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E70560BCB;
	Sat, 25 Nov 2023 06:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E70560BCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7420E1BF39E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5745242152
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5745242152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5BphH_Qguon for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:24:16 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CFD14214A
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CFD14214A
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7b3708b3eacso68205239f.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700893455; x=1701498255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9VxlSzLEuis4/ZTmSfvJZAm/eOrL36+OAgx2CIUVF8=;
 b=jxgcflCwHq1qIF0lBfxfvw38D+cMJIB1S+ZttM73jL89QPKoQBf+oN6KxFd+wOCfEx
 hY/7ru9Qx6SXAIH8Ew6VRAYgPm//R9DfwuyN3fpXHpAeTxq9hJ3GjcmRvU9bzJFfronu
 nzdq9YQz0wZs7u/PVVDwPNa/Wkads0SZ4bBtjUdf0Mw0XNtDholJwqf9atxbfevVuiPY
 5e5fmj/ruFT+hDM4Cd4Z/oCOaexI02xxnQrh5uhIHTomlBfsyrIEv322r0mWwWTuifGe
 zIqrMBmfYzGPAUy5azUGKq9cx8G3tQY3/dv52oh/KBKRaEk9orhr8l/G6iHug/lCD3Rl
 7/Fg==
X-Gm-Message-State: AOJu0Yyp6eVuO/zWS/nUK47BbRnomnaMqjB6X0fjwl2hoj+NarzdC2gk
 jRihSp6DYO+qKxozCc9oZ/G7LnJp5wM=
X-Google-Smtp-Source: AGHT+IFchwALcGfXw05m1I5X2x01JIhy1ir4XRLSip+8HA3tIAeMFXPqlSKCy25gK0rJVXySHiXDNg==
X-Received: by 2002:a6b:dc0a:0:b0:7a9:44af:ca5c with SMTP id
 s10-20020a6bdc0a000000b007a944afca5cmr721235ioc.12.1700893454924; 
 Fri, 24 Nov 2023 22:24:14 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 bt4-20020a056638430400b0046678de2a62sm1221118jab.165.2023.11.24.22.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:24:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:24:09 -0700
Message-Id: <20231125062409.708253-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125062409.708253-1-james.hilliard1@gmail.com>
References: <20231125062409.708253-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700893455; x=1701498255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9VxlSzLEuis4/ZTmSfvJZAm/eOrL36+OAgx2CIUVF8=;
 b=GT481AkjLeYi3KVcZgEuQ7VnqvLMwTJBT+lKLq1evW60IW5/FMEaqqjDReblgKAqBU
 cIOA0ejHjZs6L6EkPa6d0AP9NnvCDNIuApsEFwf1gASjAgyUDUw098LBLLHjBdbugnZN
 OEGRi8UcIXZFXMwB2WJiRQjv9bquCwGgHX2dXnS/c3+dzswnEaqusA4ZpSlGYIs79LfN
 8zF/1ZV4mVt/VX0OIvILoqoUwgvKftNXsR7nU+a6pr1Yir7MpaZLENWw8Fn2PRTvEIy4
 uF01uCRMaKmNzoTnQAo1bkQdA927fHcHMXDd93GEzCxGkpCaBV6SUCvaL5uTsnAmC0zo
 FKDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GT481Akj
Subject: [Buildroot] [PATCH 2/2] package/python-pudb: bump to version 2023.1
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-urwid-readline runtime dependency.

Add new python-packaging runtime dependency.

Remove no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pudb/Config.in        | 3 ++-
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pudb/Config.in b/package/python-pudb/Config.in
index 06f1b20c26..2bdd689121 100644
--- a/package/python-pudb/Config.in
+++ b/package/python-pudb/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_PUDB
 	bool "python-pudb"
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_URWID # runtime
+	select BR2_PACKAGE_PYTHON_URWID_READLINE # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_CURSES # runtime
 	help
 	  A full-screen, console-based Python debugger.
diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 1ae15ad8a6..08afc67b76 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  cda1c28dc52318162e2b131280f09960  pudb-2022.1.3.tar.gz
-sha256  58e83ada9e19ffe92c1fdc78ae5458ef91aeb892a5b8f0e7379e6fa61e0e664a  pudb-2022.1.3.tar.gz
+md5  81178e875fd7e15237267c3055e447a3  pudb-2023.1.tar.gz
+sha256  15df3c603aba87a918a666ef8e1bf63f764238cc3589db3c5b7a5f1b01ea2f03  pudb-2023.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index a357c34c44..ff13efb773 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2022.1.3
+PYTHON_PUDB_VERSION = 2023.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/85/a5/f1fd378f56bd8168b5921fd09d4b84fd8101a90e81402a509796caea2094
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/96/d3/a471fe68788178f2a5024031a153673df72b9287530f32b0cd469d64a68a
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
