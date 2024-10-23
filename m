Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F8CF5365
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 12:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E25B3810E6;
	Wed, 23 Oct 2024 12:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnDq-sxueeCp; Wed, 23 Oct 2024 12:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01CB1810ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01CB1810ED;
	Wed, 23 Oct 2024 12:22:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BCAE59B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 12:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C31D810E8
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 12:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1raFejd8jWKK for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 12:22:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BE56810E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE56810E6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BE56810E6
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 12:22:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d50fad249so5249198f8f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 05:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729686157; x=1730290957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3drfzHgYM4l2kx/YTybrq5GI9+b3xzxj63VonJhrRP4=;
 b=lIhJfanYc3+7NhnV9X6emhhuC1bvplI7aqgsvSG6/6ZoD4kHNGNwren8Z980hwKt/W
 dst1b+YXvrDZ4NykIizm2Dm42OZ15ptVoGauFfylB605zGde3TOo7C7So1dhdpITDGt/
 al4eDXn+yo5Dgag2/iGgaAnkdgW/vOC1sSqzwqhzQLH7lJMgRizjrFZWkDE8fCuqNSVT
 qpuModeGEh8ITrrkskRyJlHdABIbv16kSPONXg1wWD6j9sBb7BJ/iPneYFwSCPayV4pp
 lP4cJmExGDexKFJT6kjWdfeUNjwEzj7YXNK8c7s5Pnh/MIUokxKvIVxUNNVpngIobfDP
 ESdA==
X-Gm-Message-State: AOJu0YyPGsWp5xAzI2nUzW6H7MMBgOzFdj4Bi2EiZM1UtD0bCpeMR8QV
 siuCCmHVnhJBbcf9C36U+7VlNMLPvm5RLvcn5yi/JEn+lmf/pObfD4qZ/buMTTEi4RAWeKx4Mi7
 c
X-Google-Smtp-Source: AGHT+IFNtX8DB9GorNmf6v3aYVAv7VPiCxwrJixtvOImUaTS4eP4GkRZfZdtrElH4wfBlLDvyBudDQ==
X-Received: by 2002:a5d:6251:0:b0:37d:4ebe:163e with SMTP id
 ffacd0b85a97d-37efcf93223mr1540526f8f.53.1729686157354; 
 Wed, 23 Oct 2024 05:22:37 -0700 (PDT)
Received: from arnoutx1.. (d5152f88d.static.telenet.be. [81.82.248.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a5b7afsm8790291f8f.59.2024.10.23.05.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 05:22:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 14:22:34 +0200
Message-ID: <20241023122234.478798-1-arnout@mind.be>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1729686157; x=1730290957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3drfzHgYM4l2kx/YTybrq5GI9+b3xzxj63VonJhrRP4=;
 b=I5WMf8yuledg/GSSpB0Jj1+aI/xnEnGOPBvuJhkpY9rSnSLJfhOhh4L0yhZ3atXR9q
 QDYRuKVxFaJ3PWorPjz1r2J0f5eYh4lnKW0XJ22axyvTwHXp8Mw2tXlVReQJ1F7aJ+Pc
 p2eGzkO6v5O3IXSgo6q3KxTUYizE4Ku6jVUyY1Py/M4SUvXqvVLb6lw9p54Die/qmZba
 YhCxrML7rKxT14fckrfbBj+ogoAXtv6LhFwJEHXq/oENtSCRRRNJ0uVpO0XqzjxdgQKc
 An0ZlR+jv5VAAEuv+sJLrRFKqjNLjLzu7NN9YqAVEJB8rVzRAnMZ40mDYkWjYUu8HK1P
 UGnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I5WMf8yu
Subject: [Buildroot] [PATCH] utils/brmake: add option to run in docker
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment, it is difficult to combine brmake with docker-run.
`docker-run brmake ...` doesn't work because our docker image doesn't
have unbuffer. In addition, inside the container the timezone is UTC,
but you probably want the timestamps added by brmake to be in local
time. Therefore, it's better to have the call to docker-run nested
inside brmake.

Currently, brmake doesn't have any way to pass parameters, all of "$@"
is passed unchanged to the `make` invocation. Thus, there is no
established way to pass in the option whether or not to use docker. We
choose to use an environment variable to pass in the option. The
convention is that such a buildroot-specific environment variable should
start with BR2_, so we choose BR2_DOCKER.

Run make inside docker-run if the BR2_DOCKER environment variable is
set. Update utils/readme.txt (the only existing documentation of brmake)
with this information.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/brmake     | 8 +++++++-
 utils/readme.txt | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/utils/brmake b/utils/brmake
index 70dfb6cdc8..4756016a0c 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -12,7 +12,13 @@ main() {
 
     start=${SECONDS}
 
-    ( exec 2>&1; unbuffer make "${@}"; ) \
+    if [ -n "$BR2_DOCKER" ]; then
+        docker=("${0%/*}/docker-run")
+    else
+        docker=()
+    fi
+
+    ( exec 2>&1; unbuffer "${docker[@]}" make "${@}"; ) \
     > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
diff --git a/utils/readme.txt b/utils/readme.txt
index b5862f1fb9..abff659d4f 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -7,6 +7,9 @@ brmake
     front of each line, redirects all of the build output to a file
     ("'br.log' in the current directory), and just outputs the Buildroot
     messages (those lines starting with >>>) on stdout.
+    To run this within a container using docker-run (see below), set
+    BR2_DOCKER=y in the environment, i.e. call it as
+    `BR2_DOCKER=y utils/brmake`.
     Do not run this script for interactive configuration (e.g. menuconfig)
     or on an unconfigured directory. The output is redirected so you will see
     nothing.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
