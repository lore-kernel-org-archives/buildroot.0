Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00EEC531DF
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26CA4605B7;
	Sun, 18 Aug 2024 22:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfacEFiS0irL; Sun, 18 Aug 2024 22:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D73B6065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D73B6065C;
	Sun, 18 Aug 2024 22:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDB461BF3BE
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 22:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB050400F1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 22:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHFJwRQ25GZh for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 22:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 560C2400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560C2400E0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 560C2400E0
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 22:31:55 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2d3badec49eso510756a91.1
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 15:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724020315; x=1724625115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfyfTQTQzJccmBDAs44BMSVwNA50vOvIjub2yqUCus4=;
 b=e6IzdYrVCN6Jd3jrcWezAr5NMULLJ0EIU8/QKVnbCC6+FamMYfy3E2TR5ysdxdA9Vx
 f0HixHx8tSvlDcrNCbTgp9dFc43VlajIHwgFxtDdLMiXl7t3gzHo0qsoJpbPRwFvH/Gn
 PQp6jnMHE2Ho1uSCPM8qsub1AqSXsqXSQ9D+lWUK9lnahfAhBVu7seZLygd7l6ZrKT7k
 mk2fRwJvhLZaeBKCXs9eGmO1COEmWLZ4fSveZPqJ6bL4O4GGQO8X0gE7QB2S105+i2hy
 upQAstLr5CNn8PBLmMstl2pNdD4v//u67IUBAg5pg8gzkJkMpprlqwqb2HqAT8Khfk3U
 G6IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxoCNZHjtX1ZSh19Lie8aK4y55RPxxSfYrcBxU+ShV7GjKGx3c/hlzFrObtIfvxtfogB5UTWm2Rfw=@buildroot.org
X-Gm-Message-State: AOJu0YwumUoTdJl9F+MEOcwWi+7MDA68sBZCUImuFEviRNbaWz6ww0p6
 RJjcx4GIyxrMyKzs73RawhipqGSyutHnPwK5zgtLqz+ibV00TSjkx9K75QShYqBVpef1WBCSezV
 ZuligH93TU/FbhVLQWpF9FbjQXwTAUt0O5TNscdIAamAH0V9sP2nc
X-Google-Smtp-Source: AGHT+IGnS++Eclyzs4PJaQm3l4zIV4Y1DbI82nenu+dMqjdug9Z8BkqEKtCjdgIh3aA4aeji8qeInKaOvQMkOqwqmSk=
X-Received: by 2002:a17:90a:d517:b0:2d3:c488:fa6b with SMTP id
 98e67ed59e1d1-2d3e151f6d8mr6312544a91.5.1724020314676; Sun, 18 Aug 2024
 15:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240817000027.654079-1-mmayer@broadcom.com>
 <20240817121031.55afa6c1@windsurf>
 <87le0th808.fsf@dell.be.48ers.dk>
In-Reply-To: <87le0th808.fsf@dell.be.48ers.dk>
Date: Sun, 18 Aug 2024 15:31:42 -0700
Message-ID: <CAGt4E5t-csHham0e-xuhhXj-sq8fn6qd3ZbOyrutf3uNHgqKKA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724020315; x=1724625115; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kfyfTQTQzJccmBDAs44BMSVwNA50vOvIjub2yqUCus4=;
 b=gfWkPotq54QtoVPAH+i6oitenswLytczm0HTwtiSytN4L2hc9r+YUV9LQ8VyHwTnGP
 oGvqpWF5hLWSEL5vY2D+L3OSPfkG53ltgSW33UO1QlgoGEhG9QtlYA9DUTJfXeMIp+by
 gujAIRCGY/8gWWy2nbn/ArW/8s+w+hSddD/cA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=gfWkPotq
Subject: Re: [Buildroot] [PATCH] package/dropbear: provide config option to
 turn off SHA1 for RSA
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Sun, 18 Aug 2024 at 13:48, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > Inverted logic options are always a bit annoying. Wouldn't it be better
>  > to do:
>
>  > config BR2_PACKAGE_DROPBEAR_RSA_SHA1
>  >      bool "SHA1 hashing for RSA"
>  >      default y
>  >      help
>  >        SHA1 is no longer considered secure, so users may want to
>  >        disable it, but the lack of SHA1 support for RSA might
>  >        preclude older clients from connecting
>
>  >        This option defaults to enabled to preserve backward
>  >        compatibility.
>
>  > Peter, what do you think? Or should we break backward compatibility for
>  > the sake of security, and leave SHA1 support disabled by default?
>
> I think it makes most sense to do it like you suggest, but drop the
> default y so it behaves similar to BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO.

Hm. What about backward compatibility regarding _RSA_SHA1? Our default
would change while dropbear's default hasn't changed (yet).

Also consider the following discrepancy. The legacy crypto features
are disabled by default in dropbear and a user has to turn them on
manually. _LEGACY_CRYPTO matches this behaviour (off by default, needs
to be enabled manually), so it all makes logical sense and works well.
Whether someone builds dropbear with Buildroot or without, the legacy
crypto functions have to be turned on manually.

However, the situation with _RSA_SHA1 is reversed. The feature is
enabled by default in dropbear and a user has to manually turn it off.
If we model _RSA_SHA1 after _LEGACY_CRYPTO, on the one hand it is nice
and consistent on the Buildroot side. On the other hand, it behaves
opposite to what dropbear is doing. Buildroot would require the user
to take action to receive the default dropbear behaviour (_RSA_SHA1
would need to be enabled explicitly because it would default to
"unset"). This is the opposite experience than someone building
dropbear without Buildroot.

I am not saying we can't or shouldn't do it. However, I do want to
point out the differences between _LEGACY_CRYPTO and _RSA_SHA1, and
how those two options are handled differently on the dropbear side.

With that said, if you do prefer to have an "enable" flag for RSA_SHA1
(rather than my "disable" flag) and it should be off by default, I
will send a patch that does this.

Thanks,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
