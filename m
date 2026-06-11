Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD01CD98CE
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F24540902;
	Thu, 11 Jun 2026 12:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mye7nc6emuTL; Thu, 11 Jun 2026 12:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E84240942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781182394;
	bh=uJlg8HynJU0lSdBHMuc90W3qyU+www97Tt5wM0Z+foY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MtsOMwJUO4P7NjfQHK8DifIpcRIm7fB+xdgwOoAZuRqB/0XmURN6JWj/4HC9+k+8v
	 0saBiamAg5B06M+Z/exBkcKNDju8RupRZGpaFDhBrxTeK2MyTOFxwagGPA8lez4EQf
	 XUd7ob9fbn31XfE0Ybvc/ucN6PJROTZTFImewkXxQCiGrZVP0MP4kQMr2icFOQmaMB
	 iWC++Metw1YbvejhxjN/8W2W4BnROp+8lT6q95C97vzEroeeAzvp646Cys9D/+mxZb
	 jEypRA4GjSUhieWpNhNOWIaE52iS/H9WDzqkbzHDCEwviOFnvCg0ouKo+Hprxd0Kle
	 4r23rioceTw/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E84240942;
	Thu, 11 Jun 2026 12:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFAC0237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1A740942
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxkiiP3qTgRw for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 12:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B058140902
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B058140902
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B058140902
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 12:53:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so601898f8f.0
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 05:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781182389; x=1781787189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ghJIs8H+vNyMLbBPZaTO6OQmpLmUc4VpfHntcVYASNI=;
 b=CGEffNXZD3jhps9Hi8M3C5VeUnn9ceCrs5+vON5nT7tJmkgAN9VfZGDIZYGFmi59Ri
 GdYqOe6lYuUvxdrTUTnNPkl4PgB/t68GxFGAjEdv/iJ31U9rftejDugw/SMMIwej+UXx
 c9BYw8YWiF/6l+rrG/Egq80NiRpgpAO+UBzcct7KYdfWYe4Y0JDQOosh/EfhpL5JapkA
 xtTBNDPCayvBgF+ZQcHqDSM2Kq4izyGJ8MThphFtsna3ZG8qTziRZjHRlreIFr0I7TvM
 T/N0D67W9zZuptm0ODabfcJkfdrGFgBp6b54jk8xqTVIG6NT6tzi4CUhY4jd0hktCG1m
 9IvA==
X-Forwarded-Encrypted: i=1;
 AFNElJ++iYveFS3CQvb68NIrwni7eslDkgVCtaRrfZ/cjZmPSqSyAKZ1qsMynARi5o15hRLtYvva5ni12iw=@buildroot.org
X-Gm-Message-State: AOJu0YygObyy4wzkpE1hJulBZTK233o7K/oniFSKpcS22N+MlhRqwLs2
 R7WcJNIbzcB24WV0BKANBE9eAR8huOv3awJK6uts8gZOZNFnKflMxedazLZ9tMfxN2E=
X-Gm-Gg: Acq92OErC9BUyNQ0hyi7g9IaWw/DqNXiWbe+ivIe0JxJnHNZ3ypaqVIPbh3EEWKxdId
 f10pMnvFRXqpsVZeZX/eaaDv1CSsaGrbWWswms9tkIfTGoKSu/Xet/GzKzuFlYG2XbsrXN6d6Ro
 I4Rmvrh+KWShPkCQHp7jCNDKVQO8LBDk3qad1pR5UU77CwbJ4MTR6qQe14B5FZ9URjctB3YBt+o
 8lL7mJW+rL5jTDkZxNCEdgAspj/ERKIKeo2PZyhXFKCzQn10/CEwxP9gXkI5r14EA7bTE0C5c0a
 HgNMYuM1Ldp34myaUf0TAbziQE4kbgv5DEpDLwRu003rXiL97NiLFntNfcbxn10yG8xLVES0etk
 hYi2NLNnxAUnHnYEKM7atZ6semi0vb0mMOLguswSoT+LLbzes6NiNBKjUAnrofJcdpdb2NXGWH1
 t7o1qi5tgomUSMGi3/jt61gMbMyw==
X-Received: by 2002:a05:6000:1786:b0:460:11bd:3fde with SMTP id
 ffacd0b85a97d-46067e33d6dmr3217382f8f.13.1781182388866; 
 Thu, 11 Jun 2026 05:53:08 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm83440986f8f.13.2026.06.11.05.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:53:08 -0700 (PDT)
To: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Date: Thu, 11 Jun 2026 14:53:07 +0200
Message-ID: <20260611125307.988195-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <PAZP264MB30550823C1A042C1D597FC57F51B2@PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM>
References: <PAZP264MB30550823C1A042C1D597FC57F51B2@PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781182389; x=1781787189; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghJIs8H+vNyMLbBPZaTO6OQmpLmUc4VpfHntcVYASNI=;
 b=O5DQWDYQ7Fx3NLsFkAiFKrwXFJQ1upZKU1hwFKEjDwJJRf+cyDjq+47aVE7AdlBWFo
 InxCUgc2ZtsqWj75bVUy/0D+Y8NuH8rOKjh8gco28dFk2No1Rvsgb0f+iENUKgLM0oF9
 DLDT7sOx1FrncsgIFvwTFvB2THdo+KrjQFRQSfS3vpb0jJSd3a9Um3H+NZmIYEFOdaoH
 HIqM8Sqf+r4HwIJmn1SyaJqOYZpe2q4crTzW3KIQ00dDy1fCAEv8Gz9JZbxSz/2Ac7M6
 zLzdUkbad86mGtSGWIqR5X9CJkDdnPdfGtnrRkCE2MU5bMV6FUzgIuElBrW8bjEkptjn
 Mq0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O5DQWDYQ
Subject: Re: [Buildroot] [PATCH 2025.02.x]  package/{gawk, gcc-initial, htop,
 kbd, m4, nano, qt6declarative, qt6svg,
 xkeyboard-config}: add CPE identifiers
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

Hi Sebastian,

I see that your patch series is marked for 2025.02.x. Is their any reason this
is marked for 2025.02.x ? Those CPE looks to be missing on the `master` branch
as well.

If you are a user of '2025.02.x' don't worry I will backport those changes to
the LTS branch once they are accepted on master ;)

In reply of:
> Hi,
> 
> pkg-stats reports that several packages are missing CPE identifiers,
> which prevents proper CVE matching.
> 
> Add the missing CPE vendor/product information for the following packages:
> 
> - gawk
> - gcc-initial
> - htop
> - kbd
> - m4
> - nano
> - qt6declarative
> - qt6svg
> - xkeyboard-config
> 
> This improves pkg-stats accuracy and allows better CVE tracking.

Also, I think the maintainers would prefer that you do a single commit per
packages changes.

See example commit for adding a CPE for instance:
https://gitlab.com/buildroot.org/buildroot/-/commit/0c9ccb93275338b5a90cc2278e66790370e2f241

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
