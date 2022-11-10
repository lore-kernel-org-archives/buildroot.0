Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED40C4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 10:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3288F403B3;
	Thu, 10 Nov 2022 10:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3288F403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ncyg2-0sero0; Thu, 10 Nov 2022 10:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83028402F6;
	Thu, 10 Nov 2022 10:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83028402F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 012391BF842
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D056F402F6
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D056F402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTXwsVuh8HjX for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 10:51:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594004010C
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 594004010C
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 10:51:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id a13so2529109edj.0
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 02:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dF4jeiZO3KqKdKUkZ4FqdBBzJ1TPgwdAmLcJHE1AO0U=;
 b=u+Mzf94v51ZPXRrshCrzwEG7FfULt7MairjxIUuFp+cqW135brlTdcbQB0Ayxjns7d
 R/DD11x4rIkArytB99KaSZdYFx8qnO3u9hRE4BdvRtKtDhkcFFO/E6dpJJ5aeaYH7jaG
 jbFNiNYGzs1ryMYCnvoZv76PNqtVlVe/GLa+lz1T1juu3K+FgRYM2Eddazd71/fuEvxV
 M1mC7DxM47gBEfohR+bWhZ0K5nN2IwGGyykyWtcii+7LcvhrKjqtpDwku3glMIocoa5k
 nYTkr0WG5hBbohHngvq19f1RH0LVIQEtYLjbVQfleuq/lODlFs2HjbSB+OvpvWajjiKG
 l5CA==
X-Gm-Message-State: ACrzQf3DDp0/iMQQv2k8bdZlSERpwl14C8VoURC94+1DHzU3UJp2jtuV
 NBD2qNdPL3KgqqXS9EF7UvI4ZDSW38XTFOWBAymuvjtWkIY=
X-Google-Smtp-Source: AMsMyM7Wtfcm7ywdP2O/pZ/z5qxvNmNKKGXl2c4pE+uCh2Pr0k8sYWJ5R37cER0Zwk8rzFJ8b2kRM8y8XF/IESbMej0=
X-Received: by 2002:aa7:cc13:0:b0:453:52dc:1bbf with SMTP id
 q19-20020aa7cc13000000b0045352dc1bbfmr62703858edt.30.1668077470442; Thu, 10
 Nov 2022 02:51:10 -0800 (PST)
MIME-Version: 1.0
References: <11be86d8-4ce4-1ec5-41e5-ab8a9b8cacf5@grandegger.com>
In-Reply-To: <11be86d8-4ce4-1ec5-41e5-ab8a9b8cacf5@grandegger.com>
From: Juan Carrano <juan.carrano@ebee.berlin>
Date: Thu, 10 Nov 2022 11:50:59 +0100
Message-ID: <CAH2v1AqXqyY+N5SThrq4DAy6Y3yaFDKcWcGF3C2kR3F8ZQAD_A@mail.gmail.com>
To: Wolfgang Grandegger <wg@grandegger.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebee-berlin.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dF4jeiZO3KqKdKUkZ4FqdBBzJ1TPgwdAmLcJHE1AO0U=;
 b=u0cjKvHnJQC/7BpT91385EagMzInH9+HNPSnLxnhPaNiSgvu5RqvfRORqeIcPHK8ug
 UZ+ul1evXKLUfEXlWmQnuIG5XLjaVYgRcxUAA4pm+84QD1wnBVTZ4WdCQiLiWeKkeUZn
 u60kh/Slu4GBiltkHH3A7RQUhm5HbwCTyZowhFG7ikCKfwgS4KIvBng1f08VIRwaAJVW
 ta5DUmozV28Owejpa/AmSMpPFyIReoMTTYbMreMGha4jP+KydeeCyZVbf/2AsHa0Z2hc
 49Tjh6RVaAr4rfOXOevHO+79FadLlaS3G+Pug8OXqCFic0sUSabhVm4uv4xQrs8470jQ
 s32A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ebee-berlin.20210112.gappssmtp.com
 header.i=@ebee-berlin.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=u0cjKvHn
Subject: Re: [Buildroot] Defining package env variables in external.mk
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wolfgang,

This works because Make variables are lazily evaluated by default so
this sort of monkey-patching works.

Now, not being a BR dev myself I'd also like to know whether the devs
condone this sort of hack. I have used it myself too and helps to keep
down the number of modifications in the main tree and in the external.
The thing is that it can break if the original MK file changes too
much, but from what I see that is not so usual.

Regards,

Juan.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
