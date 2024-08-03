Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA4DC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E5E8143C;
	Sat,  3 Aug 2024 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKUTAzzoQaPK; Sat,  3 Aug 2024 20:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B89A9813DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B89A9813DB;
	Sat,  3 Aug 2024 20:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F831BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 478138128C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnB24ZDssFkH for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24E7F80B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E7F80B9C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24E7F80B9C
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:30:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A008A40002;
 Sat,  3 Aug 2024 20:30:07 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:30:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803223006.79b28e4d@windsurf>
In-Reply-To: <20240803104805.2574321-1-bernd@kuhls.net>
References: <20240803104805.2574321-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZDa7Hx2c0uQAFmhFdbbz4eeoTv4NfupPAJjKdjjXnA=;
 b=H2I4wDF8m9Ph7lw926tkfZTpy0FSTSfJNZerBodW/EolpUahz1ol4I+Q5PLqbPPiETY5IE
 9QvCd30nVLCrMxjXU3Viv3mNUiV8bBRV0yeyZKd5KDG9uAbhFXsj9KOP+M5SiY6U5ek7JL
 q2aqTN2tbRGjlPspOYM18RzkycmhSbpOISWKydT/ydvPdlocBOtV6oDzlnEs5pwN5k1IQb
 QxYCdcvGH0OHpsSMXox8/fSZIIWqWTJTvQaoFati+hj/EjU25HaNJYMI6HfyYeTR5m+a79
 QF31IgOPJIsYCB3miZmO6BrpLKX4jbZX3sIMOoS2474J8OqmuBFpARa9KaKrOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H2I4wDF8
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 24.3.25
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Aug 2024 12:48:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated project URL, rebased patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-include-flatbuffers-base.h-fix-build-on-musl.patch | 6 +++---
>  package/flatbuffers/Config.in                               | 2 +-
>  package/flatbuffers/flatbuffers.hash                        | 2 +-
>  package/flatbuffers/flatbuffers.mk                          | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
