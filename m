Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E8CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 08:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A4682531;
	Sun, 21 Aug 2022 08:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14A4682531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKL6vs0KybQh; Sun, 21 Aug 2022 08:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5524824EF;
	Sun, 21 Aug 2022 08:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5524824EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1DF41BF28D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 08:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AAFD409E6
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 08:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AAFD409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCB1CBPy7pBh for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 08:41:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BD44409BE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BD44409BE
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:41:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k9so9796405wri.0
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 01:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=6xpg72ueMTqCr0ZRKWi+Skww1ThJEGneFkKuuqGa3Ec=;
 b=YY+2jQ6Sl61r7BlSh3XmJ9CRkH+n8NlVDwAjkxx+vGXAi+zaRBKzGgvGdNlh1zDS7G
 3ZKIiviBG3cm1XMUlgDt0vxIpCxRHewfU9heSh7wRiRqVi/VFTkehSrqQ035yQyMC1nT
 6GVxKNZK902wZxRlBVBHqfkLM/Gjt07nCSLkewPLzvFkCBw6zzTN2xwM/w8QBwNy+jLn
 z7cLsx3uJShuMYgxFEo24Nz29Mv9XyoJfHlkzZrwTH5Xv2D0YRpKDIjA6+wugapi/bJh
 q0YH7o3YqZogZ7nvtunTliCrRYA1NDaQDbegdv9l5xz+8dB0hm3VdLjRZfI/sIIWioug
 n79Q==
X-Gm-Message-State: ACgBeo0WSupbVh8cbecYPkZ8+dTRyy1AD7A0MjYE6FCDNyn48LmLk1s7
 Nme/FN/DGcCgZYNs6v5vwF3SnZesdFI=
X-Google-Smtp-Source: AA6agR7fWtagV6s9LMuEtCgqXwTUX3w1Ft+betlg5tQC3rAFcxYrfAssO9v5rhmty/k+1Z/qwhdBGw==
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id
 l1-20020adffe81000000b0021a3574ec8emr8371994wrr.410.1661071287098; 
 Sun, 21 Aug 2022 01:41:27 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 by smtp.gmail.com with ESMTPSA id
 g8-20020adfe408000000b0021b956da1dcsm8422302wrm.113.2022.08.21.01.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 01:41:26 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 10:41:25 +0200
Message-Id: <cover.1661071280.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=6xpg72ueMTqCr0ZRKWi+Skww1ThJEGneFkKuuqGa3Ec=;
 b=TrpPYlsUnFcxyG2VjbplnRO8BEADoGBI8PEkdiFEpBUjh5756DKp5u/XXLUJd7iQWa
 NXG4IbTXaHBKgMqpmUKKtaVTX+1/wujdU9GyYEm6+eVuV48XTJssPIPexqeCvlryAJjq
 1VwK6YKP5sBJ9g4lgDZQvuD7S3JkWCPziKZh1aG38oB51M1ouYO99+v4s8a7qe8Y+dnT
 C+l59jChXhkflt+m2L+LGiVdBjjT89uC6YmR5SeUG0lKnRT8rbTUBtpbr68BPav7Mr22
 5t7aaTCmNucH2DzCBoTXlwYx5fZyzcUsM6sKH6QR95a2q3iaWLgiZuB/PNmYZS3uLLD5
 TruQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TrpPYlsU
Subject: [Buildroot] [PATCH 0/2] utils/genrandconfig: fix host-glibc version
 check (branch yem/gerandconfig-fixups)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This two-patch series does what it says on the tin, and ensures such
issues are easier to debug in the future.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      utils/genrandconfig: fix checking host glibc version
      utils/genrandconfig: dump traceback for unhandled exceptions

 utils/genrandconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
