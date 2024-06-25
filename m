Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08454C30653
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 09:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B34F6605CC;
	Tue, 25 Jun 2024 09:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hqrne0NoKXNp; Tue, 25 Jun 2024 09:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C4E60679
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C4E60679;
	Tue, 25 Jun 2024 09:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9CE1BF5D7
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 09:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0864060679
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 09:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAHz9zLrfOwI for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 09:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D11CE605CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D11CE605CC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D11CE605CC
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 09:52:26 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 11:52:24 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2024 11:52:24 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 11:52:22 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 11:52:21 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.08,263,1712613600"; d="scan'208";a="158131769"
Date: Tue, 25 Jun 2024 11:52:21 +0200
To: Sebastien Laveze <slaveze@smartandconnective.com>
Message-ID: <ZnqTVec1xjimkGjo@tl-lnx-nyma7486-2>
References: <00b56f4cad554a6c6e13be1346df41673580fb95.camel@smartandconnective.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00b56f4cad554a6c6e13be1346df41673580fb95.camel@smartandconnective.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX103.corporate.adroot.infra.ftgroup (10.115.26.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719309147; x=1750845147;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=baxRGKCNoQrR0pE+QmnLQTTjM3gcRmksAtnk4Wvc4dc=;
 b=QaVftG/7bEIBQlEQsaJy5NBygFRS6SDs0ykbNtXngGS8mv0sP/c6sXYV
 /xQjv6QSz3ni2sDb7D2qENhNyIem7uCkfFqb84Yz5BUnYX2KJGPJHsDqm
 /GRywll//keZNjnahKE8E9BG+Q1B7IGur/Vw7VNbuL2VGaT0GJftLMDd1
 rjhgIdVej+LsMWhsE3Q/0v06yvEX94oLzlccQrImhEe7GQm69TH1o1fsS
 zLeLAnw0rU2rkJet5h/9Y5DDsoB7QAUk0SV6jK29gE3LeM9WDBKrwJOLP
 DA3ks/ow9CVsnexrq/LXIYJOpfCOnCE5J7zL826/HVVgTJTFnjLRe84Ku
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=QaVftG/7
Subject: Re: [Buildroot] Rust general questions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fares Chati <fchati@smartandconnective.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sebastien, All,

On 2024-06-25 09:38 +0200, Sebastien Laveze spake thusly:
> I was wondering what is the rust strategy in term of version support ?
> Is there a will to be conservative in term of rust version or are you
> open to regular updates to latest stable in master ?

The last stable, 1.79.0, was recently added in commit 2ab21855bb06
(package/rust: update to 1.79.0).

> Finally, are there some scripts to generate the rust-bin.hash ?

I think the commit above provides a hint. In any case, such a script was
also added very recently, in commit df899041fb83 (utils/update-rust: add
script to automatically update the rust version).

Hope that helps.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
