Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA20D58E73
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 07:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B1483CD6;
	Mon,  2 Mar 2026 07:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG7BtBA5XXub; Mon,  2 Mar 2026 07:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7984F83CB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772436979;
	bh=mPmIjWpAwVUclFpFIt2KyXSE5cStyo4z5BnwOaz/q7A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAXyW6/T2Pw555Y5ZfjRmzbQENddmM4dEu57k0/rojRsFPsjiEiBGIXad9CA7V6JY
	 sWFa6YoEfIpUwPcZH9aIuRuDJlGscHFEaCpa3PQwvS5RNqlmLTI9VBZ2G4fA4GCdZM
	 gw3nU0dwNvHMSO9G9nyDqqT6CV4JZ1lGczimYDSx+oMIV4ySSH2SINTpKBdRCsLcWf
	 dY1BSXxMvD5Q/uF4Ma7ZyMmqANG3omnlQAgCZLsrxLrIgiEfPZwdzT9lzMxcCW+N/y
	 +mJsC+2OKgEyiVojb1Fd2fDTh5B2ipTNF+P7zjqGbP9FBBMkkfBHhOH5G1kVR/EdOo
	 TTPN2HZKnEh7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7984F83CB8;
	Mon,  2 Mar 2026 07:36:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C0225B
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 07:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE943406A5
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 07:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7ZNq6UsdPec for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 07:36:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8ECB7403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ECB7403CC
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ECB7403CC
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 07:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id DEAC35A0004;
 Mon, 02 Mar 2026 08:36:12 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm8l2tOsMrAu; Mon,  2 Mar 2026 08:36:11 +0100 (CET)
Received: from [10.6.32.203] (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 84FF45A0003;
 Mon, 02 Mar 2026 08:36:11 +0100 (CET)
Message-ID: <880228d6228cefee52d9d8571042d52eeca6ef3d.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Mon, 02 Mar 2026 08:36:11 +0100
In-Reply-To: <20260227144940.104688-1-thomas.perale@mind.be>
References: <20260226142023.1064241-8-martin@strongswan.org>
 <20260227144940.104688-1-thomas.perale@mind.be>
Autocrypt: addr=martin@strongswan.org; prefer-encrypt=mutual;
 keydata=mQENBEhbeIwBCADbKW4rqhkBsvQumeWTAfy+Q+YciIbbqLvxwRZPKpxz19nxJQPbWF7pG
 oiPb3TWLK3TitWVKKZuNILStsKTGiR4RqLUs8n3sESPoz5HmRqsijm6yJDzzPAE3/B7IWHBeAOssV
 TWS7b9ROz4iFI+fNLnqMqE22zMEItC2r9zi6GpDmi/QP3CcxHFzPMF5iQkMPp6QJMwOdPvYR9kBb1
 x1ubDOjsfWqI41neJTGlv3EVFc5nkv0s7PfoYxMkf8/VStd29pMe4csKJUaPDkLqenLl8Omq8Z3F+
 sbjdo+hcim4i3EsROYh59kA4/UuMFfI0hxaIaoW6UAb6gyqOHkS6vC+VABEBAAG0Jk1hcnRpbiBXa
 WxsaSA8bWFydGluLndpbGxpQHJldm9zZWMuY2g+iQE4BBMBAgAiBQJRsHoSAhsvBgsJCAcDAgYVCA
 IJCgsEFgIDAQIeAQIXgAAKCRAQGu6ewTL0wxf8B/9EThZXuVqNTK2nH2QuRi2zQntFXkK2QbU11sv
 zkfZV8xDfWKHdq67LLako/FOE1dXN6iurWFChgMexs0bSMzaftCmHGSSgGaQhBhANSObKu8M+UyHd
 bes88zNpQKdwVd9guIo6oRrX33IYkb63ifZReChcBffu6cjXQky7/79kpnl6f3qlP5ZluyNGX9Iwe
 z1EpmG2zHkJlc+3oPQbsQbFKjUOdR1hfyKbcVVQHs1ddv830Z0cpM6QbcknR81VsCQ7FYBrH5Hw3N
 AKhrfbIaZMvwBgQfXIgc7mwPZFg2oONZMzauzX6EpZ29Z+kCsy3AArnZssVAwxk+ydRJhUWlZmtCR
 NYXJ0aW4gV2lsbGkgPG1hcnRpbkBzdHJvbmdzd2FuLm9yZz6JATYEEwECACAFAkhbeIwCGy8GCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAQGu6ewTL0w9ruCADDGN0JgrImHOPGgsJwdP2nKwBytO8mM
 Z/Z/folgH20zqiMqyNR4lOZW9L3DF4rz83fKXQFbP7nCf6GZ/tmjmrImiTZBkKwr37ZsaBRaCz3i9
 rYITY94njenYp7jy6roMcvlBMhNjSI04AvLjaA/hcPuSexqqso+qoNTa7+VplF7OpikB8vKPt+fMp
 XuGP8TF/q8v9TrY+gcVv0c8ZOrGDnI5vJt1Fp0PvoH/vXFx3Jy90g+hRUYFbLW2S76geiGVML9AeK
 IQKjEpp2bxsd+JYGo91MeKBqjlllonxZ17eKNtlA+X+iluwcDJZzdabB19EQG7ZEf0jAy6Sy09au6
 MYFtCBNYXJ0aW4gV2lsbGkgPG1hcnRpbkByZXZvc2VjLmNoPokBNgQTAQIAIAUCSzjspgIbLwYLCQ
 gHAwIEFQIIAwQWAgMBAh4BAheAAAoJEBAa7p7BMvTDaP4IALJRUmUEagBRrdAi1SrxxcsgPDr5vo8
 1UrPADXKnMdf6KXPqfPMN4hIeS4zbFyC/FA9cg0T9680pVk8hLmcD3iCRMMnL9d38hOQmMxw2TYnd
 7rth1LuoDRhIwI1bfADw3EJGEMsTy49zVtVl1KwmqBZDDk3PGHvukHYawleOrTRVitOEvavg0vfgg
 CgqvSeSBy3tkX2EIlagC/5eXpYLguj1iI84xG01M4bZ9PU+PuzZADaHL+a9iPelBvk0uNjwKvKjPx
 OPDfaxsmEgjNG7M9gZjBkjSjvclRUlLMpe+3qHhGEYf2yKsv72hCLYy8my5jRnu59eZq72lX9YWVs
 jlXU=
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772436971;
 bh=HmIYxFH4jd4ejHq8DW8kchkgGnXiMYuIFivLr/Tt8Hk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=EHbhvBMYtx5n394vbVksp5IiTevCfHN+pNZGQccY/FdLVbaau76W+wmx75XBgezH4
 yw0EzCmlWFADNemqMjYvqEe2b4DGw4OLhkLrfkBkBIUZxWvfmcSHYqy/J8fj8gnkRC
 UYVrY79eBDrY9Jo0c1UUuuHyjOeW7hFfmoV5m0wylxYEQPTj4Y6/M56Nokl5u6seGK
 uqNdYioq/PMu2T60Yn/V3FHC469PN96SCLJegfCrrXL97RFC3IFgDc8c/E2mvyjYNx
 DKKk1tZgHuBt6/MNI5sObFq8xPng4skmjcRMFxRvVfaT+NlIU6S0lAE1kMWmOLwOjA
 1rbPai2tldtSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=EHbhvBMY
Subject: Re: [Buildroot] [PATCH 7/8] utils/generate-cyclonedx: allow
 excluding vulnerabilities section
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

Hi Thomas,

> Interesting to have such insight, do you happen to know more which
> are the requirements for TR-03183-2 ?

Chapter 8.1.14 of the document [1] states:

> If vulnerability information is included in an SBOM, this static data
> is unnecessarily propagated along the software supply chain in
> unaltered form each time the vulnerability information is updated.
> Consequently, it is required not to include vulnerability
> information in an SBOM, even though an SBOM format specification
> supports that.

I'll add a reference to that document.

> Regarding the `--no-vuln` feature, I think we could actually extend
> the feature to be able to generate the vulnerability in a seperate
> file. I think it's a feature user are interested in as it allows them
> to have an external VEX.

I see, I'll have a look at it.

Would you prefer to just separate the CycloneDX "vulnerabilties" to a
separate JSON, or to directly convert it to a JSON in CSAF VEX? The
latter is probably not that hard, but not sure if it shall be in the
scope of this script...

Thanks,
Martin

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5#[{%22num%22%3A41%2C%22gen%22%3A0}%2C{%22name%22%3A%22XYZ%22}%2C54%2C785%2C0]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
