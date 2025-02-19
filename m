Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9890C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 22:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA188354D;
	Wed, 19 Feb 2025 22:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isyMZ2RiFs73; Wed, 19 Feb 2025 22:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A8A8835A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A8A8835A3;
	Wed, 19 Feb 2025 22:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78C89CF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6606540D8D
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUqFbZE3AkQS for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 22:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11B9D40D95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B9D40D95
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11B9D40D95
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso883744f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740003032; x=1740607832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnFM6jdTbOJe3M+XaycMuARL41wYJFqCluI7HKufqGQ=;
 b=HZldLd6+cQBw85tOnjvO7EIiUrWHU9Q8+EvdrOHLmUoESQRKShUnSnHz2bGr1mo0Gj
 n4FXAVorjBUNsEUZZmwusPnLvW7bafhDLXlEETktxa0ryF8PKvTuZSIQ+9ncl4uTiJJl
 8Iv9DuXmHM98TDIg3ItRl8Nigann1J8fD+SsJHCkdwqAHIQZM/N1CQh1fW04SBORsnBf
 xyuBDgw8gqkyb8FTYJgTcoIH1dZyyOzfywo6xFEHOVR18govcjvMje6Bqv041y21AU9/
 /1YxaD1gMr85rmwJ+YgRXfXC8oB7ClYODupeV4a3oA2It7ukblziANQxjWGdFj4Jvq77
 MA/A==
X-Gm-Message-State: AOJu0YzHu+HbIJFPupBYwzmDtmEjZTmEnHzlIoqZQUu+9A/uskaN62ZP
 4V99oJvckdm91X2mR+nh3FsUlUhbwRykNFj+oVskhXN98koxe+MFBqvt8Q==
X-Gm-Gg: ASbGncudB2uS0UU52pitHrc2JxUk3Xs7k8Rw2uEtuV2ymKJtBczE9+6+NNAJ+JAm1O6
 cuFhJ/WUtTpRJljtgRqcmbBQcfwWVF3TH+sZy43NCA3WDMhb6kKlh+0ABY8yDYDMwa3KJJHc8uI
 JLlj4Uelgx1+/OqancVKKvQ5A/o2pJGmb0rQ5HYpUmKoLXHeL7HQIavfNMGwqu0ogHbVXSUeGcN
 ysjTTXVI0HkA8ErmLZ9KH0iwGx9nWaoFjAadt0xWYOo55wpx3VcKEWAfOniEi4pyxWEn0P8uWDC
 eD3hI3cxqRVUetV1mUP89W1//w==
X-Google-Smtp-Source: AGHT+IEMKV8YC3/dRl173DiwmBg4B9niu+tFjgmLzaQ95VTXHwn9OifUALBe0guRdN5yHkzv8lVvYA==
X-Received: by 2002:a5d:648c:0:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-38f614aef77mr669213f8f.5.1740003032195; 
 Wed, 19 Feb 2025 14:10:32 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8217sm19194696f8f.90.2025.02.19.14.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 14:10:31 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Scott Fan <fancp2007@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 23:10:30 +0100
Message-ID: <cover.1740003029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740003032; x=1740607832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=UnFM6jdTbOJe3M+XaycMuARL41wYJFqCluI7HKufqGQ=;
 b=Pw8dslqtted0/Dv440BGWsMZlXQGKhE/Fx/zaCg2Q18bpPz3Ahgg0vGMBbDPgiy0ua
 j7jjDoU1LM21zYAzhXNjaz8aSZ8ulVBmq9T7UFLC0qhDGBlhwj5xVE7EjRHv1aGYQdOA
 0EgQfzDLBXacN9GYbcm1XiSrdeEtYrNp1Lt5h9ZZ8laGjOxfHTeVqq1xgP2mzsNo9NL6
 Rood9Ayf8JRnWLHaJbGvQSNaCVMk8VZj5npVYKTrw/uzzaUA+yoN9+yy2ciurXxJzIJb
 /KHTrj5m5ExPM7tli1yzBsSOMi4ayek9WwOSIlqYys3PRb4pQeFuW/CWAOEqb0sDXBex
 e95g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pw8dslqt
Subject: [Buildroot] [PATCH 0/4] package/sqlite: revert bump to 3.49.0
 (branch yem/sqlite-revert)
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

Hello All!

There are a few regressions left in sqlite, that are not trivial to fix.
As the next release is nearing due date, lets play it safe and just
revert. There are details of the remaining issues in the last commit of
the series, so they are not going to be repeated here.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (4):
      Revert "package/sqlite: fix build issue if C++ is not enabled since bump to 3.49.0"
      Revert "package/sqlite: fix configure options for readline/editline support"
      Revert "package/sqlite: fix build issue since bump to 3.49.0"
      Revert "package/sqlite: bump version to 3.49.0"

 package/sqlite/sqlite.hash |  2 +-
 package/sqlite/sqlite.mk   | 96 ++++++++++++++++------------------------------
 2 files changed, 33 insertions(+), 65 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
