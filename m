Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF8C83F34
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA3881D68;
	Thu, 29 Aug 2024 16:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2dUJ6XenzzG; Thu, 29 Aug 2024 16:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0754F81D72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0754F81D72;
	Thu, 29 Aug 2024 16:16:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 405A31BF84C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A99741A0A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkAB2QlpIrz0 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FBAA419EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FBAA419EC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FBAA419EC
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:16:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14285E0003;
 Thu, 29 Aug 2024 16:16:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjhox-007WrA-20;
 Thu, 29 Aug 2024 18:16:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240721211628.3485003-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Aug 2024 18:16:27 +0200
In-Reply-To: <20240721211628.3485003-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Jul 2024 23:16:28 +0200")
Message-ID: <87plpr2tk4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: requires DES in
 openssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Enable DES in openssl to avoid the following build failure raised since
 > commit a83d41867c8d69a77d5cd0a665aa216af5340359:

 > crypto/apr_crypto_openssl.c: In function 'crypto_cipher_mechanism':
 > crypto/apr_crypto_openssl.c:385:27: error: implicit declaration of
 > function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'?
 > [-Wimplicit-function-declaration]
 >   385 |             key->cipher = EVP_des_ede3_cbc();
 >       |                           ^~~~~~~~~~~~~~~~
 >       |                           NID_des_ede3_cbc

 > Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
 >  - http://autobuild.buildroot.org/results/4b1088a705f8564f85e629316f5cfc92953f0047

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
