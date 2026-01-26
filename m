Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86CED13C0F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 13:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8F0560BCD;
	Mon, 26 Jan 2026 13:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN5HSyyglars; Mon, 26 Jan 2026 13:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C6760BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769434734;
	bh=tZROoqtpwup2fW6Jk+ZaCefGYGL3RkT7VgLhgbgc8Fo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cU56ja5vJqHw/PZm6bJvrsaNRklVxwEhlKAq0zIzMyI+3sfmoFQKx96XYD6WbfILp
	 e+atkid/W5zHFjacWPye6U75je24adRphRx+QGTyg4e+DxFX4p33dIQNlXCScQXc75
	 3dnVKGwoestnXfxaH5z2FZtHv7btFoVtnt7DpA/kVmtRXZtmWXX/GDJCrT7NTfllrd
	 aZsQaAECtELWCjFGxOlZ5OoJgicxDC7hLoMT0K6VFDuP7I3b1EQSq9qYPQQ/sO3tfr
	 gGJGnvzbYYw3w8jJL787+Q868LBspqUJODweXVR1K3b3w5R5jEdDE2vYIQfmOdOeRk
	 2Dq91PpSoSIBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C6760BC1;
	Mon, 26 Jan 2026 13:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A9011CE
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C65E81ECC
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAgA-YXthJWW for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 13:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DDB181AD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DDB181AD1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DDB181AD1
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:38:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so47549505e9.2
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 05:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769434729; x=1770039529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n+ixGoi0BuZTNi9Vyx2MQYQZAqyL19QEVaO3oMqChS0=;
 b=XYE2a69KfytOgxptchPQbedM5O7eU5vpD3EaHEe7nqiIwb/MsYTpspRpuOitRqTHNS
 oesdnYR8L6pDGsONWkPVhK4osyICl2tgftpO52jbpiJ3/P228pa3eptgy9SovZgXEldv
 OhqRkA95scI9/zGnq2B8GOVaZLGHth1qNYsiQrqP7oLaZIXL+CCXsp19izehpdt3dlBv
 P504lE2rU3lrQrcP/MBTyRx8iTwLsur9uF0KIcgBi4gUeOlgVXpQAhpECM0CzZ/rmYFm
 WGX+Y/3mVxCs2acEzWTUsNjiIZSnUV6jTHiiQh+rxqLbRmu7yu3g7z+Vx3V6XLh08mkA
 UfMA==
X-Gm-Message-State: AOJu0YzVMI+vfYPu6qCaA2EE5ABH3vNYo2rtYJfUilqu/y+DwZgECDK5
 Oc1aYhtandHbnhVYu6j/m5tLb1MQFfuK7pLnsGz/tJdSy4kN6i9C1JZKan4JG4Yc42OxfGbm8c7
 mQVJQ
X-Gm-Gg: AZuq6aKm/kmmeZv3tmsPUw5LWJRTKyzhlyS1YAYDomePgHGTaHufiU2eYaiZc9PjsUp
 C2tEQRb8LlSwF6LM5cnWHFZL1gz3+aHEDySGsCwnfTcbJPWUtP8QiK5BrU6WvVovjEdp5PIfcrf
 oRXFxf0XvxDh8piF8271A4IRh6FcpVjDxtqfBucxaJzpRTDEFAs3u8VG5RH58Lw/idnB3LsGQf/
 7kSyTlF7yStjT+Pe8A6JPJJ4K1IalVUamnRgRPv0KRgKavQK7rIes2ZKDcKfEl9xJWr55URpV61
 FdhCajs+0icPg/89Qm9MHQP0W58IC/DzMfA93rpNYreSsNNo9e6qEeYlMry9D9cBQvisyrWpqDZ
 AHwolPlJmkbthRT9AF0zPijQKEwcqaW/qjoPDdTXvW3+OXOL4sKclIy2A2CqXBJYNIQL4rnYfbW
 uLztC2IQO3LhMnfe/PzC6foEXAfJCFZr9gXvxMAKd3xhP6JEP8
X-Received: by 2002:a05:600c:5286:b0:477:b734:8c53 with SMTP id
 5b1f17b1804b1-4805ce4e766mr71489645e9.12.1769434729301; 
 Mon, 26 Jan 2026 05:38:49 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8a5c32sm336176325e9.11.2026.01.26.05.38.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 05:38:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 26 Jan 2026 14:38:48 +0100
Message-ID: <20260126133848.91886-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769434729; x=1770039529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=n+ixGoi0BuZTNi9Vyx2MQYQZAqyL19QEVaO3oMqChS0=;
 b=PgNqxcoE9bWdEvmAO2GOUoUCKEBIaFuBuF3YhPlZxVJJYFtiHRLeBfe87Btuj1OiSF
 H42Ddow/Hn4LvWwI11mCob3qJzG/y5SbdbIgWlCyKsayBHWUc0A3+KaaiCEwWORCyTWW
 fzIVinNVgPKXuxnQjKWjlqEhHPnyzM1j2m4F8oI6m8s1wZipAfauPgkkvSvxSQuSJmUW
 nKTRfHL8yg1NOkVlPRabt3co4iqPpVXvzQfnFKxgwWtV8J289wuQzCOxacucMC+R5tuM
 g5f5y3Pg6VHS5IVy6VHxQQ1xFy0Kc00s0oDTQu6HUhmQw2E5ihDTl6conU8p73OCs6gf
 S/1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PgNqxcoE
Subject: [Buildroot] [2025.11.x PATCH]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the introduction of CMake 4 in several distributions, build errors
started occurring on those distributions for cmake packages that
included calls to cmake_minimum_required() or cmake_policy() with a
version older than 3.50 (see [1]).

This patch enforce building host-cmake when the host system provides
CMake 4 or newer.

[1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/dependencies/check-host-cmake.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..c7aa16f48d 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,9 @@
 major_min="${1%.*}"
 minor_min="${1#*.}"
 
+major_max="4"
+minor_max="0"
+
 shift
 
 for candidate; do
@@ -32,6 +35,12 @@ for candidate; do
     major="${version%.*}"
     minor="${version#*.}"
 
+    if [ ${major} -gt ${major_max} ]; then
+        continue
+    elif [ ${major} -eq ${major_max} -a ${minor} -ge ${minor_max} ]; then
+        continue
+    fi
+
     if [ ${major} -gt ${major_min} ]; then
         echo "${cmake}"
         exit
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
