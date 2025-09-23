Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA92CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 06:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39FD40AD1;
	Tue, 23 Sep 2025 06:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5acmxlUPg36E; Tue, 23 Sep 2025 06:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B92A40889
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B92A40889;
	Tue, 23 Sep 2025 06:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BC15498
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DC5A40363
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbOryp1Eessc for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 06:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B42640335
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B42640335
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B42640335
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 06:45:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso3975847f8f.1
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 23:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758609944; x=1759214744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSKWIJhxoQ5HpNunfKNbWhSM/DcgPX/AMPJ55AdKa94=;
 b=ImaboWTVHWMOP5iXzhyA9MXSuCYY8qOYv/5n8v+/ZxzxqfMQcxCURjrE7njIvp/gHn
 DFNk51wdJUL5K2FCTPhq741KVJlEKd4AchCDhsLDJb1me8M9F/VQIca0J1hnPH15LWg2
 EbtAEBa1eDlfOIBXH2EmfOR0y/S2/ASRt0onLU0+MHyhjMZfHDjOw3yxuriQ+dbvVilF
 qIrk+W6SGYf7cZPubpq8DfFVyTK9KEKp/gw1zSDBS6ezk7kTxUAmhqDU0EY9qk+CEwQm
 3XLKXow/Tcu0Dnmfw+zn7TTTdBWuqsqNTd5gqBJ6dA7mjg7GziNMY/Z+X2GD/eHsXNMy
 Egrw==
X-Gm-Message-State: AOJu0Yz4YL4qpIf8zT5E6QRFbqnkME+3TdQPWuQt7QMnkeb+RydFj40u
 5vKAmsSNYcRC7PCnqy2V7FTCyl42hTIO9vn8dX+Wm4dVlQT6/gjV7+Hoxqb0P7A2coa+5Bg1sCo
 C+AT6
X-Gm-Gg: ASbGncsz8vcJ5D6IOzAev0hLHkH+IPusvB/JmxOis9NQZ5caxeDh9u90AA6YkGFP990
 15m8IEIrkVzL64GUMcGbj8l5cbN2T79pshQ0iv5eN5NXU2zSLYhlzSQSJdxQ6kKVaHZCkyEeyvZ
 VHkYsJm18paTxmw/THmMc2jMAZbyTTQBQpW2+GVQenxU6bmfoZLWfYhfzTOjbuGwSqEAeJVPYgE
 p1qh3X84pxkwdFDDcUHTlKb4oMjP0QlQMb/f+ySybalsTCStRv16MoD55VE41oqtp7KV6vi33lF
 2ioXIonrHKeUXDIjf1+cEsQnhMVvmwmP5Am9E+QUshfxtY7KHhhK+HykgqWPBiTvJX46OjEUfA/
 Zh/YtAJkE4BCZHWQiwqEVCxzo59UKTvR9I5mmOZGnTF+7dJCnabx9Al3CsJ/rAg==
X-Google-Smtp-Source: AGHT+IGnp9vAboy0vfqKIYTwANNQksp0kyIRRfU8r6mWRqEIbO9sX0OK7cPTWhgwTo5j10fzFF6/jA==
X-Received: by 2002:a05:6000:144b:b0:3f3:ba4:29d7 with SMTP id
 ffacd0b85a97d-405caa503e2mr1071773f8f.43.1758609944269; 
 Mon, 22 Sep 2025 23:45:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.198])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf53cesm24135957f8f.59.2025.09.22.23.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 23:45:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 23 Sep 2025 08:45:41 +0200
Message-ID: <20250923064541.865693-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758609944; x=1759214744;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pSKWIJhxoQ5HpNunfKNbWhSM/DcgPX/AMPJ55AdKa94=;
 b=C6biB3SK7U6iLJc8B4XdZzm5kc8UCfnpP1Oymc5o0yXXcfbNBunI0EnFyqNZ0OmLZT
 DypsNniv8u9Rvg4sz42JJFjvX9aT2PI8khsYaDuuc9WCgqbk7RtZRceYeVLGoHziO9DS
 qE/jeSP6nfYO1aDe27Jrh3HWjs+ac5+jqHbpY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=C6biB3SK
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add Dario Binacchi for connman
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c6ff40886fb..8403db636f72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -808,6 +808,7 @@ F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
 F:	package/cmocka/
+F:	package/connman/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
