Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B219CC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EBE403FE;
	Tue, 20 Aug 2024 20:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q70wewBJSI0U; Tue, 20 Aug 2024 20:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D471C40584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D471C40584;
	Tue, 20 Aug 2024 20:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 055161BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E51FE811E3
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pp5Qoaga5Xmx for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 728E9811E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 728E9811E1
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 728E9811E1
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:27:48 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7cd835872ceso459849a12.3
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 13:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724185667; x=1724790467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6RZczP7gFdacs/kBoxk3fTb1sqxYyDbLXoosP6Dmb8=;
 b=iZrUQ8vaM4LVqVUQ/4aMOjaed7NwRSKIny34rAAU6Ie+RBIGbH60EeKjleRgL77D97
 NubW742Kn3PPcOqecEUPFZtUCjojJjm/7IA8aOXT4G3aeS+85kMUUn5af8anemToxM0I
 e9TfZPBa71m+Lr7UwL8RPIDbk05pWPgwQtbpctQY0svZNMkYN4FeJLv2nBWaQ1vw8wMM
 +FuWuibeEbc5yEXv3pGSvsulYGi8dMTTy0QrRkYJgAVFiCTNZ/OxBd02IP/MBVI5UCmK
 zyhQc5GkW5MlbpCKTwKTEZGy889RjX0j4ZTvCd8kWwaUwndzsExAfwCGtoZaBWE85PIF
 Gp7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHfTaBldk/RvpxfNriIs1A1nzWWUhmQPSN5VTgT1CEq9lHkRlQKi683XB6HAw6wzkkVJ1Ji4w/+Zo=@buildroot.org
X-Gm-Message-State: AOJu0Yy9T7Clk37W+qjtWSWCt63gJ1PAmLjiXpI/shqnpoGoRNPZoLMP
 h4ZDFPxFFEGWM7svjvBrZK5RqaP+FSFY269hG4ANPTwxF3kAAoY82nm1tQ+FIXBPBDpad2zM3nR
 FCVXCO3aBPyARFcU7FTjnwrFizgSE/9krF8OJ1zWwph030KuuUxee5/Q=
X-Google-Smtp-Source: AGHT+IFEKIt+BV18+6gLU6xfZtA4nZkQSKmq8ljvvvB9TymycTV5idbgjsXHgnB6mrM3d2lvpa/OlXDBNLSAG6xwXe0=
X-Received: by 2002:a17:90a:ba84:b0:2c9:359c:b0c with SMTP id
 98e67ed59e1d1-2d5e9ec995emr104424a91.28.1724185667212; Tue, 20 Aug 2024
 13:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240817000027.654079-1-mmayer@broadcom.com>
 <20240817121031.55afa6c1@windsurf>
 <87le0th808.fsf@dell.be.48ers.dk>
 <CAGt4E5t-csHham0e-xuhhXj-sq8fn6qd3ZbOyrutf3uNHgqKKA@mail.gmail.com>
 <87h6bhgf6a.fsf@dell.be.48ers.dk>
In-Reply-To: <87h6bhgf6a.fsf@dell.be.48ers.dk>
Date: Tue, 20 Aug 2024 13:27:35 -0700
Message-ID: <CAGt4E5uk5p3PESReUg=V6uP8LgmoTukpCn0EJ5LgrYS+z48asQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724185667; x=1724790467; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f6RZczP7gFdacs/kBoxk3fTb1sqxYyDbLXoosP6Dmb8=;
 b=FG+LYAOkchhd8hkg4nxMNOQmhdltrCwqyF1YUKnts/OQSyFhUx0l2mjdvwCFsw0GAq
 7Nbf6SitpQ1WL8tQq9gJJkL6IHkEierYRuUOm2UrazZDTYloFov++Tbw5nn1uF38RAH2
 OMb9uCjEKJP488wDLe/OX7enqmFlmdnqT6cHU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=FG+LYAOk
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

On Mon, 19 Aug 2024 at 00:11, Peter Korsgaard <peter@korsgaard.com> wrote:

>  > Hm. What about backward compatibility regarding _RSA_SHA1? Our default
>  > would change while dropbear's default hasn't changed (yet).
>
> I don't think this is a big concern. Like you say, any update of
> Buildroot could bring different behaviour of a package (caused by an
> upstream change or by us), and as dropbear has stated that they will
> disable RSA_SHA1 by default in a future release it would be odd for us
> to have the opposite behaviour (on by default).

Sounds good to me.

>  > However, the situation with _RSA_SHA1 is reversed. The feature is
>  > enabled by default in dropbear and a user has to manually turn it off.
>  > If we model _RSA_SHA1 after _LEGACY_CRYPTO, on the one hand it is nice
>  > and consistent on the Buildroot side. On the other hand, it behaves
>  > opposite to what dropbear is doing. Buildroot would require the user
>  > to take action to receive the default dropbear behaviour (_RSA_SHA1
>  > would need to be enabled explicitly because it would default to
>  > "unset"). This is the opposite experience than someone building
>  > dropbear without Buildroot.
>
> True. It also somewhat depends on how fine grained configuration options
> we want, E.G. we could also simply handle the RSA_SHA1 option under the
> LEGACY_CRYPTO option WHEN upstream disables it by default, but then we
> have to wait for that.

Do we really have to wait for upstream? We could do something like this:

ifeq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
define DROPBEAR_ENABLE_LEGACY_CRYPTO
    echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
    echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
    echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
    echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
    echo '#define DROPBEAR_DSS 1'                   >> $(@D)/localoptions.h
endef
DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
else
define DROPBEAR_DISABLE_RSA_SHA1
       echo '#define DROPBEAR_RSA_SHA1 0'              >> $(@D)/localoptions.h
endef
DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_RSA_SHA1
endif

If _LEGACY_CRYPTO==y, it'll enable all the old algorithms and do
nothing with SHA1 (which is enabled by default). If _LEGACY_CRYPTO is
unset, it'll turn off SHA1 (and leave the legacy algorithms alone, so
they are turned off).

It's a little out there, but it should work... The localoptions.h file
looked correct when I attempted this.

> Looking elsewhere, I see that openwrt handles it with a "modern only"
> option to only enable modern/secure options, maybe that is a way to go?
>
> https://github.com/openwrt/openwrt/commit/bf900e02c7102601be2e9280231711e70f065877
>
> Related to RSA_SHA1, I believe the original reason for you sending this
> patch was to disable everything related to SHA1, but SHA1 is also used
> for HMAC and key exchange, so we should consider disabling those as
> well:
>
> https://github.com/openwrt/openwrt/commit/2d9a0be307b534ceb717267c95402d1d707cd2c3

The initial motivation was that "ssh-audit" would flag the RSA
algorithm using it.

$ ssh-audit  testbed | grep rsa
(key) rsa-sha2-256 (4096-bit)        -- [info] available since OpenSSH 7.2
(key) ssh-rsa (4096-bit)             -- [fail] using weak hashing algorithm
(fin) ssh-rsa: SHA256:a0+Ut09+aNXX7NeA6lcaJgvOAbeKcWUMMhFHuEJui6s
(rec) -ssh-rsa                       -- key algorithm to remove

This already goes away by disabling RSA_SHA1.

$ ssh-audit -p 2222  testbed | grep rsa
(key) rsa-sha2-256 (4096-bit)        -- [info] available since OpenSSH 7.2
(fin) ssh-rsa: SHA256:a0+Ut09+aNXX7NeA6lcaJgvOAbeKcWUMMhFHuEJui6s

I'll play around with this some more and see what we can do regarding
HMAC and kex.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
