Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0FBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1C161002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC1C161002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F41440529;
	Wed,  4 Aug 2021 18:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jW3QSI5GxzNK; Wed,  4 Aug 2021 18:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A16AA401D2;
	Wed,  4 Aug 2021 18:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1781B1BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11A21401D2
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kzn0559ebyIu for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:00:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4AEC40137
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:00:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b11so3200586wrx.6
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=i1IJGIHE5ADUvdYZlaO27ZT4XvYJhcPLbKn7xDg0Pkk=;
 b=ZHSBVVjvyoNCS9ededNK4RBzT61JF6ocOBva2mSwImr4o1YRj5N68ys3TxhvzHPnZ9
 ERNjSKfm0SWmE7wXzPzsDa0DiWSWEhode3vY9+gTTsLHpfwgl7bfCs6js+mMNIX3B1cP
 E38QkuXAnSss6MHn7+ZwR2X79tIpAP162GHu/CNB85/s/WZPvRjYI2MeEiH2ajvb+Yk2
 9ixL6XR7OWpvnGne5sEA5B862VvopXFaI/UPcpfz9nBiTLhT+uMbPXu+3UAPmRzoNC+7
 1pS2xb39S3UahWfrV9audJbPv82/PlXHYfUOtAOe5p3cKpEgqhkicinXEYfZn3TWxhlk
 uyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=i1IJGIHE5ADUvdYZlaO27ZT4XvYJhcPLbKn7xDg0Pkk=;
 b=OIUNqkBrkauHBHgvRS20Uf6ZPlMzpfNs2A+x++nyM2lfn37I7+s0UAU8ezYMyarNP2
 N9T5fNF6ICq03Yh0/bxecc9gCsGQjBo2hFyt03k3d8zj+mfcMBkO37J7HoX2sbnC5Sen
 4ohrqDgbD7x66f+GS1OlJNHrFy+LuxcOjmFekgmRiD1vmpSG2+kqohMBichYhUIZIhys
 Say5y1xjtwE71YaghR9WGu7KpY53aRbGG7RYbqKWL+8cma+eVw0j2Fu/k6zqw/h7UkmM
 czZg/4Kuf4PpooeCE8k5H4WCHhQ+9hfvuSGNk08p0qRCwYeWyb4BTTxoXNKonx6t4IOE
 6xAQ==
X-Gm-Message-State: AOAM532oguenPI8FzXwM9aKCusuIvLg0Bf4uzDnNo0BPDJNupvYtRHxg
 dqWqwYrnhKcYrVvvVrUEPNEMD2afZys=
X-Google-Smtp-Source: ABdhPJznIoM3Vi+9T9G9Wjc96ETFUp2KE4Zc5CK0xRFuQvyZrhgJtu8BH5LUxSRiDUL4N3L+KIkSag==
X-Received: by 2002:adf:f384:: with SMTP id m4mr563240wro.129.1628100009919;
 Wed, 04 Aug 2021 11:00:09 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id f2sm3371517wrq.69.2021.08.04.11.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:00:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBLBX-0005wM-4T; Wed, 04 Aug 2021 20:00:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <CADjhFRAiQKescNLz8wbeQx=+WfAA19hcLt=dbvm2XoYq6HnFMg@mail.gmail.com>
 <063f8d9b-4124-6f76-1208-0300b63df38b@mind.be>
Date: Wed, 04 Aug 2021 20:00:07 +0200
In-Reply-To: <063f8d9b-4124-6f76-1208-0300b63df38b@mind.be> (Arnout
 Vandecappelle's message of "Wed, 4 Aug 2021 12:53:24 +0200")
Message-ID: <874kc5oztk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] An issue with alsa-plugins + alsa-utils
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, romain.tisserand@gmail.com,
 buildroot@buildroot.org, cedric.chepied@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/08/2021 12:12, Gleb Mazovetskiy wrote:
 >> Hi,
 >> 
 >> This is an issue originally reported to me by Romain Tisserand on Discord:
 >> 
 >> 1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
 >> 2. alsa-utils removes these files during installation ( |rm -rf
 >> $(TARGET_DIR)/usr/share/alsa/;|)
 >> 
 >> Cedric, can you please have a look?
 >> 
 >> I think a good option may be to not remove the |$(TARGET_DIR)/usr/share/alsa/|
 >> directory in alsa-utils.mk <http://alsa-utils.mk>

 >  Peter did the "rm -rf" 11 years ago as part of the fix for
 > https://bugs.buildroot.org/show_bug.cgi?id=1573
 > but I think the intention was just to make sure that you could unconfigure some
 > options, rebuild als-utils and it would leave only the configured utils. That's
 > a scenario that doesn't work anyway, so it's OK to remove the rm.

Yes, I agree.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
