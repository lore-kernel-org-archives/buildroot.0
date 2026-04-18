Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53651F8DFFF
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 07:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC7A40578;
	Sat, 18 Apr 2026 07:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSA0obWR6h6E; Sat, 18 Apr 2026 07:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17A44054D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776498320;
	bh=erSK59YhTOoOOX38nowNeomWZ0czY5SuKlEDc6hMNRo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QpDB89CMAWAj4T/5JegDM7p0ZgMoIzBZucMmY7iywXT5YsLUVFPCLsrOGjm4l/LHa
	 E9MpF7BgywOR+PMyMO/jdef3Ouz1d5FyJg/mk5aNwaY3fZrb0ob4YorhIJ1ENLvfyn
	 ZO7GBEWeWHqd9cZZ1oToIc8Rpnsatz5MTH20q49ULhZTJbqjbhczCvvNnJan8ePHY8
	 BAPfgtQMR6qqF82A+UCvEqtOjzdNg9cUVcNdGEaZGWSHcdzuj8RhA2zAu+5z383sc3
	 +GrovrMyVYQSI3HjK4po8VB6h/cMrFeyQmRam/KIyZAQoJYSv2wWt3K5XpNN4nvRIq
	 1+BBhXRcyK9bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B17A44054D;
	Sat, 18 Apr 2026 07:45:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE874259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 07:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 930DB40119
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 07:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxV2HPu4N_BJ for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 07:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF530400D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF530400D5
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF530400D5
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 07:45:18 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3585ec417f6so1146691a91.1
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 00:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776498318; x=1777103118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeaplm0qUG0VlN78Zrca9Kcd2QRi5HK/xGT20IargOs=;
 b=LaUKMsaN5ErjlE5e8+du8SK1ZspunkTY56D2qSCFeYLMlxl5Dx+BU3hr3l4Uj9yfBg
 rmp/wjO5c+rhmKMoLh3V4VgrA8BRJdrgamTj/iG99/3Xh5fuU9MjeJHb3aK9SfdaWFkD
 qrmTPD0+ojjvKspZQvlS9O7wh9hWgzw08JXKpBEuvk8Y+6eINAfa4syS1HoBAoGelHPe
 9uMx8fAUiff3CxrjgW3XL3yQjQ8eF9G1VpcDPx6fNQjkWXIQJ2ECQyifJd0wPhHWLo3p
 vCECVYZpGmqwTM/9gcF3YVgbw4O9zs4OLrERtyO+r8tLFnI5uSYJ7zcUVlTZVxzzAYJf
 oC3w==
X-Gm-Message-State: AOJu0YyMiwx9D8lY+TxKqo5j8RHQ7RDW9uhryRQklm/HVbvHmUfz3BU4
 Qc0JRPUN04co0/YCsh+WJ2ISwqbBy5x/++aFWEwP+IwH4HEA1v6cPCTeqGmHlQ==
X-Gm-Gg: AeBDieuhMmmMxJC6X97OFFkitc3RZ6UatLUYLnYDwgdbISmwyGB3KkuB15zE/SQKw/O
 Lp8F+V24Z9FmZENcb2PDh79mxsOIDieumk/rBQaUY1m0zaIhRsCwwEF48Cf3tzsy00yY4vRSiR7
 YPj+k0iA9n/8Nzzqbkh/MKtLzpiY4E5mXOxOyfQEnH9pbtLW2QfxPbwppa4ecD0MJeoMN8cE2cg
 zuLVSa6osDUpgEKbr27GHLjByMX0k44yfa8uO4I7fpGZyZHH+Z+6oBU1is5ITtEiFARCz9iZ+Yo
 SlvXwXX/C+HfwCScXx/6pl6eLOMHIjyZGa3z2w/ft0H1cY3nk/4QpXi1LYVcuhMTJf9weCaju3z
 22Hv4ultNYuDveJTAOmSlCwcSAWiYyLRnht6CztEpzKc7jhgOakL+GkyHlaQUijeI04KRScXE3u
 zW3ka0dhUWuqP6WMwS2Y0t/mJ4mY9KK9nCL8V0ys0bdj1ZNA==
X-Received: by 2002:a17:90b:2c8d:b0:359:84a3:1942 with SMTP id
 98e67ed59e1d1-361402eaf94mr5761245a91.13.1776498317538; 
 Sat, 18 Apr 2026 00:45:17 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36140ff148dsm4071091a91.7.2026.04.18.00.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 00:45:17 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 13:14:57 +0530
Message-ID: <20260418074458.40842-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776498318; x=1777103118; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aeaplm0qUG0VlN78Zrca9Kcd2QRi5HK/xGT20IargOs=;
 b=CCuTo73O27xfskTeRJJwZuZl/W2aKKGF+Mcq7+nMSSCj7/TiRjaShzVNDNlLl0Adc6
 CMSwtROiaWxw4ubqeZIiKnh6kkkLSO81y9IM23kBq+tQn8jwWtRaXNZ3pi6U5CmBVZTC
 aCyS9WoGyz/o92/t6Ov+DzxTKo5Tcbt0s1HiQugAyxHXMjal9OXpSwkKiAO849tIOZkW
 fuDZSlH9PE6FC6owCljXllbwIvUsobfHlZwARtEEfiuHG3NSremLAZVDmv5MlpunIXkH
 v3ypLceBKQ65YA9pYZ4XiuFICJbI3RsYLJkZL/jsVwx/5GnmuLF8/AeT4qWkauj8SNuT
 RoRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CCuTo73O
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.99.6
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

- Fix clang version parser
- FreeBSD: Drop deprecated kf_sock_inpcb, add FreeBSD 15 support
- Linux: Fix kernel version in CFLAGS, handle Linux 6.9 pidfs changes
- Add closefrom_shim fallback for better portability
- Fix C23 build compatibility
- Documentation improvements

https://github.com/lsof-org/lsof/releases/tag/4.99.6

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index e8e2aac1cd..8002080e23 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  90d02ae35cd14341bfb04ce80e0030767476b0fc414a0acb115d49e79b13d56c  lsof-4.99.4.tar.gz
+sha256  2ce65158694e9c44dfc54916f5b843d887763c03128e0a1c77d62ae106537009  lsof-4.99.6.tar.gz
 sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fb2309ae7b..62a4d15d8c 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.99.4
+LSOF_VERSION = 4.99.6
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 LSOF_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
