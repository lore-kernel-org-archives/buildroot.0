Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34A6C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 06:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984D681EE3;
	Fri,  2 Aug 2024 06:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3OyVBT2KEV2; Fri,  2 Aug 2024 06:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4230A8452A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4230A8452A;
	Fri,  2 Aug 2024 06:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D1F1BF421
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F41E381E53
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-3ws3mZMBr2 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 06:23:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCB9081F64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCB9081F64
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCB9081F64
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 06:23:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9589E60003;
 Fri,  2 Aug 2024 06:23:17 +0000 (UTC)
Date: Fri, 2 Aug 2024 08:23:16 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240802082316.0d38a445@windsurf>
In-Reply-To: <Zqxqax4t+Jm1W5IP@waldemar-brodkorb.de>
References: <Zqxqax4t+Jm1W5IP@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722579797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThA0XV9nTgUJ9zhP3NY5VdhvVZXwbDPWm7BIRPslv1k=;
 b=UBJ3U4LNy9eKA0xAjsCfmH26rJXaNk7XSN0/ipl/zoT1zYrqd56mqkdOZvroekPq4MkhK9
 +Z/QRwHN1MUbnh/trS9G8FeaU16LuDe4g0WFgbBZ7eydGHnTzTK4apugnYOzSz3dJeeQrD
 Jk+yDtdTpZLXmZps5MpwohsrH6LgshsLQM/aE+FSPVAyxyG0b8UfCWySEeeSmhzvaYbmvj
 yADfREGPhx2qgfqg+Ujazpn16M972TLc3gcHEjwhTQOxXoNd/XBcmMVUfReJYmS/rtbYHa
 5K/ChgyIJ9CccLkfiYVXYmyQuU2umPgJEOC7Z1r4Yp4txz4+2bm4AIJLDnn+0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UBJ3U4LN
Subject: Re: [Buildroot] [PATCH] package/gcc: update to 14.2.0
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

On Fri, 2 Aug 2024 07:11:07 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> List of bugs which were resolved in 14.2.0:
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.2
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .checkpackageignore                                           | 2 +-
>  .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
>  ...libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 0
>  package/gcc/Config.in.host                                    | 2 +-
>  package/gcc/gcc.hash                                          | 4 ++--
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/gcc/{14.1.0 => 14.2.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
>  rename package/gcc/{14.1.0 => 14.2.0}/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch (100%)

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
