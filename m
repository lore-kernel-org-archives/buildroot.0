Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF7BCD8CA8
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 20:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C81BF83BD9;
	Sat, 13 Jun 2026 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y77snmn5neOa; Sat, 13 Jun 2026 20:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C625583BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781382942;
	bh=IZhXwgVs8yd9XVPpCGokukTYwF95kEVjXCnF7K1Isak=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lB5Y2Mxx7N8aCJp5ixV73vybzAGpHS7Xh2IVkxVKzOafWe0MKEPu1uXbEdscs2UlP
	 Gt1Cuq42PWGPJfdYQPwMH0k+D8VGCn/0JsGt50yV93AZou+VRUsHf0G0T6TeMyxmU5
	 n5sUTix0hhRSpsg3DzL8vKAlQg4SiWuzZugudD4j3stAFIIqvic7h3HydPFKcSj6Sq
	 c8DZ+bXbxJfSlwiFPsDkJuarrD3Lc1sQfggDHX+v8YoshKn6zFGpKKDybTGzQo7LpL
	 s2dxvlsiCkWCzOOLfscYC6rR2p0HHcgDudf87uOI2PHY3R0aOKtr/Jwzn47zFhMLUh
	 acu7IP0OMvYJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C625583BFB;
	Sat, 13 Jun 2026 20:35:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CABB2322
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B13D2403E3
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHN_3DoEPcGK for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 20:35:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3BC3403E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3BC3403E2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3BC3403E2
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 20:35:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1968388692; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 13 Jun 2026 20:35:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYV4p-0000000F0tL-0Qx6;
 Sat, 13 Jun 2026 22:35:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260604102140.3252257-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 4 Jun 2026 11:21:40 +0100")
References: <20260604102140.3252257-1-neal.frager@amd.com>
Date: Sat, 13 Jun 2026 22:35:34 +0200
Message-ID: <87v7bmnppl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=b+r+gsiaYF/el95HRb4KQJXd87mqtuIbVlFMB+E/oTjwqJ8jmolXPh7OYqtplwJw+yq8FAcAOLkEkm5Sa1UKV3Q0ZjYrhA2KvZmYy3h0mlTF5EDN/Ue6m7XJ2wx74/hYK9RYKlA11VUYvsxzLISyS+ux36OMpJPtILPw7mNQnp2ap3FYF2eDABt7a3M2VIS+UDtkh+jS+GefC6kV9wIJjoJSQWvlj/wrKRNaeOrx+0GtrEW8pgLXZQv/xr1zx5Aml4FU4C9uRHgJYgJHriGx0QuuDjyZNqBDOVqJ2j78RHjJ3KZPLSJkAxB3JP3jD3bbD57lNC0I6bw9UBRQjXZ3+Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=dDTFPapm8giGXxhjGQL1PUv9jUn48UdAp4GGMdaPylE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=b+r+gsia
Subject: Re: [Buildroot] [PATCH v3 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Bump gcc-bare-metal to gcc 16.1.0.
 > 0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch is already included in
 > gcc 16.1.0, so this patch can be removed.

 > See here for changes:
 > https://gcc.gnu.org/gcc-16/changes.html

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 > V1-> V2:
 > - remove 0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch as it is already
 >   included with gcc 16.1.0
 > V2-> V3:
 > - updated comment about where the sha512.sum is coming from in
 >   gcc-bare-metal.hash

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
