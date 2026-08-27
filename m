Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81212C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 15:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F85407DA;
	Thu, 27 Aug 2026 15:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrPHQuio_ufR; Thu, 27 Aug 2026 15:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787844570;
	bh=kFf0eUu6JEqThcu4VfQLkielyQXN4EmZJ0pUtqpXoUs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LO5KVcBMOKIJh18D0cQOdP7lhUh82doPQAtiwV7HFAL81IKmMtH1qL62joWr5P2ww
	 lu4Tv9KFB9S0l9/V/jAk0MQTd418722njb5/B9E35Erj62hlGoYSCXJApT+4Ly8t4h
	 Gmsak0AE6/SiWp/wMqIi0mQQtvhuNaKR7gFKMuFCDEa1OfVW2woj5AMlIbrVaXVAD0
	 ET33JyNtNALAY6H3diqc7/BOGY+cjveiHnPe5Iap3UANRk7ffNP36aKiI8YQrOwmOh
	 F5F8I1Ot4r1lYKonxfToCY3yT+dSghU56FXqiOMvb2RcMDSBhzCwyYTPYBULIOsbwZ
	 AKCOeYHWg2R6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60B00407C1;
	Thu, 27 Aug 2026 15:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5C5355
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF75780E75
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZqtvS_Ohk69 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 15:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C20980E30
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 15:29:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so22381235e9.2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787844564; x=1788449364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qDCBMkAijvZJLyprseufBkbCjgjNlHmU2OKyoZo9hLQ=;
 b=ar0VDLOk5QWlz8aQnR1GiGFqAuzaXN79oQNPjQCKIQEwpaTYVurKoDeDxnnFz0l9Fz
 fKtQ7qufnhk4RLTWikKT/8LsH+sNo7ZBf2V5MYKRxDYOSYxZa27tM1XAzkdFNWMkuWUC
 KekOkWPsKB+i1eDB+I8coFD6vZwCq/XuJb+nZu+VRs7ZlP2DEpXo8kC62NPnPh7hAbNA
 LPnMnR48BX7lnrBAExAqhua0q6s/e3z4m1PhK/B74Tv5FOeD4EoiQVu1XAraSG+IFRIV
 svBS7Pq0b1m2UBpdGEnmqzaAMKC996dRyorqFfJt0XCEnhdNHbo9yArnk8T0raI67iIO
 j4ew==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpgujr886iLuSzm2FxZq4Mb5LZJI7GHiOTGCR7/Cae1ukYW0QvYmt//LuJHer5LK/rMdZsi774cLoI=@buildroot.org
X-Gm-Message-State: AFuF++l6N9l4NEOWKm2WI4rQlcJqAXB4PV1PnIl39+/pToIz0v0dD17g
 bs63ob8hFPrLArBYE5utuxU7DNaiRmmxGwRcvshHyxDeRAYzIj4x0EdgMIzfDRGXkxg=
X-Gm-Gg: AR+sD12lMNRtvx3pfoWK3Fg76RXBkvFwTCYEWuAPsXSaJXGnZE5mR/OBWqx2Ukkl2wZ
 SgTv1aSma6WVLJhL5/+fBPTCdiGIuLgWo23NVtZV9Ego260QpGUgxCd5mo8kk2J8ReRsF0WhcHg
 slaKUq71OSA99ZDftxPPrwXro/LI/YIhXAlu7JsmLfSpl/1yklWE6DHa+oTPPguwdh29jRClhct
 EjoFo6F62Y6I36GH86PI48zQZt61HedYSgWAqKE0DXEIw2ylbrIdyYsn+OXr91K6j3FKuvM9HAE
 OlvsRPL0Mwbmtm1LUoPfPODeJ5YOWpI4CY1ebC5kmWxR6VlmereBbS+fgknUUDKwuNs29goMcRY
 JZKdV2RoyoMkCPKmQMJMgc7/lpp06oQHyERLfQxwTNq84AKcJ4utPvNLnDhWCMkkAyhza+N9Q4+
 XPzVUbEw6tQrcl1o3uQDXfP8kivc4c9+Ji2v/oSHgN+PiK2XY1dHZ11OePgh6V5jjby05g6NalV
 FT1aVscgcHvAboPiuCK206R
X-Received: by 2002:a05:600c:c172:b0:49b:72e4:6223 with SMTP id
 5b1f17b1804b1-49b72e463bdmr95410505e9.7.1787844563952; 
 Thu, 27 Aug 2026 08:29:23 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4923662bsm54254435e9.3.2026.08.27.08.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:29:23 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 27 Aug 2026 17:29:22 +0200
Message-ID: <20260827152922.453102-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826155155.4146765-1-thomas.petazzoni@bootlin.com>
References: <20260826155155.4146765-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: always use
 BR2_BACKUP_SITE in the autobuilders
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

In reply of:
> So in the end let's revert back to using BR2_BACKUP_SITE in all
> configurations to avoid those build failures. If we want to detect
> really stale upstream locations, as suggested by Arnout, we can
> instrument the autobuilder runs to inject a special HTTP header and
> then look at the logs of sources.buildroot.net to see which files are
> grabbed by the autobuilders and determine if upstream locations are
> really dead and packages need to be fixed accordingly.

How and how often are the 'source.buildroot.net' backups generated right now ?
By reading this paragraph I'm thinking the upstream location check could be
coupled to the generation of the backups instead.

Otherwise I think this change make sense.

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
