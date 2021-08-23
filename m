Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7C3C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 19:57:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99DE61378
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 19:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D99DE61378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9207A60674;
	Mon, 23 Aug 2021 19:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cgo0a_6zoOqz; Mon, 23 Aug 2021 19:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE08260767;
	Mon, 23 Aug 2021 19:57:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1FA1BF375
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 19:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5559440131
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0MXvGOkIhc3 for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 19:57:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3858A40025
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 19:57:44 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id x11so39495988ejv.0
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mGk3QKNsKV2/5NzXagfZUFzYzuUbmRu/c0Ki122zGnI=;
 b=Jwsc+XY3l0qo4X/ar4IBdXmKeyMIVvga9+uD71KGxfuOWuxieSOvCpvhVRWMjKcf3Z
 yErC/MLHylgLpKNm6mpkdtZnWsBaDoqv1tUdKTu+Jyn9P+dcl37j5uMoPnarh57qMkNs
 iXybc/Zx2rWAEKQ9kpskMvLECmPsowxY0DX995GCQSQNBMyCChkpzEYzfzSBJnUaMJvD
 pyGDOZQtOYVIiumh4R1yJgL9dfEaHWjdZcJSBRDEkr+6ILz+w28XvaWK57B602zJkAkg
 ZPszOB0TYX+H4gSqIJ7x2lKhzBTH8QQlkuPcmzNeyTe5NWHRjt2j7rRe2Zpx94qoUk4E
 h2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mGk3QKNsKV2/5NzXagfZUFzYzuUbmRu/c0Ki122zGnI=;
 b=AnLVoMq+X6KU6EguX6YY/CVCSzKtxGNsA9Fr6tzVHlyAc9EdyS3Ne1quC6OSgi7Jx4
 u6lQSFGzWC77MDawK7rp/kUogk2oe/BFpZB8t2uDGO2YCO8355GRCGc7VhKoHx6fym79
 8Hbx90PtcRjE0T+C68I4YEeZJhqCm5OwdIFmwEUH7km77nln9qsGrdItHhbaQ3cfpv4e
 7rxOue9JCp5EwV7JcAUnp6NjCndReP5Too1hvxRd/n08Ff08aScUsB5o6GK21+gt9i17
 G6Wp6+KM9ovnqMJGbfOuBvhjQHuoSfzaLuhUwjENfduee64HSreFZuIA5dZpoAuCbKre
 LcLA==
X-Gm-Message-State: AOAM533sE0K7FuK9b8c4DXaNCmC730NPPFybRV6UN9D16LObaKezHCAK
 ux/7dPgDHJ1W/8mHtoD3S7VsMD7gfc6nEA==
X-Google-Smtp-Source: ABdhPJyG9Qy/O8EqwCuLJs5UhahyWrbJIKQNpcUAa7pHVhSXVZGoSJIsT9fs2Vyqxs/EsRjt3wv/Hg==
X-Received: by 2002:a17:906:369a:: with SMTP id
 a26mr36977124ejc.539.1629748662449; 
 Mon, 23 Aug 2021 12:57:42 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h19sm10172285edt.87.2021.08.23.12.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:57:41 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210821131256.1138002-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e6b8d916-6dcb-7892-1cea-66ae8191ae6b@mind.be>
Date: Mon, 23 Aug 2021 21:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821131256.1138002-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/localedef: bump to version
 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 15:12, Romain Naour wrote:
> resync the version with glibc package.
> 
> Remove upstream patches.
> 
> Rebase remaining patches for glibc 2.33.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 I guess this is for master, to keep localedef in sync with glibc?

 Regards,
 Arnout


_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
