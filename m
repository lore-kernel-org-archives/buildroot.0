Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F31C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A5460F38
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27A5460F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E49BC81D72;
	Sun, 10 Oct 2021 19:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36Ikr5JulQ0B; Sun, 10 Oct 2021 19:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CC981DE0;
	Sun, 10 Oct 2021 19:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77FC91BF3BE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605CB403DB
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEzgCrlhBnxA for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 19:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 143D54037F
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 19:57:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x27so64391449lfu.5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=IcElzUVYgEdiW3koBs/0dTuHF8jAdm0aLtPJhYcA1zY=;
 b=RMTYRZ4EQdcfAr2sLgyB56pCDzwn84mPMJILLw+E9Nan97VtimeTeCN9++GklxPlCI
 yTadlNkQLeFdRw5Cv2+2EqqOS52s3NTdpQD4OY90sHww36TP/IeHBDQPJu1Bg789I5Ac
 O77JZPETms+QsVmXtS3t1cAUEuWox1Ass5MNIudyr0PUK7JMk/EHplXLH3RjlsKNdhMR
 zKRejeZX5z1Cr3bjUHhAG3Bf6+JhUmLb7Tg/CCvOit2wQBft2ub7eqSK7F7nRCRPuJBh
 VQZDvtDjWtwhny+WmsE5Cy3FP5DwkwC8oUXyaDhEr/4oFUui8tG801ew37BAVEmJq5vq
 61mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=IcElzUVYgEdiW3koBs/0dTuHF8jAdm0aLtPJhYcA1zY=;
 b=7poGEIcH2OnizTRLq1ESure+ThcM43U6u1ilJsZ6LdwUSa1hH/1rj4aEUOrjZkgZMw
 KUgEsQaFJofjz7cUBTDyk7Zip5jTCNzT3wVLXCCGRTeHlDbJgE43WOApOGKnp4tuVxpk
 l32gBKtSt85pJAw1yjlSIyS6t+nqbhkYy+qI2mU8N7r7Bb9lGDgvmMcwNKza3c93+Pht
 2JXYZglG2Grchh+ZTBTk2lAE6VFF+PU25KwwQkc4YPdpIul/omQjuocklPceO+JEdbAA
 Z4YgnNFpji2m3srduZXtgtjxvpaF47rneUzB4M1tD5erQ9B4xE5JWcWmEOcqUIeqFANV
 vEmQ==
X-Gm-Message-State: AOAM530cRHNI/dm53xHPuydxJUynRcspfwKaEvrx9hMuHaIH+sg2XXLX
 YaRtXb/wf4fOx/Sxip+H1vARP9l1X4+7+g==
X-Google-Smtp-Source: ABdhPJx6Zw7vf7veP2zxkd3LIMqAXmocB80yHaWbutJ2G+Xj0pdDUOHqWtrP/6G0tlBDEpLJ/oRtUw==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr22971038lfi.309.1633895839375; 
 Sun, 10 Oct 2021 12:57:19 -0700 (PDT)
Received: from [10.0.196.136] ([94.254.51.197])
 by smtp.googlemail.com with ESMTPSA id a14sm479932lfi.281.2021.10.10.12.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 12:57:18 -0700 (PDT)
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
Date: Sun, 10 Oct 2021 21:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2041219503052816704=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2041219503052816704==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4nt7AP6mpPfEgZWWVZndABm51uEVbLqpv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4nt7AP6mpPfEgZWWVZndABm51uEVbLqpv
Content-Type: multipart/mixed; boundary="E5vzIQYrfg0ZwemkrybcSGshaMa6bCsay";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Message-ID: <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
In-Reply-To: <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>

--E5vzIQYrfg0ZwemkrybcSGshaMa6bCsay
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 10/10/21 6:52 PM, Esa=C3=AFe Ledoux NJONGSSI KOUAM wrote:
> no filesystem has been configured ...
> I'm just trying the default configuration

This is fine.  I think you've got something really wrong with your
Kali Linux host system.

> should i configure file system for my buildroot ??

No, we mean the file system you are using for building Buildroot on,
in your Kali Linux install.  The rsync error looks as if your disk
partition is a non-native Linux file system, like FAT, which does
not support the operations rsync tries to perform.

How have you set up your Kali Linux?  Do you have the buildroot git
sources checked out to your home directory or some other directory,
perhaps shared with Windows?  If so, I'd definitely avoid that. You
can check the filesystem of your build directory by comparing the
output of

   pwd

with the output from

   findmnt

On my system I have ext4 in the FSTYPE column for my home directory,
which is in the / TARGET.

I finished my install of Kali in my own VM.  It crashed badly before
I gave it enough disk (40 GiB) and RAM (4 GiB).  That's another thing
that might have messed up your build tree.

> the error persists even if i compile it as normal user

Well that's good to know, at least it's consistent.  Just beware
that if you reuse the same source tree, having switched to another
user, a lot of files may still have root as the owner, which may
give you other problems.  Either `sudo chown -R user:user .` from
inside the Buildroot source tree, or check out a new tree.

Best regards
 /Joachim


--E5vzIQYrfg0ZwemkrybcSGshaMa6bCsay--

--4nt7AP6mpPfEgZWWVZndABm51uEVbLqpv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmFjRZ4FAwAAAAAACgkQLCqwqW4MR1iI
pQf9GD7KLst9eeO1nRYoPcH6hJnsW8pGsnxJBICbRQrhyTbr9f8ayYaQe3WTZkbXD8EL9aH7gGs9
JvBAVSM7xI2CWGvThfPhpQAT6L9DDt657Tm8mbUAwEmokN2PhPxmrEQv0X2rPXaJf1UGK42UYZqd
dnYWmXTpoyCuuXTVmcnoHLIUJtEl7addXJKyu1trNehU0dI5urLBGfW7uxvSU0qcY7hQADC7MW/W
pVj5oAX+6U9Obl/pSXugOexPkJOLtP5T4RvDevg0UdMrvpJaam1Z5mIv1Nd7FuG1crTBQ5M0nvwS
0F7XdFvX5vs3beIs3JArbFPt6pLGDCPgUotZS/910Q==
=xavx
-----END PGP SIGNATURE-----

--4nt7AP6mpPfEgZWWVZndABm51uEVbLqpv--

--===============2041219503052816704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2041219503052816704==--
