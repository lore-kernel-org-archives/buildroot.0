Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90772CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F7B60E16;
	Wed,  6 May 2026 12:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnIInHNtvQ2K; Wed,  6 May 2026 12:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B4160D4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778070662;
	bh=UJh2OGA31qvpSKw2cjsI7HrjB6nnxFxD3AsevUKou8I=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BQrl50bjBkP9VEBXHnlSq4cu4Gum1thwVPQqwAw6h5FoLADTFzSDuCzJBRiw+lRUX
	 rdyWzqlF3xtWDriM3hDudNOfvhrrT2z+ScFV+yR2VXUznKi4T264TQvtWZnCpH79vz
	 A1dtN2v+pmj1VltVGtspH7Af0RVYMQizGEkZsaEjq5v2KjSPWgtk1VczpHBwLxWheL
	 HvNZ6HjdP4OEjE6tOOITEfBkIzVNi+BN+zNx7eq38HtIiKHHZ3y/Ut+8Q7uVIjRFM0
	 hbcBf9FSNcqpyORpIdDP3NKIZDkkvfkK8epiF5w8lHpo+RqY29ISwgeSP9TpW/rA74
	 hlJN9DoU0s34A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B4160D4F;
	Wed,  6 May 2026 12:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA3B11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6516860D4F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2VNMzZ8gF7V for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:31:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93F5360C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93F5360C20
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93F5360C20
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:31:00 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 688EF2C84123;
 Wed, 06 May 2026 14:30:58 +0200 (CEST)
Message-ID: <b5d02d00-6a47-471b-9954-10a94e9af818@bubu1.eu>
Date: Wed, 6 May 2026 14:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260419120951.543386-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260419120951.543386-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778070658; bh=hjtSOT/NcoLfqpHbrsvEeDnNHVrcnvMnCGbIcyboi9Q=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=k3APB3EZ2gJJQyDBJlAddDxwhjWJjS5q4Er1iymdDTA+womGn0Rr7tlhb2rWKAsxp
 SaOziOE9wDjWKALcX99SlzeG1fkA92M/tp670nO025xxc6jI9Z6EA5I53YE2pBnib+
 Iz2/dRSyfOSNzTN/e1QvIndz9CQJQcaecorZ18h+Mdeu9WoNLXkmuvr83M9uJH6int
 7KBkGbgo3pn2g7NC0rGXXzzF/I00oN7q+L6YDlgpcwyynJqzENZWls0D7fVVZUCbWZ
 KWAVVOS0B1SNsEgfdY35K37Epx6+InvGEh00IJZTbdomXDvz3z4P01HkzvPSnwIqJG
 GGHwYmMABf/Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=k3APB3EZ
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v62.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/19/26 14:09, Julien Olivain via buildroot wrote:
> For change log since v61.0, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v62.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/13988027879
> ---
Applied to master, thanks! (There's v63.0 available now btw.)

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
