Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69636C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 23:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E65461281;
	Tue, 29 Jul 2025 23:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2aMubB8bSgH; Tue, 29 Jul 2025 23:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 470FB61279
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 470FB61279;
	Tue, 29 Jul 2025 23:39:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5556913D
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BFCF40164
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMjkuEhjpDFQ for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 23:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92E33400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E33400E7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92E33400E7
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 23:39:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EAD1213F86A;
 Wed, 30 Jul 2025 01:39:06 +0200 (CEST)
Received: from [192.214.236.6:53250] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Jul 2025 01:39:06 +0200
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 01:39:06 +0200
To: stefan.nickl@gmail.com
Cc: buildroot@buildroot.org, Aleksander Morgado <aleksander@aleksander.es>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250729172639.46544-1-Stefan.Nickl@gmail.com>
References: <20250729172639.46544-1-Stefan.Nickl@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8450b904d73e81a72f106f77fa9dad1d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753832350;
 bh=afrDFrw0bcXoJ1Aokardh1xcon1Ybyr0Q1W20x860w4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Osid9/gQGEA7nEZiCAU/wMovkMJovMN07Ptw0kLcq+6xAYmjB0GbVfdLp/ezXHNyO
 ywzrDLKxDfS9xmA/2ffBXCt7wdGkyy2W5K8yuhfSX0ygOwaLW6KIlHafJUkotdoe8t
 vSh4Rv+cbZp9PsE9mfvxuuuGrTSLykuaBZWzAiitfeUCrl7OyqwTffaUSFKx/TJGyo
 5viSLxmeb8IWBFV+1YGyc4JrMRiz9v137e7Y155ChsfpEzdAH+82kJzkTkLw/h3bkT
 gii8vPOIkuUngNVNFtwzL5QlAcs+ousFMy8OBehyqkpEVlA19rtXhqbwWon/JEHDfv
 tA6E9S8swFjCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Osid9/gQ
Subject: Re: [Buildroot] [PATCH v2] package/modem-manager: Add option to
 enable AT commands via D-Bus
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

On 29/07/2025 19:26, stefan.nickl@gmail.com wrote:
> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
