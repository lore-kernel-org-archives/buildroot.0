Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3814DD3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E6883C98;
	Mon,  8 Dec 2025 20:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yriL8pdNzLda; Mon,  8 Dec 2025 20:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1791683C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765226889;
	bh=lxTCPD4tSDXlHH7E7h+LnzsfMD/DaO05vcBSmAFMAqQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ELPdCtN/4JHTlKQlpX1GYwsmL+wo+ssOdsTA/ag9VKOMzlFLbGavOYjcSDpcGggRE
	 4ea3f1Bur11KQbN+pYVvv3PNMyNlmwLkDt2zhxKq20syVLh/Y6TgdKvD7mix6U4ppN
	 E1p4KqdjjMU4TqW2PTglJ3J+8J8IlkjN2bO8+wFZKxtyUvbjMCmHlQS9AfAP8pElU3
	 orlgfmONDp/XhRRoKS1V657NJr3u9Q4fRgA/WI45zM5IiaU1yte8Y7eTvGb9To2unY
	 NUgHkNN9ffzZixfY0arpS1VhRbKutY/20Cz922qTLOEWhEB6NaZAJRFmw831YzYsOj
	 p5Z8/DptBkMnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1791683C82;
	Mon,  8 Dec 2025 20:48:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89DCF151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C29740C1E
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5Fgav_7WPOy for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78F9540A31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F9540A31
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78F9540A31
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:48:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4AE88780368;
 Mon,  8 Dec 2025 21:48:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 21:48:02 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 21:48:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207183347.346971-1-bernd@kuhls.net>
References: <20251207183347.346971-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <6d1018f7db373b2a076a43f592afbca1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765226883;
 bh=P7ESdMgpCv2HLWkaxWuLyM0sgPK8oq5vt5ruKtjnmhw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U/OqvJVs3Zaz11RPHz5zw6j3hb6h2al7B6127RRCaHhwg0z3SaJIOqcCcdp3wTG8j
 fhwkZ0CLiSynO3LcoxEkF9GImjvcp6KbAmNM8VBJ2/O8SoG9LTnk5bYbXRSjEBUCPF
 ysFP+GYMz+c8NwWYMGwwHI8Or2XCjDA7mGx/vw7MfcQv8cfY/SjoKqjFB7DcA+MQ4z
 uXufIbBm7F1QeeyK3mpvd9mofMPYZIs/JVMTH5lqU29e7/ksCXg8ACQWNGcNjA03dP
 FVEC2YOmi+skr7WtC9nMXL88VrN+F1zdYHJNhqt0cE+8haaQhJxKFgpB2Bsho04NMo
 Kis/MUn/fTSHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U/OqvJVs
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kbd: fix zlib build,
 add optional dependencies
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

On 07/12/2025 19:33, Bernd Kuhls wrote:
> Buildroot commit 930660890bf8b40d9bd55cd9e202e574b53d5d49 bumped kbd to
> version 2.9.0 which includes optional support for various compression
> libraries. This commit adds the corresponding configure options and a
> fix for build errors caused by zlib.
> 
> Fixes:
> https://autobuild.buildroot.net/results/8ff/8ff6c3d940b68069f748f12646f7516ec86172c1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
