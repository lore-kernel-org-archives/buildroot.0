Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D94FC982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24B65606EF;
	Tue, 22 Sep 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsXLfUYjVmBa; Tue, 22 Sep 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 450D560711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790073192;
	b=Hf1gq9Gq5XC5LAl38qfoX7ymFjbyg6ySfEZD/6gw+4s+8Ica1crE3QkuHSFcyZ6bob5b
	 UQBNSHR0e8N/Dm/Ii+R8e+zr9pa6JJ0xemMOlJulyt1Zh8kKQ2i6v31G+7CTUoUI60MuE
	 cqto5EAsE3JLHj3Vy+tm5jpvLkrxLXTdfP6TS8dSRGzrz6CwfnJCvwidjG5nLxqFsGuyN
	 uWWlpqcBLx4qp9kF3Ulfe4QcANSIkbkMcBuZKlCVXFYWGuQQ2uRXMFDczv64m6fak81vb
	 8aBQ+S6FsBRIp4HoXeWG/BMtEMxzUsCd0W75wQ6/GUlUOZQveELOVt9Ivj09wi/tgVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790073192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QSgvpbgMdsGp7T0rHazj2Dyf0lJXCI3VsP2FiUrQi60=;
	b=L3C9quzpUnJf/BEDyv4/fA+94HwcS6dib8F2X2mJCtSSgIi8gL1tsPs6UImNa9urRz/l
	 VM2niW74q7G3CN8RJrXB2RkQasg0hV11zZ4bK01OGnKriHvFtq+epNKAX+1y01dEYRtX0
	 atdr3s2LkpZ8vUeOypf302OTO3pdyu1LZtElHhktXxFIRWFiX2pZgxN8+Irpj2AAotRZU
	 rx9NRf3j+eepMgW8a3io9w8meiHD6LddKr2pqzQBlYV12k5QA2H20EcuYHT5RuByyHM47
	 GH8GdtfX+pmARzBUKC2wGszicsVgcZ0hsERXtNPecS7Vga83XF7FONRXM5gsZb1N1aw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790073192;
	bh=QSgvpbgMdsGp7T0rHazj2Dyf0lJXCI3VsP2FiUrQi60=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XyHTYs5f5+dFzfmHHMCo2xH1eVa4/7wjbsFaBdcORi4EunGvEV43AGZD/j+Qy3G4V
	 jPwb+OSZaaWKjqZiLedGnQXxpBZNsl1Ywjy/4+GEXVQ2yDwYx1njsI87mlR3Zt/y+k
	 bXDaq/lcg620WXJ2DZQ3GFon1ssFehGaCgQoKecx0Qd29iZkAfmVXm3QmSYR2ZBG8g
	 6v2w6E0d+eSuuz6aRdKSt2vgvOHU5TvGs6CAnvasX/KjN0VJCgIy0aKLDM1gmqLn6w
	 6ndf/8vRsccQrYJd8W/QxotDqjMa0i2c2o44H0b+mohDY+9hyqY87jrY2BFSzkMhUx
	 06QpKl2DGuByA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450D560711;
	Tue, 22 Sep 2026 10:33:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A2513B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7754A40709
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihGpqAXjIvDJ for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20D3C406EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790073186;
 b=qWGokfZVmOSlPCLok0e+DgWzpnxLUTmGF384lir+oVNiPwl+mXm8nTYvor1LBcbnoZsl
 eYQG/EZKmeB6+HxRIHYF7bE/QvmjiMyjxVXRvaoOixv4Xpp61BH0ad1KZU4hPL5iXwGXx
 f2lJ7WuZemNGnJiw3Z3NZPi6X9Xeddv85lTq+p1Yzj4dm9/13nd3g19BYhaqwhg8gF5tp
 zzmnDALzdG7ZvedIp23cbBMO5Vy5w6SyNm6liOPSHqmjFpSYOiYtYmYDHG3ewetMOMBhE
 i6Wy1HkZoOoaeU24UFn3UH8H5GYdKBU6SVoKR/+4p2SsUgNdyT1+EM2MwndieLxANtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790073186;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=dXBNFT/ilN9NrDPQ/xDau5WtRo9qlBDWUOzq9oFWC3U=;
 b=JMax6HHP7j4B204E/HXPfVBcN4vMshCJ6R8EeNj/WGOkyc+E0KToATGbyTFlceM0rXcw
 nS+ECahJnT52JgHfFQ9SW2YCc/g/r82AJId0U7xJsvr5RGfwXciicNXrn7QWJhm2+q5cB
 c7+2tCsvvj7cnZrgGL4sv4dmCX/Exm+wA25DS8y9ykwyuCpeb4cm1nVPADxjR/5wu9i0U
 aS0PO6txqVDFJyFNEkDH6EGz5T1k8QKuj4u9YkX3H7NidDgSO5AgK5WePh54wbpCgxUoq
 O94k5is7pAuWxrNjU4CvLX9G0Z5JouNzgPswKOn+c+p5fgXBrmFIGvwZsL9w4qMac4Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IPYER6uL; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20D3C406EC
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1x3lgI1CbF-001J1G; Tue, 22
 Sep 2026 12:33:03 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 12:32:36 +0200
Message-ID: <20260922103237.712596-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922103237.712596-1-fiona.klute@gmx.de>
References: <20260922103237.712596-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:kWcLDYy/fb515IBfdekfEi8BzWeVfYncC/ueYClvqSFFLruhcPP
 oGKbS5fTOBI0/FZBM7oU8f4Kp2v7FqUHyaP+saZLW+mDx2HqYH2LQ0OSH/dhtsCiDzEELCm
 3e5CFqZzF3TqOxjI9HCWaRVtPW00CFImA8nigaXIj1nw+frIalUOx/QBloUG1jvAfxxBwnT
 2OIrIls3O/0GvqKVFrORQ==
UI-OutboundReport: notjunk:1;M01:P0:/GI+ghew6UE=;06kZWK9JMZAoxG2wmBa2f9EdvZk
 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
 Q/elwAU1VLI2q
Subject: [Buildroot] [PATCH v2 3/4] package/systemd: select
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
