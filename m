Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC20E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD36610F7;
	Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gq2ebnGTd-Oz; Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C74F610F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212093;
	bh=cz+/0/kWaLBbHdFOcL8epDAtS4Wbb0piw243WnoMQlU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SxO1WPgDs4CH609+sW3KRTlK4pCWqEOU6/jkS4q35cwiCWiPrEDFDpx4AIJYPeaxc
	 ZiNa8yw5cyNnJl+iiME0Qn6zfsi9BqHd5jTb1baIbFnojakIEU8Tfp3rW+0+d9QcwI
	 OIxculMrkbizJZaeuJ6QSSS1GOD6In5fY7M9cJvuqReBTJXvrQJ6Vc7TeVWr2g86DH
	 WVH+nYi8pdE+QtOtOtT63+MISMPVzTeuOIRPQRZUq5mpZgk/7xx7waIKYjEDFc/C1C
	 30/b86uRT1UxBg5uW5RvfwZjRBy6kb/p1+0XvqjpU17J+4TVzWn+wEcZ3hKaugCw06
	 R18GFuZ8A6msQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C74F610F2;
	Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 060D11A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF3660A5A
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dk4pUZ9aVPxe for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE47F608C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE47F608C5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE47F608C5
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43b95e5b3afso1073001f8f.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212088; x=1775816888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r6A3Mm1sHzOjKbOUOA9joqcO9gH/PnsEUSTM3QKgM2Q=;
 b=TWnZssXJNJXyFQgF1bk9il2a5h/OfdRBK3FXLdvsF+fJvN8OFK+73glS1dqcDkCWgM
 OUyYrgi/6uQNr296bqrgnU9Rbe4dOQbvDK5DhMMwneDH9XFH41AlA3WTbLEnjHBB2oFv
 AP58bYK/QC+/XSsUpAf9qvdKl8LgdqrXAsEnbyYXLgAbT8zsJDaBVqmAwgjUZCXAJM/u
 Td7XiFlempqXdGQ10A3MyKLJeMf90g8J1zv5m55xDBxKl5iuaxCOxhDXQIfL9I3R48q6
 7J+n1dVaU6bv79Qu87+5RXuQYxXXM7Macu/UJV9ue6hK/JjvcJw5NIRmQEJvEMeW5zkv
 8N/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV00/iTDN246B+BTWQX5ANNThQfvEryePExL4z99BMk/B2zJ5acEny2xsPCCEJafI+kklxcvuigcz0=@buildroot.org
X-Gm-Message-State: AOJu0YxdHAdWSeo4vAEV7d11hmz6ZTQuSyTUxDnb7rro0MeTJA2mMXJI
 OEp44lQoln7K7Uqmi+fjk1M0eCbI1KqVZDzf0NGmaYMP+DW14HKxcqXF+1aV6JnnJAUYOija9Nr
 t5yvA5+s=
X-Gm-Gg: AeBDietOh+WMgd7NPjLg7o6mOZ7ijIpMY/6zEKT/DqbtFGHIEMzKMiypSygRFMTvuf/
 sTMLRGtm2DGcuXLO7wfwyvQfZK1Op/KcCzTOjRkNpwOWz1jv061k8YiREowoS6u1YPyoH4XvGi/
 cDJrr8f9bz43/uffX56GcQXWc1rNapVi+Hi6+/5FojF2QKped3ehm9zc38t7riYLu8vB8svHW1Z
 iqr/3lDAvVnShqS0hv5vLTIk7PKHm3WrBnm8fOT6LOIo/QVo0iEFlzsBBwV+RtNOdAOCBL7eXVd
 l1agj2aYWnVnNiPXeoLb5dl/EH3uoXmz1FJZSx6bV3Bz9HEmJgPeGPk/taJSPvWFHe5Dcpec8s4
 YHtM3JJotn5YM30LqKkrMwrvkT8ZUx0Go8+n99Kow7xkjz+eXqKKo9YMC0E2B4vbbsUfJ8kJhMM
 O1V13Hw5W7WwAhrsUK
X-Received: by 2002:a05:6000:2288:b0:43d:61:6527 with SMTP id
 ffacd0b85a97d-43d292cbd60mr3972188f8f.27.1775212087769; 
 Fri, 03 Apr 2026 03:28:07 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f7d4esm13554949f8f.34.2026.04.03.03.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:07 -0700 (PDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:06 +0200
Message-ID: <20260403102806.210239-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313110739.90948-2-chakrabortyshubham66@gmail.com>
References: <20260313110739.90948-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212088; x=1775816888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6A3Mm1sHzOjKbOUOA9joqcO9gH/PnsEUSTM3QKgM2Q=;
 b=Xg0EFyVrmEcoynyDGp1IXFGGKj7bzDZ9StTFSiKJc4geammQcC52/YzUdBMKiMVk9W
 f+mTuwElw2/DmkOpUW451ri0HMBMeTuUyK6Z6l7Jv9A7dsD8w+2unoRcls2I66KrBkrI
 P42oEH5X/9ABTilUJRjmTOVnaM6RvGydm3uh3rRVQaljNAElq3o5N1lvH+su/RZ9MYV1
 Puz/CvzClT4fYoFvCf6sSN8Ak25DCPjzvpJBulol8LRDOgSuIMTWN+FJSJNLS5v67zZu
 8QlGgGRCB8r7e04gz5leVa15fPP8dqUOSP1VWqWKQkQFRGcr9qgs91fz5+ebNj7Q6qx/
 c+lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xg0EFyVr
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Shubham Chakraborty as
 ccache maintainer
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ba6ba6b221..124f5dca4e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3025,6 +3025,9 @@ F:	package/tunctl/
>  F:	package/ubus/
>  F:	package/wolfssl/
>  
> +N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +F:	package/ccache
> +
>  N:	Simon Dawson <spdawson@gmail.com>
>  F:	boot/at91bootstrap3/
>  F:	package/cppzmq/
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
