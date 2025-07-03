Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20931C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6E9615D4;
	Thu,  3 Jul 2025 19:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AEtOEso-elV; Thu,  3 Jul 2025 19:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F4FD615DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F4FD615DC;
	Thu,  3 Jul 2025 19:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74C84B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 19:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66BAA40F8C
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_e5a0pYxvi6 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 19:51:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A33040E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A33040E2C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A33040E2C
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 19:51:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2BA1F78035B;
 Thu,  3 Jul 2025 21:51:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 21:51:22 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 21:51:22 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250702162213.2989909-1-thomas.perale@mind.be>
References: <20250702162213.2989909-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <9031a89f7fd333b1907cb02e42a2b9bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751572283;
 bh=F62GB1SWBm3N0GUkvO/FTfpefkcn+D0l1+7dL52+Fqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lTYMomGiergPSneuLHnrAMsNnoaTm0Sdm8WDDuojTFKpUx4XawRZVTiukGy3cvR2a
 CxA4Kfvq7iC6LVPlLcfGoVmyPSgGLtfSsVafdukzEkcYKmxFbwLtb3GSo92xmenMAb
 CqLO8exItP0VfT/StPoqibL/yxY4foBUhutctchYVSKSJ8Kl2OWCcUYVHTbHC9iCjv
 3edpjmBVr1QPL/Mq9dGXlmZRsrQf/jGm73X4cQ0PqozcTe1csMyG8oTyKK8cSAdBpS
 6+Rqbc7KIOEnAj8WZRYwYWE4iSjswy4PMqxrSflOZAukYDOEkNBfkPAIqXUIxAdv4/
 4UlY8+NTPtrVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lTYMomGi
Subject: Re: [Buildroot] [PATCH] package/libp11: fix build w/ host-gcc15
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

On 02/07/2025 18:22, Thomas Perale via buildroot wrote:
> The following error appeared on the autobuilder for host using
> host-gcc15:
> 
> ```
> p11_attr.c: In function 'pkcs11_addattr_bool':
> p11_attr.c:126:25: error: expected identifier or '(' before 'true'
>   126 |         static CK_BBOOL true = CK_TRUE;
>       |                         ^~~~
> p11_attr.c:127:25: error: expected identifier or '(' before 'false'
>   127 |         static CK_BBOOL false = CK_FALSE;
>       |                         ^~~~~
> p11_attr.c:128:44: error: lvalue required as unary '&' operand
>   128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, 
> sizeof(CK_BBOOL));
>       |                                            ^
> p11_attr.c:128:52: error: lvalue required as unary '&' operand
>   128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, 
> sizeof(CK_BBOOL));
>       |                                                    ^
> make[3]: *** [Makefile:646: libp11_la-p11_attr.lo] Error 1
> ```
> 
> This is due to the change in the default C language version in GCC15.
> 
> This patch backport the upstream patch that fix that issue by not using
> the keywords.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/da7/da71db9b04f181b9d2e72df73ac8541709f5a1d4
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
