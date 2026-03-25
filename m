Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38362109C05C
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 20:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A2E460B75;
	Wed, 25 Mar 2026 20:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gjWvYp_xtu8; Wed, 25 Mar 2026 20:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D246081A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774470093;
	bh=CnSzChu/EK+5qpAfcjsVL8VPx8T4v8hxWQipQw5q/24=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U13IOqL0XAdldhEheXap1Sp29fiEqanNq2cuLd8h+vRJsG1K0KE9NYfIGZK2XM3dA
	 07ylhfLNA7WyDKp3UeeE5Q4uXbXt0xkqSYLnb5DSYGMiVvyG5G3Hi6zzwcdPiD+nQK
	 v5no+DpZlEix35WG173db8WBCsKoCaWMvWJuSemiF1hkG9WFBNOdSpKJU7tPdR3+WE
	 A8BvkcCBnwd5KrU2Hsra7lYl8PEzv494PeV9TBusbfbF6Kd4RWfFJ2pKrbHbjsDofs
	 DAlZgqqwoVx6kmfVCNI1Ipvz9MMsG1lKSiUtWYizZBSSOCeJ7U13WmtvhY7chkhX1m
	 OZ+c7YMgoV/rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D246081A;
	Wed, 25 Mar 2026 20:21:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E20353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B6C66081A
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkkyMO8oM86t for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 20:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FAC560788
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FAC560788
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FAC560788
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:21:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 02E5A2003DC;
 Wed, 25 Mar 2026 21:21:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Mar 2026 21:21:26 +0100
MIME-Version: 1.0
Date: Wed, 25 Mar 2026 21:21:26 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Chen Pei <cp0613@linux.alibaba.com>
In-Reply-To: <20260321182244.2282547-1-ju.o@free.fr>
References: <20260321182244.2282547-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <afaf8776cc60c02d50411a448ac2a26d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774470089;
 bh=YgQC7WqGdmgtiiwJrBsLFKqePbdGjY2+5XasqShRzv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LCF4OI4WF+l3/xxXsMU0JYcJLiTl2du8QkR5kEODGJM0xYYQ96UdlFD0V092L3cp4
 EDwD0yXj59BX5eh+OJhO/TyC5JtOYXWTtI6r64EunEUc4DvtBon4FRHZj5iT+3hPnf
 loRNQn9GqQiS16kKe5zQwLmNziXQgOaicmoEfXvHEEbtE5Ww0QJo3I3CdqmxABIf1q
 53LBCaU4Tt8zv+uZsOmOgXKg4ORUVgNuIqoPWfPb5Xh3ivr7Ku+pTQ1uy/xkVZjuKd
 lulgaW+Mfzip/W6D18laPygd6QP9ytMFXXejV+j0lGk1sIHyuc6aiMwnOABHHrwYUQ
 oyXxeA60mCLeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LCF4OI4W
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: ndctl: new runtime test
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

On 21/03/2026 19:22, Julien Olivain via buildroot wrote:
> Cc: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
