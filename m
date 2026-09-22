Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6C9C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 11:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D413A60797;
	Tue, 22 Sep 2026 11:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sqp6_zHmZKM4; Tue, 22 Sep 2026 11:46:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F28EE60793
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790077611;
	b=C0NuauM05gb4LJxJ6DMomruU8MrjhMEOJwkyrimR3hUPnRTV6sV9zLWxCkXhIsSipx1+
	 xio6EEzKJGN6ybraoQmXunJem8lo8G3/wWfGYyTWUFiv3nK1NJHVJJGbbitJMKkdeY3dR
	 xnunPrtlL9H/MwWAYjH2vYad5q2hzHsxER+oeow013Q4ZQDQ6CPKQjRnmnPqqLA25y/0T
	 90V/dXkzWI2GzZ3kCpfw2iLCf42j+BDxhTrvoBkgpTt1mcW9i6mZMm+LvlzUL+WVRBNLr
	 9FcJMeFH4T1fFN5BwsAX4xZhnp422iMIM28V3u0lRj5MpmeEbk8Nk+VT8v1GyZFqSig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790077611;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QSgvpbgMdsGp7T0rHazj2Dyf0lJXCI3VsP2FiUrQi60=;
	b=TJ+OkhsoW5kUuwIc/IQYY7R4awBg5AKOII3OcHaf0lMIFbWKDgzAM6mmEIes42H6V7jm
	 lgD3Gd/y9S360XZTRQTc/nHKuymhWkCHUkw2pu9ccWjU319Qt5fi9nZKEb3uwZm2m96EY
	 dC9CAAskm/NmU2LygyEw+o/o6DKvukPWV1Wd0F85jKt4pAuySvxo40NmXBnxN1V8Hz6yu
	 +vIFhWwIwcJCIJz0DtAPvSJfx0vhJBHG8UQOGlRFWdZBJQIo/oTdz0omspMHlz6hwj4QX
	 /R9y9WIzQFGvxsTRMLiR8Sy/Hg6QOJLEcD7YNAzROFn9e1xHASlFuk2TzRyjtVjNfvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790077611;
	bh=QSgvpbgMdsGp7T0rHazj2Dyf0lJXCI3VsP2FiUrQi60=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E3UtCLGnuSFz6rtRl3eY8f09XkUNsiq/OesjFjpHaPG4NNY6BI09JYhNvl4nljtCF
	 mx7bFB85EuEM5PzQOpoj8LxdDJ12fDGoMLhoyB/1QIOqlwLHTj0kuVOMEq5wp3keZq
	 VakjfnCxSpTqD4A8wLtyvS/GFCS8SDlw5VazC8CGGPHi+x8Dc2ORhOdvWdfXraKPOx
	 WT/gwYbeT+TyvtRMPDtfa9T4stbxTGqIavU6ukW1CKUW42+vYW1cbt1p4WBs/Y3h1m
	 xt8Hq8ZiaJy9cXlxPTiNWunRe8SH3Il7fjwuGC2+YN0oF5+sjO+vZJiKLcmd0gA8gq
	 s50XOO55sPkMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F28EE60793;
	Tue, 22 Sep 2026 11:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7979D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 811BE407F2
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WURtZsaHQoMI for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 11:46:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5A29640778
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790077609;
 b=MvwdVRVE05PWkf1w3E0HG6M8mx7rGVFWWK4zkHlGOft7YGpS8VLCUmetd1Fb8lSXSrkr
 /2twKoO4No3ecslM1oXqICG2dbN7iDrZU35pVWuXBPsPKxUAk8NKqNDfAlNTAOsa6aXnS
 8xqIq4e1TRrAcUOZF/Fvnj4OXxN3odqsASQ1R3f6/IPAHR9w/wXTBS1IDxA5g9GeKmljP
 CuTWGg3FXUCx2eiKRMnFReYVfAeR/QTrnqi5VJMOTbgfJLCG3jWB9FA1rpJhaZ2l3R8Mg
 EICrQ8LD0HKrmzkeNTuWcAzA1b82EbHe2/cdnFPuCE6P6/kCre+JpmtmVw9Wo4VWnAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790077609;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=dXBNFT/ilN9NrDPQ/xDau5WtRo9qlBDWUOzq9oFWC3U=;
 b=S4SjawHFHfPA2qDWYiYKbComRR9BngOqoHeepgz1fGrpDWwyDvLe+8VftnZo9UHSBneD
 mz1ISzqhOs4r6QgxBzFt93FO0zO4W7owoEmVRgxvaid1U83rMXPH6ojHihteHZu+yhVLW
 I/ySmsMiiaglz9tOJNIHiqIjgtErCi63ThI/DkPMopnxBklVaspI3311vHFvgxJvJY5OL
 asTdi5RDy1Uc9WkuZycS+l/igtaNlIj1vjRhtShpVwXxFz7DdPa4QHZPOyxAsmoQD+1gr
 VkACuo/T4otCVIGvssNF1p+i/DhOoT3D6/Y4OYx+wBTdV6Yt4WtJELcTVjF7ZXLsf6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=L7hVaKxC; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A29640778
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS9I-1wSj7i1CV0-00inw7; Tue, 22
 Sep 2026 13:46:32 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 13:46:12 +0200
Message-ID: <20260922114613.805843-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922114613.805843-1-fiona.klute@gmx.de>
References: <20260922114613.805843-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TvIIEmglH1cvA8ZjQrvRGvtcg8lUajxiwU1Hr5evv8I4nfJxQev
 Ako1720cNFiVW47HJChHj+IICo1TUKmzXp0DlgCOPjJILC7PuaTc3jNJmE75ejMCE04af8w
 EQX037qERT0rpGYOsDGgp0PV0jOxxml3WIvif8hVqfEH0wJOFSMjKelnnpCmRrhEcRIXFRr
 W5dKHHFqEWWhKStv2aVKA==
UI-OutboundReport: notjunk:1;M01:P0:XgbWJkMTS8s=;SpeEeD/dmJ7mAMRxdKGBMrbThZB
 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
 oNCS4nH35J6C6
Subject: [Buildroot] [PATCH v3 3/4] package/systemd: select
 BR2_PACKAGE_HOST_UTIL_LINUX for host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_SYSTEMD_DEPENDENCIES already contains host-util-linux, select its
config option to avoid confusion.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index fdbebaee7a..eff71d0d1c 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -2,3 +2,4 @@
 config BR2_PACKAGE_HOST_SYSTEMD
 	bool
 	depends on BR2_HOST_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HOST_UTIL_LINUX
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
