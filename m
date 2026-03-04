Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52E2EF8FFA
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 15:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6215881241;
	Wed,  4 Mar 2026 15:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrgYXWPh9rq0; Wed,  4 Mar 2026 15:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A509881198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772638387;
	bh=ngsEJ9VctEaIdbVChrSCjPD6U5XnLtt8U5MweGie7iA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IxwIbZEUqhlFG3MCiE9LNvp7wDq+8HyaKFZY5wzWSHftQWrXQZmEGePRlVVTPGYD6
	 wYMG4i7/UYBCdUAmA8dMFZBe+dFI0lEpIMp0cEHPSd591vuD8vSjqwqHGRJ2jrmqXc
	 JmhvUP3AONI5NWcKtKqUExWyMAKx22dblV+0iRaUEbBVX58mXRKGjQyFYGeCkKrjpt
	 5Yqvfjv9uiM9Phuksd3QxvyQf8mG607v/K1JN8uG01rWC3sTI8ugUiQe/eNjgqFhN6
	 UNu7MYBNXh3m4mz+wn451icuoNnAVqa2hHUU0UWVSwZHZBiYGf5zilSrL+UegMktBo
	 Q7hrXVhOUvYjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A509881198;
	Wed,  4 Mar 2026 15:33:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E64142F2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8E75607F5
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSd9Mfz_QNDq for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 15:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3BC96079F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BC96079F
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3BC96079F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 15:33:04 +0000 (UTC)
Received: from obsidian.. ([76.137.204.246]) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 624FMhpe001587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 4 Mar 2026 07:22:44 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Mar 2026 07:22:15 -0800
Message-ID: <20260304152217.2784536-1-sen@hastings.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVaauN7sf0zzl1wZsjevHkct5Fqbpmkl1Uiz4ccCbTK5iWPXzc5nU5aTUhRg3aM3fFbCwAYbUVwJRsEuzmtUvAPP
X-Sonic-ID: C;SOS//d0X8RGRwKIf40Rrfg== M;No7w/d0X8RGRwKIf40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 0/2] add mediamtx and hls.js
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

This patch series adds mediamtx along with hls.js, a required dependency.
Please take a hard look at this patch series as it's my first time adding
packages and I want to make sure my ettiquete surrounding host packages
and javacript libraries is correct. Also, I'm not entirely certain my
categorization is correct, I'm never quite sure whether to place
multimedia-serving type packages under networking or multimedia.

Signed-off-by: Sen Hastings <sen@hastings.org>

Sen Hastings (2):
  package/hls_js: add hls.js
  package/mediamtx: add mediamtx

 DEVELOPERS                     |  2 ++
 package/Config.in              |  2 ++
 package/hls_js/Config.in       |  7 +++++++
 package/hls_js/Config.in.host  |  7 +++++++
 package/hls_js/hls_js.hash     |  3 +++
 package/hls_js/hls_js.mk       | 25 +++++++++++++++++++++++++
 package/hls_js/host-hls_js.mk  | 19 +++++++++++++++++++
 package/mediamtx/Config.in     |  9 +++++++++
 package/mediamtx/mediamtx.hash |  3 +++
 package/mediamtx/mediamtx.mk   | 20 ++++++++++++++++++++
 10 files changed, 97 insertions(+)
 create mode 100644 package/hls_js/Config.in
 create mode 100644 package/hls_js/Config.in.host
 create mode 100644 package/hls_js/hls_js.hash
 create mode 100644 package/hls_js/hls_js.mk
 create mode 100644 package/hls_js/host-hls_js.mk
 create mode 100644 package/mediamtx/Config.in
 create mode 100644 package/mediamtx/mediamtx.hash
 create mode 100644 package/mediamtx/mediamtx.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
