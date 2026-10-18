Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C93CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224574096D;
	Sun, 18 Oct 2026 09:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7d15FVg3EbQi; Sun, 18 Oct 2026 09:51:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 568C640937
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317093;
	b=Tk3Ds0AUGmf5mVex+fu7vLeLcugifYi7M1w6AybkhYfMZYlpw9TcaXl0zQ0k/2/8G0xw
	 UXFFkqBNmkPoaBGpHc28oXGmMjMT3EBPqVMNzNDWkSJnKPLCvZABR5pTcGcb4Byy5H0Bi
	 ZrQvfOXnLnr7wC5+FwGSjzrUR9YFDwnyHH/f0DuwhN9htVnW1iJo3no5eBFqHwv8ciJyM
	 Gdjm012Osa27+ukVXxb4hYv24yFqDyMe6cVRsSQIRUD8zSfh38BFpBMaX1CsdpJsEL3Xj
	 qNrW2zTVcPBfmEWzjaYsnSFHkdg0e9pPjLNlRmTNFPzlI7gUg7hWaZDTnjx0zwmrDug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QT4km6nAhObO3VrE6jHqYW678/7xx/pJ06U27ApoU14=;
	b=LL/WhCK4VlCf4ZtmcF1S1I0YROgm+6tUimFWheisbcmQ04dEC0IU7o0/3zSmI7+SlA2n
	 fH8n2wmRMUYkneO4J/df0MHp+KX+nU67u2QdyYjdNzhceUJm+To0ZW3sNzXSueWGVOKtj
	 kV/DowKLfzkL1KpHyk0M23AG0GePIfvFpboCVtYeacIJ+t6EnUmRmdWNoTM0soc0gETkI
	 bNiVjcVVFqTK14I4EOFVgXwgk7AE6+sLkn+4HwcVYU68PLiFla05R6FluBZpBnWXgNEsl
	 /U+zKqR1E4GZmx+rli+zEnYNCof1AfqhIy+2iWuEMHVGAaw9DaBugOeczc/J3ZBOLJw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317093;
	bh=QT4km6nAhObO3VrE6jHqYW678/7xx/pJ06U27ApoU14=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P0TaW6yjRQqyHsGKdkROFg2KKQcAoj7hE6pZI9/yRMQPB4sndeegH9/zpo5dEoN6J
	 pKWym6lNxZhp5/HozwZSDY3bGCLpI9L+ukecU3yEECsUfk26dSPqAki3UWKeSM9qHv
	 g66jX5RMMnr2KTdm/IcnLZiFeFhOIJ8von/ZE+X+Oz/5smSNP60Hd+uXT8t/2Dh2jC
	 WwMKVVQlG9nM2p1gb7ll2LxA8u+Wn6hE4+E5n+2ejkSQ8wI8dSAPwqylnSjpNScxn/
	 3zqxuIvwk6TWZ5Q66TXRY7e2BWyts31ctJfBjRDLSE4jFSBC8iwBO/iFYwy0U4JJgu
	 5/HkMmr+NbYnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 568C640937;
	Sun, 18 Oct 2026 09:51:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2208C23F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CAC400D8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOcinSyxg3Tx for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6D6D540060
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317091;
 b=leglhqiW8oBjIP5mdS2ux+vk11Lpl+kXk3WI97TPEisKAEqI/dBS4QUL0jxn9KHNKehB
 Td9xZjMpH4k0UEtm5wxjLzE9m6pZg3kNLHdSMSbD+a76s5dsmB2hlcQ/TMTTnjd00HzMs
 MZiDxbuLM4tv9Cpm+RYQlOYlK6GE6n52PwKHRb3gtloPvXT+PO9vvTvXNtuecIV1OBC+k
 XB+OwuiGa0kMz1edwNvjaQjUFAa1LT/q7JbxCYYTZzHYBPDiUdrwnW2TvV6Vn6JklRaZ4
 wVx9WzKTelxPjLTLpeFaaKGnDu4hgYdm5BBnv7hrvMLTA81DXJdcPzNbT+CHueeoZ0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317091;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Pu0kO6eM11stDK4aekzuZVrvjOm5iFmHgiJPoeKWkbA=;
 b=O5UkyhPxFU7i6reYnMVVuhMo46Ul6d26YZPozmB2/wVizrQXWa3KkaPzgWIkhyJXem/Z
 x+vuv9RwtCgIgk6GIOsv0/xnRiaa6TCcx15teP+ld1T72Wcy9k4swnWBu3gfckAzw1Ict
 ee8DGnj5WaL/N/z0Ikqw1SG+3QXkMODv9r9uN/8jhnReA+NMOB452M8lOWlkFvx0CeZn4
 NBVOVgup3B9i+CBUHdE//9eH/m/iEaguaubAreR85Kk1C/LZ/IgpP89ZuslLaIH4pSg7+
 qyhf7Xpsng773ncuEVPuZ3omKx2lIiHD3oPnvFiA7CGcXmTNoLjoRG9ujfaLQzrcetA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ir1QwiBf; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D6D540060
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id ED0B419F5B2;
 Sun, 18 Oct 2026 11:51:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 11:51:25 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 11:51:25 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20261017140027.697390-1-fiona.klute@gmx.de>
References: <20261017140027.697390-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <85f8f26ccbc830dfcb6fcfdf3cfc583c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/2] package/p11-kit: security bump to
 version 0.26.5
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

On 17/10/2026 16:00, Fiona Klute via buildroot wrote:
> Security fixes by versions:
> 
> 0.26.5
> * CVE-2026-18938: rpc: guard against overflow when decoding nested
>   attributes
>   https://github.com/advisories/GHSA-6x8p-h5fj-5ppr
> 
> 0.26.3
> * CVE-2026-13757: server: fixed stack exhaustion via unbounded
>   recursion in RPC attribute parsing by enforcing a recursion depth
>   limit
>   https://github.com/advisories/GHSA-p2wm-69qx-x25w
> * various memory management fixes (including memory leaks) without
>   CVE or details on possible security impact
> 
> Full upstream changelog:
> https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
