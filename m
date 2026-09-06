Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED89C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23AD405B1;
	Sun,  6 Sep 2026 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcrWzUuyeQJ1; Sun,  6 Sep 2026 19:37:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 604944059A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723423;
	b=nrK11c8jTeheVGViKOI15ge7saTxKuwXggx/+V/HZzMW3NHfDEcG2blBvQ6HG6DoVEVX
	 MpwgSSEp56PqP+b1WoCW9dawycvZA3eNYxVC87adH6UcRT8wjpxjX5a1o9IRR/GBW3Ag4
	 B93LOEMZcnDxcaSDO8DeZGyUzCMTj4rmCRLiAeURWHKgXhb3K17IwZ7W36FduHNA/qrY0
	 QElogpdZlChXB32LEihOYBfnQv2YNYpnImvQhLJwqrYuN9jb3xlvr+rPOaWJTLewISbkp
	 A1ZOajXzM7HF4RzB41t7jsMoiBHZw+1ibIVPfWw3X/OPwZgGtty6/ArzHEX0MpRr9Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ylXe3TuQsW/7SFyrDbRBbwtpjfLDMcol6F9wS9gkizQ=;
	b=JE8+/fLIlXr9OhyiKZ3/XA61oGjFDxdacWCJqguvMzEYAVgLorjc9Lb68qJqB0DaXmnW
	 GzFLsNCcffDAboB2j21bplkWwY44ReqRrVJNLoY1WKD4GkDom5wzzAWlngeG0e/dwh/BB
	 C1caBFrdvEF+T3fjZE3AGiN/4mg5NiNFPg9jUwqm5K1Vpc8V1S3xSgi+dAf6ukT9hEDkr
	 zmfvq22YaWhOydfLO2Y9xeXCDm24hud8SGruZ2LSB/AimZCZGlkYBPfQ5vox30IuYlYUx
	 yUvy7Iln4wHFNVKrsljFpZiIGoiC/KFoLjagkKZ+Je6hHsorTgz46QPtd1lCut80AIg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723423;
	bh=ylXe3TuQsW/7SFyrDbRBbwtpjfLDMcol6F9wS9gkizQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cQ/GWbml1E5uTSysJalOdF3xl4jk1aBB6nhZWZKpwipk60VajCfX3o5a3uSyTFWyN
	 58Lkv/wZTOVCEEtVhuXt0LJiEH3+aF2MYOv1ulXSd5/1a/TE1t2IOI9mG/eIpNN29l
	 cJqfl1/fEZGxS+3uZ4JfdgA899FrwTNFduz4sqrf9orm8XalbirAiNlvDBiPZ2x4Gw
	 XnY8Hoinyg7+DICcmC+tm4sg80lOznoCh2HKU+wZKuEjFXJguyoU6+9iin5btYNQBA
	 qAeVVEoKEJW7C9c3hWmPsfW4zBJ1AWMhqExzyz/Qu+BUaCetY+3+z2WXz4E2sr8eUS
	 Jq9nG+jIYcAnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604944059A;
	Sun,  6 Sep 2026 19:37:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 237CB970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 095B580B6D
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rziw6ymbVgVt for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:37:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CBFA580B63
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723421;
 b=tV+hlIwVhplfK8wldoLxyZYz4SQJ7zruLpaKT0UyvcCb2yERpmd6RBEOT0zO2bdiPFnn
 nPJCUv9MirrExQGiyK0V5LohVpGmpyF1w2vMe4Ty1uKN334/PcWhENlQYKzoD0nl5u4vC
 NVX7vmi+g/A8ViBlI0yIOVBMhhlb6RvMubiQ0ObcdnaPvK1Q7jeKHCgJJITl60b7J3DpK
 LgP62fnlc81ObE+c36gyWgCUBOCF38JFCPTjsw6WcrCkldWWQ5JUoa2SQHRYture4uwEe
 BhmjkECRy3IGOg6XDFeBcBbtOVKV6BrK/xUbo8Kar2VWyFWZuK3hom+zOzKQg/+8VtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723421;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=K1JRD9QrBQ9kgyEBtssZGaKVQnLb/60HDKeBa5IwX4Q=;
 b=BJ5zvz6+t4RnYLhhG8c8hcoC4HDLFnXhzPRFNsDBd3VuqvjqdmsnHsFb57F9vj/MLEFg
 WnJFFZ1IjEsSngFRU+ss8ff2vCC28eCnUArdkm/OptlecnP/3efstVP0lYVdupz19Bbvp
 ODM/A/nVvsDT6MNXeqwnlH8JH5EsUT57Ia1WYdjM/kJX46t1klnybF5exMaOo/sXh6VrZ
 KHw0L+02RYMbqQD5rH4Ai3mT5xTXwLa2MGTCnkQM2DngeEg28AelwRA7ZjeByACtCdezv
 gg5UJ5p8nEIS/Qv7Uu/fxEDry0GnELmp+MON4z+1UX4zgACS6VBlieYzHjM0qtQv85w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jlcIUNY8; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBFA580B63
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:37:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E5CA919F59C;
 Sun,  6 Sep 2026 21:36:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 21:36:56 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 21:36:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904163304.119934-1-bernd@kuhls.net>
References: <20260904163304.119934-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <076e229d8e250500b2de3a02f858263b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.411
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

On 04/09/2026 18:33, Bernd Kuhls wrote:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.411
> https://github.com/vcrhonek/hwdata/releases/tag/v0.410
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
