Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23ACCA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 21:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31E72838B3;
	Sun, 31 Aug 2025 21:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDB5f6uS0Xed; Sun, 31 Aug 2025 21:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 443FB83926
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 443FB83926;
	Sun, 31 Aug 2025 21:39:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E33E279
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 21:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F5AE40859
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 21:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LgU-xl4O4W9 for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 21:38:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFB6F4022D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB6F4022D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB6F4022D
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 21:38:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b7e69570bso16213525e9.0
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 14:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756676335; x=1757281135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1TY3lgqZ12Zlpu3OmtWB/BOvjKp1ZIbtwukxjf4ekc=;
 b=w9glGk0j9WhEJNQY0QtOpQSBPn0DBQim017FVWeklxiKi8k5kHIYqOP3uuYoe45/x0
 Qj3WdrzJmqSH2xS2nCR43hRVPl/SpCfTxbS3kurTN4r6VcP1fkyouM/vnCTP59ORGygO
 pPSilNiv3N2w7u4arVSKJ0QMMNcIHut//8m/RPHRUnJnpQCHVcI1F+j7Ubu9Hv43h48d
 mIADIH0NgVQfj5q31q2xduvEOtj0wJI0zcWyNtKgZtCI4fYzpgI/hjgREFbSCoXun7MC
 yHp20QAKAwCd0ccW/uzHxHvKHhwZRxml5/TUhWbqD76HcV5QikpymHuAu4T0FQixOwbT
 79zw==
X-Gm-Message-State: AOJu0Yxas+ebtnpfQcRwUKs98/Ey0cjRIrPwPdr7D092X+IfzGJB4f2D
 CzcdNr9HpsUoJkTYHQSurd3l6a0Af8e98IppKBnNc7fum+1WEtscep4lfZ3iwOnhDFwR0/vzJgP
 vzyh1
X-Gm-Gg: ASbGncuD5hThQoZhH9/9nkecC9Wd0e6t4xjj/MBaYvF+2IQqeabtAs7VS5fej2kZhfQ
 l3D5P75m8vZaZiFJ6MYVBBgSQ/uxuOxSnOaRux9/DKqaFgra4l3VMrn9Aulw7Q66wLhw5iVa+Ir
 btU+knn1Kj3YtroMHbhMMm/3ECSTBKq1UB6dNzwohOlfv0v3DRLV2UrJ7FsRB2K9aJrImkLXUxf
 dbsPduOvdlLo9ZlsKgzGYtwsyZW7Zef1wMxkQJnysgfGCsWtoLRqxwQuidF/OeSf+YMLERPF8iL
 gS2gocND1PdFWvNzjuwA7TT2OGfEWJytlFeNUlQq4nfOZ5mNh0+0gRzEtXJiyA0vmjRKyvuclti
 pqEJWQCxpPdoffqxBDe7TnfWQpHEat+zh8quHFS6eYtuA+tUbxnfDPXiBd9DbQDzJQ6CTEcEKnO
 B3bUyV2IWJwPjhnq+LveXTB6Xui9Mst0NqsGyuQrxNMg==
X-Google-Smtp-Source: AGHT+IE8/Q+opyCAB6TT8fgodUrvgE2lIQ4rQ4snNOOxrHO6N+n8LPD6FTPHklprakl6oWsz25kKSg==
X-Received: by 2002:a05:600c:19cc:b0:455:ed48:144f with SMTP id
 5b1f17b1804b1-45b8c85802fmr11529075e9.14.1756676334747; 
 Sun, 31 Aug 2025 14:38:54 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0c344f6e3sm11329032f8f.35.2025.08.31.14.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 14:38:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 31 Aug 2025 23:38:43 +0200
Message-ID: <20250831213843.1310171-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250831213843.1310171-1-romain.naour@smile.fr>
References: <20250831213843.1310171-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756676335; x=1757281135; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1TY3lgqZ12Zlpu3OmtWB/BOvjKp1ZIbtwukxjf4ekc=;
 b=g+PefCVM00a5olDJWhy9DU0xc4oosVLGUY3rF25yMN8DDMzyq3KInRFlZZAGNVVsv4
 ibA6ojyR18xLpA2JK43ziDYmmRMmPp/MArLcz0DZQ2ZEs/ixoTjQ/X0lohgwtjfJGTeD
 He7pHuOnoNVCEIbJQKohjBQkWJzyBZwK2Itd0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=g+PefCVM
Subject: [Buildroot] [PATCH 2/2] support/testing: TestOpenJdk: remove
 stime() function call
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

stime() has been deprecated in glibc 2.31 [1] and replaced with
clock_settime(). Let's replace the stime() function call used in
BR2_PACKAGE_OPENJDK_JNI_TEST sources with clock_settime().

Apply the same change as busybox [2]. Make sure that timeToSet
has been zeroed.

With that fixed, the test "Call Native Library to Set System Time"
succeed:

  [BRTEST# java -cp /usr/bin JniTest
  Test: Get JNI Version passed
  Test: Read Native String Constant passed
  Test: Write Java String to Native Library passed
  Test: Write Java Char Array to Native Library passed
  Test: Write String Member to Native Library passed
  Test: Set String Member from Native Library passed
  Test: Execeute Java Function from Native Library passed
  Test: Instantiate Java Class passed
  Test: Call Native Library to Set System Time passed
  [BRTEST# echo $?
  0

The last external toolchain using a glibc 2.30 was the Bootlin
aarch64--glibc--bleeding-edge-2020.02-2, so since then TestOpenJdk
is broken.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774851

[1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00001.html
[2] https://git.busybox.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9
[3] https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/readmes/aarch64--glibc--bleeding-edge-2020.02-2.txt

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../br2-external/openjdk/package/openjdk-jni-test/native.c  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
index ed87e345af..9e926a27d9 100644
--- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
@@ -29,8 +29,10 @@ void execute_function(void(*function)(void*), void* context)
 }
 void set_time_in_seconds(int seconds)
 {
-	time_t timeToSet = seconds;
-	stime(&timeToSet);
+	struct timespec timeToSet = { 0, 0 };
+
+	timeToSet.tv_sec = seconds;
+	clock_settime(CLOCK_REALTIME, &timeToSet);
 }
 void write_internal_time_in_seconds()
 {
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
