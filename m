Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299F4C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9EBB40B9D;
	Tue, 20 Aug 2024 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLq4l9N--v1a; Tue, 20 Aug 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BAE40BA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90BAE40BA3;
	Tue, 20 Aug 2024 21:36:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9F611BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6C58606EA
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zbjvfHRiDPt for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D5A5606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5A5606FF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D5A5606FF
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3FBA1BF207;
 Tue, 20 Aug 2024 21:36:34 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:36:33 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240820233633.4f961c49@windsurf>
In-Reply-To: <20240820172343.2124306-1-dario.binacchi@amarulasolutions.com>
References: <20240820172343.2124306-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKjfRxa1/ga5Wv52//xjK/FxxEvgGiTobr3HDkyTi/s=;
 b=g+4xF5VO9k4bpCn3Fg7FOppnNVukvw9X05D43Q15b+t3GNJ+x1iTKCNI60n7jxggSNNLWV
 d5Oe60zoJE6KXVf8dJ/gDSTxdPkF8wAMaOtakgJgjj/DDXtkNiadBhO53gyr9D4mBoq9Js
 7vCK4W9C9z+HlqlIXeDc452OahaKYj23ETVaalrzJnTEqCcUkjEwJnDto5irTwD5iO1gLM
 7D5Gg1cfVslmXYYFS1fLzBybuQcZZIbgNKH2deZk6mlhY+5NZyewdOuBLPxfzQFsxPSTNf
 SG++l2jEhZzQoT+/4p4nxbOzYiJU89/2gfUVSLGbLqgwpcbs6m6/UBMNOD0VGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g+4xF5VO
Subject: Re: [Buildroot] [PATCH v2] package/ntpsec: fix host building
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 19:23:43 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The following build failure on xtensa:
> 
> Waf: Entering directory `/home/buildroot/instance-0/output-1/build/ntpsec-1.2.3/build/host'
> [1/2] Processing ntpd/ntp_parser.y
> [2/2] Compiling build/host/ntpd/ntp_parser.tab.c
> gcc: error: unrecognized command-line option '-mlongcalls'
> gcc: error: unrecognized command-line option '-mauto-litpools'
> 
> reveals that the target's CFLAGS are being used for host compilation.
> The patch fixes the host compilation by correctly setting the CFLAGS to
> be used.
> 
> It should be noted that the build script used by ntpsec applies CFLAGS
> for host compilation and --cross-cflags for target compilation.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - Rework the patch following the suggestion of Thomas Petazzoni.
>   - Update the commit message

Meh, the ntpsec build system really sucks... But not your fault, so:
patch applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
