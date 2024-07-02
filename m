Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE79BC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4092810E7;
	Tue,  2 Jul 2024 19:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTS4vzPBSeed; Tue,  2 Jul 2024 19:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B386281132
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B386281132;
	Tue,  2 Jul 2024 19:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 313B81BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D3F041526
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dup_AbWwk8BN for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B0894155A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B0894155A
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B0894155A
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:41:01 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ee77db6f97so14329331fa.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949259; x=1720554059;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rq2rIDYIxNx3P65Ny558lMdX0BaJTei5eUk9Ax6ZeNM=;
 b=F9EGTDAJMmNFFUFjXRk7UvijaBVKUgoIFPyYCXBSBRibrG8CAwyVLqjbehgsgwhxBX
 S5aBVDFQl9g4OFp/zctEHLXR34RBJqAwGPILyqtgl51McRn5kUId4UeApZDsLxOl3uO5
 97ka21pWc0RN7lo1j1kzhgGO5+HzxsGJ6iiVOouQrOsZwXBu+asIg+nyEk1Qv9punpIQ
 pm9pp6vKLLMys8vrBy0sGgOSeuYk/MlCe/RQeWGFaZMu9HcQiPAK76proUrYS8geoKQx
 3NFlrMchifvGJVYa86Y7g7ly/FWLM9F4lgH7QEXTUX0fb8viYNP2+D3GAGI8SgPlT+SY
 TdfQ==
X-Gm-Message-State: AOJu0Yxs8USoAuUVupWkO6Cf1X267ExJjz3lzuDcdAxTbHgaGN/1Dhu1
 COb0B3lz3jQwQUadA+U6SMh37DVNjHmquM8BsmmrrwF4TdJr23eJAjwnXQfzCz62ueLarG/Ce5z
 +Bz7nZA==
X-Google-Smtp-Source: AGHT+IHFGWTJu/Ez6gP4BW9grTeG/ZD3Ycmgho9kYpfi+fA4Ta0HvvZximSQmy/bu6lTDytcbpZt8w==
X-Received: by 2002:a05:651c:225:b0:2ee:4a67:3d82 with SMTP id
 38308e7fff4ca-2ee5e3bedf3mr80165941fa.28.1719949258192; 
 Tue, 02 Jul 2024 12:40:58 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee516801ddsm17523421fa.85.2024.07.02.12.40.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:40:57 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ee794ebffbso13096571fa.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:40:57 -0700 (PDT)
X-Received: by 2002:a2e:a784:0:b0:2ec:5ff1:2271 with SMTP id
 38308e7fff4ca-2ee5e3937b0mr89344961fa.18.1719949256791; Tue, 02 Jul 2024
 12:40:56 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Jul 2024 12:40:45 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
Message-ID: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>,
 Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1719949259; x=1720554059; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Rq2rIDYIxNx3P65Ny558lMdX0BaJTei5eUk9Ax6ZeNM=;
 b=DqmH250jwcwlfmwIFSLNfUXP6yQ8Ec6RHIn6dR/PjCTPQ6xUDxsrVLZ2gWeiuvn+LQ
 t8ligvNznm71KNqDUhq2Z1VirMJZeawf1vq+t191mWQ2ZH/OGws08WAal6CWuchgcw6G
 L8JvDG43L2Igxrb/L8KFI2zgUQEPPI8WBbfgBjOVy2FJT28TuusQIzrAQoXzag199lh8
 pzmeuetP337TK0jjRruETgeOqrZMPBto9wF2bGy+UZSYuDqXj54Q89l9AZilQmWA6qH2
 JR8dh8Zzicrc9PPc1dpQrrZX0Vq2juf3F3+mbde3cvkvllIJSGXEFY+OlluegW9NtpVZ
 7BKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=DqmH250j
Subject: [Buildroot] package/openssh: please backport bump to 9.8p1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============2259196547124179888=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2259196547124179888==
Content-Type: multipart/alternative; boundary="0000000000007baa1f061c48e488"

--0000000000007baa1f061c48e488
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please backport openssh 9.8p1 to 2024.05.x.

4ac2cc5beec0eac4991fb28f286707a5659fa67e

It contains a security fix.

Thanks!
Christian Stewart

--0000000000007baa1f061c48e488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Please backport open=
ssh 9.8p1 to 2024.05.x.</div><div><br></div><div>4ac2cc5beec0eac4991fb28f28=
6707a5659fa67e</div><div><br></div><div>It contains a security fix.<br></di=
v><div><br></div><div>Thanks!</div><div>Christian Stewart<br></div></div>

--0000000000007baa1f061c48e488--

--===============2259196547124179888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2259196547124179888==--
