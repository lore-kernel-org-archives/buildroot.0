Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6969C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8253F60BD3;
	Tue, 18 Mar 2025 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfbDtalE6pGY; Tue, 18 Mar 2025 20:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EFC8608DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EFC8608DF;
	Tue, 18 Mar 2025 20:40:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CA4950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65CD84076F
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS9sp8DioODM for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 20:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 054D340707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054D340707
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 054D340707
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 20:40:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5CBB1B005A2;
 Tue, 18 Mar 2025 21:40:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Mar 2025 21:40:41 +0100
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 21:40:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Colin Evrard <colin.evrard@essensium.com>
Cc: buildroot@buildroot.org, Colin Evrard <colin.evrard@mind.be>, Frank
 Vanbever <frank.vanbever@mind.be>
In-Reply-To: <20250318083905.45217-1-colin.evrard@mind.be>
References: <20250318083905.45217-1-colin.evrard@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <e25814f1208c789fd6dd3134ec111ac3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742330444;
 bh=pE53DmkKUu2nWx1KpXSsQrsSn8mixNiHsi4G7ir4rAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BQ/Cbm6sTlUr8KuPQshWzG+u51G5VV5oBKTqVoKrmcXFQ3/+VxtGVlWTb8AP7k88R
 ux/tCdSlCsVzpLDiNs+jebelH6xFZ7VnlkQimgst9axeRCN1CRY7Qpa0gHuVyfwC4E
 nef+3Evn1RluydGldtfsCEiz4F38x/2kQu11qQToc+vl6rwIX1bSrMvIIt6o8kD4/D
 Yg/TU8l0IOE2Z0maqmh+O4/yoegnA0EdPpcWoq1QL7EXunEEqoGdlp1BahEhObt9DO
 N56l5IR0cb+4lk4RSPL/PHw9fypzKJ4TOP1Bw2yQ6HyOi6kVsh+WtpmuVCgEM78HQZ
 izDQQNUybeENA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BQ/Cbm6s
Subject: Re: [Buildroot] [PATCH] package/libmodsecurity: security bump to
 3.0.14
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/03/2025 09:39, Colin Evrard via buildroot wrote:
> The project has been updated, including
> security fixes to issues present in version 3.0.13.
> 
> - Fixes:
>   https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2025-27110
> 
> - For a full changelog, visit:
>   https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.14/CHANGES
> 
> Signed-off-by: Colin Evrard <colin.evrard@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
