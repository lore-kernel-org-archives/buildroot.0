Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E9E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 15:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD38811A3;
	Mon, 23 Dec 2024 15:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quSHTwtU-oz0; Mon, 23 Dec 2024 15:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBDDA81242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBDDA81242;
	Mon, 23 Dec 2024 15:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E243D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CB25606C8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6ZLUC963LHZ for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 15:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C4C7606B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C4C7606B6
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C4C7606B6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:11:04 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a816cc9483so32127935ab.3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734966663; x=1735571463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YllvNTYqNsiH+68H2d8e12CSYTJCqZ/TQP4QGsR5S/0=;
 b=n7mNL3CG2L/RpWuU7dvyv4sAfndR1KDjgrN6ixD/oOeKr83QjpKY5NQjrWq6PijHS3
 vWYByG41QKA1og2x5bHubgIsOjo7cRWdHkz39GLVLoGmVrtTp9HJ8wbJDg1N0En/U9it
 3FFVokUigTkixTTyHI9u8vg5RkMpmh0yeTzIhTco51tJgYY8nbHJokk8nyLjpGYiT/QY
 +vJ5n51cfWqsxS9ZsJenP9sMXjAefO3esmO2S6+YdnMd1au6dBzgf6npbNZq01UHU5ZN
 /oZ22pWX4aeq2y/FdXxU8n63qjHRSPy0WGjAQOcLbr5jc53jPLGdXxsN8vLFe59D/q+e
 ylxw==
X-Gm-Message-State: AOJu0YyiNa/W7Mx93X39AFjv7unTZqGdHPJ6MWvKTwPiVJS6idTFtUOo
 F/s1v/HAlwzjuMCkCIjpVNMHszfTR/i55Gpnh6XsDQYTmejPEBqLck7q1YqqEak=
X-Gm-Gg: ASbGncvCkwbg7VC0aapvvORMn1gGUpfQHLY7YLimsLjPdMdWANBHcEKqPpaCKaM3gmU
 xsHzC5o/rn1XI08VZQXBpsolNE9mZGMC/zmGEVN/BKpG3vegxniS9EWkff0NHU9kDPismUZnOL+
 raciG8JIUQ2E2vEhRQ1sAUfipkHiB2qnhIR7ASJocWuZj/0KG1m/3omTTtsMqkojJYMhcLIduCm
 TDou/PEsb01jmGxFyuUS0WpuQtqPW+5RosLNbpiG+TUVL7mVUg4qD834Mqz4hjIOc3bNhXQ71+A
 rdu78m2RqVrgC1XCEwiBsBTxDoDBOa8GRg==
X-Google-Smtp-Source: AGHT+IGN6UyKlpVFA+POrAKB0zwB4GoqvE0XYQZgrg043BH7FMiWSiVx7a9yT0mqt10cPYFn3yTf9w==
X-Received: by 2002:a05:6e02:1fe8:b0:3a6:c98d:86bc with SMTP id
 e9e14a558f8ab-3c2d14d21b6mr116181355ab.1.1734966662912; 
 Mon, 23 Dec 2024 07:11:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c199c3bsm2255645173.86.2024.12.23.07.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 07:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 08:10:52 -0700
Message-Id: <20241223151052.1726594-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734966663; x=1735571463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YllvNTYqNsiH+68H2d8e12CSYTJCqZ/TQP4QGsR5S/0=;
 b=EMFy/pD3AGFGUTlw7GeqvWXK/lX40mm5v0FCsB8HJMZePlULG0RzMi31Fk5Anib70U
 3FHgQeKASgQDoxoJSSdHvXoUJAseQE+15mfrn5Iwf4Fz5NtCgQLJZlU5N87XXvfBoDe1
 hTxlQmSII9iGE1DLdzgSEAFyWyhbDjcz/gV3skvyRH4UhkK0BX7LPqWbPGOwoVIJ1yUB
 AFtoLkocQqpusmuQfcmGq2aq4CpRLwIU6T530JE8ZiyDPO59fDDq99XOiSijdMs8ozH1
 PT2/mWpOJ6xYZ1ezZx3h+fo1CwwotFQkwZYh10I5MHXHenqmB9aoNReXvnyhsZpIZgPj
 UaqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EMFy/pD3
Subject: [Buildroot] [PATCH 1/1] package/python-argcomplete: bump to version
 3.5.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 73ee60f268..82b22673ee 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  d41f3c39f4be81d29bb6166e8e57116a  argcomplete-3.5.1.tar.gz
-sha256  eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4  argcomplete-3.5.1.tar.gz
+md5  947144ffafe463aed8c8eb97bc981d11  argcomplete-3.5.2.tar.gz
+sha256  23146ed7ac4403b70bd6026402468942ceba34a6732255b9edf5b7354f68a6bb  argcomplete-3.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 0118cbb9d6..bbf4031c5f 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.5.1
+PYTHON_ARGCOMPLETE_VERSION = 3.5.2
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/5f/39/27605e133e7f4bb0c8e48c9a6b87101515e3446003e0442761f6a02ac35e
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/7f/03/581b1c29d88fffaa08abbced2e628c34dd92d32f1adaed7e42fc416938b0
 PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
