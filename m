Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AABE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 00:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A7685134;
	Thu, 19 Dec 2024 00:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VKgmgpsKrS1; Thu, 19 Dec 2024 00:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E506A85131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E506A85131;
	Thu, 19 Dec 2024 00:34:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3690CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF85F424BA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbIgCMRJxs0I for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 00:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D00434258B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00434258B
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D00434258B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:34:03 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a814831760so826245ab.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 16:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734568442; x=1735173242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jrGYqmrxgbYiJY3mEL8qXM2Fe5SuF2xtexsOZQYble8=;
 b=tOvnNF9K8DIrBoMzzBG6qnZbADA3dVD0AD+koeprw49rl8mk2TANxyp+AyLRxQrHHV
 Xmg3rqKvLDSZEXWXKxsOXgtf1jXwMfDowcPJ6DumQZXEf7p0oY1iyjshD7F4CdE5Lm+O
 i5BKtZl3VZDsX9d5h75A6uK3BfxzMv0SbPDvNP490R3H0T142mp6ZeiwUJQH70wI87V4
 CjsNHj19iB6RPGjUwmT/nk2RANV/8CsqUvVnOQG++gVvfMk4UOWEHRQj7k+ksum8rXEz
 jjcADRXZpOKGIr1y5iokGczcyshooad/TbxTrO9RkzHSt4pIyiYhHRHNHbzQv0OMXw5F
 m/1g==
X-Gm-Message-State: AOJu0YxaXp5EbUvebo2ebuJo1qIbTVjgI4FICd381PdPAqLME6TxTMpy
 B1Z6HuRmlhVA5xYTT+9fOVUQDD26HPAWBeo29uc7nCEpRqQg4z3ilrZLOYFVkn8=
X-Gm-Gg: ASbGncsf2XnqVhADPU/WtBSLOV+sffD3DIgg6Uhx/AeKB+abcgmlFwkDoYtrAHOQnBo
 fRJZiqyPBz6pVDbkRfPFSbw8hBghnTFOTJSGhJDYePHtftlA8Ld87xDVvIdjXoiqJeeR9hEN2JV
 3RNEQsv5YZWikTP0sreSHrLBFtnjxRbCzrQRSuVhDfuvsyR71FigbNpir0Yqxwn2q6GF2BWfN4b
 F3TDucpf5Ayot9MB0A8ZbCREYOoLMNnazdmHHF443CO6usQuNe7OIiOHaPFk9q8A9xhaoxZA2nP
 8TOT8PTGDHi0UUIr9/Nn1VJI1DAptufvtw==
X-Google-Smtp-Source: AGHT+IESx/3G9aABqqhZtJ8m2MJqNt+S8IN3RF3wUjjjoYOd2bBwx7BQI7mBmDS+RqBfMEZSSiNaXA==
X-Received: by 2002:a05:6e02:1c85:b0:3a7:7a68:44e2 with SMTP id
 e9e14a558f8ab-3c0145b15a6mr18422375ab.15.1734568442546; 
 Wed, 18 Dec 2024 16:34:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf4f584sm20828173.15.2024.12.18.16.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 16:34:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 17:34:00 -0700
Message-Id: <20241219003400.227049-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734568442; x=1735173242; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jrGYqmrxgbYiJY3mEL8qXM2Fe5SuF2xtexsOZQYble8=;
 b=WvpBlsYiml/gEMHZrG75mg2TcE03cF2yL3tCCfIpWgjsM/UOBZGEPUP6NW/1IbqJiy
 H3ebhgFWSpPW1rPij6SPjgWwAaSEiTEk4aSz/WPEjwcNgl8r4Vw0H4nzjKMFGF9g/YIr
 r52+7IqTSrBAuQxIMBFkqTZw1Yr0PtL4PjfN3sZ6ZhXgS2KqfB0h85lyktZHwvGIw/rU
 qYURfHgg/zbc4cjNKXVqq4lTevOUiz7hTVvAcWflrhUvpbnEWJ+AOF1o1V0Uo8fGXsRd
 EQ+WjRhNKoHKJCb5e9a1PXCnHyeiVUGZeEkRpp+QGL7l5gVNImXlsn6ioKJw42TDz5pE
 1W2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WvpBlsYi
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.8.1
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7e3cadce70..1c51c5b2ab 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  0371a857e08b555cabf3935044675f39  pymodbus-3.7.4.tar.gz
-sha256  573c370aea04523403eea1e159616a583cd7b93cfc5c81b07340d3cccd52c99f  pymodbus-3.7.4.tar.gz
+md5  7fca9b2c51dce7e1d8585bb1d96dd7d1  pymodbus-3.8.1.tar.gz
+sha256  543e3fabb10e9012801d235108ec81c8db15cc8f8e2c398861d0dc5acf9c623e  pymodbus-3.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 0bd99cc3da..fe74e3d211 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.4
+PYTHON_PYMODBUS_VERSION = 3.8.1
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0b/bc/f98789706351e778676a3e84ed6203160c4f581092e298eb075bc9e08230
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/ff/81/7a7bae73b54d3545a1da420886abea0641273bbd87956dc7217b54ef524f
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
