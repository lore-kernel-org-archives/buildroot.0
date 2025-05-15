Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F8C3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82554415E4;
	Thu, 15 May 2025 12:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhC_83iHJ5O9; Thu, 15 May 2025 12:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF85F415DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF85F415DC;
	Thu, 15 May 2025 12:10:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C93EC13D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACD6961166
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoqzaC2gmSRI for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E4AE61148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4AE61148
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E4AE61148
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fcb523ebf3so183314a12.2
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311037; x=1747915837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQT6jU3kzY+HcCDtcNnDihEyWjqxUXNJ8i1K9OQRZss=;
 b=LrjxJPcX7nRiMzcAaPpD65Zqv6H4Lh7vShkULlf9YM0BPnIBbanRTCZaWzLQSQ/MOD
 P8natUWAOXBaT6FDClMYc0FmV4+O0CLoKLAIUFnMBl38BJaax1xbciz3aOvEOBwrmMJp
 x8seQXjW2o4FD7ISEs6sWwiAOA/B5B6Jp+EuOVdmXgNH3/s+uJgwCnaRbnadeHU9E1Jq
 1CXKbGZgGn0BBEw6cBpeU5J6S8Vy9MhUhmqE/w9urLdS2amEgSoG+TfAxwMb4Qd3pHzg
 zVqbF/+bDS8NW+TT1Temnletz5Z9TChfsYjPfoXBtg3fOohcyuAF1TevzT2B6grRmIBC
 EMlg==
X-Gm-Message-State: AOJu0YyrvVeO8AV5ASWcRVNXj3iLbX3D3w6MDZc9+QWv+pGQ4K3ojE1U
 5KA3FzkmY5rBMRvoOqUqyh3QK8HDyRJ7Kqn9Kf2qiOHDUJic0VGcpymE6wXbAKSgqWGTmkxIEdo
 j
X-Gm-Gg: ASbGncucaLm3nPi32RNDEgPzxy/boINJhjIZzLlKjl06oaRRy1aD0Jckxd7XfTup/ZP
 sluikVIPXdjfyv5ZP+iYJfUO0k6s55EnfinRK9337EHtKnjJWYhrezrbrFBqck6It4mFWq2hSrp
 /FD8hKNnbM7cb6/59jCgTvPfgGg7ojyvv8RuZOkAYzqmkclPaBhFo3J4n24AzWZVhA3hGXaf8+y
 e3kiRgTF20Ijkqh4h88spuJqYJCP77BslKcZxdORVZkkAv+A3RZYQJzPAhuEcUOmZFiyTUFoRqU
 y8nZDdrUxSiih/STOrvEsqUbRdqK+ndbdUN8/cmfjcz7CWh5qN1o5XZjj1Tv59bQFstiu6/C6nP
 ta3Su1VCPya8OcLqh2rJboFe0epeiqG6H66zlM8oCKVK7IWFyiigernpYcd8Fd2gZU99ve4+huK
 aPWLlxzznDtPHqQh4PwbLXbomxo/BYOcw=
X-Google-Smtp-Source: AGHT+IGuJvE75iAoOY7N1Kyf1uLFJMiZC9VwpVKZiZesQATYwRwxKQg5YC8E1oKTzjD407dTXcQjHQ==
X-Received: by 2002:a05:6402:40c8:b0:5f8:624d:42d9 with SMTP id
 4fb4d7f45d1cf-5ff988e300emr2409530a12.9.1747311036925; 
 Thu, 15 May 2025 05:10:36 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:36 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:22 +0200
Message-ID: <20250515121027.561571-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311037; x=1747915837;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQT6jU3kzY+HcCDtcNnDihEyWjqxUXNJ8i1K9OQRZss=;
 b=BWnKbCKW454XIE6QT/ejN8PFpQ0ziM0o+PCdBOsUI99d6roDDQtKlZkF2uQMaaivLW
 tSon+gFQmeFOyNvTRN63p8dqf0jQYkQU8xj/bEaZIu8JFbQpfgLDpuxGI0xHixCDsAHp
 rS3ThQkk9j/M0xHEwtctRNwapNc1cPoGKKxeI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BWnKbCKW
Subject: [Buildroot] [PATCH 05/10] package/policycoreutils: bump to version
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 661c1285e8..4884c55770 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  58fe4e481edfb4456c114925442e11389df17394925acdba3de211145ce5ea98  policycoreutils-3.7.tar.gz
+sha256  eef23196b501d141cb95f5fc52ef1a7289f459b65e4415ea0fe9aeedc5d80ef2  policycoreutils-3.8.1.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 2b53c56e49..3265986bff 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.7
+POLICYCOREUTILS_VERSION = 3.8.1
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
