Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B35C021A0
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A4442839;
	Sat,  8 Feb 2025 14:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOFuU_8enc1D; Sat,  8 Feb 2025 14:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F03A4285C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F03A4285C;
	Sat,  8 Feb 2025 14:23:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DA8B1BC
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DB456081A
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngPwovl8Nzec for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26600607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26600607C0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26600607C0
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38dc627eba6so1573057f8f.2
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024613; x=1739629413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNLpZWRxHqBcrzGipUT6lI//aJr4wxUPSA2/FeWV6HI=;
 b=GUcWrybDZd1GtkoD4N2IwvRTcW/sKvF2s2/pYWRE1uWKMMJKyFbpZvYr2RuVeSjGgq
 PjtCf/IrCz7pCf+cyjmYchaj8nvbh3bPp50ilXFQ4GtVkY3ifon/TwZQMfGc9lX8Z1B1
 eyK2julUNGx4Ep712kI9NEmUwNBUfv/qaIZHfGhB+zIAfWtdLd8oDhMEuSXsUjyuBkv5
 rzB0D88WyGWr0+oV8DriJLqEx+VrTkgrFIzBL+94pG/bGNb0ZK6tetbg8DZdPluuBofy
 HAyjxchKMtcutqTK5MfHSdRkjqaira4T3NjyZ7UTvHF1QSEUAliLCm01zDiaAIo7o0vu
 2vHg==
X-Gm-Message-State: AOJu0YzQAJ9jZ+5aHUrqj2BIGxC/ifmP5Uqtq8rhU4E8hDf/KZBMFW7E
 pKZ2KP2g2jtYr5xBAgrZ0X1f4+eemEoRpQ05OLX9DjohLkwNWSFLVHZckpCQOkgoONHRqGypL5l
 G
X-Gm-Gg: ASbGncscNpot84DbYLpP+OSLIAL6PfZgnlgBQQUAL/hO5prgoJTgZEvoyNdHvTox41k
 VdpsXXeU2UnUhdE8vJvxZYkVZp5a+aHOvz6CONcbykdfxIcFiT+v+i7qUoChY9dbpBkkZpTauSW
 wFwuw4bD95g234Nsa/39MMjacyM6Fq51wesWw0BDHPQ8amcs0ek5bNT9Nh6quBXcfGsCC0T3IKJ
 gcoN8pZZDnxQ31ONfHLOJGOs/Qj10Y/BC4NayC99VTg/wLuJ4WfLBbUT0X3849UYPFln4nnnZi6
 BEtLrrI6H7pDx5qItTTIwmz+4vOIOKjP6GNZiKC6yE4aGUyL7Z9QIXVaAR5GJ9oCB8P6QKnoPY8
 nayt5S8NQjS/S
X-Google-Smtp-Source: AGHT+IHUerczMcalqocbSQhbYb6BF3GB1jHkpug8IixgmGzCrbDI3Fa1960mfKf6TOqFAoC1E58oCg==
X-Received: by 2002:a05:6000:1848:b0:38d:d3f7:74b0 with SMTP id
 ffacd0b85a97d-38dd3f777acmr1591519f8f.20.1739024613154; 
 Sat, 08 Feb 2025 06:23:33 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:32 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:21 +0100
Message-ID: <20250208142327.418271-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024613; x=1739629413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNLpZWRxHqBcrzGipUT6lI//aJr4wxUPSA2/FeWV6HI=;
 b=Vd5q1guEB7Z68eX78WVwAyhqsjaj0yYqcrFmNQjhFtKBsV6X7yTn2MM+ru5OyTOYQW
 jVrdiggW2c63IQ1TRWd8hebnQ7a9EthoBmiGjnTK39CXPwpMnodjUbIxVHao7FQCeH+a
 A9cDvtrAxyvzhF0HAwyo5bsXiQCDZvBUrX3MM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Vd5q1guE
Subject: [Buildroot] [PATCH 05/11] package/kodi/br-kodi: fix shellcheck
 SC2317 & SC2329
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

As stated in shellcheck wiki about SC2329 [1]

  "ShellCheck is currently bad at figuring out functions that are invoked via trap.
   In such cases, please ignore the message with a directive."

While adding SC2329 check after shellcheck v0.10.0 release, it also
reduced the amount of false result returned by shellcheck v0.9.0.

So disable SC2317 and SC2329.

[1] https://www.shellcheck.net/wiki/SC2329
[2] https://github.com/koalaman/shellcheck/commit/4f81dbe839091a06a5cfaea695cf1c451ff07565

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kodi/br-kodi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/br-kodi b/package/kodi/br-kodi
index 83d4d4e5ac..b776b5d96c 100755
--- a/package/kodi/br-kodi
+++ b/package/kodi/br-kodi
@@ -5,6 +5,8 @@
 KODI="${1}"
 shift
 
+# shellcheck disable=SC2329 # https://www.shellcheck.net/wiki/SC2329
+# shellcheck disable=SC2317 # shellcheck 0.9.0 "spammy"
 # In case someone asked we terminate, just kill
 # the Kodi process
 trap_kill() {
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
