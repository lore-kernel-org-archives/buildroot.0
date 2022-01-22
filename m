Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D21C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D586F83F1E;
	Sat, 22 Jan 2022 18:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id za9ZvC52WTqN; Sat, 22 Jan 2022 18:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FADA83F14;
	Sat, 22 Jan 2022 18:11:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A32C1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6095A404BD
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERjxBXpgCCKo for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A929B400CE
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:11:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b13so48728780edn.0
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=CdHM5FBhciVFD8wPYKCH/LmJhBnj5AxiPczVkPbwE0s=;
 b=Q1/xUYGfigFBTLNujybxcaSOM0AVproNMGi23EKSR0h7pyS3d2SYXZvp+XW6BZnosh
 Gdb4nTqPY3TM/VCzrpxbOsRyr0pA0/xYVSPyphO7e1ZIPi8Zjy9/6Iq8XQ0Q8h4o0nWZ
 6dyR24ZeGrlc8SIbYC/NOv/ox3V+XH+HXj9++3tYkBHd5DEbEBfxhSAr2mwCtJbZq0i+
 eKudvU1z7lJhJX4syRGUECbF6mazFOYF4A4XM/4ztK1TZjTTNDbhLXRRaSdhuwJ2vS4x
 +n7SH/tPwTwofin6z+x4BKMeFa/o0Ao3EsRjhQhsN6NlXCMSfMG+aLsbsBlXyy3pdT7E
 NrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=CdHM5FBhciVFD8wPYKCH/LmJhBnj5AxiPczVkPbwE0s=;
 b=uwjcGYTTKPqfpZrW6IJj95qQD5PEezMuDkwygXDjiejSM4au8pDqj6EfdaXSVebXDo
 PRi9orTz88DpMdljtwH8TKY2TwquDKcDeMcwfPG+WYJlzTeMyBRZ6zIAPIxqBU0nNNBc
 Xi9AND76W4VtTqfcNY7zJNNFtG7AFEazUoyXG8YMf+nKCDHjJn8BvzhB4BYRtktesEAY
 EoZ9xFTaMWcZzoA7gk1lzvOibkob14o4E332c2ztgEtqFtbJWRwpmwbvuIX8rycPi5Ge
 0/fS4QW+NvJk/VLqINCuuI7Sv+y7OiZta55nLiw24w5HDFN4Q6zwmW+ZQpAdw50EvDZU
 +k8A==
X-Gm-Message-State: AOAM530e22a2BJYyqLgUrA5hIH10eJAFJA8ZQDky4MpJ997Yo+URo3Ee
 XZmh9LacE67ULj8e4guGZ75PBorOs04xWw==
X-Google-Smtp-Source: ABdhPJwQafzw9AqWwmjQ8DLwaoAxxM7TAHw3ENrbxdTvi1gQhAxgwlNX4PJiIuJYGMN5HwBc9iaGWw==
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr1131354edb.226.1642875060818; 
 Sat, 22 Jan 2022 10:11:00 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id s1sm3894269edt.49.2022.01.22.10.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:11:00 -0800 (PST)
Date: Sat, 22 Jan 2022 19:10:58 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YexIspJ7Tw4LKRzm@pevik>
References: <20220122180804.30250-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122180804.30250-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: bump version to 2.6.1
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

note this version does not support NFSv2 any more.
Does it need to be mentioned to the commit message?
I didn't add it, because even NFSv3 is quite old (and I recommend to use
NFSv4.2).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
