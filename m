Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC0E9D812
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8671C60709;
	Sun,  5 Apr 2026 20:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noIhFinh3VoH; Sun,  5 Apr 2026 20:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED2B606B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775420474;
	bh=04aO2celds2b1twus1lbrtWLJ74S/Sp8v/OlRJsnHsI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J8j+dYQ9oG5mZVRLS8o68+T+VgUhnZ+lpjkibysaDxKSLvuCoctFhG43o/xOprFS4
	 k+FOIp8hICA3C8oWWe+EfMKizNgEmLHaJV2s9D7nAxWR1aFKIGEyz9L/Oj358bD/w2
	 TGC4XGON7NgThnPWFqfO6bEfjzpa7LDSM2Tibwc1VitqPTV4UEWiJlpLoGq4oyu66L
	 v9r139cBmnfS63293ayGkW/ForcbZyTt/Q/8JRsDCKT91IMh4NqieW3KdBTdmNC1mQ
	 h/5fsW1UoUzePYm3yBWVfew4GURQRfWyHxK+qQRhbrUDAynUHchlV/C7XFJWKLrmch
	 cYPyZc1cCq+LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED2B606B6;
	Sun,  5 Apr 2026 20:21:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F79F219
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75430401BC
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szbngk3c5PSl for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 20:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E040400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E040400A5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E040400A5
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:21:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 582352003B4;
 Sun,  5 Apr 2026 22:21:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Apr 2026 22:21:08 +0200
MIME-Version: 1.0
Date: Sun, 05 Apr 2026 22:21:08 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260405133312.1205102-1-giulio.benetti@benettiengineering.com>
References: <20260405133312.1205102-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <34381839e0a7a77c9a7be15c0175268c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775420469;
 bh=7ltmVVwADlI3FPk0fI0BJejdYUIaRsflxkNAZjP8Hs0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VreRieUEU1TVlDMlUUyllvzoEEUNSC4uLACiOEoPwtPF4SiElUniKbUPtAKOG7yom
 9F9x/IsxrmkaKC36iofmFC4xz5QIaUgTNX30lgPi3kmnAdOHKjkOPfRKy6B/TD4pft
 oTjys9CpEc18n1dbrmjoG1M5TOtTzCemi0kWjnMDPgwr8zOmbi7OLRV9OFgnkflhaq
 v2PZv35uaZQ+Uaqu+m9gz9OnuD3j6UILD6I5hXaOyiZVfHQpEO/a8n68AJ9n3/ZYIH
 OHJz/uchev7N3S/axBuy2OMqmhKQll2lzahdgdsWnGSRfJYfNeN918kVDrPx+6TxLp
 d6G29XlR++8uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VreRieUE
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/04/2026 15:33, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/14.1.0/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
