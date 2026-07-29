Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F44DC54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DBC3607BE;
	Wed, 29 Jul 2026 21:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_2yW1lIt9gy; Wed, 29 Jul 2026 21:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A13960648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785359541;
	bh=BrgAfFWWYRVnZdHh0gL+GP0Z8ekyW/0uSMs6sa+EYJU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dFmgbdyvx9+Qet2TD0mPHQoQaZyhxesXUgeM04bEHLoFiTBmGI9f8HObEG2hte7oN
	 6/gLDWm3CzkOoztVZ5OD+MWWlzOxUxh2ki484DPqov4NePrqCp4yS1DlDwbXGXUkoO
	 ldQGfRhKlp+eqgUlVLG+Ss7M1kCEKsEH6boHI1w5a2YP6mtQQD5AOVV++edufXXk+J
	 hu/6Vh/cTRVdX+++IIP3lb8XxbCLIREXaIJFjkWyFjDoGGuzCCE/XOLbW0hh3WoP4P
	 SkY1lMZJQ4bjUwByKyRGAFuJcR7avzAuWF5kMIU7DLIQM61JeVFOamJDpf9a/OHB31
	 IvVw/4EgNHiSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A13960648;
	Wed, 29 Jul 2026 21:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F4A28E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5825E80F01
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kyD3LNEzRNR for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 21:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69A3C80EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A3C80EFC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69A3C80EFC
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:12:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BCA0B5FF95;
 Wed, 29 Jul 2026 23:12:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 23:12:12 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 23:12:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20260729183508.133541-1-bernd@kuhls.net>
References: <20260729183508.133541-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <41bcb19773b0b268f116410a04f56f84@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785359536;
 bh=l0Kb2cvAFnSTGuABVniJoiAehKg1tDCXydo7oPKMVno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g5Qg/howBAyJrRR/bAH9IeK84zqQKZzGudj2MpikRNzIA1UQVx8vgAFP0e9JnRJqm
 BFw8eDJCUJN2FAHOy+x2SA1GZjIztbTwwWSEuhCYsdfgX6YAgNHsLCQ+FKlhw+cGIU
 +3MqtGZgGQ5Lto61aYOEeaOkU4cMhW61nbVporahA4x8DVGRzy/xHQdViicsWIhYgy
 NmYH+FX7hJnNj/FqKqU+MkHiLXZ7j+c1OiSaESLyoFVTQsuLAQ7wIrT0CTn2afO3W+
 99xD0bIdbRceCT4Cj+LkCVoIB5R232CzO+1RPZTLDpLpVpOGimxo3uDQgFEVrNSbe0
 cgt9luJhPXITA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g5Qg/how
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.6
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

On 29/07/2026 20:35, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-July/000862.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
