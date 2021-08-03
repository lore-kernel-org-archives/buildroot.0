Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC90C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146EB6103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 146EB6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF9E828E3;
	Tue,  3 Aug 2021 19:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49eQKu0ho4FA; Tue,  3 Aug 2021 19:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180E2826C0;
	Tue,  3 Aug 2021 19:40:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61CE71BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 570FB402B8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPcp1TzaKKMH for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:40:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99650401DE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:40:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id b128so13108596wmb.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 12:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=LynGVFg7LWj79lh6mQW9sLfQhWbGThjVXSFr6n9P1vQ=;
 b=S/sVXsZY2kFkL8+3TM4memcaW3pJQUmep+OlDuy50OznguPyQo7IuKhJO4TkwSomGP
 ydn0L4SgkBzprKn6kDpYI6cQdd7GaNezFfHpztZapNxuv7MJf7VrriEjtPQaw+SDuHAA
 u2hJq/0B/cejE0y4DrMSpE+MIa+JV1oxVM0ZGejPoVq834NjJ+Qh5hpa1EsAnuHKmJ5+
 rFrv//AK2mGWBRAtstO3YcxSliM8S3j2/NG/bJtUntnJ+/tJjVyL6iiCuyO+SMSLtJ6+
 o/+jOU0nSuZszU6JDN4jVNvHSPTjlTwaSDK70u8KHafvpGLd7M/KbNDJnMIHirtBYkq6
 j7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=LynGVFg7LWj79lh6mQW9sLfQhWbGThjVXSFr6n9P1vQ=;
 b=iVVR+03P8B+QlzoYee3X5JiQNtoZ/TdwtVrxkBJ/Sn6PVNDGk5zbnt+lRXtDZ9tnXa
 JO/R44QhDVGKjJ+xY9joYQN6ArH6OvHLHkrvry78EQiMeSDCqbgrSAVqs8dl7serJzvQ
 V4d9XI0/SuvYKiauTMe20vqIL18OfZ2sH5q3mesnP28r7kvYTyDOS1DUSdHPZY/vxo0U
 ZRsEghSwbtjxGGvDH7T6gydAaYLyLQUJ7NrAaxTVwoI2EC+9MpuGFJEpGEpKvFefaYJe
 T4I7KpzjSCq+mI4lYpN5UMJqOiDiOTbG4kt1tcbC/dz2vzQ+2zdtr3ELgvM1Ho69CZfL
 cMvA==
X-Gm-Message-State: AOAM532aLWQpzEhQ0m3ce6TqAAaWURY1VgoZEnvb2msEiV67BB5x8wIe
 JsWH8tZzDpxgQyTO/GCjCHk=
X-Google-Smtp-Source: ABdhPJxOGECOgKU/SRMg5/3btX29dnEXieWMbmm3ZGqxnFwOVYqC1gSD0ehwd4MYA8Q5Bj7TqNTaDg==
X-Received: by 2002:a1c:1b14:: with SMTP id b20mr23656425wmb.170.1628019642818; 
 Tue, 03 Aug 2021 12:40:42 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h9sm15532411wrw.38.2021.08.03.12.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:40:42 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB0HI-0004z1-Hx; Tue, 03 Aug 2021 21:40:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717090037.670285-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 21:40:40 +0200
In-Reply-To: <20210717090037.670285-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 11:00:37 +0200")
Message-ID: <874kc6wc3r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/trinity: add
 TRINITY_CPE_ID_VENDOR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:trinity_project:trinity is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrinity_project%3Atrinity

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
