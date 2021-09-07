Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1521C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:08:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA463610A3
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA463610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65830829F2;
	Tue,  7 Sep 2021 06:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3FQWre3GnYn; Tue,  7 Sep 2021 06:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FF3829B6;
	Tue,  7 Sep 2021 06:08:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5404F1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C38C40112
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcUsm5pFo02b for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:08:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 278EC400AF
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:08:34 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jg16so17503478ejc.1
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=cbZxOh+kzajToN3e2LnsFLDlLgVIQ/C48fJP+p5ddA8=;
 b=Ztl4p1Gpam19kI5dlU8PEGT58ssnOyETZj35RxDuMHIRu/SZfUVIj44qtG/ew86ZjT
 E9bkBL2oxSGZj386Q4+Pby0nWqdUslFFTzIzjZw6L2suIw9xkEx8FwIUFC6SyoUjLtUt
 HvtDo8PZQZfIljt4Mppj6UUOnaUpQRhtQEb9oL5EJ0c+YcaSkLW8xK0R8EVtMkARuYfN
 fZc/+HgiIPVfN4SNRhqFw857foomUhpTIdfOZW+RyBMC99flVkcu0trh2x1fjDgaiZ0x
 KVZPCsOlQYejlw8FONSev8xtjwe4j/7GaRyRuBQyU3br0Oh9DKjOWvbXXeVJA4ckf7H5
 +cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=cbZxOh+kzajToN3e2LnsFLDlLgVIQ/C48fJP+p5ddA8=;
 b=DtoId84YV5/JVImwq7KNyn1N4dA/O1nJgj9eVzM8HYq4k89PbU8zs6dR77cq1TSZXT
 ylnet9MSVbHRXC8SIpa9H2a1+sX/FitCST3USV7w7McSAGaySV5abaKGwfDJ99V/ulPU
 VlmvKD13D769pUkE9KfhMA3h6+Lf6sOhkh2sgy3AOzGHAC19NkrYozDCiCMqYfKxAIzU
 MIx37Ua5KetfxzeDO3V+zpOnj86BFd1AQQ+Iz9BN7sT/JU7knZxK2u7xg4jIVwB6CZcj
 g8QxmzL7esoD5zrqUloq67dlRWF7rwWhw2CDomRyC51yn/WsQq1+cuvgoTjtBHnzg1we
 bDcg==
X-Gm-Message-State: AOAM530579aIcfGVT3zMipzffma8ErtywRFD3saFKaKhB7jsD+2qRL2f
 OgL6DYzLSnNtJhKh3PCPCufk6s6C1aU=
X-Google-Smtp-Source: ABdhPJxpMCRLuUY+g7RGu3uMtvmHYF1LbiLqAUaN1P0a70o7VMQ9k15KnG6tAimT4tKRmFYVSoH/lQ==
X-Received: by 2002:a17:906:3693:: with SMTP id
 a19mr17050434ejc.237.1630994912289; 
 Mon, 06 Sep 2021 23:08:32 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c25sm4886057ejm.9.2021.09.06.23.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:08:31 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNUHW-0000Qv-A2; Tue, 07 Sep 2021 08:08:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20210821131256.1138002-1-romain.naour@gmail.com>
Date: Tue, 07 Sep 2021 08:08:30 +0200
In-Reply-To: <20210821131256.1138002-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 21 Aug 2021 15:12:56 +0200")
Message-ID: <87pmtkhq8x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/localedef: bump to version
 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > resync the version with glibc package.
 > Remove upstream patches.

 > Rebase remaining patches for glibc 2.33.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

For 2021.02.x / 2021.05.x I have added a similar commit to sync with the
version used by glibc (2.32-50-..).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
