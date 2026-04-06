Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E2FF46C78
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2875760BFB;
	Mon,  6 Apr 2026 19:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDp1OLwycbQM; Mon,  6 Apr 2026 19:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E2860B1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775504706;
	bh=8n0rsvDkl0bCRVezcTtdDavDzjiNYoyiziR0VhzaXU8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pLHLQC4qr/gKI5leb/CwYUniyNoyFgMBLY3D79Kf8PHzsZbEWy37/JPtMTe7WPdyO
	 HC+BAwmfbEKDFRI+cL/bozzGY5Ee5IjPnq7YLmHPdtoHtC30VMT3042quEzkK/dfOD
	 b8QSuVV4zzDRPidCpdAeomFfhwS5DnuNWC2+7OBrpCxg65ytBMA6Uy/ecn9ZvvwVSQ
	 rX5EchMkUlT45zhQUvnSZhs66OWMP0ndEuinwVyeNzlrIwlblM3ZSh7VmtdtzCmM0G
	 Dgs5OND36SNoTt0Ik61LUkupXZqJeptOBnLEEOrHlgjM4MHDKoTPYrrgarWrDugAbr
	 P8nK0DEcOiJvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E2860B1D;
	Mon,  6 Apr 2026 19:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B8AA1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0150440608
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nazfKihBJSgI for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 19:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C911405F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C911405F9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C911405F9
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:45:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 071C613F8BA;
 Mon,  6 Apr 2026 21:44:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 21:44:59 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 21:44:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260406181810.1853090-1-bernd@kuhls.net>
References: <20260406181810.1853090-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9d950574ff3a4eb2708bd017ccb32498@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775504702;
 bh=zqJsB1dSvi4ZIZssoRjluF9AieV938yh4Ssz5uEnpL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tJB8Nz9/HagoQg6srDV3vC8Ao7nncoX4Fe6f9dgvVvDTQINHzgC4Yz1RU8uvsIdJf
 h0jAsfSK9P43WHxYqxFdRRN/gmx0lRx+wXAIaZr7OhhBOMU1jGtxf/yJ1z9jiOPpdO
 hyFytCccnEBLos1aPJcMJ5H0HvKyzdDzOS9mTNVPybEjM0Wo29vIwFtgkrIn86NE5q
 yy28CB2XaAcwIyqzLB8mQSmztfuEXiWVjEYzstNFjza2+7HmpbYsX4S+/2HYsJLUAZ
 YRotgE02JMghWMHDRg+oCDHAooKtHn0LvVmur5oZI384TG3AHGY/sKqtOAGXS3bNSz
 HfW6eG/d3ZpMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tJB8Nz9/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/suricata: security bump
 version to 8.0.4
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

On 06/04/2026 20:18, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
