Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A98CFB421
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775CB60681;
	Sat,  5 Oct 2024 16:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyktXa0ZEwtL; Sat,  5 Oct 2024 16:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7554E60686
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7554E60686;
	Sat,  5 Oct 2024 16:59:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6A71BF29C
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1AE04026A
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aH4ffXgZg5S for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 16:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3F33401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F33401F6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F33401F6
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 16:59:04 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82cdc21b5d8so169029439f.3
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 09:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728147544; x=1728752344;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EkaGp+xh6rexWnvGVrQ9jc19GilcIW+eOh2LL1uzONU=;
 b=g1diHMvjemZ/OYRkEPK3R1krcTcAgAzE+8OZmr47kIeXLgW3n1tRd7JoNAB9VsMoD4
 0tmsqJUo8iL6m1Zp+RaKymAffpPVsdQBadZAjWgud793ecW5lKCHGRAAB/wFCuoFPmaj
 sVmrflG8V6IycBFyDh9wp4zMbcK8QSboTxY5dK0LMahPvtbngKWn82AUDIb7MnvdwEaR
 fLZSlvu/6rNQbK/8ISGkofYrx2kUEJ6mRS9V0WO+WEIvI1BDqhp9NCxEVbE6r/+ou3xB
 v5t44rIx+GGWbeQhYu6QRyCJMeo+Ja9dlm5tONxGxvLThhz2rjT4xSG2fkkds/U6Tlq/
 6H9w==
X-Gm-Message-State: AOJu0YzQVUIA6Oxd3V9QsXZywhyHzr+8KA8XMxJKbmIS8oVBbMJGw1BW
 TRC+5hUwz/Bq5TXrkbfg5IFRH2sboyEZVyvlvrjy43f2b9B2YQ3rel0e6V9f
X-Google-Smtp-Source: AGHT+IEDG6IClNZPNQCGLT3iR60idDia3+5N2j44aDKXlawnJu5qdz9IapHW8vIUHIp+ul1dQVhv7w==
X-Received: by 2002:a05:6602:2c0d:b0:834:f6e5:3e90 with SMTP id
 ca18e2360f4ac-834f7c84691mr706992339f.7.1728147543462; 
 Sat, 05 Oct 2024 09:59:03 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503b306d2sm48134539f.55.2024.10.05.09.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 09:59:02 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 05 Oct 2024 11:58:43 -0500
Message-Id: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728147544; x=1728752344; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EkaGp+xh6rexWnvGVrQ9jc19GilcIW+eOh2LL1uzONU=;
 b=ewsCMImef8mNYSndycJxRqG4gEx9xw2VDddXa4bKnbJRDdiZdEBNNloeu7ekyQfLG5
 yrYtqlF6XPK0GfO0NrEM2yfxNTg6o9ld13cXQaRlX5ESUFQF0BT7npVKu8K5BRYNzApN
 rMTslSHbuSZdK/dawKtDJx9ensYk4vxMJyQtWlQntR147o57yVcHLfRrYOD54vZgSFMm
 JLXSo1GnoqqBVRVwsjXHqPQ90/ytg+B/RXzCKDnf9O/XAaXo6hgJs4m17RbpQsEsnujn
 T+rXFTER7rd6WpGwzOGDbqexi2mGXLF7AZSYHioyKMupVAZzU7QEu1dbCY4jebGVpxqt
 HMFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ewsCMIme
Subject: [Buildroot] [PATCH RESEND 0/2] package/dtc: add tests and update to
 1.7.1
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
Cc: Brandon Maier <brandon.maier@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
Brandon Maier (2):
      support/testing: add new test for dtc
      package/dtc: update to dtc 1.7.1

 package/dtc/dtc.hash                               |  2 +-
 package/dtc/dtc.mk                                 |  2 +-
 support/testing/tests/package/test_dtc.py          | 40 ++++++++++++++++++
 .../package/test_dtc/rootfs-overlay/test_tree1.dts | 48 ++++++++++++++++++++++
 4 files changed, 90 insertions(+), 2 deletions(-)
---
base-commit: 09964bc5c0f8b329cda6383a1297029354269da9
change-id: 20241001-dtc-1-7-1-e4951ec624ca

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
