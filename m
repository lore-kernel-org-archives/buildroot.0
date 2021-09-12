Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC59C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:36:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF0960F8F
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DF0960F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B5EA40441;
	Sun, 12 Sep 2021 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CQpzsRR3KPF; Sun, 12 Sep 2021 19:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA3EA40417;
	Sun, 12 Sep 2021 19:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6991BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E506819B4
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpO1Eq8X_Rc6 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:36:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA2678199D
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:36:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g21so10997087edw.4
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=/Vpn59A91aqghewBdDoOJKU8NhIdrPGsQwGC5HTunxk=;
 b=FJM7p4EBQn5DM8v1mBN2271cz1feATL1G0lJvmXmRNdQsTkweMh4kvS9W1bAjcfl9X
 japrK++87j3RqXOAOlydPXLDcwkEv/1cRi+RKXupbgw4b/7iZn1kKw2KREQzbQRfUvME
 i+xCu9bYqcrP9vI/3lM2IChzU+LDhwImPmhDAZlsdEaaC1+7w81CMXZVPgSVHpBOt89Q
 CE1XqqxRuT+LfacRESY0j3m50nsA7dDAhe1+7cY6d4ZQeNPVa729pD5oK/vH5IrKG1Yl
 1oR+AvJZT4oan3+6lxf1QFstW6tOiwYOJ71/llgLmQVyv1KKvED8ij4qhKtazws27mq3
 FaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=/Vpn59A91aqghewBdDoOJKU8NhIdrPGsQwGC5HTunxk=;
 b=E6/Ynprn73x9RvvBNXo0rWVPOaXbIVWoM7QxP4UOcf9iYr5s4m+HV6w/+jUXy+pB1M
 pac7VvJIvSUzwuNZjZPDoglw6Jc2fqIK9mME4sU9jGTIvJWpJw1l9gdSk8oJH+He2Wso
 LI9OBJAC8pj8IPhqBCp5Eo+YMihvfudNvlVIqQBR86000otefmQwtzRJdQUKNlFFXK/g
 TpVpLICRCJjkTOkFLbAE/c55lXEGsk9dj7QmX2n2ulxbLAB7t8X4XsidxDS5OUdPW8vv
 dbSUTC2m/ri+SBD+NHLYXgVeBQ3yxC1kidPi0MWLGTvig281bDUDPZ/LZAgQyjUSy3CO
 QVBQ==
X-Gm-Message-State: AOAM532ezUsl9mvK8j0PZK6sn87uDS9QIGXwcveDvWhziRfA7sgcb59L
 rPBgr5TETbggstCiLB9FeO4=
X-Google-Smtp-Source: ABdhPJwejWrTz2SPpynRnqQOUnZUZNblNIL3uTYUiFofI8ro9/N2/VfsR6BE9dVpDoWytkRQoxveIQ==
X-Received: by 2002:a05:6402:897:: with SMTP id
 e23mr9368777edy.366.1631475375219; 
 Sun, 12 Sep 2021 12:36:15 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u10sm2745978eds.83.2021.09.12.12.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:36:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPVGv-0005R0-PU; Sun, 12 Sep 2021 21:36:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
Date: Sun, 12 Sep 2021 21:36:13 +0200
In-Reply-To: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Wed, 8 Sep 2021
 16:55:22 +0200")
Message-ID: <87lf4137te.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/bayer2rgb-neon: update URL in
 Config.in file
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gVGhlIFVSTCBwb2ludGluZyB0byBwaHl0
ZWMuZGUgaXMgb2Jzb2xldGUgYW5kIG5vdCBldmVuIHVzZWQgYnkKID4gQnVpbGRyb290LgoKID4g
U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgoKQ29tbWl0dGVkIHRvIDIwMjEuMDIueCwgMjAyMS4wNS54IGFuZCAyMDIx
LjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
