Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70028C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2186361185;
	Tue,  1 Jul 2025 19:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnQ2Vx_scLPf; Tue,  1 Jul 2025 19:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DBE360DCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DBE360DCE;
	Tue,  1 Jul 2025 19:07:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5D20196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A336F41740
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsLd9FVJ9RAM for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::762; helo=mail-qk1-x762.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF2B140B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF2B140B26
Received: from mail-qk1-x762.google.com (mail-qk1-x762.google.com
 [IPv6:2607:f8b0:4864:20::762])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF2B140B26
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:07:07 +0000 (UTC)
Received: by mail-qk1-x762.google.com with SMTP id
 af79cd13be357-7d467a1d9e4so113359885a.0
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 12:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751396826; x=1752001626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NleukThbgf/wspzV/j/0KW2r/KRK9oTNHAfnvnmn1W4=;
 b=wQqxp0BBCm5W7i9lgXJnnX3thb2bnIrUd7TlWxOdwUM0X6/d7mxXq65dMHq0RG6GxR
 7y7rZyDA8Id92HWmmREiNG6AneNxNlhi4N5PnOisJ8tBZ8tcbNivYfA86b4+KKXJIXij
 gBhxhiobBHeRTPs7mUKBlLTi2Yik0MdwK/6VJYSEvHbW8mIVPsK5pJ8379ThhBGWaI/S
 aDj0ZqeAezzWnljzqgxv8DJrFlDfJ4gy4kmRXeRwVqCysY0llR69kg5E33KFPcFA+5Ku
 LTJjqwfHcU7CLCnJk8YGSs7rxB0rbE+5DA2anbNP1aizf0U9Jv/qQXEwUGYNZ2peMsUz
 vIjQ==
X-Gm-Message-State: AOJu0Yy53tvs2UZPDMu/CBnFxpmSltpMgaGgZn9At21GMK6G9wqgcj6q
 hp9wIa6oiHRQ4HL4EASjZA3J5XdTrIhnZW5f6pkN9X7ZPlR690eNjUcmT2gjjnYvO9dFJv+9gJX
 AOKijfq8dtBNjBxJsL9ZTeJek3dkHjsL/fCJBdtaHoKSbw10=
X-Gm-Gg: ASbGncuxE3knNxU9Vv5mQeMnoes7y3XEwpYfpu9g8Ga71jDE96UNFbCN5dO3sUyhngQ
 AUv4I6Huhw1sLWMHrDYdVz0ssUsI2ziPqgmB2BfSl/gGKwsvaQ/vlp0sZXepxS68Y1U59PIJWYR
 1NCbReFvxssGroXgU3ifbhAKtoDKJ+tIJnU4yuwv0k1xRs49+cNU43k6cE5DsV9n+paQkVFXowK
 M1KvDZ4KZWVRJ3rDG/MXBLh3pZHlpAu5+LgpHJhSgIoW9ebr5/ZG5s0N0Jjw+jr+Ulr1EsXyOTM
 O/q4c8xf0bLDxAPiPprAP8lZ/1NZT8CwhJuyR3Ef9Xc=
X-Google-Smtp-Source: AGHT+IHyMKG641UnwTWHMzwR95iZRuGO6kU5JgVKjz3VMzhMZHWMTqLg0QTpRu0bOu/ol72QWFRaUKkcaicm
X-Received: by 2002:a05:620a:319c:b0:7d3:a7d9:1120 with SMTP id
 af79cd13be357-7d466e326e4mr643349485a.24.1751396826455; 
 Tue, 01 Jul 2025 12:07:06 -0700 (PDT)
Received: from localhost.localdomain ([184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 a1e0cc1a2514c-884e8b93940sm109467241.8.2025.07.01.12.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:07:06 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Tue,  1 Jul 2025 15:06:45 -0400
Message-ID: <20250701190645.2205-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751396826; x=1752001626;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NleukThbgf/wspzV/j/0KW2r/KRK9oTNHAfnvnmn1W4=;
 b=o/Lu1EL7AQCuPAuOFBOx7QII0+E5TanzuFIuiBcVdeRSEKLfVu1dSzkJTmP9vQySN5
 YgOkY2VvWJcSjH0jN6p6PHIZjSjgHe7TKwwVHboou6nD2PlRK9zRle+5hlFmoqhY2OlD
 kY7JSe6KM67k4d8vknGn5mDM4N1A5wFd8tyGKnLWh8xsenr5zUqKuKIedn1FayjN1Ckx
 bvkJ9BpKPtI29E0Cc3A1iPF+F8DiQ8Q4qknvszubvwZrEaC5ebuca/ZidLjUapIJ1DN0
 KMMpnviWxU2ioyW4zyYwf9UYlkgaiec3yhN8+2Ss3t5hWtnC2jWeomabjDHJfTCoJtL9
 Nbqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=o/Lu1EL7
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: stop on sigint
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When SIGINT is issued for a package test run, it will abort the active
toolchain run then proceed to the next. If a user is running the entire
default toolchain set (`-a`), they can be required to invoke SIGINT
multiple times to stop a run.

This commit uses a SIGINT hook to flag a shutdown state and stop further
attempts to run anymore toolchain tests.

Signed-off-by: James Knight <git@jdknight.me>
---
 utils/test-pkg | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 19d8713d6a..cd77964252 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -3,6 +3,11 @@ set -e
 
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
+abort=0
+
+do_abort() {
+    abort=1
+}
 
 do_clean() {
     if [ -n "${TEMP_CONF}" ]; then
@@ -67,7 +72,8 @@ main() {
         esac
     done
 
-    trap do_clean INT TERM HUP EXIT
+    trap do_abort INT
+    trap do_clean TERM HUP EXIT
 
     if [ -z "${cfg}" ]; then
         pkg_br_name="${pkg//-/_}"
@@ -139,6 +145,10 @@ main() {
         (3) : $((nb_legal++)); printf "FAILED\n";;
         (4) : $((nb_show++)); printf "FAILED\n";;
         esac
+
+        if [ "${abort}" -eq 1 ]; then
+            return 1
+        fi
     done
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
