Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC4EC282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 20:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A80F40794;
	Thu,  6 Mar 2025 20:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwx3-qjgtLRB; Thu,  6 Mar 2025 20:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429AD407B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 429AD407B1;
	Thu,  6 Mar 2025 20:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7790DF21
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 482C380BEE
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEVr2LN0zFFJ for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 20:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.50;
 helo=mail-lf1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8631280BEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8631280BEB
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8631280BEB
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:14:28 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54298ec925bso1718878e87.3
 for <buildroot@buildroot.org>; Thu, 06 Mar 2025 12:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741292066; x=1741896866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Piynq8Sl0pFOWn9R/4huglWJ3ws5psFqdWtdlq/GDU4=;
 b=UF+A//RnY/XmlPyThd/J56BH02JvsgpaEyTC8+XlA4J/+4a8BX27z37Uc6ZDKXHv9j
 a7HexRnKpNfjyik+JAkFISza+Zn7roTD8FWJYRM2rAeXISzihkYa/U13f0nws8zrPd9n
 XRkwzKObLA0VRm1718CweBPZF3cTxWbJoCQ0Qf6D7sADYXV7tEBuGGvT6MdRmg/M4z0D
 VTwhVOh4A3KRasQVbBp7wc8lfMOAJplvkrbAEsi7QqEcLrQPojrtf1nHKns2oSJhv6ul
 b3ZHNszPIBLymZ3zSxc2n/gPPJCKCP6Ogejy+IPakt5uBWoJy411rGcKeuTQ+Umspw9/
 04Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXbYlX5lZ9FkVdp5ynqBBl+SUB2UQ/Ju0TvQWc3F8ZORCT4vuxXAfyqjXpps96Yk5oqdQJtmNYTGw=@buildroot.org
X-Gm-Message-State: AOJu0YzOS8zBTxQVl6pVcWbfvTzmiROEcMn9Hwi9Ni5/2BlBvdklFCNg
 CprUY68PRE+tTtDd5cvA2ZQ6TnNV5mL26ylxNxtdSvO0nYHySOGgx2AAfP0k
X-Gm-Gg: ASbGncuA0SiXt+o4dwVXGfGmR0+J4IH5BwQvXwlhplsuO3zMW0bio5ZkXTkG4396Jpa
 mhjlkLPBGosR3/P9gobXf52W3UFrAX2lRpCQ0KJgbKTJDZMi5khoox1++DE5WV/9LsRpLyjoUE7
 g8kD8TS9a/VCU6PmEPwRIzAFyLJ0rhYWST7kmjJvPaLAl+7cLkvmqlc8r6oET3lb4fZ5WIo+VfC
 mnxLdwwm8YC6zLr0R4RPrSD8rdL9rpDu6zWNgTyKJ6B24qSdxQBWW2HGQcNModhwfuOCir2RBHy
 q4vI/uWX8rjY8argDXMh87ZnFGXG9JfqUrS/4R4mRwhn8i79vSe8wZtN15Hy8Q24x/jfzvnGNgT
 kAIcLfSZ6dQ==
X-Google-Smtp-Source: AGHT+IHzONcQJKgpGWWc3NU+f/bg3rXGALIzCF014VDvFAORGreik5jwjuULcK1elusR4sQd9uln6g==
X-Received: by 2002:a05:6512:b11:b0:549:38eb:d68b with SMTP id
 2adb3069b0e04-549910b5eaamr221397e87.33.1741292065666; 
 Thu, 06 Mar 2025 12:14:25 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae4465fsm281747e87.26.2025.03.06.12.14.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 12:14:25 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-307325f2436so10521121fa.0
 for <buildroot@buildroot.org>; Thu, 06 Mar 2025 12:14:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbYhzceASGiBUan305T1htEfLpfA6nOAvKiOCsgRE3GPF3ucJdPZr6ygXPxOqKLk/m7OSUKCaUeV4=@buildroot.org
X-Received: by 2002:a2e:a78a:0:b0:30b:9813:b007 with SMTP id
 38308e7fff4ca-30bf452da00mr1495901fa.15.1741292065184; Thu, 06 Mar 2025
 12:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20250304205633.397011-1-thomas.devoogdt@barco.com>
 <20250304205633.397011-2-thomas.devoogdt@barco.com>
 <87frjrgvks.fsf@dell.be.48ers.dk>
In-Reply-To: <87frjrgvks.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 6 Mar 2025 21:14:13 +0100
X-Gmail-Original-Message-ID: <CACXRmJiXdnFzC8XDNDEM=5-H3zHRzvyuCxKPY4L4xvmTseaipA@mail.gmail.com>
X-Gm-Features: AQ5f1Jpn1BbaY3_pJRalbq6xiRRsz1gta7SlDhBYwzI-W0jd_I1GMl5uWyYA4lE
Message-ID: <CACXRmJiXdnFzC8XDNDEM=5-H3zHRzvyuCxKPY4L4xvmTseaipA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH 2/2] utils/generate-cyclonedx: add an option
 to pretty print the output
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter

> I take it this is meant as an alternative to piping it to jq? Maybe we
> should just always indent with a "sane" level (I believe jq uses 2) and
> the comments about using jq dropped?

This is indeed an alternative to jq. I'm also in favour of just defaulting to 2,
which is indeed the default used by jq.

Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
