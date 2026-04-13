Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8DEF34C5C
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 242A784495;
	Mon, 13 Apr 2026 15:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsqb0BMdJ0Ba; Mon, 13 Apr 2026 15:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43691844CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776093165;
	bh=OV+dQRwjt+3bpY3uHBGyQMa34YeNYL2lcAiIM64E/qU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XYl7B1hM8e0U8E/Xt1+wD2ZGUKqXEdIjoUI3FmGwDhseLfXCsgsaPdWJ7QOBX6FTf
	 +NF9M81WQlviRCp5mLl1zBDDl+EIycY9r6atNvsPq1araWKPxgv+cHqfovR3iSBH8R
	 pqwApIxFEnCJTHEJGGFNDnFj0qKO7khhONQ818jLiWdaiFT35jnVbrvGT1cSQRFVRB
	 /ED7G5zyB1xWDGGxDDJ9lxJOAtIBEVTUTonjowaO0EEmXI7EYXCBzVPBD84zOooyu5
	 ZgMIfkqe7eh2L4rk7Bc6S1ErwyNF36CGL/Y99jFe9ewGP3ppWz4XcfzAOIQUmzMDKc
	 Zvt+kuv5U8h8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43691844CA;
	Mon, 13 Apr 2026 15:12:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 056AA283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEC1F42295
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcdHLLr-LaSx for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 15:12:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA6064228D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6064228D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA6064228D
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 15:12:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d73352cf2so1127817f8f.1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776093161; x=1776697961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rio6YVwE24J696vuLJbkrOCDyVciXO0hX+HamZ4X2ks=;
 b=nzQq0VC/eXLqXPua7Pz77JPdpW/QQYdwvg9UOPEhLtDregW7/imPMaPBhnk6v6svIU
 rAkBp6DsC2j6eqOfF0GvgffS4F21Gc/WB/xxTZx54h3yDdZ28iAs9GmWNUQxp2NN8Wqp
 RJWvvNco3nq1K7P/63caBuiYUCb9ucJSZ8HMBw1uS/PcgyXYJKdvGH8ddbsJ+q5P/rqY
 NyMoedf3hNMldgX8DedadglziSGgP33QqIy4Ax9mvXs1ZIslHgZt0YnprORENwnBPMnq
 gtn1TSZVVK57cJUZOBwArr5g7HHC06Hji3k67AiYyOYlXke7MY4ws85Yv/lQtD+0cLG+
 5uCw==
X-Gm-Message-State: AOJu0YxfhaPjp5UsxYJ8VVt5C7VxpPHBiCbeNVPKBx0rEz2UQkQ+3yxv
 7mThCXLWzb+v31E8xYz/Oj2PjC7RuYcEpSCm3QruDdZC+jPAG1O71jSTRBC9Yw==
X-Gm-Gg: AeBDievMNrB60GwRR7ylLD2zbsfAmdStjym3RrURDkJIE7Hc4Na3FehpamQ8wOMXXOI
 xfC/X647ERNMAuDSYq7EnMGBX9e0KX6vVLmSjyCEhU10PaiYErhZhjVmHmFdjBllwqbPfkKUshs
 embG08phQj/qoLNGf+vdgBD9CL89MH7Bn1eumLVWmX1razC5fBfKOXJIfgMkYWvc70Rcgny4A2l
 kbtz0gJWEKdJTgNgfa6DnjuEcFTgxznva7Lb2ndEWSA474mRvsj+ojT+hQIlDb4+sMZHwJhgEzE
 EVsyymgL6C5xR/uz6JQmps0Hw+T3vo4ryAqWfRwlooYkFLFb9q0fMlTAbbGDSpQGfC0Ike6aMYE
 SX71O9+RPdfEsP/jzIcuNjtRKMEAtQWzEp9KAvfjKFk3GTLDNIeygykSamZie4a8MuzrzcOMnBq
 kku36mwrkVjyoWLE5z
X-Received: by 2002:a05:6000:250e:b0:43d:77e1:6a69 with SMTP id
 ffacd0b85a97d-43d77e16af9mr6507840f8f.38.1776093160494; 
 Mon, 13 Apr 2026 08:12:40 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:e29d:2bc5:1d06:3359])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d73b44b3esm16572267f8f.13.2026.04.13.08.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 08:12:38 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Vincent Jardin <vjardin@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 13 Apr 2026 17:11:45 +0200
Message-ID: <20260413151148.42226-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776093161; x=1776697961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=rio6YVwE24J696vuLJbkrOCDyVciXO0hX+HamZ4X2ks=;
 b=jMEwVRGCGieKfIZ3fVk3Bm+CvbxYeaoieeqootZd5pHBYZhCTxIYsWXb7S/WxzKglB
 2Ps3ljammv+ym5zGNRcfPQNJDIynrnZsRDi2SUPDzU/ScX5nUqaNj+X+CFNhXLKBLjeq
 CaKWsSzJioZOIKu7SXQEtjdYoPDMaeeCmvO6eBjn/oOTrvrJlX4DscyoOn6eWDGJM0ly
 +AgFscmNyWlfWFBBiY0nZC+SS5JhYuB7VsP85N3HBC/wzHujqSjPMLv4fEO4KQtU5RUR
 DPQLvjB47/YWIxv+e7hRJ5zCDwp/etBww0zUp0vY/B0NzyI1Jpx2wmD0Y94LiZuTT7I5
 9/sQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jMEwVRGC
Subject: [Buildroot] [PATCH 0/3] Bump libecoli and grout;
 DPDK packaging improvement
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

This patch series updates the libecoli and grout packages in Buildroot
and adds a new option to the DPDK package.

Summary of changes:
 - libecoli is bumped to version 0.11.3
 - grout is bumped to version 0.15.0
 - A new DPDK option allows disabling target installation, which is
   useful when a DPDK application is statically linked against DPDK
   libraries

Tested in GitLab CI:
  - https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2449432442

Maxime Leroy (3):
  package/libecoli: bump version to 0.11.3
  package/dpdk: add option to disable target installation
  package/grout: bump version to 0.15.0

 package/dpdk/Config.in         | 13 +++++++++++++
 package/dpdk/dpdk.mk           |  6 ++++++
 package/grout/Config.in        | 10 ++++------
 package/grout/grout.hash       |  2 +-
 package/grout/grout.mk         |  5 ++---
 package/libecoli/libecoli.hash |  2 +-
 package/libecoli/libecoli.mk   |  2 +-
 7 files changed, 28 insertions(+), 12 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
