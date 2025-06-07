Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514CFC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 17:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092D981293;
	Sat,  7 Jun 2025 17:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLGLP0dt_RPv; Sat,  7 Jun 2025 17:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2995C80ECF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2995C80ECF;
	Sat,  7 Jun 2025 17:43:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B056A1F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A284403E7
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kshDtgJYOpuM for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 17:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=stefan.nickl@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B922A40340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B922A40340
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B922A40340
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:43:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so897097f8f.0
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 10:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749318230; x=1749923030;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CAryl9SpcGK8pjhEUD1fOTebJmd3VKrAQr/9PsOZo3s=;
 b=O+haPiiy7vnx4Gr1rRRGjrxOeKjUGprRAmta+ZC909ST0MGlhpy9JYPwCCYyfUJhXB
 8vl+ov0X+SKvhQPVDkH23ntN/5AR/TSiHEYvLwViEuQYp+KOm2i+oT9u2EhwSqNWULx0
 tUNCGiuA2LDAjp+gO2DNpdqvMoIMj/ucOva3jI41RIQg6+w4Y5e9SV+Izb7ahlyI0scC
 27JnHiQ/79GfY28rFD/FofZk3ekNmFciIGuADDokvy+kfzHS3enXShy5lC810NrxjSQ7
 2s7I/SdFjh6juof/yolsnXl5oGAsaWgRWGJ0ChkHeCmQ+6ApTXGGt2fuuAuSafuvViYB
 B69Q==
X-Gm-Message-State: AOJu0YzFs6o/EZCqzpCCNgkrDpH35A6deOsy0qfW3EHRm2eWF0a41Auv
 voBeBKhNenz9pEyQ/Fo8vNfxcYKAqI+T9M1Kbjn0D/cBUv8FI3lOsIVjKtOaXXDM
X-Gm-Gg: ASbGncun+0RcHTrdroTYXt4cY5hGMYkInAaFBkY/TF02GJUVC09yM4iGICPHfqmnhSk
 9YLtBYxldUgK/NVOs+lE3Ht1tC2yYKSYGSoR0KLJ8UAoQPOE23C8doUgkYiSdNQlPPFUrCA6Jnk
 eCU71dSLKSgX0IYQvaBLLiFCoQebpEps07HC4UFpj0QGkxmVmdQLo4BVcbWDYFZpHySWAiGUUhn
 QjB+YZuZ0wFobB2aRnOqi1VsK+dwG4GZVxju8plawL2Y6noD91TLBdm/y5LhA/1i2RPgN1RahVU
 2UNhCq/YAeIAdw0Ilpw/OQluIcxTtnLxxRGtcBAzV4rFo8og2n7AsGwPFSvwwY7MUp8thD6MBF3
 r7zUPT4i5H5Nw6JV4UvNW5YyefBXorI16qYoMAnRcVlXUfTgxygNr4CbeTLk=
X-Google-Smtp-Source: AGHT+IEY0y7JAXibV+VAMBhPP6bUHlDSuizamKFtDasOcCTU7WruUZDuvgQ2cb6qIYJ0d/vShugX2Q==
X-Received: by 2002:a05:6000:40c7:b0:3a4:f70d:8673 with SMTP id
 ffacd0b85a97d-3a5318855efmr6777087f8f.25.1749318230242; 
 Sat, 07 Jun 2025 10:43:50 -0700 (PDT)
Received: from ultra.fritz.box
 (p200300d1973ff600a1ab5b988c9d795d.dip0.t-ipconnect.de.
 [2003:d1:973f:f600:a1ab:5b98:8c9d:795d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45213709670sm62027875e9.25.2025.06.07.10.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 10:43:49 -0700 (PDT)
Message-ID: <6b647793179d68e2f9a0a1e5b7ef4309c0c1ea26.camel@gmail.com>
From: stefan.nickl@gmail.com
To: Arnout Vandecappelle <arnout@rnout.be>, Thomas Devoogdt
 <thomas@devoogdt.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Date: Sat, 07 Jun 2025 19:43:48 +0200
In-Reply-To: <83d30ce1-9a00-4ecc-8ff7-906ae968be70@rnout.be>
References: <CACXRmJjfEMb4zGfoWxbDLsV4aw7a3cp+PiJXRuE9kdfKYUmOcQ@mail.gmail.com>
 <f20a8e9711025d8cebb71b8b0d93ece783e9be50.camel@gmail.com>
 <83d30ce1-9a00-4ecc-8ff7-906ae968be70@rnout.be>
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749318230; x=1749923030; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CAryl9SpcGK8pjhEUD1fOTebJmd3VKrAQr/9PsOZo3s=;
 b=ScEmPRKKXh/+qK++9GNsIVfk6RW1Pob1RigGJ9vi8v6xkU6xHKXJtPPZXw/ItGUAsv
 wRzPROjm2kmuQIhQkw10auqgrmLtM1rhJyUB+fjzU85UfrD1hbiukaAxlQggu3/IZWY4
 NfR1DkFAV/9+/Cf6LDm6SSLBxTBxIgPbiLWF5sg6PFGRREbAURdk1XmdGHOolHKRwzrQ
 MopsIECb/ME9pipv53PUGiEdGsalbkGJ8SeItMI3Fyf8Np+mptnY4xj8CfoxssBvAKx9
 15gxG+4ga0ezu/IBZm9DJKDGwRpiKUGQGjeBrILfwiN79ivGDKep25px9xMtPy93tis5
 LGeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ScEmPRKK
Subject: Re: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2025-06-04 at 20:57 +0200, Arnout Vandecappelle wrote:
> > Thanks for the advice, but what I really want is a canonical archive
> > download (and I think the corollaries to that with github have been
> > sufficiently discussed before) instead of git clone.
> 
>   ... Except that github themselves claim that the archive should not be 
> considered canonical. In practice they have made sure that it doesn't changed up 
> to now, because when they changed it some time ago there was huge pushback 
> against it. But there's no guarantee they won't do it again.
> 
>   Because of that, we actually want to move away from the github helper and 
> instead use git downloads.

So if we want to be picky about this, isn't it just shifting the
problem from github to buildroot? What guarantees do you have from the
git, tar and gzip projects that the archives produced this way will
remain reproducible forever?

As the github blog post suggests, the only way to be truly sure that
the files never change would be switching to release assets, which of
course requires that the upstream projects provide these, and also
rules out references to mere commit ids.

An earlier version of the "gh" helper was based on "gh release
download", but I abandoned that approach for those reasons.
Here's a quick example though how that would look like on the back end,
in case anyone'd be interested on taking this further:

gh release download -R traefik/traefik -p "traefik-*.src.tar.gz" v3.4.1

Cheers, Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
