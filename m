Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26911C3ABBE
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 14:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B979E40606;
	Thu,  8 May 2025 14:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NF7DkKWxuJq; Thu,  8 May 2025 14:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14CF54078C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14CF54078C;
	Thu,  8 May 2025 14:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FB21A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 14:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 895C860FBE
 for <buildroot@buildroot.org>; Thu,  8 May 2025 14:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awyw-q7qHeNB for <buildroot@buildroot.org>;
 Thu,  8 May 2025 14:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 062A560ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 062A560ABC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 062A560ABC
 for <buildroot@buildroot.org>; Thu,  8 May 2025 14:24:12 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so10922165e9.3
 for <buildroot@buildroot.org>; Thu, 08 May 2025 07:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746714250; x=1747319050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+gU7kdJHGT6ZteYQmMSDcR2eW/9akWu0egoHiakMX+0=;
 b=I9WEru5dHqW6x2tEbr5I1Q5sUR2OtcBZF4u9eaAuG5qtyK/wE4923TFU82BI/3174K
 JP0v7tiorEOYp4LjlNr5OPUw/I/LJDQT929DuTF4ij1llBIv/U5xk9BDNh77GtQvAwvf
 dRNduJveZVzCXYTyGBwsAbkwim/C8U5JSH79iWNsmqYZQ5IHsbtTPIcRAuxOuM40pZtt
 ikhpou+EdHt+05hCLTIlNvXoPBoluA3F5VrJsQKtVUp/3qHT9FNnxlpU4JKwCtEuEW5X
 jzY9ygQe+PgUUaVh0FRG76vgNMEdgErnz3HQarvkCpx9mANIgvey5jCTumgEETpYRidB
 yLTg==
X-Gm-Message-State: AOJu0Ywg8jPrscpku4lhHZkKmuyQRBqzeLbrfVda1WIpIVyt9jnpLPJP
 HuASHhXHv9z5N0oQkbxXG6IaTLRdZUmSyLu8dPiGbwWQ9MvMYpd8xXilqvwf3UM4oelyly8vY/O
 bzjc=
X-Gm-Gg: ASbGncuvNe5WmP0XgFwI3cwFDIL8yosbCrq6BEtVgPUxqdjwirKAQjv3ssh3FRGo1iV
 puR5bZUSv/h35Y6mX4gWzKz9LbzN+TCvtKCjL3C10cUSIm4+myhiubgCJhEWXAyPOEezp3i2agp
 vdGpQ4XlDa2UZNysAtJRE7ZrBo1DaMx4ZzlYiqI1JbDS5btzjuGvfVMrfzsfuCi3nsXfe61E9IB
 4oRWjgzEw2ru/jJynTKWthD2ezJfN12x0Rkj9Y0PhXjwpa3xuF8lGg+/AKeAsBlH6/3ibtkLXb8
 Jlt1T4AMLas3Nq/k0Vw0kGewe6DIBIQ1czSqGzNjVdW5FLRrlDxMtG5AnIiBjpsBQ9j1StVz2bt
 Be4UAbEiPswOsYJWvnYBVA+wXrFaigRzCbuLjBz3G5Rc=
X-Google-Smtp-Source: AGHT+IGKh815iluDIwccuQg2cEd7vhWqtpYRaj14swGlRr7crsFBn9Ve6qpd7MZCe6wJ4HWiQiOzVw==
X-Received: by 2002:a05:600c:5129:b0:43c:e7a7:aea0 with SMTP id
 5b1f17b1804b1-441d44dd0demr49776905e9.26.1746714250115; 
 Thu, 08 May 2025 07:24:10 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32b0e2sm40309005e9.8.2025.05.08.07.24.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:24:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  8 May 2025 16:23:56 +0200
Message-ID: <20250508142356.91867-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746714250; x=1747319050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+gU7kdJHGT6ZteYQmMSDcR2eW/9akWu0egoHiakMX+0=;
 b=PsOQac+zgF5SqIJSsMKfX9yuxMS8iipnY1WGxiJ8p6equdORzze1I/Y/B4ZUmAVAI1
 3IQEGSWW+lJDvuJFzQcxDczMIPt/v9OwmQzhITipX8PzKrYcteSd9N3+tQ8mfKToD6y1
 lGZ/NhozcFzaObDJo3us2FShGlixSpqTz4jCoHyLZ0C2zosmbG/iUlUGXvKrqRz41JD+
 LlpVepATlgFJN6PZ7GayLjrGwilJmxrfR+BtRfXrKTpn3mkW1OQe4oavKzYHSKwSVpwE
 WLqwTiSdU9XVlJBHH9BqwziPXAenqxCAsBEUCOb2GEfCB1UGu7CDgRpZnZC5uG6zY4GO
 Haig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PsOQac+z
Subject: [Buildroot] [PATCH] utils/test-pkg: add new option
 -T/--toolchain-name
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recently when trying to reproduce a build error with test-pkg on the toolchain
br-arm-basic, I had to create a new CSV file with that toolchain only to be
able to run the test in that single case.

I believe having a command-line option right away in test-pkg would make this
much easier, as I can now run: `./utils/test-pkg -T br-arm-basic -p redis`

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 utils/test-pkg | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 19d8713d6a..6f1b33a45d 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -17,8 +17,8 @@ main() {
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakc:d:n:p:r:t:T:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -61,6 +61,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-T|--toolchain-name)
+            toolchain_name="${2}"; shift 2
+            ;;
         (--)
             shift; break
             ;;
@@ -107,7 +110,9 @@ main() {
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
     mapfile -t toolchains < <(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
-                                | if [ "${random}" -gt 0 ]; then \
+                                | if [ -n "${toolchain_name}" ]; then \
+                                    grep -E "[/^]${toolchain_name}.config"
+                                elif [ "${random}" -gt 0 ]; then \
                                     sort -R | head -n "${random}"
                                 elif [ "${number}" -gt 0 ]; then \
                                     head -n "${number}"
@@ -278,6 +283,12 @@ Options:
         try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be
         used.
 
+    -T NAME, --toolchain-name NAME
+        Name of the single toolchain to use. It must be defined in the CSV
+        list of toolchains (see also -t / --toolchains-csv). If this option
+        is specified, then a single build will be performed on that
+        specific toolchain only.
+
     -k, --keep
         Keep the build directories even if the build succeeds.
         Note: the logfile and configuration is always retained, even without
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
