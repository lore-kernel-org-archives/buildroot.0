Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE3C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5B482531;
	Tue,  6 Feb 2024 19:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSz_X98vMxcK; Tue,  6 Feb 2024 19:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE038254A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EE038254A;
	Tue,  6 Feb 2024 19:46:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79E191BF409
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 665618254A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCAITJ8knHLR for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=caseorum@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2ACA82531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2ACA82531
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2ACA82531
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:46:41 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dc6e0fe3195so5165510276.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707248800; x=1707853600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISJpLMRVTGyMWfwkIbgn3AyETi9i2MPiuNuPIWHSj+I=;
 b=C1llJp8sAzq89mf5ydGQd1b+haHHslxsljTLT64cjOQUK5ZnQgsVlIFVGXffSW+RpK
 TOZ2+iF7uSnB0zlkpOFGcLX4y0NSm8pFhKrFAtoQMUVTOGte8Q2VtZvxbk4kgVKNw9jT
 OdwbAqYcIsuOaTO+XtUko3fXQ3xBrVl7jPLBTEde64hBBfR5A/aJYJwBwXjqOsClqOA7
 8/4adcg38efwu5Eo4acE8t+5gjPlNKQCBDaoOmMNQK/OJYeMmEHZp9tDQGCuI/4Lh4YK
 VtSELhUbcLbQ4Cs0Cm6ez459q9kTcL0AF3+uUZloUMhqa5888ldcUR2t2AH/ZbnJBplq
 syaA==
X-Gm-Message-State: AOJu0Yxc+G277PYVABnxDPEfJxzYHzthko3HcOTK1vD44kQSP+/q8fJe
 W9gZOqMFI6H4+4I1NtOePSzVepE2bv27YkdoSXP0/r73CsoCxosoc1Ta9sDPQMdg0YK/uA6JdHo
 oPy/lL88Vg716xWjc6SzWD+fla4M=
X-Google-Smtp-Source: AGHT+IG5cjrbBNFn2nR0dyv7tJFktSUfaB+ikavFyDxduxi35UOqqI0oFwj/0fzcGd2kQLHq4Pu7Bln/vgpyXh5O6C0=
X-Received: by 2002:a25:8212:0:b0:dc6:d574:9371 with SMTP id
 q18-20020a258212000000b00dc6d5749371mr2231871ybk.47.1707248800421; Tue, 06
 Feb 2024 11:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20230112075509.2200-1-caseorum@gmail.com>
 <a5094bfe-bdb7-4b21-8c0a-5b5dc7984d15@smile.fr>
In-Reply-To: <a5094bfe-bdb7-4b21-8c0a-5b5dc7984d15@smile.fr>
From: Joseph Burt <caseorum@gmail.com>
Date: Tue, 6 Feb 2024 19:46:03 +0000
Message-ID: <CAOHK2jH_8hhWOC9vLvzuh3JVpvC_Jm5oAvCJHUU+frrHFNffxw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707248800; x=1707853600; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISJpLMRVTGyMWfwkIbgn3AyETi9i2MPiuNuPIWHSj+I=;
 b=FutimsbCU1m9tWgdR6mbQNrNqle+gv8WuLr/YfHwxOMdWLM8g+iz7lM5J2ogC9QTmR
 B1R3QPiHl/T+vu9X/GNoFOo2/VzV+GvlJF82jTz/jRgkO/45nEfvLBCa4Am7cUzy3Ze8
 CWPTdWLfQ5jBMMxa+0+Cgdvlln4goc2I2GYKhjXHKEB0WhEcO9wJuTYppTsHPJhLYkim
 50ANoxzvwisVOByL2RFx+tZlpJKexXjr+JUX2fBpXtpVWtxzsGdJVpNR32tlLOfZgTkN
 bReD0NMRWD8f42bBClcZW+qUFWGDBgnuWwDfw+JPYn9TrZf4NI4d4LHXKfh46pzY7TD/
 Hi3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FutimsbC
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: reenable Qemu user-land
 emulation for musl toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gVHVlLCBGZWIgNiwgMjAyNCBhdCA0OjI24oCvUE0gUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IE9rIGJ1dCBpdCB3b3VsZCBmYWls
IHdpdGggZXhpc3RpbmcgKG9sZCkgcHJlYnVpbHQgbXVzbCB0b29sY2hhaW5zLgo+IElzIG11c2wg
MS4yLjIgb2xkIGVub3VnaD8KCk11c2wgMS4yLjIgaXMgdGhyZWUgeWVhcnMgb2xkLCBhbmQgYW55
b25lIGJ1aWxkaW5nIHFlbXUtdXNlciBwcmUgbXVzbAoxLjIuMiBoYXMgcGF0Y2hlZCBxZW11IGFu
ZCBidWlsZHJvb3QgdG8gZG8gc28uClRoaXMgZmFpbHMgaWYgc29tZW9uZSBpcyBidWlsZGluZyBx
ZW11LXVzZXIgZm9yIHRoZSBmaXJzdCB0aW1lIG9uIHRoZQpsYXRlc3QgYnVpbGRyb290IHdpdGgg
YSB2ZXJ5IG9sZCBtdXNsIHRvb2xjaGFpbi4KSSBob3BlIHRoYXQgaXMgdW5saWtlbHksIGJ1dCBJ
IGRvbid0IGtub3cuCgpCZXN0IHdpc2hlcywKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
