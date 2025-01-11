Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D01DE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B30611B3;
	Sat, 11 Jan 2025 17:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbcA5VhXmpfT; Sat, 11 Jan 2025 17:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC83611C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC83611C9;
	Sat, 11 Jan 2025 17:02:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B936950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77DC940017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHI3mCAch9kc for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AC024013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC024013D
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AC024013D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:02:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3ab37d98dd4so8593665ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736614942; x=1737219742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=am4ACoQsDJCyGexchPBOsJhPzCw42R/P+tWpGJ0ARfE=;
 b=pLQ2vXtzH5iL7h819ktxG4EPdeuv21Z1faAmQPbzk1gwTjWybgOeNApkjO3Vf8zwjR
 sZ43UWyqeDweKwybYEaVZ7RU2PEbsPfOfLiiMX6rcg3ormao3MUY+fg7Rr9iNNBts4FX
 y/YNjmHvm7jfgnoILZRh/3J62m26SFYwpHgPPTkNqV/5FF7ME5Sv1u79hZdO9P2lnlIF
 MSGRreE+SiNexdJnJCskwqACU24KJTAkQOruANc6nrIKyKTz2/9NqegfOUXMH7hptQtS
 tO0Hs2FtbcX1mMobGYczOhtfh2II8/rG9rvrvYQ6nr/a2UMFM41mYbiCG/dAi58BgZgg
 6ZAA==
X-Gm-Message-State: AOJu0YwpR6++10dD7tJDSwaBR1wCo+5ERGj8bzovUDMYuMc88oMWGOFl
 NSkv6WFjG+vl+tFg/RR/luguy2kr14jIj7OOCoAB8LDBOr81NBaFDlx9b5jWarM=
X-Gm-Gg: ASbGnctgAthanbJX1meZaFQM6SlCZW0Ga4AjxRgJuK15r50RZaBKB65ZKjS/TDXCY7H
 cyWOtI4JmLmSfwKjQfGUQeXhogVnBFpG574+IdQrkVs6ma60FSS+OhctwYDGy5VFH0qXjn5QDX5
 V3wWQTQswzJBM6C7K3uv99csdMKZ1OOULDCbXh2y1CF4ZmjQyAOui1io0gDqLmORVNIh8elzRfv
 Q2fFNqH3YipGSG7Lv0dl7Mh6YUr7q4D/gvirxVHeIxrG+uG9pvLJfxdOrtZmdoENS2HloZBZLIg
 TdvvYCjvpaQZhrUbiqY3v5/BD8zYZd4=
X-Google-Smtp-Source: AGHT+IEH4Ap+WHQ8NpEx12ijOjRYPF/CEbwkRYhwXkp8d4niCqOf6qDIH/Xn+29zOZ4Gf+eoOKKSxg==
X-Received: by 2002:a05:6e02:1d84:b0:3a7:6c5c:9aa4 with SMTP id
 e9e14a558f8ab-3ce3a888392mr117175655ab.12.1736614941890; 
 Sat, 11 Jan 2025 09:02:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce69c125e6sm1284075ab.0.2025.01.11.09.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:02:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:02:19 -0700
Message-Id: <20250111170219.2902628-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736614942; x=1737219742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=am4ACoQsDJCyGexchPBOsJhPzCw42R/P+tWpGJ0ARfE=;
 b=dz5DcCbTxGEChyGGE/drtJAAQSYYmZvg4ZrEkmmnVh3N0nExCwBSCoQ2LQ1QDUn4bk
 7AKpbyweb0hSFhKdXNDiEmN9S0nnO306sRNbTdNpYp83NCXc0roPGNd84HrceayVCTTQ
 QpHckLMzr9y5rOEnDUflwHBYfnzSd3uYpQEoFbWwyQpwGOuSf5zf5DC4o4c12d0mp+Xj
 wCt4bGK9gphZ9YacAlHNidECv8xHhpXXOSUqiImrLeL6rxBFOyH1PueseoW/3E99DhMV
 4zZmkCYz9LlQWjeMVM9481gcZpdGOWGIa1lSwtxyzKl7TWL4Q6PWduLNjwitfQP4E66E
 Apuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dz5DcCbT
Subject: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setproctitle/python-setproctitle.hash | 4 ++--
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index f60595bf6c..0076b0268f 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  1c042d6717212de791c4f9b63e7b544e  setproctitle-1.3.3.tar.gz
-sha256  c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae  setproctitle-1.3.3.tar.gz
+md5  9971bff3c4dc79e31565f1f79adb97af  setproctitle-1.3.4.tar.gz
+sha256  3b40d32a3e1f04e94231ed6dfee0da9e43b4f9c6b5450d53e6dd7754c34e0c50  setproctitle-1.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index ca2d0ffbc6..6698000eb2 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.3
+PYTHON_SETPROCTITLE_VERSION = 1.3.4
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ff/e1/b16b16a1aa12174349d15b73fd4b87e641a8ae3fb1163e80938dbbf6ae98
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ae/4e/b09341b19b9ceb8b4c67298ab4a08ef7a4abdd3016c7bb152e9b6379031d
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
