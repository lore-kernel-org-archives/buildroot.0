Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7280FECD997
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F78460034;
	Thu,  5 Feb 2026 21:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLVwWCeu7PZp; Thu,  5 Feb 2026 21:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D13605AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325897;
	bh=7Ke7sFho2ASwg/zAYdXehs2jGjkKBtxwmyn51VWr5SQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=W38E7LtIxeQAOxvEN0qwU2KDCkbyGtblfEVM35EXEo1zo9Y5uwEbMgevTMH2RzPCe
	 /Vp1kR3+FjNmpyT1sak/1c7RaDTlrzTmwIUTfaOvw/Tl1QItmOuJYjIKWU0hL9uyj2
	 taDUxwtwdmZ7/Mt+4xuxljngxeBjprW6tbBiDf+VM9kjHS30stdZQ19TliVzYHGlOX
	 K3fD9xjPED1P+jUja2gNrFEYZXH5XOOQWvtYJxfo1OOlevPsgvTXzSXGMWokolLWzr
	 aVhhfEfIaS5xprO1sviaQk0z6+k9qbqZ553ayuVdnhJWR1hmK9p+fmO71ENQZuKuzP
	 ZCal7bnuao7VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D13605AF;
	Thu,  5 Feb 2026 21:11:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C364470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CD154084C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ8gjCx_azCo for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 033AF40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033AF40175
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 033AF40175
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:11:34 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BC6732C8330D;
 Thu, 05 Feb 2026 22:11:32 +0100 (CET)
Message-ID: <7dfd0d95-485d-46ac-9b7b-65d88670866d@bubu1.eu>
Date: Thu, 5 Feb 2026 22:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20260205103500.169542-1-vfazio@xes-inc.com>
Content-Language: en-US
In-Reply-To: <20260205103500.169542-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770325893; bh=lvd24Jn8hnbIfaG74z4mrJxB37cwDjHfZ/IMLm1q+vw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=EXOVaPvJcwci8FAhfK8utz3lQM4t6Q/TM8z7YyA4MCsy7r1mW8PIW06vaZrb3rzLG
 Thqcz6U3mThJ7wmPhbUUbfWTt8bXYHp+MQiHZYJD8U7Y8UwJdWIRcXB+5lvhjy0uNB
 PsMTa62nVkuWOYAijmilav0MOa776u7GLCgrDnNTxAGK88y0yFZ5sXs6stoiOxIQo0
 8MMlPROsK9jlAfZNlL/lY1AsqPo9WjOU1WRBOEQKyTpyntgZV0goVXRtvSvERaFsDf
 fYZYKBOU6iJkRreK1d4ceXYBkL0B5SIbIlG6XACfKU2CfMVy0F+DtT0oYaF3DAgcDH
 d/bASGeWeB25g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=EXOVaPvJ
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python3: bump to version
 3.14.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On 2/5/26 11:35, Vincent Fazio wrote:
> https://www.python.org/downloads/release/python-3143/
> https://docs.python.org/release/3.14.3/whatsnew/changelog.html

Just wanting to note, that this is a security update, from the above link:

Security

     gh-144125: BytesGenerator will now refuse to serialize (write) 
headers that are unsafely folded or delimited; see 
verify_generated_headers. (Contributed by Bas Bloemsaat and Petr 
Viktorin in gh-121650).

     gh-143935: Fixed a bug in the folding of comments when flattening 
an email message using a modern email policy. Comments consisting of a 
very long sequence of non-foldable characters could trigger a forced 
line wrap that omitted the required leading space on the continuation 
line, causing the remainder of the comment to be interpreted as a new 
header field. This enabled header injection with carefully crafted inputs.

     gh-143925: Reject control characters in data: URL media types.

     gh-143919: Reject control characters in http.cookies.Morsel fields 
and values.

     gh-143916: Reject C0 control characters within 
wsgiref.headers.Headers fields, values, and parameters.


[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
