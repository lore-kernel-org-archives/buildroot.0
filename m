Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E88AC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA2DE83D7A;
	Sun, 11 Feb 2024 21:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i20LmHdOZI2; Sun, 11 Feb 2024 21:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4682850E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4682850E9;
	Sun, 11 Feb 2024 21:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7646B1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 620FE418F5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VASmSOYU3C-v for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2600D418F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2600D418F4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2600D418F4
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:33:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E21A01C0002;
 Sun, 11 Feb 2024 21:33:45 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:33:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211223345.2298964c@windsurf>
In-Reply-To: <20240211170707.524645-1-fontaine.fabrice@gmail.com>
References: <20240211170707.524645-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGZiut/cMu0u9+fd+dM9B/nI+gbGLyFTAEBn009B0hQ=;
 b=aaQe/uf3u/oGEEnl/dUl9Sze4tynXOXbD5A+3OAFTCLSz5kXdn0k022ANYMsiRxIVhnQSr
 WDUc8NjwB9p/qwV+OpA+eHHY7h+IA+lC6rTDBqmLY09X0Ohl6nlh7l7hGnGTDhR0o4PKCt
 5E68dG66wehQFTTZoYlWvFLYhUssBVCQzCefwCb1bMA8dMreuhUhzy0PPaiBsAkSSvoaA+
 BMIEKMY9ykKDvRyDrwMoBS+wEFFCPcTyI472Lj0B1TyMeIpwzUJ41T5Jl5R7bs9ZBoJd7C
 lI8z97hu4bvk6v1TRIR3PE/iR2GdRFVoubmDQ8vE2o32FUAWTUWe2k9q8wrIJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aaQe/uf3
Subject: Re: [Buildroot] [PATCH 1/1] package/cracklib: python needs
 autoreconf
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

On Sun, 11 Feb 2024 18:07:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set CRACKLIB_AUTORECONF when building python to regenerate
> python/test/Makefile and avoid the following build failure with python
> 3.12 (which removed imp mpodule) raised since commit
> 36e635d2d5c0166476858aa239ccbe78e8f2af14:
> 
> Traceback (most recent call last):
>   File "<string>", line 2, in <module>
> ModuleNotFoundError: No module named 'imp'
> make[3]: *** [Makefile:485: install-pythonPYTHON] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aec4c19fdf8087c76c1d5f472e855e0f84fcf7fd

Thanks for the fix. Could you describe a bit how an autoreconf helps in
resolving this? Is it because the new Python comes with a newer set of
.m4 macros?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
