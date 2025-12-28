Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59846D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 19:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD0160905;
	Sun, 28 Dec 2025 19:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF8YAb4kej_u; Sun, 28 Dec 2025 19:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF94608EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948555;
	bh=1myYs64b1k0UjECXOjzjY8C5xb1fHefSHTbnpNTHXHo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HdRJR0b1mhHIwFxjFyk7eyJpTK1g73SqrFnN1+R8XCLPRdyTfkiW5CNWWpYHWCTLo
	 fSBTfqeDRoF4AaLXH0yC/JmelfJML9iw2vWsfSkJNDSiGWYn/pGX0pP8rLFWsHWiS1
	 cJm83GkcDibd+gOAOvNaowzN4X1ejUCEfTJhrNFiuBVOkwhAkW8+dZOIyAdQ4VhNzT
	 Dq0O04cfTPO5rAzhTL0drXDIVyluHXi62wegsUuh8yORY5ZlpjEXlT+9hALyt/Bt6R
	 GS5DEHQPop6TuP0yvDw7joUhFq/m62Y3s2nTBbY/nzakaV1+d+WjqDS88Q2+wu/+MS
	 3yePzbk6ZCwAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DF94608EF;
	Sun, 28 Dec 2025 19:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED429D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEED6813F5
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3tiqPtap330 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 19:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAF0D813EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAF0D813EB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAF0D813EB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:02:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D326F13F8A9;
 Sun, 28 Dec 2025 20:02:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Dec 2025 20:02:28 +0100
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 20:02:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251228075546.3372169-1-bernd@kuhls.net>
References: <20251228075546.3372169-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <e04902bdb3d8c6cd84067a9bee9f5b55@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766948550;
 bh=s6x5rHG9/3/fAvW+MpmragXfq7wuXbILrnriaSyaoSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O7Tqf56dApBKF+pHoVUmiB52OCXXe38Qy2l4onikQSeM6S/KOVLY3JXBDzqTI16G7
 GD00EjmD3aer37rHtm9dZxFDC5hDTXGP3jFYs5/11D02YXl8HEHbYKti1dyNYdn2QJ
 rRXIEbdCI1UDuGqhugqNIfK4u1pFW+Q8wFsB0tGUFV1tMYL7mnQ1XOJaxl8BGONlvl
 Wr827Yp7SBkS9IhK7/1qgYMxvw3yF8bZkPHvPRilE120+rQgQAoX44CdEUy65WAhlw
 aA2QzF3tlzhIoBwZtPu+VpcpWaLlQ51dBisqlIOnYU6NT43PHO8Ib80n7o0tx2dZBw
 n30KMtM3tM18A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O7Tqf56d
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 25.4.6
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

On 28/12/2025 08:55, Bernd Kuhls wrote:
> For release notes, see:
> https://github.com/intel/media-driver/releases/tag/intel-media-25.4.6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
