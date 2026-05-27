Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E902CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 06:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B85261336;
	Wed, 27 May 2026 06:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOarMuxxmn8H; Wed, 27 May 2026 06:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED2261333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779864286;
	bh=rtl/nzgOQ7eWNbR7SoezW61+r06JAUP6yYpgX0CKkdU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMpn391kT6KT6gll5ro6I0pVMGkdf9vcADM/RnghlnkfV1oGMKMN1TBDTLTwLhY2i
	 cgFkdJoj92WJ+Ex29r1NGqjBVj04PTZrm+v2MjBKmWV1Pt3jNkcHrUvVfAmGfbx2qa
	 CTWDf49C6wdb5E62oUQSXRNTBvNZW0zuG7P4NQRmsI4bvympRsx3VAH4p7McH0farj
	 cJWpTw8D/6VWoVRMfMkWPKIzIlhzdJqH3lt7M93IraQbDaz2lJv3CEMmAAwSb+v0LL
	 cG0FM6XMe2lGBTh+J7+ictO7Biqt+NBalhj+u2OgiOhLnyUVvxG22caSDGvsG4kTW9
	 Ym2rgLPJOusjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED2261333;
	Wed, 27 May 2026 06:44:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A042B23F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 06:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8213C80812
 for <buildroot@buildroot.org>; Wed, 27 May 2026 06:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHmOftiN6yEr for <buildroot@buildroot.org>;
 Wed, 27 May 2026 06:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D40DD80808
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40DD80808
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D40DD80808
 for <buildroot@buildroot.org>; Wed, 27 May 2026 06:44:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1930396708; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 06:44:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wS80H-000000010Tt-0B7U;
 Wed, 27 May 2026 08:44:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260526200641.939539-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 26 May 2026 22:06:40 +0200")
References: <20260526200641.939539-1-bernd@kuhls.net>
 <20260526200641.939539-3-bernd@kuhls.net>
Date: Wed, 27 May 2026 08:44:32 +0200
Message-ID: <877bopmjvz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oCRA4XeAZ4zrBI7UIzPJVRJMAR6tBRcarj7iHm54VZE9NnCo5ogdSIuGn10s0rkySX0ysrznb6IxWTKi0n8KQ/pc3skj8xZJMhJ46QrRx0q25DojyssfQAE3R4KqqKxvXnJPVcP28nIEAqOQa8dAQV3cLNqI7brvKaIvowB+REMBtgmOzrjxjBXBPUvyM8ZDHu0NA4euFO9/I0FJmIuQtQ0yPMQyp9MPYgVLZ/4yvoxuFi7wGF26yNC30R+jzmrb42VEoHP6Cvnz8S8qVTCyw3ftETa4kb9QrEzzcZdP0uyY7Uvu8B8MwjM5wcpdad/ejQ3qxJSdfwYHcxr1VinWmA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gigXmt8Zhl7VDizONsN1HSK57uAdB4XOBaTZf0PLln4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=oCRA4XeA
Subject: Re: [Buildroot] [PATCH 3/4] package/libheif: security bump version
 to 1.22.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/strukturag/libheif/releases/tag/v1.22.2
 > "Fixes missing heif_image_get_bayer_pattern_size() function."

 > https://github.com/strukturag/libheif/releases/tag/v1.22.1
 > "Security
 > - CVE TBD (GHSA-r7qj-cg5r-r6vf) - Wrapped icef compressed-unit range
 >  check causes out-of-bounds read in uncompressed HEIF decoder
 >  - (GHSA-5hqq-636x-r3cr) - Out-of-bounds write in inline mask region API
 >                            when source mask exceeds declared region"

 > Removed patch which is included in version 1.22.1.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Series passed Gitlab pipeline:
 > https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
