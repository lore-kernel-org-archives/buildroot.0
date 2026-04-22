Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1133FA1FFB
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91F880D99;
	Wed, 22 Apr 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8RlSs1NaNgg; Wed, 22 Apr 2026 21:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E479A80D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776891840;
	bh=2dDrFP4dUSU+FWuFrgjGqJxWhFurhWurVLuOtZsYGlI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BD0/6OFkL0UG/OWcOJExljmiYb/EQb1pf6aYYxuyH6vfRnSkS6I6spwIlhvFTFztS
	 ZwEntEASJdp0YWSpukoleoBmX+pfUIa+vIG4dgecVRbfHxUU+tLoOPDWF7PJeFfgwq
	 c5vhVDcsvxh9z2QQnPY2VarBGYOMu4KNDe28Iwlky6bb8oGdJvGR5dmiEVqTsGWCif
	 UsAsaKfGwkBY8D+2/FSNvyPj4qY4MKQroR4JHW671E0hRvUmZS08vQPVo58eKMLAi/
	 sh1XoDEsC8hPybc9TcvMg20ym7/o2C5PdgWjphB9mZS/Cri7NCWov3qYo/hlrQJdk7
	 vI1m7mTLuXiAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E479A80D8C;
	Wed, 22 Apr 2026 21:03:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 126B024D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E998980D8D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PnDynkrr0Vj for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 21:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BB1D80D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BB1D80D8C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB1D80D8C
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 21:03:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 299F878034D;
 Wed, 22 Apr 2026 23:03:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Apr 2026 23:03:52 +0200
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 23:03:52 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260420214451.2704785-1-aperez@igalia.com>
References: <20260420214451.2704785-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <4344a8ff7bdd0413ab2904f8575321f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776891833;
 bh=ZAW0sj5Ztk9d8O+BbNJPNd93Z8NoNSRdYTXymV+9/k8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qa373+7b1uwCUN6uyrtCDLYwNbLTn9VUj8nhDasgIvmoF36yU+uXWyc/6fm4ZuYmP
 WSpag483fbLfaU32vlqdgPxmkYLVwu3JAxuLUQx++mRAU1K0PjUGuAjRJwKL3O8N8T
 UkYPJ62Ryolde1sE5HPIPM3ZHEIDozMGxIMr4EZfEHezc2J+pU6MQY8r7j538oBxOM
 CdA8ciZLs3dgEbcx4v8DYMXBexrzbZ+7pJ+a8N92nIqndGasOuT9vgv6HFRceOgvHj
 je8YgunaxmZfixFH5GMcTWuO9dMrasti6OZUaim/guZWphYMbBpjpt6YTPja0TkfF6
 Ly6rYzBtuJBew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qa373+7b
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to 2.52.3
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

On 20/04/2026 23:44, Adrian Perez de Castro wrote:
> This bumps WebKitGTK to the 2.52 stable series. A welcome change
> is the addition of the USE_GSTREAMER CMake option that can be used
> as a blanket option to toggle all multimedia support, which matches
> exactly the intention behind BR2_PACKAGE_WEBKITGTK_MULTIMEDIA.
> 
> Includes fixes (among others) for CVE-2026-20643, CVE-2026-20664,
> CVE-2026-20665, CVE-2026-20691, CVE-2026-28857, CVE-2026-28859,
> CVE-2026-28861, CVE-2026-28871, CVE-2025-43457, CVE-2025-46299,
> CVE-2026-20608, CVE-2026-20635, CVE-2026-20636, CVE-2026-20644,
> CVE-2026-20652, and CVE-2026-20676.
> 
> Highlights of the 2.52 series:
> - https://webkitgtk.org/2026/03/18/webkitgtk-2.52-highlights.html
> 
> Release notes:
> - https://webkitgtk.org/2026/04/16/webkitgtk2.52.3-released.html
> - https://webkitgtk.org/2026/04/13/webkitgtk2.52.2-released.html
> - https://webkitgtk.org/2026/03/27/webkitgtk2.52.1-released.html
> - https://webkitgtk.org/2026/03/18/webkitgtk2.52.0-released.html
> - https://webkitgtk.org/2026/03/12/webkitgtk2.50.6-released.html
> 
> Security advisories:
> - https://webkitgtk.org/security/WSA-2026-0002.html
> - https://webkitgtk.org/security/WSA-2026-0001.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
