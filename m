Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C0E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423AB40815;
	Tue, 30 Dec 2025 11:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQRoEQUMoiCW; Tue, 30 Dec 2025 11:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F5040839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095320;
	bh=cdk3uyR2tN09eHNwm5Rjl3np1xeRHzRNyTR1wAmWovo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lnl+4aCakt6RC8X2SZqG1Kaxs5SlWma1aaY4ao2Gw9rEVUbc21CgNnNRVs40tFvKy
	 AN7qdEqdTyp8dBzwcslbEdmEaoOVPIhuiTRYCb/W5nEh8Po3pyQvIfPo+RC6YX3E+H
	 PdLgHi7xq3Wf14sx1CN0/xavrjbcpQO0Okyz8/vXutDxBxw0EWrATEd2V9Yb1VFMXp
	 Ue+qArIRSSVlQlUv1Evqk5LKiMKwvKkXhHCsgTxZjF+wmVQFoFRVQ/dI30ztYLePa8
	 W5TaFLrS9NJ4Ick40ZJxs2UFGhQJa6fTDAAd5f3nWDFSlIb0jMW/yt9pcVwHCYJ5Hi
	 9S7nUYs2B/oQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F5040839;
	Tue, 30 Dec 2025 11:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A6AD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC2964030E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvlxmIugm9hO for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C879D400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C879D400A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C879D400A1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D84EA4C2AA1;
 Tue, 30 Dec 2025 12:46:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBM-000000003Vt-0Sxo;
 Tue, 30 Dec 2025 11:46:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:34 +0100
Message-ID: <20251230114545.2236640-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095199;
 bh=7Aag5+7VYWixr8uut6I5+10hYWlRm5sJRYNWQLveGuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CT/Vj/2EC3jbvYF20ml7yWDDDdsFlFMSNlexECIKH7gs1CLC8aQ79HTs76nS6r7eJ
 VFqWLyZ4+Hi+1i+RKJHl97+sSSRtKebwAl5CgUySX65mTelWEhnioL6amLuKKhVtbe
 rlL5lxR20oEs9T+Yn2F5N957NH7LFSzTdK/jpqzvNjSY5wyOJmGogLaEKZKRnpjbw7
 c8VYuFqR5JHiWsxOiPfRStXZi4903JRYmBV0/4duvqJtnP4v0qa+bKWjqo0jk0aobz
 Jqm53haHbOxJnryiupevOC5pmr3NWmgsom0w23FLnDHdIR6LqUflCwKtw4hof0dCRT
 w/gyAOTYflERA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CT/Vj/2E
Subject: [Buildroot] [PATCH v9 13/19] package/gtkiostream: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gtkiostream/gtkiostream.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index c748c7a000..250e47a0a4 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -47,10 +47,6 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 GTKIOSTREAM_DEPENDENCIES += libwebsockets
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-GTKIOSTREAM_DEPENDENCIES += opencv3
-endif
-
 ifeq ($(BR2_PACKAGE_SOX),y)
 GTKIOSTREAM_DEPENDENCIES += sox
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
