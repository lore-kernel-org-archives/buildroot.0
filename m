Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52186C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B4ED406BC;
	Wed, 16 Sep 2026 18:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L48R1C1huvtU; Wed, 16 Sep 2026 18:43:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2E6D84051D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584202;
	b=G0rhPXimcvwZqIhtnz+SQsxwoXqqP4KIpapb1B7w1cvObuOZT///qf+RU16fv2IHPBL2
	 EMA/8+CXLeL3EbHopeBXDARr6UZ4oIc5C04D7L524nlDz0uN1vZVpebMYeXAUW+DgIVvD
	 cfUMa5WT7WbrcAKyEaYrvJ7hhTxHv6E1SM9avLD65jiPpSk73bVh/V3nH+sEWKtUi73iQ
	 gxywdGoDARktw/HAdgpGwJPmIXTN/ilIMlDjycFVMO4vxh1utQn4uLMqQ+M+Q2Mm46v/4
	 MsS+4Jydl5GvzLxvNhjf5c6IQb/3ckl2wP65Gv3hgqZyBbuGajN/xY4gHRN3zHLrn2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1HsRDIPjlwhQVS57KPbGRNFnKPaW7p2hlxZ7BcGaQy4=;
	b=rbUKMqUbf2beJQsL+wzarfscOFk2Ahg2YwC9q0uGR3QGRqUyw8aEHgeyb8OeI6UAYcjH
	 Fwdtb64NjcZtnYBF+Cle6Gxzj6Ot0o9WmvHHFesI9PKisqjSEC2SxAOa72oH9V8vy6YCl
	 7jnjpsBxhk3TFUIhTiKLCTbvdJePMOFqtHQ0uyTB8bj7Z1X75+9S22IPaGXL2h4bUDn4P
	 n7XnvuZikLnDx1gtf0F0B5hSvOhKbJkQ5PYPXxzTgkaIfU66+IuV+z2E595ROstGuG2hn
	 gwjSrgfT7HJm5dhm4XTMCxvBJvg4ZDYrCLc4sr/cTd+RF1afU6l1U3JOsS16ft8Bn2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584202;
	bh=1HsRDIPjlwhQVS57KPbGRNFnKPaW7p2hlxZ7BcGaQy4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sgRRY4j3DJS/QAgsuR1YZOcv10wX2RdFZMu9qqTfOSTO99C2uck0wztRIScKqrriG
	 gP83I09blTbC8LGKJvkpeNZi9mwnacjy7N3Wam6FhHnzbSGbOY56OXoExsfX/1bXfm
	 exr/0YIChr9cWHpY4kBaQtU2qYOmZ432QB6d9h4rFLIS1k/DKkpEd1Sy2q8BH/bWiP
	 S0TxCTwhWr5Ao6W7/jIOrPYkZg1NEVMGWsOdX7VKJfcksRBT6/4fxlXnHnybMBN5zE
	 3+l87xQtvMXqAcg8g45vtfwYc+jx4gGGdlOzkocEOyjQkVgVsgf7mq3nqX7YLzAXKU
	 n+RGYoLzccwlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6D84051D;
	Wed, 16 Sep 2026 18:43:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E168A24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D313B4008B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPmhc-0dVrX4 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:43:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 67CCF4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584199;
 b=K91RlIbG45j+BjYQSyPJ+JSXI1jAU3EVVzrdq2d0+TgLEE3zW2+OrLp2AFTb9bnTecSR
 8uJOniPFPJkL6MSkWoGD0h9NLtnbkq7fB1SQM0j5UPiqu0RV6aaYh40suPJJVEWZkvnEQ
 0TjBl7GLzqtLcyijfYWSP/MuZ6zcDRuOnS9mqQ4v+kM746TQpR23BPvrl8tZ/6ametnb1
 cdMqImqEx981tpYSpfRsQHHrRnH7bjAEQBE5UJD1N9jK4UH/2NoM6tl1Gl0DasfW+TQ1f
 VgZYyrpfLwpRtK9zmYDEUyUplohN562+qsTe+Cu8+7oF1KD6Zwq/Z8tpbrSvoSLi07A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584199;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ykt9DlprmC8MGKs1nJ6NQc+gNpp/SFOu/HK1ZTbtjbo=;
 b=jP4c30/v/X8UXMR1vy7Fq1XjOXWO5NrHauQTPdrId5OzAbGrfL8I7hS72Mpi4IalMZlI
 s4oHAFT/NLwUW1BfL4z8ZXyD/k5RIHEeHvPwgeYKV+3ucM535TgVyGCKVoXs4bhee60Dl
 JovUDeGaWUcMnjmCbYEz7FPzoQDyxTNwi4PSrvEsDu4rub/O7T7R9vV8m7yxdOIYgXRlz
 /sDdrYPU3PmjZxfN35RC1N7hsWPVT6kP/CRcKUk6YeEQ1gXw4vDR47YImJqhqpOcI0g5C
 Un2MU+R4CmDGnmLut/PjmZhBgCYbF1dZhxSSwcoHNvOtklsIgWkA0Us456JisQ9IAAA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ThoDCv2t; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67CCF4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:43:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CDE3C4E40747
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:43:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9E5C960337;
 Wed, 16 Sep 2026 18:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E4AD11C7B00D; 
 Wed, 16 Sep 2026 20:43:15 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:43:15 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Francois Perrad <francois.perrad@gadz.org>
Message-ID: <aqrjPfuIW-6sYcM1@windsurf>
References: <20260915074215.620475-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915074215.620475-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: propagate gst1-libav
 architecture dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 15, 2026 at 09:42:12AM +0200, Michael Nosthoff via buildroot wrote:
> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
> depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
> this dependency. In practice, there is no issue, as webkitgtk is only
> available on a subset of CPU architectures, while
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
> all CPU architectures, except Cortex-M, m68k coldfire, and some
> specific cases of OpenRISC, which are not supported by webkitgtk.
> 
> But for the sake of having correct dependency propagation, let's fix
> this.
> 
> The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
> dependencies that are already handled at the top-level
> BR2_PACKAGE_WPEWEBKIT option.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
