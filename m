Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9CC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 07:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECFD2400B5;
	Thu, 15 Aug 2024 07:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flL8qgdeJNi2; Thu, 15 Aug 2024 07:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 919F240485
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 919F240485;
	Thu, 15 Aug 2024 07:47:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC86A1BF5A9
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB23A805A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 07:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9qSjOIWm_JA for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 07:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9AB6B8058F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB6B8058F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AB6B8058F
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 07:47:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 965F0E0002;
 Thu, 15 Aug 2024 07:47:39 +0000 (UTC)
Date: Thu, 15 Aug 2024 09:47:38 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240815094738.266ac1f9@windsurf>
In-Reply-To: <20240815062841.1051418-1-roykollensvendsen@gmail.com>
References: <20240815062841.1051418-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723708059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvRMwP1PZ5UfdQHjfPlqOJTkoZg3JcL6JaPV8hrg4vE=;
 b=lMbun6Wmbz18rovYCg8XEsgR/GzzbeYp4nced/vh2XPnx+qmQdzQRnLXSOjkX9ui7goT6e
 UOp57r4kH8Ki2gTUxsBB34389OdcjCJABk2p/YLiNVIW3dx0/4+QyqnYtXfDBCZYXHzeNc
 VTVhL1BWyYxgr2fLiSP62C+9ytE8EBjjKSpDsB2modC2MWOLDx8Ozg/aopcnCmCFxNO1M4
 mYGWxU0eo3aUsv3mWEwIx0iDqCrbgMiJRmq4aoMVm/gyiR+t6TrAnqKWhNlkFjZPNQaizl
 DlNFlrFgEJXG7a/GxMGeNCAz7t+1yIsto1zbNfxzE7RMH96CoLnT/lJ84K184Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lMbun6Wm
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6base: fix CVE-2024-39936
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Thu, 15 Aug 2024 08:28:39 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Fixes:
> https://security-tracker.debian.org/tracker/CVE-2024-39936
> 
> Got patch from:
> https://download.qt.io/official_releases/qt/6.7/CVE-2024-39936-qtbase-6.7.patch
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks for the fix, but I actually have a request, see below.

> diff --git a/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
> new file mode 100644
> index 0000000000..1d11eb9fd9
> --- /dev/null
> +++ b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
> @@ -0,0 +1,155 @@
> +From 627617b002a34a9a0a63bcd9529c655e93d6246e Mon Sep 17 00:00:00 2001
> +From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

The patch is not from you. I know the patch
at https://download.qt.io/official_releases/qt/6.7/CVE-2024-39936-qtbase-6.7.patch
does not have any author information (which is kind of crappy from the
Qt people), but it would be really really better to use the real
upstream patch. So instead, could you cherry
pick https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58,
adding the Upstream: link and your Signed-off-by ?

Another question: in https://download.qt.io/official_releases/qt/6.7/,
I see two other patches for CVEs. Do we want them?

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
