Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3104DC5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 20:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E983D406E1;
	Mon, 10 Aug 2026 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbLNEftIkfs8; Mon, 10 Aug 2026 20:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF796406CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786392021;
	bh=9dti41ipbbXR4fHiFUoJSX6EZRnoLBaXlpHOBz1MsJM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q93MdMHMYQapQt0pYypEJRTKMiKm0h7g6odN0DAIFCFsL0aGVpeDvVcDREVuxuFxm
	 B2HygcgmRnse6a4Als3MKBrlcu5XZMVnjioPLSIowwMk9tPkNku3dBwA649MKNVLkP
	 uBaZlC+byWpNsRQrIHURcamh5/+XfftKK8zQSRy42QOBBxhil2o5Ufyq7Gv5fM3eDF
	 4D7KxyA01agFwNHqgkRH8fbkhdIBMBzrjuYmC4/2Sub+/aX5nC7+fjoZbTMVHg/2KS
	 Q+eCAROjXobej9WhruRZt3jkeSwEE21zO37j9uwH5TsrP77X1ApM+2BwR3vcZjPRue
	 utJZiVH7zIOvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF796406CF;
	Mon, 10 Aug 2026 20:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A4F296
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 20:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C460E406CE
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 20:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8hSQb0vjRnx for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 20:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB636406CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB636406CF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB636406CF
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 20:00:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9E8AC78034E;
 Mon, 10 Aug 2026 21:59:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Aug 2026 21:59:56 +0200
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 21:59:56 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Petr Vorel
 <petr.vorel@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>, Kurt
 Van Dijck <dev.kurt@vandijck-laurijssen.be>, =?UTF-8?Q?Jos=C3=A9_Luis_?=
 =?UTF-8?Q?Salvador_Rufo?= <salvador.joseluis@gmail.com>, Philippe Proulx
 <eeppeliteloop@gmail.com>, Brandon Maier <brandon.maier@collins.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Chen Pei <cp0613@linux.alibaba.com>,
 Sergio Prado <sergio.prado@e-labworks.com>, Alistair Francis
 <alistair@alistair23.me>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd
 Kuhls <bernd@kuhls.net>, Gao Xiang <hsiangkao@aol.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Etienne Carriere
 <etienne.carriere@foss.st.com>
In-Reply-To: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <9bf232af42f25d210bb1cfec0151d3ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786392016;
 bh=ocgvMaB6kVid/S0L7Wed8yzHXBHfTcTjvkEQ7ypC23s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N/t0QX3cd9HQA3i5GdLQFwZ5ozbWZpiC8uPUL3xuvwBS3+Gu4aJ5PzJXz8m5A87cV
 l/I9sS9hI14pPPk7Ea8IdkbiueIb//YvXgj+EcGB23qcAuuUPaH0d+Z/jBZGUoBtxi
 ofducTsZR7S7+6YTRF/5uQmkTXeNjdQKAkKEUWg6cSOGT36SZHiWpO3qejfJ7kyFEV
 xDnirx4HUKFEhh5WGj7OTAGTCs2M47P5FVGQFFKS13U9D96t56DSKYHOTdyz9RxiJ7
 DYZVib7Qnl29/gj6otfVCDf6Z2N2TxIsoNd4gEtIckqDEaO1a9VqiJSkfJ/U2k+AJs
 NGUAntavZhP2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N/t0QX3c
Subject: Re: [Buildroot] [PATCH v4 1/3] package/jsoncpp: add host variant
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

On 21/07/2026 14:53, Dario Binacchi wrote:
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I applied the patch #1 and #3 of this series to master, thanks.

For the patch #2, I'd like to avoid requiring MMU for util-linux
libuuid, since it is supposed to still work without it.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
