Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055BFC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 15:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D13605F7;
	Sun, 18 May 2025 15:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARbE6oklFK7y; Sun, 18 May 2025 15:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1956607A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1956607A7;
	Sun, 18 May 2025 15:43:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08701E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1061404F0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GasQD71VuArH for <buildroot@buildroot.org>;
 Sun, 18 May 2025 15:43:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=tom5760@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29E3840D81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E3840D81
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29E3840D81
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:43:42 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2d4f832069bso986967fac.3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747583021; x=1748187821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6y/HslCMO0ysY+JrWytlJDr9sdLCcecnAc30mjyqSQ=;
 b=nv5J36/zq54OD/RSf4B57caArzEmAQkmIOIMqFvYR2kNMFu8o3+IAXkcFr3vgOCvNt
 +acqhNQv0j5wLfBpOn/H/lkjqwbeDM6p8cI+8cHavukuH+77/BDEQV38AltFttdwBGLU
 9jlBGsge0oHZORgLz3WZSY429V/oZ099fLhlCMx6omORzhf70SuX6Nlp7h8ZrJ0LnYQK
 qjtO+dn3LP+LzcYFXsZIihwp6ACQ5zJxi8k0DKHq3m8Af7q6vSeDvFQWhbhxqauN4HLj
 80ETdv/PtoojEj+wXVzIcCnYsipKZztzXasDwSZT2rjlm+RoxWGYN4pnkL54j2BZGdVx
 OjGw==
X-Gm-Message-State: AOJu0Yxg6Mmj7cJex8+qvonE5jjTnqhHUo38jPXm49v2YLerpXlXpPLF
 SBp2MY2y3r+BWufuc8G8sxDe2eMskoMgwXoJdBAUMWRQSFO/RQky7ftglRyXsZkkej1+z2/ErOS
 E7IUW7sHV9gjr7NLy9Y1EUK5KZIJ2ew7qfECg
X-Gm-Gg: ASbGncsHaj1ku4uUQsSJgCAGUjJfHImcUTyxgxO7iZWn2N6S5mJRxnEwtNeEXw8U9vC
 TWMp04LVQHOnijfSI7lpSJytZ56f5iTJF7f8ehIu1PBSYeT94/FnvKpF8sR+jsFgTvZIfglID4u
 bjBtDBPh9aaZsOqVSxu2aj9Y7QX/6+Vrx2AJyTKuRQ0ssL6SUzpN5m34j2kp9rTmRLDH4GBwjHp
 UA=
X-Google-Smtp-Source: AGHT+IHVkdowlpF4vd8FJit5Vve3BuqPyH0Vo639kNk65ZjeR+hsU0boJ5mqNy3L9n1BO/MaUN6d70Qa0UGT3pzsXyI=
X-Received: by 2002:a05:6871:6202:b0:2c2:3eb4:e53 with SMTP id
 586e51a60fabf-2e3c1f5a2dbmr5892550fac.37.1747583021156; Sun, 18 May 2025
 08:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250314154252.10248-1-tom5760@gmail.com>
 <20250331153438.4103-1-tom5760@gmail.com>
 <20250518141452.4f6ea693@windsurf>
In-Reply-To: <20250518141452.4f6ea693@windsurf>
From: Tom Wambold <tom5760@gmail.com>
Date: Sun, 18 May 2025 11:43:25 -0400
X-Gm-Features: AX0GCFu9b9QmDK8pKCF0yntxsnOKf7D0l-zKarm7mN-UshErxlXsP_4f9JwAHzY
Message-ID: <CAGQD++iu=34MUb7p994mPL+NhWZC_ej6LnKUu_DSAYp3pxhGDw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>, 
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747583021; x=1748187821; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6y/HslCMO0ysY+JrWytlJDr9sdLCcecnAc30mjyqSQ=;
 b=CtZkX7fQk0U1+PlTAZumckMS+El6rMtUW1iybdGqoz0jbI15/axIGD/4e5sF8ex/E3
 puNEjt2IgxhELtE9pPmQpFB1dH/wjWn4gi8hCJi9QW2jthRxZlugKob5eOBZ/+4rLgzi
 ERI1ECblxuMw4Ct8XUfyugVv8e2JPa+YgHmG5ksvVckC0HFRBnxwfFFS81joPoGrET8u
 /22ko4Z+Jx2lW0fGIuLwbQT33uUooq7bcB8Kahk+UJQf7DCgrwq+SWRGQ40Y22j5NyJO
 jd3mRWIaH4TuXsEZbirnhcqfahte9z7v9Q9GxNERbj2ZdmohU/5z59ne+BtxSB8eTXEw
 FQXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CtZkX7fQ
Subject: Re: [Buildroot] [PATCH v2] package/go: go-bin host-go provider
 implies target support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzOgoKT24gU3VuLCBNYXkgMTgsIDIwMjUgYXQgODoxNOKAr0FNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IEkgdGhpbmsg
eW91IGRvbid0IG5lZWQgdGhlIG5ldwo+IEJSMl9QQUNLQUdFX0hPU1RfR09fQklOX1RBUkdFVF9B
UkNIX1NVUFBPUlRTLCB3aGljaCBpcyBhY3R1YWxseQo+IG1pc2xlYWRpbmcgYXMgdGhpcyBvcHRp
b24gZG9lc24ndCByZXByZXNlbnQgd2hpY2ggdGFyZ2V0IGFyY2hpdGVjdHVyZQo+IGFyZSByZXBy
ZXNlbnRlZC4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrISAgSSd2ZSBqdXN0IHNlbnQgYSB2MyB3
aXRoIHlvdXIgc3VnZ2VzdGlvbi4KCkkgdGhpbmsgb3JpZ2luYWxseSBJIHVuZGVyc3Rvb2QgdGhl
CkJSMl9QQUNLQUdFX0hPU1RfR09fQklOX1RBUkdFVF9BUkNIX1NVUFBPUlRTIHN5bWJvbCBhcyAi
dGhpcyBjYW4gYnVpbGQgYmluYXJpZXMKZm9yIHRoZSBob3N0IiBhbmQgdGhlIEJSMl9QQUNLQUdF
X0hPU1RfR09fQklOX1RBUkdFVF9BUkNIX1NVUFBPUlRTIHN5bWJvbCBhcwpzYXlpbmcgInRoaXMg
Y2FuIGJ1aWxkIGJpbmFyaWVzIGZvciB0aGUgdGFyZ2V0Ii4gIEl0IGRlZmluaXRlbHkgbWFrZXMg
c2Vuc2UgdG8KcmVtb3ZlLCBlc3BlY2lhbGx5IHNpbmNlIGJvdGggc3ltYm9scyB3ZXJlIGRlZmlu
ZWQgZXhhY3RseSB0aGUgc2FtZSB3YXkuCgpUaGFua3MgYWdhaW4hCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
