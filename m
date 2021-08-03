Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15946C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:55:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981096103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 981096103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A0574021A;
	Tue,  3 Aug 2021 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDhS0oO4dinv; Tue,  3 Aug 2021 19:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9D1400C7;
	Tue,  3 Aug 2021 19:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5FE1BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DE9840530
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wecl_fTpXoH1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6F4F404F9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:55:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d8so26513350wrm.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ake6A56k26kGgf+9RI3Fk642wVB65S9twVc7iKer1oQ=;
 b=iQe4YcZuMytS8ZY0q+x4sC8ypPKCQeG2c2aDyt7TrifQZxoYD6QZmF/usO6thbRCDj
 KnvX0lgbnaPeYyXRmVQUddKQ6Wmu4WMQZKqFAS4hyl7XKlzkbQpwsWnn6xoSjTlU8Df5
 wNpbkghBdPOFrU8xLG+SU2MraZS7f+e09hsIXlD3GuSHB46MDGjsz+uwcsVk9PhBfLab
 Kt/lppD0eUwtEehKLLK9fkdpIHRYDE7vRYScR/KFhu1tAogrQWix4AecbGXX7Zw+J2GR
 8iQ5xQ1pgG+mUW14zlI12BnUvpBM9NafN1v0Z5krJgSZ9JhqXRmcXXe0ouU+NjATYqJI
 Gv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ake6A56k26kGgf+9RI3Fk642wVB65S9twVc7iKer1oQ=;
 b=JZiDIuWuhK1elLBkx2pZxEINtXjKFJuzWPq3x8krqFtE9RRAj8Ry2e6EBa2/GnQaxI
 /JI/uQjwwn9Ig9mBoUnxbf208s5F6A1qTT/75xr830kweqJvjh+F1X9QNUHmMZnQs+xs
 V56GHN7LUEngUGH03V/MpUIgxpSlAEYjhY9oa30zASZmAaNwZPAiJLwlJviLjQ2uR6qI
 nf8o4zOazJxUZRgrUUkxy4xsE2lp/udl3uOOB4P/7vz4r9JSnKQr/6yZvUGnscpGqXPz
 1avgZN2Gms4maMj+HB/TSg6xuGXFQbg9QDUBi2gHL8fqwZA7qx0GLapa31hg4O3NcT44
 gYTQ==
X-Gm-Message-State: AOAM530NsU9ELHtNe7DLoscM+SgBjsKKUpOIREod3lYkIOHe0dpc/4N/
 3wcsQQ9PyadEBJE4iHKH/v4=
X-Google-Smtp-Source: ABdhPJylsSFZEDEEBDh5bNrdN3hr1KZAXUh/lT60P1wK1oiE7RaweOHwi3ySjCEbNUndPodyOS2rCQ==
X-Received: by 2002:adf:e94b:: with SMTP id m11mr24188536wrn.339.1628020521946; 
 Tue, 03 Aug 2021 12:55:21 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id a207sm4258968wme.27.2021.08.03.12.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:55:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB0VT-0005iS-O5; Tue, 03 Aug 2021 21:55:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717091619.674195-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 21:55:19 +0200
In-Reply-To: <20210717091619.674195-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 11:16:19 +0200")
Message-ID: <87v94muwuw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: fix CVE-2021-36367
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
Cc: Alexander Dahl <post@lespocky.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > PuTTY through 0.75 proceeds with establishing an SSH session even if it
 > has never sent a substantive authentication response. This makes it
 > easier for an attacker-controlled SSH server to present a later spoofed
 > authentication prompt (that the attacker can use to capture credential
 > data, and use that data for purposes that are undesired by the client
 > user).

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
