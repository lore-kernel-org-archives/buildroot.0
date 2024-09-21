Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D23ECF9C68
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 07:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA070846DB;
	Sat, 21 Sep 2024 07:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nd0FSvsHndQR; Sat, 21 Sep 2024 07:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96FD846E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D96FD846E6;
	Sat, 21 Sep 2024 07:00:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0D6A1BF275
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 07:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD57C40360
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 07:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Dcv3EmXZMtL for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 07:00:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=marcus.folkesson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F056401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F056401C9
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F056401C9
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 07:00:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so2984325e87.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 00:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726902042; x=1727506842;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyMEl9aQujwumtY2lmpa/oNSpudIP4Ig5NH5HdVyJ2A=;
 b=FLvBgqBAdwpM6ZUKVs6C9ujHlSCfEjFTXKcX21Q4ufLQE/DP6XqGYrzKpgHvD5LJC2
 b1ANCw7CIHbQqx3ETBKJGp0P7THDmsOxQCnfItf0xWgQQTK/pZ6imWOzdzAI2Hg1YqQN
 s6YsNOF7oP7kuoM5Q4//u/wzVG5yYvQzFI3JMGMoKqVahDPgpyOFZNQ3AHpE5TzmTI5I
 q1kQqdwPMzOAHrGmLS5pNY+/iSWN0OyVVKZuDIuERB4JPrnKGI5lfszJ05tigOpCQX/3
 YlIwXT0PkV9goFCmUeiVpZhYOSBoFGhxhRST/IN8pSBTQNUYVUYuYYrQjjrdmomOiR12
 8OEg==
X-Gm-Message-State: AOJu0Yy+dXL9RzisILQOAWfaQSU2Wq1ex1HUf89dFZaZagZtsqVeeuah
 Rnat3gg2w68kus1/wnTsZgWu0fbJHxiFHRyWqSZjyLypfftApi0jdD9fwQ==
X-Google-Smtp-Source: AGHT+IE/xw1a0S4P4OptVCtaYaZd5ZmkxZH6xaf5KMmTmv6X2MkNwnYUuLgrGomvVELg2dcUw+pTwg==
X-Received: by 2002:a05:6512:3b85:b0:536:562d:dd11 with SMTP id
 2adb3069b0e04-536ac2d6983mr3534775e87.11.1726902041736; 
 Sat, 21 Sep 2024 00:00:41 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a86c7sm2479921e87.223.2024.09.21.00.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 00:00:40 -0700 (PDT)
Date: Sat, 21 Sep 2024 09:00:39 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zu5vF3uZzCZGUuDb@gmail.com>
References: <20240920155955.4074868-1-peter@korsgaard.com>
MIME-Version: 1.0
In-Reply-To: <20240920155955.4074868-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726902042; x=1727506842; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hyMEl9aQujwumtY2lmpa/oNSpudIP4Ig5NH5HdVyJ2A=;
 b=Qxk9nUHm0hTX1I/9O3bgVE2R2gRihgPU1nNkKmzCPgMc+BQ6+trmZnznc17e3ysFxE
 YJG9sDi6ml1sBava+E0NzftLcMHe+8IDQ8/GuJRTjlSKwNABVfNfXdby8QUS9J+FXzl3
 F0lao9COtj/8vhm69HU15+VjBcUZRmuYUQ1lR3gE0pg3L3Mj5t+ScAahtiKimWDMHyVF
 qhoL3durPtNEo6UhbUINT3S5D0Jt+yJq/1jX4Uln8YpnvjVCvZHpzIuCF+Cz01cfKmsu
 0aLqfHo0qrCabeai2XUJQCXGL2T8YS+mQ2b7rzc72dXrg96R8lTcRZ0+lkPF6ptuso9I
 hLfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qxk9nUHm
Subject: Re: [Buildroot] [PATCH 1/6] utils/config: fix don't typo
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
Content-Type: multipart/mixed; boundary="===============4445496598661063953=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4445496598661063953==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uc4skP9OIsWGmCNO"
Content-Disposition: inline


--uc4skP9OIsWGmCNO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2024 at 05:59:49PM +0200, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--uc4skP9OIsWGmCNO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmbubxIACgkQiIBOb1ld
UjKj7A/+NvtOaLaoHceYMfcYj/y7shs/aUJ4phcpMuEeBD7QwEXAhpwXExmcKUJq
LjnewjN344FDkZzj0nr7BUa6QGecPl4faVUj3Pm8o/7f35UMTK6unORChVI2FF3J
GuuW6gvTwTSQgl9nzysGF06fvunrAONxw7ZoFlLW+Bdi+WYHpAYvz/RfFyAGN9W+
3N+dULMtAwYZt77YGI2THSyZ4sI+W4AtSFWuCnsgjg3n+AW9TJd+ezFNBcvzGq7A
wMxp5MUsX32Oz535tDblsXD6KilxfQl9qgJyzPYXwACgl8KpQczs/K5oELpceBSw
fW6RwWx8NDMlM2lf/HQ1nFjvBzCdrSxjZqBWJF4BTSWya+T4cwushFs5qqTvC34W
j+dTdb/AMH2EsYiqFkqwcC1vO+blqKmMUFYAu1RuxQ8OKDyaL6gY3NuoPsLAJ1n6
2TEtm4pYSYf5p6JE6I3ez1XT/MUdiP1jWVKIi3nbEJhDhgd5Ww4AruB9u8KnQKy0
zRd5xOIfTb5Keh8v6SOMYQQ8p2gLehCdu0Ljce/kSbB/n6eg+Led1bfhaQXzDBGB
iJu00Khmib/MINgUc19ISUDnbWxejpkJEntX0EkoIweEb91I5iRIzyTjkMH0N9pv
sKhLFQs44cj6Jl+zS2nGitMnwDA5umClylU4Jh72hZ65ml9HCVU=
=XgHd
-----END PGP SIGNATURE-----

--uc4skP9OIsWGmCNO--

--===============4445496598661063953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4445496598661063953==--
