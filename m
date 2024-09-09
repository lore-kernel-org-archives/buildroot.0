Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F514ECE581
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DD8810BA;
	Mon,  9 Sep 2024 16:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV-WDerTpNX1; Mon,  9 Sep 2024 16:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B695D81027
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B695D81027;
	Mon,  9 Sep 2024 16:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 202021BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D93C80EBA
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEgQtiaBthZp for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9D9B80D84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D9B80D84
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9D9B80D84
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso7970305e9.0
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899279; x=1726504079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3GN+4Jp5T6WBfug5EQprV2Cv1HRs5214DS/lHYgI5I=;
 b=tgEHZIyW9B7wzd/VTbRK1qL/79TkZCdhbwXOQBcQ/SmSQZBDSNetOdnScBtnTAQBUw
 xiiC/3wKPkEfR9jbgiyB9yZLcSrn0mfKG2F9zDNyc5+8C7POyo+K3ACqlRbxk8uGvZFd
 jiOyXWalTItpEhH/NOiPBJecaOXo9WELZIa+RQB3Yih76Wi/xyIDcCfa8vp+23654gUy
 r7v/btIt8KtOaLl9wDSXZCc6Ktg47c5HoxGbRYsNRWoouZi7T/pcTdLCzlJ1SwpilIXY
 igbtUCMvZZoOVt5TJqArpyABixxkv7/tvcVEbc37Rcoqj9tLIOmI++wyJuDp9N8O0RBA
 TIuw==
X-Gm-Message-State: AOJu0YzVh6IOrn0UTG3jp5ZUZffsDaEGhfMbZxVsAtRAmtCFkoUDidp2
 m5wt0eSeB0wjvX0q1JUIy8UYs7U55bmPumh9Ub9XfApIOxPrt02LkWwKzjb/iYMQA+tRoGDL+Xj
 fsA==
X-Google-Smtp-Source: AGHT+IFjF0mONk1gwDAAW6vowmA2bo/4fFKw7a5/1OQ/FvDseNJIP7VixFXk+Q5hf0sxqulMLecONA==
X-Received: by 2002:a05:600c:1553:b0:42c:b603:422 with SMTP id
 5b1f17b1804b1-42cbddd70abmr1285385e9.8.1725899278685; 
 Mon, 09 Sep 2024 09:27:58 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:58 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:54 +0200
Message-ID: <20240909162703.3439481-12-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899279; x=1726504079; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3GN+4Jp5T6WBfug5EQprV2Cv1HRs5214DS/lHYgI5I=;
 b=g+tSyZcdZk/UQiGe2Y9LnuD+HXv0IWm32J016S8ZgJAATYb5yBuXTSQ7z92iLF4EiE
 A2FC9Ke1S2tFuZ/E3PLEVTdXG2PW5rXrM4QB+6948MNb+W4OgYOH9jQCeB5jd5Oj38As
 zrb3vePlHhzw41WKViG/enwmF+PJEXKItpdWE9ET6SwNSJqqKP41rzWR9kFBtXjtimKO
 kwc00MCJgBkGUiuYXqVPisepF7O1KpcueI3KrzZqj+KmI11ETpmK8ChHaJmHt1M4JPWH
 n/c1k6juZzxjZ7fndb11bqzShmKm32e15sYszKGKuEozaTCdNfKLE/kCc8UnSTNztDQD
 6uyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=g+tSyZcd
Subject: [Buildroot] [PATCH 12/20] package/perl-path-tiny: bump to version
 0.146
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-path-tiny/perl-path-tiny.hash | 6 +++---
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 7874846b8..c0f1952c0 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  7b2fc4f5edfd29b88d2cc3b96830e7d1  Path-Tiny-0.144.tar.gz
-sha256  f6ea094ece845c952a02c2789332579354de8d410a707f9b7045bd241206487d  Path-Tiny-0.144.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  656d3556bb7f30c77d0881d564e200b2  Path-Tiny-0.146.tar.gz
+sha256  861ef09bca68254e9ab24337bb6ec9d58593a792e9d68a27ee6bec2150f06741  Path-Tiny-0.146.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 6d784a0d1..5f1078425 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.144
+PERL_PATH_TINY_VERSION = 0.146
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
