Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC088CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 15:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA394115B;
	Thu, 14 Aug 2025 15:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoRjHsjOU6LF; Thu, 14 Aug 2025 15:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56C640E84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C56C640E84;
	Thu, 14 Aug 2025 15:33:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2314D1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15632407B3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vf2Alms9Wdb for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EF8940D51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EF8940D51
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EF8940D51
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7a0550cso181906266b.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185602; x=1755790402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT8MvWsy5P59IqKvZtPcHmV5Q2HyVsjBIgeB0M1+FgE=;
 b=QPhFGpeg6GZFZlrxi2uWsMHYzIl87O6HNr/t3DEg/VeW2Js0463yvPB/+SuU6sG4iS
 GuWmB5Pt/+Hz7VFkNntVFoeRnCrm4Q7UwAIoXXwIvXq0Yna/5uivHRUP9ZnDg1qUPzuj
 L6kZwPy82gTm8ajQDldHpzRULGYVog0Yg4d03oQ7+Hs9ge9PUOQlJHYVstiQD755vn2+
 Z8KnInRGXuAGrnDubMw4fTmwep/BSRphZplA4QGO/ii2i7Xn2Drbd2O/hkLQz95jqSkD
 Ku3sEOdpNjiCfTcvt7SfdsjhfBEAeQkfiGvZjoTStk9322Y0UeyZvsZ5z4Lm4jkVUcQO
 rafw==
X-Gm-Message-State: AOJu0YyLOWzdKizWqwBdZu1KMll1WTIL/cdi7EsTa9L57n5JzcqR7nf0
 sgKoXMjgKXfpq7RtPfoxCWmV1fUaSBxscno0BYptYsHxtk/nFzrQhf3L1WNWJB11knWgjtFSpX6
 UUB1HPNc=
X-Gm-Gg: ASbGncttk2DYMEKgZkzTM9hmcwMncNCCC7qFX2gHA6SRgYKiUgixwI5dsxetTEoNtws
 uisMlWU2TuepjU0JW0cn2mSpbeyQBiSMxkvYbUd23XZva0qKsVh9UXbCkGxatgU5dFP65TY8iyT
 +6zw3qEugzGHVOTn62tQFNtb4LogWm1ESCTPWp/aIVJ1OspmMdPkVqIBlNg2/FvQA13w3IWi4um
 VelmBTBKlemPK5owi5t9sBZgg+kFs1xEd4VIfltaayH5lV/RRxtBmd23fKcEgtZVZQjx51C6ih5
 fYcNLy8SFtHGPFv16EctV3auvSkBoUAh4KhFLdtqsaDhS0e5QMsHnoL7EhV1vUAzNttArtP29RQ
 IgK1YQFwTeS1sDUraQksk3xZ9FqUxcut0i22QIFV7CZ0sh+SujIN2X3p25FDCjuDcoyY7M6XmHn
 ti
X-Google-Smtp-Source: AGHT+IHEOXmI9YKIWEbIVsmC+DKVulTY2R2TRT0W+DBKIa61lli7Jq3YoZhNifqC0OK3zTUYU2s0pA==
X-Received: by 2002:a17:907:3e8b:b0:ae0:b7c8:d735 with SMTP id
 a640c23a62f3a-afcbe212092mr292761266b.42.1755185601815; 
 Thu, 14 Aug 2025 08:33:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:9b30:e43:d6cd:c58f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2561928966b.101.2025.08.14.08.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 08:33:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 17:32:56 +0200
Message-ID: <20250814153259.6822-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755185602; x=1755790402;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JT8MvWsy5P59IqKvZtPcHmV5Q2HyVsjBIgeB0M1+FgE=;
 b=K86UB/yfDN0rqbx76t6/Adt/GT7LpnghrbNxmwhTgm5Qw28WlD2mwVHWaUGzH+aiwc
 n/o5RkvlWeghdiLRFrzrSi6l9fG18c+97S1wwOLoNF8jRblxp53OP2jyfao0zAg3d6l5
 Qqc4vLlc72XB6lkvaaj+tE7KrQNmdB3KoVGKo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=K86UB/yf
Subject: [Buildroot] [RFC v3 2/5] package/qwt: bump to version 6.3.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index d4fd210cbd69..e20c9ebadab9 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
-md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
-sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
+md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
+sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
 
 # Locally computed
-sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
+sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f6f..67292ee025be 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.6
+QWT_VERSION = 6.3.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
