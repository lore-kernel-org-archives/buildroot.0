Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813F3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:44:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD697611CB
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD697611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADEF940691;
	Fri, 10 Sep 2021 14:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDd9r8kYLEEb; Fri, 10 Sep 2021 14:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1000C40695;
	Fri, 10 Sep 2021 14:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 127CE1BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D8040231
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHsAskl2mrDK for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:44:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FFA94019A
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:44:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s25so2881368edw.0
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=UbwHEZkTZ3pRojuUZbArLEo0zGwmlKE0pL23YdgGtEE=;
 b=W9wJs01f1qd7WHCFA2kGIYMTz/A+JZa9DRmvekaT8FqYEWKJVJt6qWDUgwHTZOTluj
 Pv/VJTf8ytZyP5PFuqnRnPlh0qBalTDR/WPP5lYAdVCATjTjr4jTV2nAnW4tt4CqADlw
 zK5HT+Qcmj6WOowWq6H0/LWyox8bkZiuaIawG0f//RnPFW54ncSJ9BnNrVEPKRT7ugvo
 /NRsvVt6U1p358Ac0atsQThG9YQu2kxUbJhB7mLpUS5nzFPSKxM1xDkD72aMnAVGUN3Z
 HlUaPEyqnUKyk6A9xF0ExLXgqgaqsjCKvgiX/RzixEsryoJriqx2zW9zyoFRbp6g4hHp
 jv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=UbwHEZkTZ3pRojuUZbArLEo0zGwmlKE0pL23YdgGtEE=;
 b=2R2wi6uZDQI1w2hJBbUY7M9l3AxInTMOMHibSxkZlhjgxEAMsg4oDZEFYzEbv03lrs
 rjCclw5jK/2wgh74EEPrjyHpd3XnAqpRv6QbdJ8qTyFaZfCz3Ze3m4ncv3vI4k/0VJay
 IbslKUsIwPv9ky8WhMAtcu+LaTf6bLlk2nHb7Ljozx9YWRnkZ6hoLQg6BEaQZuRq7er+
 bZ0Um9KOvnLDSlthQOMPaEXAZN7M9iOC9niwhsYanjOjLZr4sVy5VRLCLGswki8iST5M
 lg0zxWgDhlMU9WRybL+R5VtDB960KXR7hLMg7D4uVKEryyKgk73CnlpaPge0rNR1lRIc
 c6jA==
X-Gm-Message-State: AOAM5333Cj6vbrmp+BWCaRzATl+Nxj2WVkH9SFzKqHcnqOO9TE/qGlOF
 eJPICwEDLhBJ1aCHmMR7b8M=
X-Google-Smtp-Source: ABdhPJxka7GZEeFONCDX+ejSZFkRXDNSW6lB6DGOxUvvp9LVME8oBOAhNAYdD6ftopEhRM3xd4vSAA==
X-Received: by 2002:a05:6402:b0e:: with SMTP id
 bm14mr9439371edb.371.1631285086345; 
 Fri, 10 Sep 2021 07:44:46 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 k20sm2550159ejd.33.2021.09.10.07.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:44:45 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOhll-0007j4-1U; Fri, 10 Sep 2021 16:44:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
 <87zgsk8y0u.fsf@dell.be.48ers.dk> <8735qclcj3.fsf@tarshish>
Date: Fri, 10 Sep 2021 16:44:45 +0200
In-Reply-To: <8735qclcj3.fsf@tarshish> (Baruch Siach's message of "Fri, 10 Sep
 2021 17:39:04 +0300")
Message-ID: <87ee9w8p7m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/getdeveloperlib.py: explicitly
 set devs document encoding
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Fri, Sep 10 2021, Peter Korsgaard wrote:
 >>>>>>> "James" == James Knight <james.d.knight@live.com> writes:
 >> 
 >> > Explicitly indicate the file encoding to UTF-8 for the DEVELOPERS
 >> > document. This prevents Unicode decoding errors when printing E-Mail
 >> > entries with Unicode characters on systems using an alternative default
 >> > encoding (e.g. 'CP1252').
 >> 
 >> > This corrects the following observed error:
 >> 
 >> >     $ ./utils/get-developers outgoing/*
 >> >     Traceback (most recent call last):
 >> >       File "utils\get-developers", line 105, in <module>
 >> >         __main__()
 >> >       File "utils\get-developers", line 47, in __main__
 >> >         devs = getdeveloperlib.parse_developers()
 >> >       File "...\buildroot\utils\getdeveloperlib.py", line 239, in parse_developers
 >> >         for line in f:
 >> >       File "...\Python<ver>\lib\encodings\cp1252.py", line 23, in decode
 >> >         return codecs.charmap_decode(input,self.errors,decoding_table)[0]
 >> >     UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 6659: character maps to <undefined>
 >> 
 >> > Signed-off-by: James Knight <james.d.knight@live.com>
 >> 
 >> Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

 > Not in 2021.08.x as of 1279d2b13284 ("package/go: security bump version
 > to 1.16.8").

Ups, too many branches - Fixed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
