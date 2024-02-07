Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4950C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C1FE833AE;
	Wed,  7 Feb 2024 16:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3CVmf5TC0NJ; Wed,  7 Feb 2024 16:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 992178352B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 992178352B;
	Wed,  7 Feb 2024 16:10:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D35D1BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 475088352B
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDEjAgkc3wNu for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6B97833AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6B97833AE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6B97833AE
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:10:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99954C0008;
 Wed,  7 Feb 2024 16:10:35 +0000 (UTC)
Date: Wed, 7 Feb 2024 17:10:34 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240207171034.535dd392@windsurf>
In-Reply-To: <20240114184111.454187-1-thomas@devoogdt.com>
References: <CACXRmJj_RLgX7yHPCc6cv7tn4mHkcJvrhY9kzJ9fbdH6Y-pa8Q@mail.gmail.com>
 <20240114184111.454187-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707322235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/wmiD33B81wVgR3yXqXlM31nQ/ZgZe3DaAprgQ/RZY=;
 b=YTWTl+RDRe/knVouNsRUBkE9Vvjeyh+AhWwdxAYrykE427gRn8yCCYwZuVKsNLcJ31fcCp
 utmgNq82cLK2N9YKq1eBwjKElvWkk6oG6VcAR5tlo9tAx4OKycZ3fWe8haDyBLRmAQCc+Q
 sjv9fVE7CvrOX7dsc1tGIzsp1wkXfcp/fLCD4ilz++GQnBWGOP+cNKTnrWqBva5ZveTlmK
 w47tyQBzQCCQ4rNHXbvQ2Dt4ozxl6la6CoTqlscqGO+SYDPmHMMg8CnPu3UtB+BfzsTkh+
 8yY1+hdouqhHO2/58OOmIeeBp3V/0itUhTBGKMLXH/m9Q3wYmeVRwG0EXlCQBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YTWTl+RD
Subject: Re: [Buildroot] [PATCH v2] package/libglib2: fix libiconv (intl)
 support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, yann.morin.1998@free.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 14 Jan 2024 19:41:11 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Libglib2 can compile without localization support,
> but still depends on libiconv, which is selected in Config.in.
> 
> This fallback support was broken, and is fixed in this upstream commit:
> https://gitlab.gnome.org/GNOME/glib/-/commit/a497d5be122f193dcf8679334308333bbbc14a71
> 
> The other patch is purely added to avoid merge conflicts while cherry-picking.
> 
> Fixes: http://autobuild.buildroot.org/results/04d/04d9a17e64503e0bece7bad33549ef3ad4b237c9/build-end.log.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: dropped meson libintl wrap, problem was the libiconv detection
> ---
>  ...ion-of-a-system-provided-proxy-libin.patch | 53 +++++++++++++++++++
>  ...05-meson-try-iconv-in-libintl-lookup.patch | 53 +++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
>  create mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch

Applied to master after doing some research to explain when the problem
was introduced, so that Peter can more easily decide if this should be
backported, and to which branches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
