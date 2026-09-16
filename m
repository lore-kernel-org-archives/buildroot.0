Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AE7C88E5C
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8650080E44;
	Wed, 16 Sep 2026 12:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lkvtu0b-9sJ4; Wed, 16 Sep 2026 12:53:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8767D80A9A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789563180;
	b=kLX/gq8SgDdVIJVr1udEtpWT409M7XC0vmN2q4lCa4WRzVvXlz3MdDivL59Jq8mXDOGr
	 rk0lLp3BzI3UhbKCe2koKpF412NOhyAIdTy7wWcyIw2/JmGaXr7HeQpUNBGkJEZeFQZR5
	 QK1tBsoyN4f0A/bQbyXWRTf3IPhCYJzwcoa1pME0sxYxsBqqhYPs5Pv9kSa+UygyoqXqZ
	 VU0ST3Fk3bKkEiSwoWSoWC0gbomIgDDy3EmkQmoUYtAj9CIgDu6MNKwE2w2wiXJb0whts
	 UivP0+7TJ4eOS8H2SU8ipS3mi3DfRZ6unJGygjOnvyG8F7QzLP17wasUFWIbh8F+SYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789563180;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LSZ/CO+iNNOSgtzkZKrDN5V7e2V+5hyKQanE1iPgzk8=;
	b=FUsvgjRNO4impQPQ+6kliZmfHBBO9ajxoq3b+8RVXoOWb7YtjRxPHNfpRPq4RhaS0tgH
	 51c/V4NRgDARM9lSFAgsyN+4S68BNoF+BPGlFH+nMOhffqwZO/4z7CyuzU6nYbhBiW0v/
	 6xv+lT1XxBRpaezQ6MnjTPzBnDd5YPaIpnIu991oDZdxGJZ3dGLhwyPtNOd0KDaXpAsxI
	 edZFv7IVoE84Q6/3bKmIq2Vtk6p4wnRS4vFeOCdZe2D3wfCPiAVscp+3hNwQMMunUt6el
	 ATHQxDAtlIW11Y39cmw/SdZNj+pDW3EM5zci3QYd8uIjuG5S81p6TvlHPPOm/WE+doA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789563180;
	bh=LSZ/CO+iNNOSgtzkZKrDN5V7e2V+5hyKQanE1iPgzk8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=G0cwI8/WkCd3a1jTtMt6g0tiwQiwJgw+jjQLT2VBRjVx4rQPY9EP7NYuava6wHUVr
	 G6LwyxPoWdl49gv48MDhoLc9cKVwTT/ZYRXZruahHIszsmz6sdB+qzxHrXYdPEf5NV
	 gt89kNiti55x/jh44+Omw7AApXbA2Dfa5XYsHCqyqp47imeSExCb8VydEsEeQ9Z5vc
	 4QauJ6EKBdemiM9Ek+leMdsVG6JhkA1tdqTWGqfjhBaUJaMFP/2+S6O3qM3AxP3oBi
	 Rc+x4BK9enZGq0cUj67oinx+rVLZM6As73tFuSM64+70qI4OddEcYoCYkWQ6BY38aO
	 nZ/9kqUNxh0mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8767D80A9A;
	Wed, 16 Sep 2026 12:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C6724D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 936E580A9A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHSVxUsi7bhM for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:52:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 67B9380A66
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789563178;
 b=UlwPjsZ6UnDjAooemtmnTZlhYzU7jzjxcOpjRYRTaa7xAmBeaRWE/GCvW0W5RbmltTTB
 whvWEg3gScKqS4ucOXqj+oia+DJxRE/QzeltuK98KR44hwQk9YMxVbIbKX6lEpneXu7p7
 S6dEyggrlxOpJRLokzZgGA9gc4piXmiBpiYHrW4BaMyw6rR0txabAmcT0bgaZpXSijC22
 TiuAekunV1TFNc8jpZBbUrxzu6bdWMvZl5S249HamabtGpJDUBjnS0z3c9NNFK1zLxYtz
 qzMgj4Y9ldf1D9dyAnRfB8xpXOIjdokUZAhXajVYK5JAd00B9YPeZI7dev8j6otFCcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789563178;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=UJ+uQiUCYscKa7FVibAKNKnArz3uix4Lcuz/7vyuQlg=;
 b=SxcVBRN/S3VKCNPkNNWyrfe9w7Do9znKJb+ffThj/sW0cjrKl7lnDzn+UukEW0ulFICs
 exSXS4qFcemyg6EqkN4NJSlW5CQCMd8BxXipaum/5ebss25xtdhVTNYHp8ML1STes4arq
 NMGMVj2k47LEBT4GBGAacEHB9IRgUPG5TElxdkaxCvzc/h7UznyCNCU9EAFiY64XxBQ/u
 uZcBTNRqm4g76H54BAxe5SORE+ddHD3ABSdDnVBZkxW9RSxacO7pX4jY2AmytTdFia0bx
 /YcqXD9nODpFuMeNPJczTW5mUHo+fMcFtYzlNNS1fWuYJNITBQzC5Jqw9iJ0h/LGnXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tZ9N5hTQ; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B9380A66
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1weCUQ3ksq-0160SE; Wed, 16
 Sep 2026 14:52:55 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 14:52:34 +0200
Message-ID: <20260916125236.2759304-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125236.2759304-1-fiona.klute@gmx.de>
References: <20260916125236.2759304-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:S0hfeZD/SbfQYhxf/TPVEshnAzO+1p6ASiE3boEf/Red/WiXNsx
 qCXkXzSo9JFMpoZbWE8UrVVH9By01xIVagon3ueA1f6sX8XWXXG6VW/prlRi6+9ujixCcCd
 Wd4IKcuKotGfmDxkiV3Lrw0i5sLkb0YV4YKGYI11fLFmuV9olpK2VPi0B9cGfb1v6I78rIE
 2CMcT0z9dvBJ+NcIG/J4A==
UI-OutboundReport: notjunk:1;M01:P0:Yv6+3Aw4V5k=;uHgPqR2u6C/RzpleZ5+/ktbbCx/
 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
Subject: [Buildroot] [PATCH 3/5] package/mtd: select
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
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_MTD_DEPENDENCIES already contains host-util-linux, select its
config option to avoid confusion.

Fixes: 447feaf9862fae7ba37a88717890784bc48b2ad7

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/mtd/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in.host b/package/mtd/Config.in.host
index 3752266156..a35f23b71d 100644
--- a/package/mtd/Config.in.host
+++ b/package/mtd/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_MTD
 	bool "host mtd, jffs2 and ubi/ubifs tools"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  Build mtd, jffs2 and ubi/ubifs tools
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
