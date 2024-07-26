Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A75C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 06:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB34381EC0;
	Fri, 26 Jul 2024 06:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpSqriS6Hgsn; Fri, 26 Jul 2024 06:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C125781EC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C125781EC1;
	Fri, 26 Jul 2024 06:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 433EC1BF83A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31A1881EC1
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ezKso0dnaFM for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 06:43:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15F8A81EC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15F8A81EC0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15F8A81EC0
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 06:43:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C34BF1BF203;
 Fri, 26 Jul 2024 06:43:12 +0000 (UTC)
Date: Fri, 26 Jul 2024 08:43:11 +0200
To: Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <20240726084311.227da789@windsurf>
In-Reply-To: <20240726025539.30665-1-danomimanchego123@gmail.com>
References: <20240726025539.30665-1-danomimanchego123@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721976193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Gwc9PSbujTrGsFnfZQjb5/IKN+0ZuPAK/3WWvFTeIM=;
 b=YunYAzsJYtsqk5WVVM6jELgx8b3Q8n7MiUI0R+fDlxhJSIqr711PLfp/kAFjd1bc4TV7Ux
 4Nc3nomwGasBJ5MoCHxUdb7ER58/3S2L8QKpxW+r8PEHI+HeTMn3dzKdYardGfsz0avirx
 4AYHicjmYlcgn6U2d03goSIzStlyPCtu5w8dMCrb/+C9WpOJhZ5cbafg/kTVC63eicp04+
 Ej00lhfcNOlKG4y5Zz/8yGyITnnwPPEbovdkNYWDtsdnPvBSTTBH5l0eTzutqqDnHVq+BP
 dtwwa/94z8FM5x2B5ZOIsxj/Zf+M8frW+/o2XFQqO2QyI15EvqUFlUR2b4Z7qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YunYAzsJ
Subject: Re: [Buildroot] [PATCH 1/1] libpwquality: fix PAM module path
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
Cc: Stefan =?UTF-8?B?U8O4cmVuc2Vu?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 22:55:39 -0400
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> The libpwquality package provides the pam_pwquality PAM module - the
> replacement for pam_cracklib that was dropped from linux-pam back in
> version 1.5.0.  However, it currently installs it to the wrong place,
> so passwd and friends fail to find it.  This commit sets the security
> directory path to /lib/security to match the corresponding setting in
> linux-pam.mk.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/libpwquality/libpwquality.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the fix! Could you indicate more clearly in the commit log
which Buildroot commit caused the regression? Is it the bump of
linux-pam to >= 1.5.0 which happened in
276f1e0a896698abec85500a86686bf72c79eb91 ? At the time, was
libpwquality already providing a replacement PAM module ? If not, when
did libpwquality introduced this PAM module ?

Indeed, libpwquality had this optional dependency on linux-pam since
the package was added in 462040443ca943694fc59ec8380c82f8bf9aaddc, back
in 2017.

The whole reason why I'm asking for this additional detail is to
understand whether or not this patch needs to be backported to our LTS
branch, and therefore instead of just "fixing a problem" we need to
understand since when the problem started to exist.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
