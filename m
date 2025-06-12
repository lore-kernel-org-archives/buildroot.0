Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEFDC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB771407E4;
	Thu, 12 Jun 2025 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0XBgC4QXll2; Thu, 12 Jun 2025 20:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3D6040800
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3D6040800;
	Thu, 12 Jun 2025 20:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EAFE183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 453344091E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3A0--CHVYOxb for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A74A34090B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A74A34090B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A74A34090B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:05:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2156F1C1064; Thu, 12 Jun 2025 22:05:23 +0200 (CEST)
Message-ID: <ce6eb454-cc7f-436f-91f7-0e0396db1625@rnout.be>
Date: Thu, 12 Jun 2025 22:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stephan Henningsen <stephan@asklandd.dk>, buildroot@buildroot.org
Cc: Stephan Henningsen <stephan+buildroot@asklandd.dk>,
 Fiona Klute <fiona.klute@gmx.de>
References: <20250531212436.2788813-1-stephan@asklandd.dk>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250531212436.2788813-1-stephan@asklandd.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aFPymORfmIRer8bAcIBDE7Q4oHFhkWiBlOQpk/mSRdo=;
 b=XEHdi64T3qvCKVWkshhta44QZ/fHoP1cIFIQuriRBjgR+Fw8ZhI9VAVGCOFPIk+4QwfEfk
 4cBJ+ywOeD85HX3Z3qCCjaz5uwddb1lHQcw8astQAv/hRPeQyZ2CLJU+Kjhp31x+N6qmcc
 Ec4u9L8po+oltP+CQobbkNU0OqMneIyRgZh+wRUrMPRPWGU0Mjh83GSsWIYYiYfnPMLjiD
 I4nF4WguUbsoCVevclk1fP23sWmIVt3PIkb4Po2yILZrFW1tGEcBRDfJs0nupDoqRM7G/m
 YMn10t9sJ22Gz/zRmCO4puP3X+GjrWLwnfnR+0apzNmCY05Cc9Idai8capj+qA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XEHdi64T
Subject: Re: [Buildroot] [PATCH 1/2] package/busybox: fix path for crond
 binary in S50crond during stop
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/05/2025 23:24, Stephan Henningsen wrote:
> From: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> 
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/busybox/S50crond | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/S50crond b/package/busybox/S50crond
> index 74a0c0849b..7083a36cb0 100644
> --- a/package/busybox/S50crond
> +++ b/package/busybox/S50crond
> @@ -36,7 +36,7 @@ stop() {
>   		echo "FAIL"
>   	fi
>   	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> -		--exec "/sbin/$DAEMON"; do
> +		--exec "/usr/sbin/$DAEMON"; do
>   		sleep 0.1
>   	done
>   	rm -f "$PIDFILE"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
