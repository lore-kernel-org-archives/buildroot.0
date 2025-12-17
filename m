Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD4D64084
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 07:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0D640DDC;
	Wed, 17 Dec 2025 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HD9F003d6yDf; Wed, 17 Dec 2025 07:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 981B040CE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765955342;
	bh=9BqJobL0zclNJYbSxGBq9jREhTwXlfPGdvb8w/e5jTE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eo/3y9J24nKEseq2ndJMGZgdTGLAEHsmRu1xZioS74oKJkNjZY5eS4Wej1xZQBOPf
	 EA+qoa7UjTd6Zi4VB7pjmKnfnpVP1KyAWk7yG5iHPqeoJaRfbVerhRAwjNzIaBxQeo
	 Me2Q7+drtzMgD/R5fAgNw0C0+PDqxNx+qAUw7vGODpsOovRQLgbn/uJK+nz+XQPFMJ
	 tQL+d5Avh+XZ1i26ehaq12RXn4V+MvhliPUdyHugjepYsn+8dU4dPj84aFI3pRCLNb
	 vGLGtebcx9ExRln4qr0OAkxDtPt1/9mKvWBJQcRkwk472TDu3U3nMoRBVBChKw3na+
	 lPpPatt0A/c6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 981B040CE8;
	Wed, 17 Dec 2025 07:09:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D09364
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F1A7607DD
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYZLLtE7AbUa for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 07:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D800E607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D800E607CF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D800E607CF
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:08:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 843587526; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 17 Dec 2025 07:08:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vVleZ-00000004K3Z-3thc;
 Wed, 17 Dec 2025 08:08:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Martin Bark <martin@barkynet.com>
In-Reply-To: <20251216182845.2575378-2-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 16 Dec 2025 19:28:44 +0100")
References: <20251216182845.2575378-1-buildroot@bubu1.eu>
 <20251216182845.2575378-2-buildroot@bubu1.eu>
Date: Wed, 17 Dec 2025 08:08:55 +0100
Message-ID: <87a4zh8u0o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MVnRa7SzQg0Jnko+yxPGm8KnAyIX9ZmbTqsyIzE0CRzrQA1V3zNV6PExvqwF30BQ/mYnKS1GEIXVr0TujF/I0s/55RsUGKdSSM19JSKXTlwhJEBtl5YUcEENVEClMAtr38xGa7a/hXL5Z8qbAEfc73DFMUXwAyRaTi4yKZRydO9WxJuoqz9qBN/5m7PGl6+oPi5ulbup9zmPGpPKjEjCfXsVPp6hCq29k3DzdxSvI0AdYCybe3EMJx9OFthb+q9jvn1frAihT98RsoSX0/R5ahwMH+GHy8Rd0J3eTMllqt3CxGrMrtd+zAbbXfoccrdEhBK7JnO8F1XTJazZ3k1ETA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=LUhOo7z3WJarBsWWvz1FTECZqLzcMoFPNVuuGtcLLhQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MVnRa7Sz
Subject: Re: [Buildroot] [PATCH 2/2] package/zic: bump to 2025c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Release notes:
 > https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
