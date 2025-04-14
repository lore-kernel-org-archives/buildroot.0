Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3985C369B5
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 09:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C347A40817;
	Mon, 14 Apr 2025 09:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gi6F33dyTBEO; Mon, 14 Apr 2025 09:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E4F640B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4F640B8C;
	Mon, 14 Apr 2025 09:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50EB9108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3635C605BE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAqdvLdX83lN for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 09:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78930605B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78930605B3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78930605B3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:13:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf825f46bso3557305e9.3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 02:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744621996; x=1745226796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Js8FOtYBntH7jMzoyiw3IXhrymhIzFVo3gCCE8lBVg=;
 b=bkKst4AaRLEOHfQF6CqJwCxqZECCCdhU++GAkaBRZ713UtDwo2O95QRVXIS019fuka
 2uiSPwJ9gUqNrUUQKcLS1h8MrMAx7EGdkmZXKoHZQKH2MYSFCvVcI38a0GzWLvte3q3N
 a2pp/ZE3zgIVbv+baaNF5sudQxuoy+5cguNJyaa2eEVAXUjXQLj6QvsQL+ciKPD8HwA9
 76A9tQN1oSL4ZlDp4zdrvNsvnxlueKZlUTyWvSH9mEbnFZBO8PN5DVWFKm/4aMzjAwLl
 dVXGXswzEjCvzwe4gqzA0QXoVZvXKx7UwGUf2cUO5SerRMCxYyKBZNXcgFg0V/bWPO8v
 Jh9g==
X-Gm-Message-State: AOJu0YysMtgcYkIMef3um7pUXhxaMTYwcDiU4AYpsx6jriRXW2HoPsDY
 k28mAPjPUfdtTqln1h0mmEe+DVHx1eqTWng2gzrKlFAO9Co9Eu4v+igkUUZM
X-Gm-Gg: ASbGncvRU67+4yYCZammJ2AlVNtHHtUZGJT867zvyGFNT/9KiLhSC3SVwrBaZaLmvdb
 9JwbGW8RBNWcCM+LoxRKC6eQm99wT5k4cQy1784Fb5cO948YV5xTZULljP2KGTdtoAMyl3GVp1X
 fdSyVUNbxkmn4CLhDRojgq22ItpQeCVQ+8csuMdBzlQ1Mf6lWXNwqzblKHsA3bf+uYI0FUp30V8
 d3a4dPmakBdgYKBo69oH42niH1mZ+LNQNIq07NKdgqr9ZBeYEdc0OfiVS+baCibEQweD8MD24y2
 bKzYDMzo93S1XesyAj9jGf3NIPVZ
X-Google-Smtp-Source: AGHT+IErd1b2q9/UKD2ckhanWlp5xbF2lq/SWTv2Tg2+ZMx5gleajmXpHM9mFmZiQWkbY3B8UBh3cg==
X-Received: by 2002:a05:600c:1c25:b0:43b:c825:6cde with SMTP id
 5b1f17b1804b1-43f3a93af88mr28188575e9.3.1744621995884; 
 Mon, 14 Apr 2025 02:13:15 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d6ebsm176118125e9.2.2025.04.14.02.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 02:13:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:13:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250414091313.gy63qo5kibpdimb3@skbuf>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-11-olteanv@gmail.com>
 <676856ba2b7d9fdb09ecd3b63217bb8e@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <676856ba2b7d9fdb09ecd3b63217bb8e@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744621996; x=1745226796; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Js8FOtYBntH7jMzoyiw3IXhrymhIzFVo3gCCE8lBVg=;
 b=nMRh8ZI4lNuBhhZwbTBc12lztEVJbFro+fHXndjW2qmuBR4yQ7n2KwTLach+ycgzcA
 4f8kM65RtOtefbn6BjMhIVAlpPkjCdvTZ4GyFG6yXyX4JNJds1gXOJrXpFna5Y6QvZgl
 PhP/8aNaaB3Kpthp+A1Bw615MlE9MBohg7do0a8eoik/d3TzJtUFrvoqbdCPRjdg46Gp
 zYAyoJVmp04aAaHY0X1ZjYCIyGFDe9j2MRoxOu6JfJbynuVCz4MZzidilNt09bJGaCTm
 jdMhFXmRCBkhYawD/AvW4ExRlUZv9ddRPF9djy9m2Wq8L1gXTBvDdNBb781gu0/q+QCB
 zvJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nMRh8ZI4
Subject: Re: [Buildroot] [PATCH v2 10/18] package/fmlib: uprev to
 lf-6.12.3-1.0.0
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

On Sun, Apr 13, 2025 at 11:48:05AM +0200, Julien Olivain wrote:
> On 28/03/2025 19:04, Vladimir Oltean wrote:
> > This is technically the master branch, a few commits post release tag.
> > Change log:
> > 
> > 7a58ecaf0d90 fm_lib: explicit conversion to ioc_fm_pcd_exceptions in
> > FM_PCD_SetException()
> > 22a0d3f1867e fm_lib: make REPORT_ERROR() definition more function-like
> > 08ac8b3112a8 fm_lib: fix conversion warnings between e_FmPcdEngine and
> > enum ioc_fm_pcd_engine
> > 168eae74fd8a fm_lib: fix integer-to-pointer conversion build warning in
> > GetDeviceId()
> > 
> > The build fix patch from Buildroot is no longer necessary, remove it.
> > 
> > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> 
> Applied to master, thanks.

I didn't know that Github supports "git describe" syntax, thanks for
reworking the version bump to fetch "fmlib-lf-6.12.3-1.0.0-3-g7a58eca.tar.gz".
I'll keep that in mind.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
