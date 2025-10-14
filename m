Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7148CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF4A760F83;
	Tue, 14 Oct 2025 22:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRnAJbD-WVGF; Tue, 14 Oct 2025 22:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EBF6121E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EBF6121E;
	Tue, 14 Oct 2025 22:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C89D4C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 636E640536
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPMXV9qlfrT5 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5138404EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5138404EE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5138404EE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:01:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C5762003DC;
 Wed, 15 Oct 2025 00:00:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Oct 2025 00:00:49 +0200
MIME-Version: 1.0
Date: Wed, 15 Oct 2025 00:00:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz
 <olivier.matz@6wind.com>, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Guillaume William Brs
 <guillaume.bressaix@gmail.com>, Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Mauro Condarelli
 <mc5686@mclink.it>, Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann
 <bubu@bubu1.eu>, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <cb84a48458c06a324824698baf034a93@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760479267;
 bh=J1k8k8p6rYa+x7pLN9zUP+jdoJmNPFN8Ul/ITFS0j4k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mG6ZmWa4GxN/Q+htnPE26I/6lT7CgydwXPwo+uSYYQ3/wkl9hBs7z0zQGNoCAKyrS
 IhVol98UGnzEfMQxfwHf+g7cKtE/3kSahEC2EyFQ0vtq01mgufsHINE/MZG5OwDu9+
 VDUvKToVBlBM96edDpOVZBWgQ7NtVasEZEmJ1tsKHw9enJxY92wLHH/m5i+AIIVI32
 Tq7WPX/UAcD1/624OEdrP7PC81JzwtDnCThALqqG/aoqMJ2/HSbDsU4TGJf92c8DqR
 Yn4ym+zbeNYtNY/TcmdV1bjOfBR2sabf4d9AqWaGN65d9P/3PvoUvWEBYpI67X2Jlo
 wA+H0T9i/M+9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mG6ZmWa4
Subject: Re: [Buildroot] [PATCH 01/36] package/python-parso: bump version to
 0.8.5
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

On 13/10/2025 19:54, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master (except python-pyudev and python-pynacl bumps). 
Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
