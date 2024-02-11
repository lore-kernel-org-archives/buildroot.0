Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F4C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 151B0822C9;
	Sun, 11 Feb 2024 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nepCe4RMHiIg; Sun, 11 Feb 2024 20:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C58D283BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C58D283BCA;
	Sun, 11 Feb 2024 20:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B1A1BF868
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF99F83BCA
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 20:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-R2Exet5NUN for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 20:41:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5323D812CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5323D812CE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5323D812CE
 for <buildroot@busybox.net>; Sun, 11 Feb 2024 20:41:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4547E0002;
 Sun, 11 Feb 2024 20:41:16 +0000 (UTC)
Date: Sun, 11 Feb 2024 21:41:16 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240211214116.72131219@windsurf>
In-Reply-To: <20240210082751.12920-1-francois.perrad@gadz.org>
References: <20240210082751.12920-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707684077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7EY5ko4QlADVk2jEeqwYgLbTzMX11tTUhRiLO9jJYQ=;
 b=f5dO7io7nKqPuC9jkvnIIyAPQ5Uckci04RdGfzpGa3yEDCxKt2ERvPO2SEmAVnpGRJRy9V
 QMlhYg1EUOivK3WrttghQ5wcAW2+4KrzklvgRIJp3eKHPdnLLwGTehzb+EnYMfRzCRDmPr
 6q/TMBKsKRMbundAx/o+nRa0B70jd395jrwwEgxvJ9MxNcWrA25qwNASIc9V3d8FZdMQXJ
 z0n8YzaqNn52KWHqDjVyyxkkR2KE+F/kEre3wBW9Tt2//i9w2V3Rlpdr4pYUULZug30qEo
 kTBOcqyl7N6MGCKgB0KqEBb70KzlAwawPLeiEZGhG/9m8spYu/pjKdAbw7F3Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f5dO7io7
Subject: Re: [Buildroot] [PATCH] package/lua-http: fix CVE-2023-4540
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Feb 2024 09:27:51 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> see https://nvd.nist.gov/vuln/detail/CVE-2023-4540
>   & https://cert.pl/en/posts/2023/09/CVE-2023-4540
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks, this looks good, but...

> diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
> new file mode 100644
> index 000000000..e8f88f1ae
> --- /dev/null
> +++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
> @@ -0,0 +1,68 @@
> +From ddab2835c583d45dec62680ca8d3cbde55e0bae6 Mon Sep 17 00:00:00 2001
> +From: daurnimator <quae@daurnimator.com>
> +Date: Tue, 22 Aug 2023 23:30:20 +1000
> +Subject: [PATCH] http/h1_stream: handle EOF when `body_read_type==length`
> +
> +If a client closes the connection before sending the expected number of bytes
> +then return `EPIPE`.
> +This fixes a potential infinite draining loop when trying to trying to
> +`:shutdown()` a stream.

We need you to add your Signed-off-by here, and a Upstream: tag with
the reference to the upstream commit.

(Please use "make check-package", which would have warned about those
two issues)

Could you send an updated version? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
