Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BDFC3601A
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 08:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1758417E7;
	Tue,  1 Apr 2025 08:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avN2KyhvOoF8; Tue,  1 Apr 2025 08:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E028417EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E028417EB;
	Tue,  1 Apr 2025 08:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 871A017F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AF7981147
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 08:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3tCtmSTKZjV for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 08:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96CBF80D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CBF80D3D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96CBF80D3D
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 08:14:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43e9ccaa1ebso1800775e9.1
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 01:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743495268; x=1744100068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5m3uH+rnmtHYAZOMYT9FpkIMguv/oMnQWcwrInpQtZs=;
 b=Rutv7qvXc2jC8ukQ5vt7GUW1BzueaLcBqXg65epBEHTUv6KTVrgTy6Nvy1gLuLknmD
 +L/oeBaKFS6dt/LvoUYpUQ6BlMfdYBT4s/jcKCHLJJZfjhyfaNDzDTrlptwESut52RW6
 ZZ9sZ8SLWyrElppyZaRif2C4ILseJn2cJsL5o5kXEH42e/bGPfwA9dfS3DCG2jz5C7mu
 9rMrp+VqvkWb3MXqzg36nMbtbGiONY4tDUOsFMctxAX4lw6uAPYiGWu1RKzsgJB75lht
 pa7No6o6YbhjWj6YKPahvjlas3ngCZanzVgHu4mhn7OS2nRLWpWJAsQSS+TtABc6HdGJ
 1pkw==
X-Gm-Message-State: AOJu0YzVylVZORh3ZWLN3+3bcOTQ3+UKr1eiVN1aTk7t5v8ptH20J19x
 XCw31fmBrhpoI9A00FnK6+NaUmHs4HzpnYc14Q1orGIHD+6EwJNP
X-Gm-Gg: ASbGncu5kh0nry35QZ13VceZjhbEGkhAL6M38U2MYBWhjNLX4s3zQlhri3nRqJ1xWsy
 lHt6mHeZ9a46enh3z463M9BBDFNjleuH2TtqO3/2Nj9NwayQDsiUZMF8ULynMSQp9rnyP7a4ona
 ciqtTjcJRC/bUgcqSGv1GMnwtjfLwzGFdKA5BbAa5PaYcJ7FehYPUwPBe2mvP7R/EK+1faicGz2
 Wf3poXEvqZEGWnXkYrYdk9ogoMdIs3bzBSiOjXOtmlZkCukGAkF7EmFXB3Lc2OeR50BtB3jIthZ
 6IFH/09jwEpP0t5mELEW839pHZEpYGBD
X-Google-Smtp-Source: AGHT+IHWFIfDpYE1ps3xT01CwsYKE2NHwEjqkJxQqlsCd3hMe9mfDgrH/sdbiHBvC/PXVT8w0v1LOw==
X-Received: by 2002:a05:600c:4f49:b0:439:94f8:fc7b with SMTP id
 5b1f17b1804b1-43ea936e2b5mr4581805e9.0.1743495268048; 
 Tue, 01 Apr 2025 01:14:28 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbc10f7sm149701805e9.14.2025.04.01.01.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 01:14:27 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:14:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20250401081424.hwdxevrzucohq6fw@skbuf>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <7rnjce73dhujdnipfea5e2qg7z7g7moczlzbkzsrxzggse2rkb@lpmauc2r4qc6>
 <20250331103956.tdwjd3xl7jaihse7@skbuf>
 <lsefn7ciqjh4vcjresnslswex7o4y67hyewwv324gqkmhaw5tx@s43mnee24je2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lsefn7ciqjh4vcjresnslswex7o4y67hyewwv324gqkmhaw5tx@s43mnee24je2>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743495268; x=1744100068; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5m3uH+rnmtHYAZOMYT9FpkIMguv/oMnQWcwrInpQtZs=;
 b=UWWFdttdmpTeMvKEgeae9OtMZlTWXeXRrNGBXob7DBuOiqJ06tSW1jrEnYVP/8457f
 6yKL6iQLF1PT5BKkHdXG0zB70/lmdAYXadA7oKSV43DZ3juau3Pik+ZCfPIPNpTqxe5l
 cotSTNWkySlB7H1SDtfPG9L4PhKGS55L81idrcLrHpsEZ+5XnMWlMhZ+H7DqT0Xy7NUC
 3KR7mpHdPq3HpLNj1EslSLg1c4kIzondvSRm49GEFArGl7fjboOmGxHb2rcxh3YYIdAh
 JMD+Rq143O2J6AeWwY3zaSM/k9b8jJkmZct2Pk4KNA0yaE5CvC/8aJAhFupvPsVxygNA
 uIog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UWWFdttd
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Mar 31, 2025 at 11:11:41PM +0200, Vincent Jardin wrote:
> Just because I'd do support an upstream first instead of a NXP first.
> The purpose of an upstream first is to make sure that any other boards,
> including RDB, Silicom, etc... are all based on a same build
> infrastructure instead of a respective "fork".

But even with downstream components, they still are based on the same
build infrastructure.

With the "forks" you get access to more feature-complete DPDK
networking, thanks to some non-upstreamable components such as
dpaa2-mac-standalone. The upstream network community favors fast path
technologies such as XDP more, and does not make it a priority to
support DPDK. This is just an example which you might care about.

> Of course, I do understand NXP willingness to control theirs, but here
> it is about Buildroot, not NXP's Flexbuild. I'd like to read the views
> of Buildroot's maintainers since I am a novice with Buildroot.

I don't know if I am reading this as intended or not, but you seem to be
making the undestandable confusion that it is me with an NXP engineer
hat who insists on using components from LF.

There has been a disclaimer in the cover letter of this patch set and of
its previous versions that explains I am not submitting these changes as
a work duty, but simply to serve my best personal interests on how to
make the most use of the platform as a simple user.

The other Layerscape design boards in Buildroot also use LF kernels,
U-Boot, ATF, and to my knowledge, that didn't happen due to NXP's
willingness to control the software on their platform either. Non-NXP
Layerscape boards (arcturus_ucls1012a_defconfig, kontron_smarc_sal28_defconfig)
use their own versions of these components and don't seem to be hindered
by the integration choices made for the RDBs.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
