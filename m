Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E4CD6E77
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 14:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 781216F5E8;
	Thu,  4 Jun 2026 14:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIOw2Cw0UUn6; Thu,  4 Jun 2026 14:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991496F5ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780584175;
	bh=ai9MId36uG9hDi5g0GUkbq2qqNAEil/72S0I8SqCUfQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=siwZ14tCuuAtccPZoJDkI5wc5fqaq4ezMLjRNftlLp4yeYlrnhQuWBmYJza/hG+LT
	 apnqh57D6rPlm23jWOpTctwZW5e9WryyJIS70IydY2V2LB3qhhIPQyRckmmfiQG22z
	 +lmxWKENJpHZZB1ZX5PbB7caBNXdGjXuXbHv4eQrraKQvsOxeVLUNRcDK04ACIT2dk
	 qbtIrtphyvJkWlc1uN7mx6EyvXnhsYhcv6Zs2OOYo5etAehRbU9nXn84I5jVpZywjB
	 FT8P6YCUpE6Ewp7u8bIZrWRnq0udsQavD5CwlkS12MLw8Bbj/UbsoxBxoxRKEsbz++
	 4h5vCunHWpRsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991496F5ED;
	Thu,  4 Jun 2026 14:42:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B7D192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E21DF6F5E8
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Uqgcx5WlXyp for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 14:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A84616F5ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84616F5ED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A84616F5ED
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 14:42:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1wPOdw4793-0065jS; Thu, 04
 Jun 2026 16:42:50 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  4 Jun 2026 16:42:30 +0200
Message-ID: <20260604144230.840387-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604144230.840387-1-fiona.klute@gmx.de>
References: <20260604144230.840387-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vw7pVDSYCx4QV2dKnDbao+Ize2rHy7qtLOCDC1CQPdfHBFv1+0Q
 SMhaCSMFHbuXsyXUpvfVrhBQKlTRVPl0geKdxjU7wR5tV9FzR8YniRapBRRrZgmAGt/7z9X
 +PAFsKfGXjJTRCE0bJuw6SyTh6Wi9fUKWT2y5EzQQveXm7ykj6jjuZVT8K6mkJx+uM5aWw7
 IIpoIDbcWPmx955bGQC1Q==
UI-OutboundReport: notjunk:1;M01:P0:HYTjPX5eYtQ=;IuyDEKr/syD89LJ+YdsOPWciYUd
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780584170; x=1781188970; i=fiona.klute@gmx.de;
 bh=JY+lnEQrRAIPp9bGNXaEb43YRrcS//tOBojqZO/YpqM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XuwGhzBIPjUWqPPlL4th7PccJIxGjRF3GF/hAwvRe9cKPjWZ3ByqSG2Ch2Gpdmy7
 1u3OZGrzXJD0aT3paxcG7VMpOWkZ3JOUnBoByYMn7fL7e4pma2GjVFmwPz0p3lgBp
 dh+T1sc2Jv316JV2e+aqyB3eE6jcqF6rHuWTFMhz6lxdhaMi2ddlPkO072shpJy2k
 v9clI/lYiQlE/CySEBACPJoPVBw8RNnDlS4G89KLbZtj2ATl+dMp36bZPtQ0ImBJH
 gcgyZ5m1SqEkavBx1sgHoVEPxWDoal3qyoRB/HSnQSVnfCLyZU9nhoit3NUPzcCGP
 DKqX3KSbyQMipSDhXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XuwGhzBI
Subject: [Buildroot] [PATCH 3/3] package/iwd/S40iwd: implement restart
 command
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

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/iwd/S40iwd | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index c329f3bcc7..00857502f8 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -43,10 +43,16 @@ stop() {
 	return "$status"
 }
 
+restart() {
+	stop
+	start
+}
+
 case "$1" in
-	start|stop)
-		"$1";;
+	start|stop|restart)
+		"$1"
+		;;
 	*)
-		echo "Usage: $0 {start|stop}"
+		echo "Usage: $0 {start|stop|restart}"
 		exit 1
 esac
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
