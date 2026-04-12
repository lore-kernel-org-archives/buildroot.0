Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08CBE937E3
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 14:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C8D844D3;
	Sun, 12 Apr 2026 14:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFmTz4bBiWPY; Sun, 12 Apr 2026 14:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94667844CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776005026;
	bh=DM+3fsv37YlwThljhH30YhvtvwGxXCYgA2Tyh7COBsM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sAaUnr3Bln2c7d0r+3XDNqHTvnJ5t2r4Ebc9c1o87ZXkhSXLHJjI139WqCSEMn3D/
	 xg5WA+Po6fU5QXaotmkT7Wchuppxqs4mfOcvQOtIsbmy5yIfFh56T1z4NT5Wm42FQE
	 XZWaOB7lmUhwxJ5J9kUkfXKXB6bC+2FREw0cdyOwHw8dL60b9n4W/868G9jFWiGYq9
	 d+e3oaQee6H696kC9yHMsG2qKzceE+eGOuyDTEwlvbMlRSXEinTEYRceVpyS/gvyXQ
	 13DYKMiEYAKhbk8AZbs8BU4vFblr1CNHMKQ0kNSBKO5c966eLmv1uKig3nA0yuR0Tr
	 Iv2OzoUbN9ogg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94667844CF;
	Sun, 12 Apr 2026 14:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A80D194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C427844CD
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2r6B9MwgShF for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 14:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F8CD80ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8CD80ECA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F8CD80ECA
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:43:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6518EB00535;
 Sun, 12 Apr 2026 16:43:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 16:43:38 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 16:43:38 +0200
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: buildroot@buildroot.org, Javad Rahimipetroudi
 <javad.rahimipetroudi@mind.be>, Javad Rahimi <javad321javad@gmail.com>
In-Reply-To: <20260412121607.1349535-1-javad.rahimipetroudi@mind.be>
References: <20260412081915.1335127-1-javad.rahimipetroudi@mind.be>
 <20260412121607.1349535-1-javad.rahimipetroudi@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <b3f086e97ccd3772312c0175b01a202e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776005021;
 bh=Wd3j/TIp8s7QxWGGWp3KFlji0b8MVMArAKXMw0R9xfg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tK8TV+8zzriNAZWxMUsfdRRtEhylJUEqeWWSUDj8+mmxm30Yntbmup3EFFLTT1LvG
 OUOS4HMm9FwfObe6FKLvl299R7+sL9YTjYN7U+/xaC7IEYzUpILDJZ7EEFx1+cyVNg
 8f9T0NeQq/jo/Nq1Yo29ooKs1WX3plmjob3arJC6jaONV2FoOUsoGIrzaA54GN0UWb
 7MDQ4tHL4D47Cwru1Y6c+USOArw0UgfuXu7H5Soxl/kw+ELSh+MCww4E8HZJsr8jEB
 BxTlV27nXXGGbNanOrGGZSOuFG4Xn+VQ+tl07p7TkrsHS0Lix8HbOdn9pqwntt2Kot
 MqFj3jdzVmVpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tK8TV+8z
Subject: Re: [Buildroot] [PATCH] configs/orangepi_pc2: bump uboot version to
 2026.04
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

On 12/04/2026 14:16, Javad Rahimipetroudi via buildroot wrote:
> This patch fixes the autobuild error for the OrangePi PC2.
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950361
> 
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

Applied to master, thanks. For info, I added
BR2_TARGET_UBOOT_NEEDS_GNUTLS=y needed by this new uboot version.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9882f8e5c1c33361509325b6d30a211da465882c

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
