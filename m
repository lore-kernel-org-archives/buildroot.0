Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04767E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6B5740211;
	Sat, 11 Jan 2025 13:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 363wC7t_QiiH; Sat, 11 Jan 2025 13:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C66E4008C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C66E4008C;
	Sat, 11 Jan 2025 13:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4981B950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A52D412B3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkeUzId1X7mw for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 151F6404F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 151F6404F7
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 151F6404F7
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:02:40 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a78b39034dso9095555ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 05:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736600560; x=1737205360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2ZzbMSXWTMs8GqtQBWqjVcKqf6enemTcT2ybSeFEwE=;
 b=WkSe9iVBR7MZKkM7aT80LHQXMbsbWtPHMglZnS4DOHwMGnbYlAChEMZSQtHCLqeDwg
 hRKlWgTEEoNTTtPpxR+72LD5nUPyKgIbewLR25nVuER+xnHl9UU8Gv8NP9yCth/NYElD
 j8SvC5nE3iE6bXZjYCgDo43JGlzUBPo+0GUv0uztvJk8VZiG9kinKMtIw5uAS9aKKmKF
 BYqf2U/fBzIaiS9LVGIrqQS5Ptxm83iOgE0JdJDWyZuZi+mH+Rh3/yuxBpD0/OrPjZAv
 FMTIlCYmuxArVepr/MVoQbN4bj0pl0q2eXiNg0V+3qrQSGGwTmlo6TSeVKEGkM56mX7s
 NyoA==
X-Gm-Message-State: AOJu0YwfUBbykgspLP2l5UCesv5ks4x7058ifYb4wMi+k1C+IdMZNAqB
 tqUQKVm3HTxqwAfKOx94SlojJ/W1xxeGfKrn4+FDXZpjIJOnhGjD7SBxGk2b8j0=
X-Gm-Gg: ASbGnctvFof1whwzpWoUqIusQfhrwnKEcEyvtnu3P22VHvICcyNBEZ/U42TIjaSwuzN
 IM3m6iZVgy5jhnFySfTDRy6o6KY51/Bk9oOcmddIdZjiRgNvckiD7CbCUdJacj/uCoLgBh5aCqZ
 l+RTBNHFtWQaBAk/bVLvUMQlK6Iofpb/QsXUonafWbbQkP0n+VhgoGQA4LFhwGYR8MyGsKQb2cR
 PRgsMOYAWIePIfFCgvw1pG2sO0chJHaHV62nL4t/xrWf03Yio0hD1fZf1jET59WfXsZ+qESVhCM
 sW+VLDQPvLh1GydFnF3mYTRVkwemXCo=
X-Google-Smtp-Source: AGHT+IF4IOdQleJ3GhfAZr921GtCUcgCA7wKO/Pp8Dxk5moFouVlfcLabN0gzOrWt6BYq77LUif/lA==
X-Received: by 2002:a05:6e02:1a82:b0:3a7:fe47:6228 with SMTP id
 e9e14a558f8ab-3ce3a9b5739mr107863645ab.6.1736600559712; 
 Sat, 11 Jan 2025 05:02:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b613136sm1510015173.54.2025.01.11.05.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 05:02:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 06:02:37 -0700
Message-Id: <20250111130237.2458003-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736600560; x=1737205360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2ZzbMSXWTMs8GqtQBWqjVcKqf6enemTcT2ybSeFEwE=;
 b=QPXmslBOZiwTkW5by2FZnuUJFde4BgDduOlLB/kLFXq8tPKp5gZzbxM+vz1Kuxzh6Z
 hGIzadlOZq2VvBBTLjVOUhjLaPxTqzGrdyr8Yqeeyk6SW1wgfN0v64Z0Wyypz+mmRGWh
 kbzcAc8w88uU6NU7Sl1W7Nwchj+5eLlxmOus+4FyQparYSTzkcWaBPzvUi3IOx/4n+Px
 8LKKq9y3U3fXy29ED4dyzOKXeiVt/c681DelRQuNRfw+z2GnMTFdI/v8I4ZFk/+ada7a
 hltrdIMtpmPuR/PojND1BTmrXySGNBRUX4VHSnvCBe1xxfbubECIsfl73IpMVIX/ejLm
 8buQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QPXmslBO
Subject: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-mailbox-server: bump to version 0.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-magic-wormhole-mailbox-server.hash                 | 4 ++--
 .../python-magic-wormhole-mailbox-server.mk                   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
index 5512537c62..fd02bcc758 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
-md5  8e45d8943628d9c618e8801b8005725e  magic-wormhole-mailbox-server-0.5.0.tar.gz
-sha256  1f194edf88c6df746ba980c6a8c837c1e1d90f3afb3c7b0e501fce752aabceda  magic-wormhole-mailbox-server-0.5.0.tar.gz
+md5  bb9f84e7ecddc43413b4287b7b20d285  magic-wormhole-mailbox-server-0.5.1.tar.gz
+sha256  a007a03672293204657681dbf502045d6d5817c57f9aae2f2226e6ea1a008ca1  magic-wormhole-mailbox-server-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
index 04cd65e3e5..7525054167 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.5.0
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.5.1
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic-wormhole-mailbox-server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/1f/0b/0b6fda78c8a90d6c600da614c5a1962a4f24275e76d2e1bf763ee8df0b70
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/9d/5c/71566147af3f28017035ebe69ce7253ea26917225ae7c39b964578541bff
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
