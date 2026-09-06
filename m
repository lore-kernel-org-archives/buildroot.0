Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853C4C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3399840543;
	Sun,  6 Sep 2026 09:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNXM_yxfgR-o; Sun,  6 Sep 2026 09:50:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 51D9340513
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788688200;
	b=nGD/yidaoflXmVrONHfkczXTlf5c0RNXvkXWPuFhDBuBQzx49a/ejni98O1CoLCq1728
	 cjBMYCAlw7RMj4KOYweSM+V25vgx/4uFQPisDCORc07MGoa9dbigRg4JnmjN0l/Efreqy
	 o4vwKk9CSgnNhS64dMQtisruDBE4cuPvJ7A+QRGbw5Cr8X3s7s8/TWru1sQAjWpAzhwHc
	 cWvA6s94lILj0wigE8sO5zpnr+3l+c66fgr25CKlrpm7ayPoQX5i4/CZRgDnV7dtr9jR9
	 htOBDFigK09bGtk4AY3elhKHY8SNtOe7l0Dks02L5uBVeW/EBhtMSGdfWXJZzZYNhOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788688200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=b+wdBVMGe+O+L3qgAnFwhDFzZ0TURssQ8kLHhfNvAMg=;
	b=Bzjvo8T0pTJpE1pBTFXyAnUyNMU3idDXtPDSIBHBDWFxoB9+Bk67/ZUYjwadMOFQm54X
	 57LtG0FsPXyhRjA9fZayKAFZxB4Ajo1C9WR58y3XKHfgFNKky1+bP+RDy0YpUjhCkxQaZ
	 aEciYIJxyyzPaBO5OFowyjOZ/zqZ3xIwCQqDlDEpBR23g88/3PYu0rHrwmqcSEXtuwERh
	 ByZlsJ/lRSaGyDtb6+j4evDpGmNkdrgsmGZP198yqEL4GHA5QSx7sE9kAffkUNVlXqzmj
	 nDSk6i8JtIhXw+kE83hhf7GKHRnhOOYiVz33Et6FUzQuB3MQfhWRqRVXzD4jWOAMiAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788688200;
	bh=b+wdBVMGe+O+L3qgAnFwhDFzZ0TURssQ8kLHhfNvAMg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iZDH6XgGo4+6aHEYo0yWjM+3cCHQ9tkBis0pH1+wbj1QKFFKzCgDvEgTM5tGYeE1r
	 HypWvIa2MswtRtRZ6kpvpL6u0AhwafiPn2g1QaJ3DJGTdktEjHgT6TNSTD5DNgptF2
	 ZVjNcf2CT+xwi/KF00dxMhVapoy36H8aBnXhXisxc9GqOG4zaITSiowSaKnGBGm3pQ
	 1BeMkRnxRUioxQXM7lK+/qnjkWcJaMeC1qhpMJQo+qMaWnXO/yQD2WYHwYrd71XYp1
	 yPVFks5hy9h2km3Ln6BpTX48u97tLcopy1SMBFLFHezsbpjrUAg2MuhUafePXSspTG
	 JbLMukShiUxtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D9340513;
	Sun,  6 Sep 2026 09:50:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FA9E372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81BAD605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RFX12BZ8kYM for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:49:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E499E605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788688197;
 b=izKh7QR83pAJP1d7IPUrXmCOvqWyQGaAXjPgpbmFwDHUPwhp2g4ZP4T/Kcou86qCf/1a
 9eKoYdiXk+de/BYDE4BszF8azlwU5vqCdQ2OBeDPVGEaQQUFKmLdd/FTs+mrd91RKaBs+
 SLy/xRUAgEPLthGYl1UBjYubSb3Sogj4rob6MB/DL5vNDi1+TrHRbP3hpmML8sSS+C+KY
 zyIjF3ACx/I+7dZOfcuSYtPqICWfctptB3L+JW+W2UVBVaacfowRUfGmy7Atcl5fFvJlv
 BNZ5NFwQXGrVlqVjpmHx2xzGb/r8lKSTpyioArMFq3Ka38TbH9L5L4G+68dWuueIw7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788688197;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=r2O2r9br89GyUCtarBqrX6N/m0X+4zOIYN0Yuxp68SU=;
 b=bnPMCKLwRAKGTiVPTZ25bVSNquavnIGQLr4IeJPkabzyJrpZB2DYrwlJ1lR69K/Vmrkm
 yoYr9Z8VrFfB8yjpGJ2gUf/mB259gxxhdWI0A1ks+By7twBtwVEuUtJqxtHMoyFB/XB8z
 yBEF8g+msnqbZgxZtZqxdoB0TZQ8a9mQ8noRrnoX8hOX14sSJXwWo8iSdtdYBVIiYZa86
 vgOeOl6S0/L8UJallP6sjZl33Z000NBj8OHVtzlBfHVwXJbUfPvyakk8VzZhl7dmxVku9
 njtBLpPyEEWKo/sdJHKNTEElAyApe+VYlm6mZ5SOsF6qDrfYcvKm39if+g238HaIw2A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="t/C7s2wQ"; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E499E605E5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:49:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4B6BD19F5C6;
 Sun,  6 Sep 2026 11:49:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 11:49:52 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 11:49:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260904184341.876117-1-bernd@kuhls.net>
References: <20260904184341.876117-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <6b1cd0ca774ac78cf416c26bcc235a4f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/llama-cpp: bump version to
 b10702
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

On 04/09/2026 20:43, Bernd Kuhls wrote:
> https://github.com/ggml-org/llama.cpp/releases
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
