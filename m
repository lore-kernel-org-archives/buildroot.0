Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FE4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB4960F38
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EB4960F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01294401F1;
	Sun,  8 Aug 2021 07:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OwGf1RqilCk; Sun,  8 Aug 2021 07:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A65B401CB;
	Sun,  8 Aug 2021 07:42:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F64C1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B8AC403D0
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjzpVCHsQC3R for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:41:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43593403BF
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:41:52 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id z20so514246ejf.5
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7UazuoVtUyAV9BE5iOT1999Mt/pTaPo9867CNl4ekK8=;
 b=N6uw3EcgCCXnRbeVaPnkjHWxPZ2YRewanb34ZWkjGCVYNhM0H4eQHfDXxtnsW/IZ7z
 FQUzMY4xlxP27d/oOxMJitrofdXTby+4ppMMRZtEwGaSteB71inN7Hc8MeCxtkAWNCZp
 zgxCmmpibvnWzppvPgLxmdOTflrwofJfxbjoCuAQz1WyKFt73ypXZ2pkzwYu1AlwEVO9
 SV4AFy3rioun3/3rTBavlbNVFJBx975QJReHNMQCWQuFMM4I1LKkJNhQ749WF7jwLG7s
 BcRNudzxnRlmtN9nAlx7ENmRisc2sc/u7aasAYn65s3LRrSHIYGTuKIdSZ9weXfh2hGA
 18jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7UazuoVtUyAV9BE5iOT1999Mt/pTaPo9867CNl4ekK8=;
 b=XgRsh9MzTdO8gOrs9ENN6hdgsxKAeXi2Age4iUDQsj+wOTp9+68Sti/ewvd7QhIDwX
 hTeduFmrempTN30dZytvrcg5gR1c+a6adRm5Jm05BqdUjYdUETrHEhw7FRQvoWk+wApA
 DT3m2achJqdSb/Hy7QEy8yGFZg5r4T73z+36tsavDULHyrp6OEwOwPrpPv0IjUnY5G42
 4lZWc4gLEouDxa+gFDrVUvW/oYKIacDJdzzNjWApMVwXTY5FGtkFnUmTd127HrXlfH5u
 UbA7UoqSonk+cLtehaslKeE6x9tzVKs0i6Vt3jrTSH3RHnGteZpmAGDyZ7wv6jcTlL4/
 pZOg==
X-Gm-Message-State: AOAM531k9qBuPBy+pKbGB82j7r6A/dOhqCLFf5hlGyhA9QXP1LSGcWVV
 9cv68hJtFoAG0AD8lDy+FzD8tSRKJ6AXFA==
X-Google-Smtp-Source: ABdhPJwh5tCxV/ZfF/XqAnPcxKitRb1f40/z21GWc3zwv85mpR8WdMg9a88Valjl/8IiJyWHwIinrw==
X-Received: by 2002:a17:907:1c9f:: with SMTP id
 nb31mr17883640ejc.114.1628408510336; 
 Sun, 08 Aug 2021 00:41:50 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id cz3sm6338544edb.11.2021.08.08.00.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 00:41:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCdRN-00072h-6l; Sun, 08 Aug 2021 09:41:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801220024.806915-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 09:41:49 +0200
In-Reply-To: <20210801220024.806915-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Aug 2021 00:00:24 +0200")
Message-ID: <87tuk0cria.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libjson: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 11:
 > In file included from _internal/Source/JSONDefs.h:12,
 >                  from _internal/Source/JSONDebug.h:4,
 >                  from _internal/Source/JSONNode.h:4,
 >                  from _internal/Source/JSONNode.cpp:1:
 > _internal/Source/JSONDefs/GNU_C.h:58:28: error: ISO C++17 does not allow dynamic exception specifications
 >    58 |     #define json_throws(x) throw(x)
 >       |                            ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1e66dff705bbb38e7e0f0e5864ce794b4345dcc6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
