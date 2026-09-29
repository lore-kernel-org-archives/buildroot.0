Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DA0CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403C7811D7;
	Tue, 29 Sep 2026 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsXzjXdpqIrN; Tue, 29 Sep 2026 18:59:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 57020811AD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790708389;
	b=qoGZyTI4u6Pcrk+cSADfL3BdJ3SIXKrYmXV+b+T35nb5YReG6j5X3vhTMsxnUI0MzXAC
	 zXzJxowoaiQH5ZNNktu3Tp8yKlrhT0WShAIiIdGBYGBZ/wk3IifOj4G2xgD6WIwjcWufv
	 X2YTuZ8mNtPP+k0rhlpF0bIvHizhbtqBDMH7bJQglAlu5dJQ0Okr4K0+ii3b8EE1TStOM
	 8mFzwYFroE0eEg+I634b1WNE3BtusMO9a9ll2W9ipFijscrzBFzf448yYbTa7UbUC1fsl
	 MW6+jctf/tYc5jaYvVaA+YuUCRNWtI7sXT4ql8RQcI9U2dZpBHVarbmh+z6+iAr8+uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790708389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qkLhDqOqKOGnXp4zsWlPEa1zp5csf+IM7K5FR9cPTyk=;
	b=I9G57cn9ZY3ScyMEbTKcC251H+LL6yaSloSymrQJiy/ncHTwCRIR1B2WgrTWdn2T5yPd
	 0jXIWpOOiVNolrZ8/U3tXYeliNxaEB49gBj38j83E7d6BdlfZSPijzzZJ+o0HH4Lt9ZNC
	 /RsBCEEme+NDFDy+tB4gq0h1cfKFzyEU8qDwK89FjLCrMiFJcpyrdUF6eEsf9EKywwz3s
	 /EURRqRZEJlIVV3uXpTKpSh0EA6DvlRtYYh3AuIZkDRrXNSAsFY4d9XNOZsTVHz3VSL2a
	 md7Xn9xkob0+nl74b1jrmdBgUvY7XVdqtpXakKHfk81muLd9B6fZLU6Vw+hmmUu6jzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790708389;
	bh=qkLhDqOqKOGnXp4zsWlPEa1zp5csf+IM7K5FR9cPTyk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQs6yUUBrN3rckuiASle3+r7Zk3Y6WP4oMka+fLETBFpusGFDD/q2y1fdV6SqdJT9
	 ozFdr3Eif3SITw3DXEmO1L66JEbli3bQ60Z1PQWMY1ezhim3SNQIf3fmpxpCyQd2Fs
	 B0m+oUOTXsBYwHrD1luZsgKdhxrfuWabIFc2ZulrNUHtUEUkvorM9MTjOi0coxdIeS
	 eNYeJCig0WKV72CjPRH2f1bxrt2NuT0bRKT/9iLoEvq6jQ87Dh+FNdsm2cYRgjdnMN
	 cFvfiK40MQlOAOPmNlkNulBlCJlC74Rzho2N48SfwQF9zle507wzUlXrWaTbw4SNpY
	 QnGiTfA81ZyFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57020811AD;
	Tue, 29 Sep 2026 18:59:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F3024E
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 629164032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoKvGdAEuCig for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:59:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7784C400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790708386;
 b=huc+71TFabmJV/UmUH/Zj2LqAJ4OY3u7TEPrTzqdyn4FAJbq7xWqgnXb+SsAqeQodCXr
 tSLnkndxzuGcqNmrAvcY1KKkqUBWNyoUyNc71ecLkSjvUuOIhc1/TFk1y/1n+zJKUSwMu
 oj1iz6vnSnFo+pXh32zC0tLLzSRmX1oIy29xIjIkCD0OGe5ckENSZfDLyIwV4MQJRCJzq
 IH1oxY3m9SIgphPDuJG9QoIrjwc5A9QlqetgjpZNJEXBYWedkHDYV1Gw2xOkcBXq+Aakj
 z7m/dU5glx47vniohEJNAn2BHtdwfMI/cD0Y7e0nETcsg9JG6qXvQo+g2laEGyOBU/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790708386;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hGI1xXuKpjXz9Xa+p8914TR7EIbGha1123JXTOPfLt4=;
 b=KcF7u9EMFgO1CJRN+2x3AH8SF+bwe0i+cdBdmQrwhyXlf1tYtJk17jeOZurbEAWlWn6G
 HpE7XuaJV0b/7shPqaoJcc+VNiouDdV7PlJORu1HFZq8+Lruk2gqIQ0sl12K3EEKl38Gp
 XlpXiaJ3m/5BIchBYue++Lp2E8WU3NjhQX70KWFf4k/iy6yoX3aI9IyeIEboRINuuV3nT
 /HNnfxVhZgF0LhvGK2Vl/T8b1vC8VAFoqrbg1vUu/VqnFnA0ei910gliw+OC9n8sKtDJ3
 NyGOeNXANKrYbAqdZ6DMYR+3ZqbqWUV2uyIoM+V3ys7aKjKYf8MqQQS+lUOCH4mMUkw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cD1Khe0d; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cD1Khe0d
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7784C400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790708370;
 bh=hGI1xXuKpjXz9Xa+p8914TR7EIbGha1123JXTOPfLt4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=cD1Khe0d76BeFc/HGQioBsaFcYDmVXER5tBOQpzemXhfMq0p6Pdzeh6i4n/QrnYnf
 aAXAeZQ7XfqxxSIRFP2PFLTf2ZVU2vb0sFZRDcPl1b3IGdEANz28NQV+7LbHLWSk/D
 EPZxPYWZ8NNZjVxzke44k7SEpxVcHbznHSRxU7SlFoSV4irjBHXNADMuGAVZFd5IXs
 /FFwz0DStC81nxifWP6FeYN84w1zyZGrSVeVWt9akdDzY2c5AqA37wG4c5dVvbreEx
 t0pKBw3dd1Gp+QvOFD3c+j3Kt2GmDo1wbJPxXwzORbsn221vNd1H3OHumYo2IIcH59
 opIaLlOs6BjdA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 W+BvBW2xWITGlyatmpJL2HBA/OXKo1JKpyDDur/Zl+bv9gHYRb1u6CAoxFvvfCKYQDCOPr0dRTR
 YiwSWrB7uzMQmOg8N55EmL3NlA933CYjsK72435rl84j6OEm2yFU/DFiCy7baDKZu1038kOjN9P
 t4WczsHxZxSVOLZif594xJ9IEfTaf6MgyD511fZzgGFVW7gmtxKf8eKzdotKyhYQo/1wxV6IthL
 jcnfS/dSPfPgbIrmJDRVRJNgWHfLSkKUbtiSN2prZM2DfYQG8/7KSyxU2+PWb7IQpLIRFOP8MLq
 ynkqX/uBdeqXHGjqAtruG/SOk3+d67QFoQJ7zYWeEsCxSFGPXWgAH1m5mW3Iymbc+ZSvr6yzXUi
 qUa7Nem4fuIX2HcNh6Gz4tKhyYmf141H0zSTocKTKhGXUeD5tXwILq6RAyRdvQZydSXsz5l6fHn
 ZsOlXgNNDn/aQ6hUBx2gPJHsj0tnyOy94fQMWzcTBa+rMGoJbcAHJmuGfzFhThnIgs63jQFgUVd
 5iK1rU1wMC1Q8FuKY3Fb2sroSczCF9HMrU7tbenVB34ILoFZj9nJX7oFvAv+7PaHNBg4tBR9YXK
 t4Uimw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EC8B0A4C5114
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:59:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54978)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBd34-000000001xL-1YrP
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:59:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:59:30 +0200
Message-ID: <20260929185930.1897670-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929185930.1897670-1-bernd@kuhls.net>
References: <20260929185930.1897670-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-mythtv: bump version to
 21.3.20-Omega
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

https://github.com/janbar/pvr.mythtv/blob/21.3.20-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 4e170fc10f..9ce2f1bdd0 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3ca903e325edd82d86ece135f2d669562c7bbeb9399c6605c91e920c32975512  kodi-pvr-mythtv-21.3.6-Omega.tar.gz
+sha256  fff61cba963647e81ae273a974b31c2aab054e1a8c0e20278bb52623cd244921  kodi-pvr-mythtv-21.3.20-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index a37328fedf..1270fa5871 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.6-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.20-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
