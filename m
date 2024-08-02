Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6964C52D70
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 06:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8228B820D2;
	Fri,  2 Aug 2024 06:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXxfwR92xt5e; Fri,  2 Aug 2024 06:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 995C7820D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 995C7820D7;
	Fri,  2 Aug 2024 06:37:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF2F1BF421
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ACDA820D7
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3db5aNbjU6S2 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 06:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43DD0820D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DD0820D2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43DD0820D2
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 06:37:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 742E3C0003;
 Fri,  2 Aug 2024 06:37:52 +0000 (UTC)
Date: Fri, 2 Aug 2024 08:37:51 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802083751.7bb3f9fe@windsurf>
In-Reply-To: <20240727135252.389739-1-fontaine.fabrice@gmail.com>
References: <20240727135252.389739-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722580672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFCl5bUFFvhLJx3Mawny62D18UqQnZfbtubrePeIyrI=;
 b=i0J71pwepM7d6EIkcjozSEzDACHTwn+vpZ6E3UX4cvOHOjgTiCzwvrBTaINYQyjY97Fos7
 bHBl6YGBTfaozm7b8snTGFMOXemq/83Z4hWnqzXEiBsML5CknVGOkIqW4g64sv8jrbGO+0
 EmA2nwBEVq/+iAMLYlbH4zw206mkUsfmLTfDYaTNCcnBTOIx55wSrH49RWPPSebRN93Wfd
 YPhPURJNQofBtODYz8AAXZuDrXetNcKpnKwBQCdTkqmMa/oD/alhvPEcme1I4zQMZx/Miw
 JhdbK47fefPgW0V6t9maB9Yb20l80oIXq9XEH4xuxgULMfFsJNA0pDh6JOE3pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i0J71pwe
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: security bump to version
 0.9-rc1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 27 Jul 2024 15:52:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Fix CVE-2021-3468 and CVE-2023-38469 to CVE-2023-38473
> - --{en,dis}able-libsystemd must be passed since
>   https://github.com/avahi/avahi/commit/bc116c05b15f1f478a40e47fe9fc68011cef1e50
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Do you think that this would also fix:

http://autobuild.buildroot.net/results/fbaed7ceb472cd524c7b48443453a91fcba741d8/build-end.log ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
