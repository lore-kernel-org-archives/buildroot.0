Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD205C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D8540015;
	Sat, 13 Jul 2024 14:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0PtXlOoSO7D; Sat, 13 Jul 2024 14:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E36CA416ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E36CA416ED;
	Sat, 13 Jul 2024 14:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E479A1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1D8C606B9
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMGzZf52yCHS for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D435C606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D435C606A7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D435C606A7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:43:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42662d80138so18233925e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720881800; x=1721486600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phH1/1B80YEM66Z7Qf0sOihlOOsNYsJCe2Rxv2TQBNE=;
 b=hcBIU31S7EDZcFQ2G3TA1pSFbQWC9Ktj3zT2/ZFviDx3iZ4if+9vG5opJu1U1BuKcj
 R47thRfhduElateUwsWkeEVdWJq/jZGrGIj46qqzDldO0a/9Bv2NPCBB5MBKAPKW7Ibz
 H5VfPzCyuZLAD3qkKPdjRkRLEohtb8H1OL2gE1Q7UEuGhwr0yoZNhU6CKCVOA9IUQXNK
 wmk9ML+nqzSTqmEVVBiNNWe7dxib9DbD0iNE1bJCLNps7N968glsK840YiSkjv8TAT63
 YYTp+DWb6xuvm5JGHK2oM9KKaHudIhaak4admuOW1oWA+kVzLMXUO2uJ0R/LheNN+aw2
 uUbg==
X-Gm-Message-State: AOJu0YxdZn2+aMb6PsyrtLzvc4Mq38TcfD6xW37g6p6RardPCXvutiux
 f3kzlkcIT7B1pXE3lXtP6b66CTZNwWuwSRWx6PA+Vn9q/0Lc8spYwD6f2zN/2nJny7sSIoqO3cM
 AWjM=
X-Google-Smtp-Source: AGHT+IEALxxVupgXlUsZTCIQxd8muKwtmA7i4pKsA3CRG7oDxOY/Kcn5vxXc+swcwG9P+aYIM7PmrA==
X-Received: by 2002:a7b:c40e:0:b0:426:59f3:d976 with SMTP id
 5b1f17b1804b1-426708fabdemr95092655e9.38.1720881800003; 
 Sat, 13 Jul 2024 07:43:20 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276b14sm57610835e9.23.2024.07.13.07.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:43:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:43:16 +0200
Message-ID: <20240713144316.403640-3-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240713144316.403640-1-arnout@mind.be>
References: <20240713144316.403640-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720881800; x=1721486600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phH1/1B80YEM66Z7Qf0sOihlOOsNYsJCe2Rxv2TQBNE=;
 b=SwYuUABP/+nlPkZW5EU5fuG0i/hdMwxMD9/pBOsjhNNfjR++oRxzQ+jYd61pVfueS2
 HGhh5J8QB8J2v4J7Twtehz8xBBZOYSijz0QJANTl0WjV90TWuo1uDFn3cstyVgBiiZjN
 LAo+ATqW4Fml52ugx6mU7FbNSfbAbCMC8rbnIQBYrkd8x579tESaP3cF8KuETKgUDT8M
 CSHdgiee/Z13iM41BPGpRRKiBrN5/dTekj5AGIeyoALGOWW38pVHfCaucfUJfGjre8om
 T5BLnF9i7nfagIJkUIzM+Gbp7mhkKL/BmLsLs20Rwu7tX3Swu+NtCGkoGC2rKUoRHSoq
 4nVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SwYuUABP
Subject: [Buildroot] [PATCH 3/3] utils/brmake: allow override of MAKE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow to override the 'make' program to use by setting the environment
variable MAKE (which is the standard environment variable used by make
itself).

This makes it possible to use an alternative make binary, or to provide
a wrapper around make. For example, to run the build itself under
docker, you can use:

    MAKE='utils/docker-run make' utils/brmake ...

(Running brmake itself under docker isn't possible because our image
doesn't have unbuffer.)

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/brmake | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/brmake b/utils/brmake
index 70dfb6cdc8..06977cc18d 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -2,6 +2,8 @@
 # (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
 # License: WTFPL, https://spdx.org/licenses/WTFPL.html
 
+MAKE="${MAKE:-make}"
+
 main() {
     local ret start d h m mf
 
@@ -12,7 +14,9 @@ main() {
 
     start=${SECONDS}
 
-    ( exec 2>&1; unbuffer make "${@}"; ) \
+    # We want word splitting of ${MAKE}
+    # shellcheck disable=SC2086
+    ( exec 2>&1; unbuffer ${MAKE} "${@}"; ) \
     > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
