Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CAAE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF145606A7;
	Thu,  9 Jan 2025 09:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VH3itBtJ6K1N; Thu,  9 Jan 2025 09:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF724606F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF724606F1;
	Thu,  9 Jan 2025 09:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8983940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C89A740119
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpKjMPW8xoom for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA0994004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA0994004A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA0994004A
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:06:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -377248993; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:06:11 +0000 (UTC)
Message-ID: <69b17dab-78ed-41b5-a68c-329249c435ac@korsgaard.com>
Date: Thu, 9 Jan 2025 10:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250106215514.1531389-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250106215514.1531389-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kEOcXZUuhV/+3dUe3qLpn2UXxke3sXxb7Q2Yfr+u127CgfGRuz/H3nEcM5jtkZeCRleZ0QRB6qHUwm++zbb7gf2Rs/MT4XatYNO9v6PLnA/lJ4ULJrl5dv1aDq4RcX8Y4BWxvv6B7Vc/b64EM+/oWgs1LuXNdihexW520Ig+/RDZEpdGP9UQCH4A5Ym3NQkz/CzTwod5tX8bdwl07IjcQRxfcoYoCzEU1XhWaEAGzEgp3YSziiTahf2LuoMvT3vy4mgGS8mAp0zcHsc1uFKzGE2zsJIREsI1cYtYner5xe3qlGKUsRpum/L+qpGFv7Arkf9XZ/7bUTBOvq5uy5HCEw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qs+sU6F/FeyeNr9wfdIidMQ5+merfw7HU0DcWvrOlF8=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=kEOcXZUu
Subject: Re: [Buildroot] [PATCH] package/opensc: fix build issue since bump
 to 0.26
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/6/25 22:55, Thomas Petazzoni via buildroot wrote:
> Buildroot commit
> 1f4b4ccde7ceb379010aeb93458792202622d64b ("package/opensc: security
> bump to version 0.26.0") bumped opensc from 0.24 to 0.26, and the
> build started failing with:
> 
> pkcs11-tool.c:7854:45: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]
> 
> on configurations that have BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
> disabled (it is not explicitly selected by this package).
> 
> Our initial fix was to simply select
> BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH, but when investigating when
> EVP_bf_cbc() started being used in OpenSC, we discovered it has been
> in use for a while... but in code that kept being disabled from
> version to version as it was broken (upstream bug
> https://github.com/OpenSC/OpenSC/issues/1796), but it was apparently
> forgotten to be disabled again for 0.26 (the issue is still
> open). Therefore, we opted to continue disabling this known broken
> part of the code, and submit an upstream PR for that
> https://github.com/OpenSC/OpenSC/pull/3303, which ultimately will
> clarify what is the right fix.
> 
> In the mean time, this allows to fix the build issue.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/ca51b3e8e3ac83e2a69814caa84d9862385b956f/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
