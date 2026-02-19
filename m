Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2493E9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA6A40B7E;
	Thu, 19 Feb 2026 13:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzuEP-bEBCI8; Thu, 19 Feb 2026 13:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91A2D40AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771508326;
	bh=rQHD1xwQxhlo2vuDBfDPVQaRxuyyuYwuCyfP3knYWoI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KsQ1dbNQKQgP+JUyyErqAP+ib4MwwtxfBBqBiGPSpvCPCf2rxibXwan9JhQk7Tig1
	 BsxlUYkoH/xs5J4W8ZnFQLNk8XQvvgk+v/FXk1+sEfaypIwGTX0XvTqfJWbcxbBQTU
	 OAS56pedeF0Nez2ePSKnXRpe15VNI4ik4BizpnkFX0u3ko8rO87gxZcqeBlaGzFYZb
	 OisfF3gSFevjkgaAMP+awbHZoOz5hTZEe2MCCt+dpp4QVZSTauilnyBuR7HnUXbwxC
	 dYGfzDheZWd8OVNAfScQHKj4JP0InqYqwQmr/2sqKuzJekLYLhWBpY59JcIV6oflca
	 k6REP4dnkVVEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91A2D40AF5;
	Thu, 19 Feb 2026 13:38:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A2171CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BB3406A4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnHt5l9p_FrY for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F630403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F630403CC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F630403CC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:38:44 +0000 (UTC)
Received: from [192.168.112.49] (unknown [61.8.147.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 57B392C84162;
 Thu, 19 Feb 2026 14:38:42 +0100 (CET)
Message-ID: <a8a49c27-8594-4c41-aec7-030987882cb4@bubu1.eu>
Date: Thu, 19 Feb 2026 14:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manuel Diener <manuel.diener@oss.othermo.de>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260218132845.3113245-1-manuel.diener@oss.othermo.de>
Content-Language: en-US
In-Reply-To: <20260218132845.3113245-1-manuel.diener@oss.othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771508322; bh=WGXAEEUquFRDpnosrOjzZbC8l67ExFVZ+h6VzNdLm1A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jwKEOm5AeIgtnPMR5uBcK+Wip/zuR/qQNsocsgjaJC/eHoBnpQ3r+1mdQzTvkuMD+
 6uEtdKDuLNCYd5D8ZBtAHkUFxY516OonoxDwFoJFuv6fg/egRPJYf/zUzLPNKCWzcn
 0v/ZbU+zdVFh+Y3cZApcHwC7EuRFq8a5YJlMqaOSB76KNF61B43xIkiCUhcHCm4JNi
 +BFGV97kiHej9NvvNOwbODq0/QjqUn6TFEkMVMuYGUdm2wbW/crDjqeT3s6LJ0hoCj
 c1jFS83cmb0HaB5CqKp7aEkhS762lOTS5A7KKuKGtVDH6w77qTGIn8O08Kheg5rEPC
 3tr6iT/2Jqwyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jwKEOm5A
Subject: Re: [Buildroot] [PATCH] package/python-anyio: bump to version
 v4.12.1
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

On 2/18/26 14:28, Manuel Diener wrote:
> See the release notes here:
> https://anyio.readthedocs.io/en/stable/versionhistory.html
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---

Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
