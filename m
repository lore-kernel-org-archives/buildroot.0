Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6140ACE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31735413E3;
	Mon, 17 Nov 2025 20:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg48BduNhO02; Mon, 17 Nov 2025 20:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AADF40A21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AADF40A21;
	Mon, 17 Nov 2025 20:05:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9591BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEDE340A21
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7RsxiCXGDjU for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A927540092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A927540092
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A927540092
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33762B979430; Mon, 17 Nov 2025 21:05:05 +0100 (CET)
Message-ID: <060ca0cf-75af-44fb-873a-78fa86e84d03@rnout.be>
Date: Mon, 17 Nov 2025 21:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251103211146.57344-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FYyz/MHMRlFrn4hpK/alfxH/IssXgc6KOZBz4EDjn3g=;
 b=Tg8pdPzpChpevl7PZ8fWGZxWehrbPBKEOS6/o1Jy/9uZyRpaUcbBuaIdMtI00AmAkpRBBy
 rHMmVJVc0hG/3aURhfgj4dbW/Iy3GLoF8rGZxCwac5rfcXc5aZSOL4S/e2AqtuJ3WaMmS+
 DKFFj54fBliPKkazqC8/YwBp5WqDvsId0u4APdsMi/LlyMK/3vxtj3eZMKDKEs+xw1Svog
 JIkT9asD5J8y9Kv2JfcEAy+tlC/SxebX5ti0IueTbNaH0mXtIRK47LyoPSEnomTq94SlQQ
 PAXfXgYvuevGpCT0NV8+Z1qGmjIpk9QjqhihdQLpxDi1/+oGluADA/Bv1sXi+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Tg8pdPzp
Subject: Re: [Buildroot] [PATCH 0/6] Fix CPE criteria matching
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/11/2025 22:11, Thomas Perale via buildroot wrote:
> Thomas Perale (6):
>    support/scripts/cve.py: remove print from cve.py library
>    support/scripts/cve.py: fix CPE matching
>    package/pkg-generic.mk: Set <pkg>_CPE_ID_UPDATE to NA by default
  Applied these three to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

 >    support/scripts/cve-check: add cve-check script>    DEVELOPERS: add Thomas 
Perale to cve-check & cve.py
>    docs/manual: add information on CycloneDX

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
