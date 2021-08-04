Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAAAC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA6D760F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA6D760F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A4534024E;
	Wed,  4 Aug 2021 14:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ys8A9aW_vyyf; Wed,  4 Aug 2021 14:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E9A14020B;
	Wed,  4 Aug 2021 14:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9C121BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A84814059B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YzgTNvBd6_2 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E71F404BB
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:36:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b11so2532670wrx.6
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=Yl8faHP+3NRK11/MeffpMuE0fLkg9ARIoauAb9+kchk=;
 b=lzZ/p1y2D0mOx9lzAz9Qzjlho5Bk95NCBI89Z7sz7Fr1JWbW/nwiyr0pkuwyZUWW0X
 lFeGmhWdFy4zxRjGgSFbUnMGRaEEw6aVCLmGF+fap+Tu6L+mDTiwcdSPQrAfa9trHu+q
 MALmWvr50dWmWzGlbxMlX0eWadBsZnJkFBA5gOlSSTkGfEVfx7EbUZmTd7uxuDfMuObM
 kWIilTt862g+vZRu3BflFjHcGualzS6/oSaoiwQq7/qshTJnkyy3QMuX7541UOnS6Ziv
 NkjtMqR4o/JrNwT60jIpod/L+aLjboXZotUNDjBe4mMlGfEJsO+7Ggdfmt5ZTuQVypUd
 JACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=Yl8faHP+3NRK11/MeffpMuE0fLkg9ARIoauAb9+kchk=;
 b=rNgSoKTSpkNcozeV6p5fiYZFCtPTGssS2GK4jbE/Dd3BVqi0K4VKaQeNBZSwX71GrD
 2NU7ggvgeFtmhmH9MZClQ8mjg52b5qWxYOhEQJk3gUa4icUNZ+sP35iiwiwvKuvxLCHz
 lGFiYsP4UpEbX8LH3e7UaDVnrI2lO1ykpWP0Oha1EZNiHZmqiR4y8KezrbKhX1I5UNoA
 j5gDxljsy5qwb9Q9JQ9z2P5/p5FpKrZ54ANeAAY6wTm2JOl8jTwcBzZqES8BI9iTq+1S
 pVyPfFisUdbQw+qpuX67ETo1l4bG+WOchHkAfnWEK+VHfkNBJHLAkwO/6TNI8MoeNGHE
 5Fjw==
X-Gm-Message-State: AOAM533brT3oOpiIYtQHCrOSejJ5ttU8TadNUJOUlS6TfDfk2BJbSSd1
 x8maKFaBeC4JO84PazMuxSRFFjhAVro=
X-Google-Smtp-Source: ABdhPJwkrZ/RCsU/oWEPpHAZYw0PkbCtIY0pibZQF3h3LDdFwtIwuofiVo4RGO/7g/DTmJjNvs8/EA==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr20038977wri.128.1628087789348; 
 Wed, 04 Aug 2021 07:36:29 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id f17sm3358077wrt.18.2021.08.04.07.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:36:28 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBI0M-0003p7-JQ; Wed, 04 Aug 2021 16:36:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
Date: Wed, 04 Aug 2021 16:36:22 +0200
In-Reply-To: <20210630234717.21742-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Thu, 1 Jul
 2021 01:47:13 +0200")
Message-ID: <87h7g5qntl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/4=5D_DEVELOPERS=3A_update_email?=
 =?utf-8?q?_address_for_Rapha=C3=ABl_M=C3=A9lotte?=
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCiA+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KCkNvbW1pdHRlZCB0byAyMDIxLjAyLnggYW5kIDIwMjEuMDUu
eCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
