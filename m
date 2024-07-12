Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE42C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A477D412CE;
	Fri, 12 Jul 2024 09:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nx8Nx5B4w90D; Fri, 12 Jul 2024 09:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A234412C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A234412C0;
	Fri, 12 Jul 2024 09:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D798F1BF232
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D265A81E81
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7KMiEkk21-D for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF28081E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF28081E7D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF28081E7D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:59:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2B641C0005;
 Fri, 12 Jul 2024 08:59:55 +0000 (UTC)
Date: Fri, 12 Jul 2024 10:59:54 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712105954.7eb8b35b@windsurf>
In-Reply-To: <20240625211847.1419944-8-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-8-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720774796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XDpFwzHfElw+wPAJbOfToVLz+CHIlypgPC1TEgrAUk=;
 b=bEqJqdeb1EbJRi1a80lAvpVY/XafG/pz4PVJgg2RiklA9I1d8uqItTnEkwLrGGgDBjghhV
 Qao2QtncwbkOUY1CohONkRvxmsbXT2p1AwCOPKGR//YoMtwhwxsRf5QH2ssmZwIpVOcuuQ
 t4tnhsNFaxdvsUp81WG7dOXYoN6zrJoznJfu127TBhEDwRmwKk88DZih3DIF4f/xn+4yHS
 xmzTwyifsu8dOabkQGSWbL2LaNaRxN68s5wX1xCjsoZGFoS5TcSR9Dlmd+HK1O+HjBCrWO
 rjXqWDvTJESz+gVEUgE6PW/Y7+PQouCRr/nwsHjtbiu9rb/C9qDez/BKd42ABg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bEqJqdeb
Subject: Re: [Buildroot] [PATCH v9 08/14] package/qt6/qt6languageserver: new
 package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Tue, 25 Jun 2024 23:18:32 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:


> diff --git a/package/qt6/qt6languageserver/Config.in b/package/qt6/qt6languageserver/Config.in
> new file mode 100644
> index 0000000000..8a54ae1911
> --- /dev/null
> +++ b/package/qt6/qt6languageserver/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_QT6LANGUAGESERVER
> +	bool "qt6languageserver"
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt6languageserver module.
> +
> +	  https://doc.qt.io/qt-6/qtlanguageserver-index.html

This link is a 404. I couldn't find a really good home page for this
particular module, so I used:

https://github.com/qt/qtlanguageserver


> +QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
> +
> +QT6LANGUAGESERVER_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0, GFDL-1.3 no invariants (docs)

Same comment on the licensing terms, these are not correct I believe,
so I changed them to:

+QT6LANGUAGESERVER_LICENSE = \
+       GPL-2.0 or LGPL-3.0 or GPL-3.0, \
+       GPL-3.0 (tests)

when applying.

> +QT6LANGUAGESERVER_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt

I should have dropped this GFDL-1.3-no-invariants-only.txt though, as
there is no documentation under this license in this submodule. Maybe
something to fix as a follow-up patch.

Applied with the changes detailed above. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
