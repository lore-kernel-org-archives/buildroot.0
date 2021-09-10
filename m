Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BBEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:34:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74798611BD
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74798611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C654060E;
	Fri, 10 Sep 2021 11:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tbfBmVDw-1fM; Fri, 10 Sep 2021 11:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AF0240624;
	Fri, 10 Sep 2021 11:34:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9819E1BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76EC040632
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pM1FKkVEesRg for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96FD24062A
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:34:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id am9so299234ejc.7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=uQ/xIEjcBQVQYG8v6ReXbgG7HkLizSpbcBn23YtnZOQ=;
 b=eKRT/V4AId9XbP/lNUXwckeQAA1dCzSC4fF6WX2XzTnR4JJhe5anqq+Nkk2yqGJLkf
 LRE4vMnjF6rVD4booQ1jmeNgJViWc2WY8RuVJr5dwIR9XwYbN3HdLba9v+XB2WAZ60k2
 uc3xyYM+PKU8jqu7PNb1iDED8LLS6XGhDAKjhisVnrUdQCaA3046TWBG4Esvo79ZH0pz
 EkRxzcQ2yNjezRFtavmCkLT5mfKLGu2+xp49QioTQMiV+hZf+dFgfkqzX8Z8Fv6i5PJH
 GTB92OP64m73CzaqZxbhINOL6PWzhAMKBKV6LgyjZ+UdyYKIZUEWrcLH6i/mUobJ7ec6
 +wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=uQ/xIEjcBQVQYG8v6ReXbgG7HkLizSpbcBn23YtnZOQ=;
 b=rZiW+BncuSH2/Z1z2FyRszcMdibsTMjOH2CSDuKt69XBUvMkMCw6rouHcAXZJiDcL1
 9LQtavr7ai0eAJQ71mXXeOilm/VeMJRppyx5rnAjtkEgmUMO/yFQ/7wFlZ2/j+iVwP9X
 fob0utlKwFS2ZtuzgQ3BrY8+Mmgw1PRu+yhGOwSf5wuW8UvHK37jxW8VQb+uR7b8OXmF
 ZhvFw9G/6lx1uD9drqqxVFh/sDvsDgS8bk/z/RojNAycY0QMbnL2l/2d4HIZH76DLvlR
 PyVnjS19o96N2hLLunrpvz0CgSNCs7IRq/Ct3baS92ghdd9aw+4Jq8jIySWYH+QxGEUx
 SfvQ==
X-Gm-Message-State: AOAM531ZlcIY1tlSzaL0aJImvKLL8fSZPFne+L+WG4MbSFN4oNrBJrVE
 DTI3jqYos3/P2MeVpxHS4u0=
X-Google-Smtp-Source: ABdhPJyIHBFRFF0ebZlSXGx/8lPC/KpbUpKZENgU9RGNX3jCTuFM/GmoxOu97g7VlLT4qFyCIy6UNw==
X-Received: by 2002:a17:906:e8a:: with SMTP id
 p10mr9144141ejf.265.1631273666489; 
 Fri, 10 Sep 2021 04:34:26 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s9sm2807430edc.82.2021.09.10.04.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:34:25 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOenZ-0000TP-Cg; Fri, 10 Sep 2021 13:34:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Knight <james.d.knight@live.com>
References: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
Date: Fri, 10 Sep 2021 13:34:25 +0200
In-Reply-To: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
 (James Knight's message of "Sat, 4 Sep 2021 21:35:19 -0400")
Message-ID: <87zgsk8y0u.fsf@dell.be.48ers.dk>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "James" == James Knight <james.d.knight@live.com> writes:

 > Explicitly indicate the file encoding to UTF-8 for the DEVELOPERS
 > document. This prevents Unicode decoding errors when printing E-Mail
 > entries with Unicode characters on systems using an alternative default
 > encoding (e.g. 'CP1252').

 > This corrects the following observed error:

 >     $ ./utils/get-developers outgoing/*
 >     Traceback (most recent call last):
 >       File "utils\get-developers", line 105, in <module>
 >         __main__()
 >       File "utils\get-developers", line 47, in __main__
 >         devs = getdeveloperlib.parse_developers()
 >       File "...\buildroot\utils\getdeveloperlib.py", line 239, in parse_developers
 >         for line in f:
 >       File "...\Python<ver>\lib\encodings\cp1252.py", line 23, in decode
 >         return codecs.charmap_decode(input,self.errors,decoding_table)[0]
 >     UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 6659: character maps to <undefined>

 > Signed-off-by: James Knight <james.d.knight@live.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
