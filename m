Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C736E9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 11:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15F5880E2F;
	Thu, 19 Feb 2026 11:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm-j_D-vxE8q; Thu, 19 Feb 2026 11:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7980782298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771499759;
	bh=j7ALIuzyXQubcVVA1+5HgVd3gg2zxWu0otAbIpux7Vc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=o3sz6lwC0UQiFqGC4Gnmd9LK2LZ3ae3pA/Y9QcsIeFS7VD1CoxRLenzZMSrpyc5kH
	 snkZn6KYuIcxyuviO68Kv0xXl/FJFdAY7uF6424nqooOGIAiMWA/fmF4iBM6MVFPdf
	 bJcQhm2NTaXNpiHoWbO38IHKu+8B6AudPDoUqTafFnj9JC3UmXKZCxWqR6VSKYmCsF
	 7yTMN+HpZ2IAhwYyKG5btOARnawRpkVg6SpGi08adQzr1Jt6VdkTKgD9ICEj8v6g5i
	 1wtjFRmuVBRrZ3mGqj9CYJA7wEHFpEOJfEZg5z3zHSnoggsUcj56Bj77rI5B7OnhPo
	 0GKpD6v9wx8qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7980782298;
	Thu, 19 Feb 2026 11:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74FFA1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB3D40682
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YR5cU8x5seIL for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 11:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EC5540671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC5540671
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EC5540671
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:15:57 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5A42C2C83203;
 Thu, 19 Feb 2026 12:15:55 +0100 (CET)
Message-ID: <e0c8b0cb-816e-46eb-9cb6-45825bb2c88c@bubu1.eu>
Date: Thu, 19 Feb 2026 12:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manuel Diener <manuel.diener@oss.othermo.de>, buildroot@buildroot.org
References: <20260219084513.13714-1-manuel.diener@oss.othermo.de>
Content-Language: en-US
In-Reply-To: <20260219084513.13714-1-manuel.diener@oss.othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771499755; bh=kUk71OUaXTeuTVC8DEiTC2hUNEPxNezLheJvSHjtK74=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=UNu3JlwqwDINDrNTY2AqtHCXVKWulFuezgFLRlN6Iy4DZAaodbGVq/RRETEXcKLAH
 gG2vOCdAeI9U8xkkK/5FWj0okzXEp75Pw2Z8vyzqk0PKfT28s9rPWBAEo+zzU9GcQp
 GnVeV+chqviTU1hCK7W1OGv+0/qx7ThdfLDqTkohEv9ck0QMHAqxawDyzOqoa6cOhR
 YTljit59I0zNAIYYjM57tQcucoKYU0bWuEyrDmREbt6KoFHKz88TJe3XgOgw5FfQr9
 Vivsbrr5gl1ZAAQzqEwlidhWlJly4oUQySfjzDgyZkRAyzaEX3pp048XzKBzPy8ti+
 f3E1N6qGCXFcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=UNu3Jlwq
Subject: Re: [Buildroot] [PATCH 1/1] package/nghttp2: bump to version 1.68.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/19/26 09:45, Manuel Diener wrote:
> Includes the releases with the release notes:
> v1.65.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.65.0
> v1.66.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.66.0
> v1.67.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
> v1.68.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---

Applied to next, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
