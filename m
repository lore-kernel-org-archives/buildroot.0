Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9115CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 718B461323;
	Fri, 16 Oct 2026 13:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZvSFJR80Pqq; Fri, 16 Oct 2026 13:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 69D5961310
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156393;
	b=CQS7oqqvbw8K4FrMm9JHCqhGTwjayaCPv2DL5TNhURxZPZrUsV9gAeaxlqgXkqcdKVGu
	 SD7eqZ+UzoI0RPzPH96t0d+xGpZ1chNeUlreG4kEM1kf7INNSNpCSdDqTkdlgQwAJqI39
	 jZQlWzT7+atzzgSzfIPEf1QWA0sGLgAnpVI98vuqUMoJ4ZQb1NkCiQ7XVUY99z9skFIpv
	 bEsSjgP2L9JR/8t0UD1tG5cORDhVDe9V16cP3zriBPI4CVVy4X2kC6v7MDFV9d1//TTse
	 owRKSHlY2jhxBPAWSsdc1jhP0gfAAHrmHgh1EIDUS3mdm6Zffn6+vBnGKnN81OPLelg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=yjC/EOKHCUaMJaCXvGzSBRPgBSPpsSOL/iwPkIDvunY=;
	b=pb7NnFy1QlHfcRZtTOpEDND1HYhNDttg6TXRmls5SkezG1De9y0CwGO36tVrbpL7e25i
	 IEiumfGAK3gTvyKYoPmkbDtgzAtCuZoydGwhw3R8yy+GPlRczE8lLoc2tt+jcstNnUHOD
	 pW+nLYPnMK6jrkD5ECmThNi5ijcjzCY9R9d4jfc0GUGDcx1J95Ys2CzR11gkdygnz1ZrI
	 pady6bOdpUEOuJrDvDEERDBy9xRtLT/KuK81JRdiJH7u9hEKebT+JQEg48NpKeCKxRBZS
	 VpXGHVmch8lOqWb7k6wAEHxXR+5OxGDzz8z5KEBAG+qRRFSgAfkOL7l6Nc8gPVZH1Pg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156393;
	bh=yjC/EOKHCUaMJaCXvGzSBRPgBSPpsSOL/iwPkIDvunY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MdGLYEX7vv9u2m8JnuRxfi4tqkxyHYaPdhyK8ur7KkZkXbs914R2YPItA7+62lr6v
	 ikKRPCICwHJWgfHEyD+S4RjEp3Gksmxi89OoTuZkER49D7hI4JN9y10v10saygLgTO
	 4alA9xVbwvWF84BI13sW7DU6lIowCXlfRAAP/6zPbs0uszbvWx+5txDrc75XCjBJCR
	 3ibVA90KRarpO0z0ctiYArLA2VvA7fkcsv6ripRynWr+QqEga1Td9qebaEXDzRr/1u
	 IxKmrIVTrUDpfMQ+P9OUnmRKdlMLrdNGewEG8KlrMI0QvhY60Gu/xf9s5OlpOojjzz
	 EmNU37w7Bi62g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D5961310;
	Fri, 16 Oct 2026 13:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E7E105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E446960F1A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIXLrv6BCoil for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96A8360B61
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=QtncYNQKzZPdEaPb82mAhDpnd4fzEPxFES/UNWVDraQGFIvnMzPWkqlDK9oSQBiyMrbU
 ZOSEfXwZxnXOFG3s/O28MN3tibEAZ4FKO5ZEqREKZHpuzDltR2C0ys0eoToiteUSmIYcL
 BMm7Y5zM0tnBn2p4Da8C9feuQM62prei7FQq6l6KMWayu+Ycf66jbAlpplVJW5FjCkJKL
 2p6vUDx4QH0sKtFli6nZEGotp3O+K5n97qbi3WIb9KDCJJFDq7wynvGjbR2fvqo/PkEdH
 IT+RRt90YcgvERbBs3BXx8PSv5Z9xLuUOWICtENuW1WxDUb9x12b8y1bVnki282NrwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mgoD4pmqcpEOGHyGgiPq0VJAQyfz1Sl5N5JGYlHOpC0=;
 b=NTyau4KhpNUjgxyPo2+rt4YAL67TgapIPkUMxAqcbVPWZqFAr4e92myv3D/DXQTLoC8h
 Er8gB45lLfHPhGf5hK/tWei2tlb2f9itaH9SFIUBF7LTA3Qc0rUU0BWZF+06ViWIz+Tvc
 aJt9ZJUxoaN/ROBL6S4pF2JAW4yKaZ3RrA/d6LY1P8RCK8ibkiVGLoXPu95jGwHhwarr+
 ZKTEl2/yL8CNIrNyfZJ6dibhbcIo9Yr1Xf1ZLpT9MSHXhd72EbgOUPRTCekn6BxfjJvln
 EmjDLH4YCOJ8kO4cXjbOTRrkSlFk895peZbpA2bsvfErsOTWPdfI3oS6JkW//jkAh7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A8360B61
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86BE0960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:48 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8ad5be182ce19e3083827f40120da06f77069c94
X-Git-Newrev: 83eaa5f8b6f63d4e38ab4b0a584d5a93840b97a0
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.86BE0960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/qt6/qt6svg: add
 CPE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3430297153159379993=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3430297153159379993==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83eaa5f8b6f63d4e38ab4b0a584d5a93840b97a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:qt:qtsvg:6.11.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2021-45930

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6d335ea39f8630b75c1563ea0a2e676616e25bdb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index c8d5e8fd17..6fbb492a36 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -12,6 +12,9 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 QT6SVG_CMAKE_BACKEND = ninja
 
+QT6SVG_CPE_ID_VENDOR = qt
+QT6SVG_CPE_ID_PRODUCT = qtsvg
+
 QT6SVG_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \

--===============3430297153159379993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3430297153159379993==--
