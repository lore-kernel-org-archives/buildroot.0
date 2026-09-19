Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F7FC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 19:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875A840CDA;
	Sat, 19 Sep 2026 19:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvc2iSqBf9Hf; Sat, 19 Sep 2026 19:13:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BF3554078E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789845223;
	b=bV5qCg4zwbTIz69NeHd7YYeQHR98DOGx0sVZ7onKfWAxkY0qeLsxobDvlnw3kEApiWw/
	 G62wXK6WUz70WefWuprO/cDJ+6eFScus4IhTnJLXzflp5xMC7mrhK1d0/iqPD5Qnv3ezI
	 NK5/77ivNuyaG/1qugW47GXfFRmsDzEWgcysH6ufUdUR05b74ct1sYPQvDCCdw0aX77pG
	 SXKiSbFG16VeJlyiewUIsWdt3m50mdFIRyxsEFylKOYD35PHMh05Z8X0JwdQjmZsJZQYS
	 W7XFNdwDQrCQRt8K+TvEcQc23CEjyPXMDDvgTjA3N3DsUGd+SZqahi56trocL3szQow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789845223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3GZoMDn/dI80wo7RwCqmqSx20D8XtRcqgX876NXYhRA=;
	b=NHE4Lh4vPmwoD/2ZWoTYFv4ttkB0LKxYesMDB1wDbmePSV1lge/ERt0n3SsVUrKG61wk
	 WKemDn4p81n3HY6K59gOPqA+9UjmiECTQJApYVf56/K27Gyp3EVReWL5EwL1yq4vUxMsf
	 4xiiW4W0PieVA5m4SE49N4KpGNc5B1rUXTdqVkjTX8sNp9rMFUX4EWHnxnV67bFsFTcUx
	 SpYhY20RrQgfUGIeqXrc31cFDFsqOik3RRFd/ne64CYMMrtIe7y8+SopzH7rVTx+g+GDE
	 rgrhfDBjrVzultavCr/WbeTu+mc8JaYXj2pZW8HeWPr5grgLiTN+ADUut4N/LBrN8Lg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789845223;
	bh=3GZoMDn/dI80wo7RwCqmqSx20D8XtRcqgX876NXYhRA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y+HwKR0BzYAIjbcezTCMwZ/ELeYqVW39phKnHifUt5JnSJJoinH843Rll0+OAlcKu
	 OxKfWdypCFOLranbIDULOlcyu6GT4Zu2Ujcy5DZ+Wg72xPOwCckTVsGLBOjldfGTDY
	 pl9mR8iZ9RZ6u2fJ2xe5FHbvYDpWwvQa95aIXAAtNSWY+YoSj2KGRcv7/eM7sCeSoR
	 z17rx5ooDIcBtjEdnpjFXxHRV1Foe4pcZmP1S8UQ5XKCruUW+qeQDsYHg2ubRSSmvU
	 /2xEmuFi//Cyc2Suq/llhw0klZbdlLXa6+MI7piX6pOaM5yRHt/9aFrIffIbhz5jA6
	 jLPJQo30c2dSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3554078E;
	Sat, 19 Sep 2026 19:13:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3087013D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F1BE4078E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYQl8uxdWGKY for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 19:13:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 517C340746
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789845221;
 b=AlyjzF+PhKsZQm8FN1mmQr8eMyHOn5KVGe+ALF7SJu7NohqbcbJwv1BRRTVy++qwIpji
 NH6pKaJE0JMPyGEyFAoXtdx3O0gTbYZtVA2CGr0gQjjK2f7PA4uGvaCPGIRkY9mKzTFl4
 r2vSb3vnlXoVWpuSTKLBux6NEgtn/L1+fyUNp6um9Q0hN5QVoD1Huu2Gmic21sll5cu3e
 8YWKeScBM8TCoRkLrfcP3hb7U4Ee4GMCts44P5Py2FqKW0DoBCEzZo/8I8NpQDBOo9s/D
 gSSCp5c/fvRe5hsxDoSuDG3Mxgs6h09JBxIdvlZfE7qjwkUOZXASdvbyztdoWLVBWSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789845221;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=j/UaWhIqvJN5xn5BKUIeU71IYmwOacQHw+UEgZBkO6Q=;
 b=q2p72CJus1Om3R3fQrvOh3JV33GrcCcrpuwTJ3eZ+pG1NHn46YdH9msdjkF97agLUM/b
 iuMZLkd14+Te/9kyIyPcqI/9c+1oP54O606AsBAN/WXTOwoIh8P0ZZ2cAmhPwaJF5am5s
 0B7VXL/T34vf0C/AQfCh2lrcKpO2x4FtTt2yaW3QQMdWirodpR8achkP2Z1EMic3Tdn8s
 HI64zhU2vYPPDdfficAiFlIA45grB1ZeOY1M6+wbPN8VCYWgyfvjF97nrE2Hb2uR8u2RM
 2PHc0p3yU+vZWYtM3CDuNy9T4TZJE0X+gEx8iyf143+RossR0omH+BnbcFJZazd/gfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 517C340746
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:13:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60FB48D5E4; Sat, 19 Sep 2026 19:12:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 21:08:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f667c1c2061f70d17298fa53236c18578ee9008c
X-Git-Newrev: 0e27b1d8a47c1c9b36e7c5761299495f9a7e8c19
X-Patchwork-Hint: ignore
Message-Id: <20260919191233.60FB48D5E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e27b1d8a47c1c9b36e7c5761299495f9a7e8c19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The previous version fails to build with Linux 6.13 and newer because
mlinux/moal_main.h includes the removed net/lib80211.h header.

The header was removed by Linux commit 02f220b52670 ("wifi:
ipw2x00/lib80211: move remaining lib80211 into libipw").

The new NXP release skips this obsolete header for kernels newer
than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
compatibility fixes.

Signed-off-by: Antoine Gennart <antoine.gennart@quimesis.be>
[Julien: fix _VERSION to use a tag rather than a branch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nxp-mwifiex/nxp-mwifiex.hash | 2 +-
 package/nxp-mwifiex/nxp-mwifiex.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.hash b/package/nxp-mwifiex/nxp-mwifiex.hash
index 559e89cb37..d7d63040dc 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.hash
+++ b/package/nxp-mwifiex/nxp-mwifiex.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  dcffe6c48babf7db82aac4704b056cffc06a1f80008cd9c23ab0479fc890ba99  nxp-mwifiex-lf-6.6.52_2.2.0.tar.gz
+sha256  7511600dbad34677d2a5fa93e467a3685af96c517169e9fd1e107da679115ef1  nxp-mwifiex-lf-6.18.20-2.0.0.tar.gz
 sha256  67d461bc478d220fcdf99c59d8ea17fffbd1881718281aa4947eb608fcd568bb  LICENSE
diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 46678a2c91..019939d93a 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NXP_MWIFIEX_VERSION = lf-6.6.52_2.2.0
+NXP_MWIFIEX_VERSION = lf-6.18.20-2.0.0
 NXP_MWIFIEX_SITE = $(call github,nxp-imx,mwifiex,$(NXP_MWIFIEX_VERSION))
 NXP_MWIFIEX_LICENSE = GPL-2.0
 NXP_MWIFIEX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
