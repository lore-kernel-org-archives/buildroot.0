Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E6C71157
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 00:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E399A40B89;
	Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puLFMRyLiNjP; Thu, 19 Jun 2025 00:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBA0E40BC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA0E40BC0;
	Thu, 19 Jun 2025 00:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25497E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17083400C5
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSu7RIA2sH8y for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 00:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DE3F40070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE3F40070
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE3F40070
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 00:59:33 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so2473945ad.1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 17:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750294772; x=1750899572;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j7S/sL7nqWj5UnKzQvnQg5w+VgtkR4hkGJn1l3LkgkY=;
 b=YF6jqZv6GB+fPjdL8tnKBJJ8MAiHVLKq2wK5xU6zGh8yevsqpSFqifd8R9zKUOhco6
 SBcwOh8HKrOIdv3T0O+SObHyFhfV/+4bet3BmQd4ZGLHHo/7xcmsRxu+DQrTkHPJn35u
 VVhCdFY2Om4FTdvUZPBAPI9Yl4vai5pjHSBp42T2+LZ71gvECsYRwxhWcDwk72gL8ZNZ
 mg+tn8Igw9yk/+Cwl+ZLM+8gEwrd8h3hPWIhWsv0WplnZaE/LuJVLrIwjV6TiGfvThMQ
 r8hDHZa3RkldC8LdMAQAfbmZJ/xO+Z7VdRI1ciETAPspKG2WAey/YlsZKJVALjFNSVtt
 ee1g==
X-Gm-Message-State: AOJu0YxGRhGEWJiO955aTW/mTNGgTckDQLEzUxG7vz0zOx6C1E5vLUdI
 3k4u3y4COUCdhNRYCAwreG/V4PU5aIcjtPmeEgQBEeE3oO+62snyNWzbP8TJHer7
X-Gm-Gg: ASbGncuFtcjxeBe/Yw5fc3DB7LipkgdQdjUqv3jm/QIat0eZGZ/Qh6+Y7NQFdlOw/Gj
 bFBpfwShsJp6xoZ1Q7cN4ioi05p/jbe1aWdjJMK39ppTSJpOGLsgWOWLmTQEckpfFXu4Qj3HFSJ
 MYVAEzNQ5mzQOzQLh4K4sYa8ZwVdKz+HDKfdBvcjqBcbi4jXYgbdJeQ9W2RjwksxwCH4BxM06/K
 hjGtf4EjsP+SZxLA7dib1wsBmFSivZVg6kIx43rniSBEqTDnqXQbMQbCQxEAcBUmkwVP5VNiu1L
 7BSe1qlbGAG8baNs5Z8/s89fQAgtykd7c5Dqo1I6mtxRwVjwMAL35mq5btb6pw==
X-Google-Smtp-Source: AGHT+IG7JjQReBVuaXR7kcw8oUcIdH/mYy2Y4SLugYHw1hYXdM2sqssG7IQDg79ICrVmQoaLrFCbHw==
X-Received: by 2002:a17:902:cccd:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-2366afe481cmr345327865ad.12.1750294772178; 
 Wed, 18 Jun 2025 17:59:32 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb87ddsm107884165ad.177.2025.06.18.17.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 17:59:31 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Jun 2025 17:59:29 -0700
Message-Id: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPFgU2gC/1XMQQ6CMBBG4auQWTtJSxSIVzEuWvoDk0AlM0pMC
 He3unP5Ld7byaACo2u1k2ITk0cu8KeK+inkESypmGpXX1zjO95Ex1mRExTKr9WeirBw8i1S51p
 39pFKvCoGef/Gt3txDAaOGnI/fXd/FzqOD9lYRnSIAAAA
X-Change-ID: 20250618-virglrenderer-upstream-d17ed807041b
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750294772; x=1750899572; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j7S/sL7nqWj5UnKzQvnQg5w+VgtkR4hkGJn1l3LkgkY=;
 b=F+ogRxLQ27EvEN8+/gfcOPjmcAxDahxEMjTAc6o6zsiLa5cust9tQ1RzlnUGbbqnTG
 18h/cEKoNyKXHthvIdX50WgK7K71D43HUK75tTKkClqovJiay6od0JtFSIsXT3jnjfZH
 KDLzT/dgoo5iaz1HI8GERI36gJErPNAomyLJB9Zz16lw+VU2lyAIM1Od+ht/S/Ai43fW
 EaOu0K8an6FrVIKbaRxKoJSgEllcb+CScwS0PVzkYXkf4pTv0hCUasueFDMgNtSMnP3S
 q5zgSeHxFyOl9k3kw4guVizfgx71+anEldvcdASZNvuuRCIxjJB/PAuCJi6Ap8G1kZXM
 Jq+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=F+ogRxLQ
Subject: [Buildroot] [PATCH 0/3] package/virglrenderer: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxkaW5nIHRoZSB2
aXJnbHJlbmRlcmVyIGxpYnJhcnkgaW4KYnVpbGRyb290LgoKVmlyZ2xyZW5kZXJlciBpcyBhIHVz
ZXJzcGFjZSBsaWJyYXJ5IHVzZWQgdG8gaW1wbGVtZW50IDNkIHJlbmRlcmluZwp1c2luZyB0aGUg
dmlydGlvLWdwdSBwcm90b2NvbC4gSXQncyBjb21tb25seSB1c2VkIGluIGNvbmp1bmN0aW9uIHdp
dGgKcWVtdSwgbWVzYSwgYW5kIHRoZSBrZXJuZWwncyBEUk0gc3Vic3lzdGVtIHRvIHByb3ZpZGUg
YWNjZWxlcmF0ZWQKcmVuZGVyaW5nIGZvciB2aXJ0dWFsIG1hY2hpbmVzLiBWaXJnbHJlbmRlcmVy
IGFkZGl0aW9uYWxseSBmYWNpbGl0YXRlcwpWdWxrYW4gcGFzc3Rocm91Z2ggdXNpbmcgdGhlIFZl
bnVzIHByb3RvY29sLgoKVGhlIGZpcnN0IHBhdGNoIGJ1bXBzIHB5dGhvbi1nbHNsYW5nIHRvIHRo
ZSBtb3N0IHJlY2VudCB2ZXJzaW9uLCB3aGljaApmaXhlcyBhIGJ1aWxkIGVycm9yIG9uIG15IG1h
Y2hpbmUgd2l0aCBHQ0MgdjE1LiBJIGhhdmVuJ3QgZm91bmQgYW55CmF1dG9idWlsZGVyIGJ1aWxk
cyB0aGF0IGhhdmUgZmFpbGVkIGR1ZSB0byB0aGlzIHlldC4KClRoZSBzZWNvbmQgcGF0Y2ggYWRk
cyB0aGUgbmV3IHZpcmdscmVuZGVyZXIgcGFja2FnZS4KClRoZSB0aGlyZCBwYXRjaCBhZGRzIHZp
cmdscmVuZGVyZXIgYXMgYW4gb3B0aW9uYWwgZGVwZW5kZW5jeSB0byBxZW11LAphbG9uZyB3aXRo
IGEgY29ycmVzcG9uZGluZyBjb25maWcgb3B0aW9uIHRvIGVuYWJsZSBpdC4KCkVuYWJsaW5nIHZp
cmdscmVuZGVyZXIgZm9yIHFlbXUgZW5hYmxlcyBPcGVuR0wgc3VwcG9ydCBhcyB3ZWxsLiBBbgpv
cHRpb25hbCBjb25maWcgZm9yIGVuYWJsaW5nIHZlbnVzIG9uIHZpcmdscmVuZGVyZXIgZW5hYmxl
cyB2dWxrYW4KcGFzc3Rocm91Z2guCgpUZXN0ZWQgd2l0aCBsbGFtYS1iZW5jaCBydW5uaW5nIHdp
dGggdGhlIHZ1bGthbiBiYWNrZW5kIGluIGEgbmVzdGVkIFZNLgpBcyBzZWVuIGJlbG93LCB0aGUg
bmVzdGVkIGd1ZXN0IGlzIHNlbmRpbmcgY29tbWFuZHMgdG8gdGhlIGhvc3QgdGhyb3VnaAp2aXJ0
aW8tZ3B1IHR3aWNlLgoKICAgICAgICAjIGxsYW1hLWJlbmNoIC1tIGxsYW1hLTItN2IuUTRfMC5n
Z3VmIC1uZ2wgMTAwCiAgICAgICAgZ2dtbF92dWxrYW46IEZvdW5kIDEgVnVsa2FuIGRldmljZXM6
CiAgICAgICAgZ2dtbF92dWxrYW46IDAgPSBWaXJ0aW8tR1BVIFZlbnVzIChWaXJ0aW8tR1BVIFZl
bnVzIChBTUQgUmFkZW9uIFJYIDY5MDAgWFQgKFJBRFYgTkFWSTIxKSkpICh2ZW51cykgfCB1bWE6
IDAgfCBmcDE2OiAxIHwgd2FycCBzaXplOiA2NCB8IHNoYXJlZCBtZW1vcnk6IDY1NTM2IHwgaW50
IGRvdDogMSB8IG1hdHJpeCBjb3Jlczogbm9uZQogICAgICAgIHwgbW9kZWwgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgICAgc2l6ZSB8ICAgICBwYXJhbXMgfCBiYWNrZW5kICAgIHwgbmds
IHwgICAgICAgICAgICB0ZXN0IHwgICAgICAgICAgICAgICAgICB0L3MgfAogICAgICAgIHwgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHwgLS0tLS0tLS0tOiB8IC0tLS0tLS0tLTogfCAt
LS0tLS0tLS0tIHwgLS06IHwgLS0tLS0tLS0tLS0tLS06IHwgLS0tLS0tLS0tLS0tLS0tLS0tLTog
fAogICAgICAgIHwgbGxhbWEgN0IgUTRfMCAgICAgICAgICAgICAgICAgIHwgICAzLjU2IEdpQiB8
ICAgICA2Ljc0IEIgfCBWdWxrYW4gICAgIHwgMTAwIHwgICAgICAgICAgIHBwNTEyIHwgICAgICAx
MjIwLjk5IMKxIDEwLjEyIHwKICAgICAgICB8IGxsYW1hIDdCIFE0XzAgICAgICAgICAgICAgICAg
ICB8ICAgMy41NiBHaUIgfCAgICAgNi43NCBCIHwgVnVsa2FuICAgICB8IDEwMCB8ICAgICAgICAg
ICB0ZzEyOCB8ICAgICAgICAgODIuMjQgwrEgMS4wMCB8CgogICAgICAgIGJ1aWxkOiB1bmtub3du
ICgwKQoKTW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgYmVuY2htYXJrIGFuZCByZXN1bHRzIGZy
b20gb3RoZXIgaGFyZHdhcmUgb24KdGhlIGxsYW1hLmNwcCBHaXRIdWIgZGlzY3Vzc2lvbiBoZXJl
WzBdLgoKRmVlZGJhY2sgd2VsY29tZS4KCkJlc3QsCkpvc2VwaAoKWzBdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9nZ21sLW9yZy9sbGFtYS5jcHAvZGlzY3Vzc2lvbnMvMTA4NzkKCi0tLQpKb3NlcGggS29n
dXQgKDMpOgogICAgICBwYWNrYWdlL3B5dGhvbi1nbHNsYW5nOiBidW1wIHRvIHZlcnNpb24gMTUu
My4wCiAgICAgIHBhY2thZ2UvdmlyZ2xyZW5kZXJlcjogbmV3IHBhY2thZ2UKICAgICAgcGFja2Fn
ZS9xZW11OiBhZGQgdmlyZ2xyZW5kZXJlciBzdXBwb3J0CgogREVWRUxPUEVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9weXRob24tZ2xzbGFuZy9weXRob24tZ2xz
bGFuZy5oYXNoIHwgIDIgKy0KIHBhY2thZ2UvcHl0aG9uLWdsc2xhbmcvcHl0aG9uLWdsc2xhbmcu
bWsgICB8ICA1ICsrKy0KIHBhY2thZ2UvcWVtdS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAg
ICB8IDEyICsrKysrKysrCiBwYWNrYWdlL3FlbXUvcWVtdS5tayAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOCArKysrKy0KIHBhY2thZ2UvdmlyZ2xyZW5kZXJlci9Db25maWcuaW4gICAgICAgICAg
ICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS92aXJnbHJlbmRl
cmVyL3ZpcmdscmVuZGVyZXIuaGFzaCAgIHwgIDUgKysrKwogcGFja2FnZS92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXIubWsgICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysKIDkgZmls
ZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNv
bW1pdDogZjIzYzgxMDE3NjMwNTYwNGM1NGI3OTYxMWQ4ODU1NDdmNGU0NWMyMwpjaGFuZ2UtaWQ6
IDIwMjUwNjE4LXZpcmdscmVuZGVyZXItdXBzdHJlYW0tZDE3ZWQ4MDcwNDFiCgpCZXN0IHJlZ2Fy
ZHMsCi0tIApKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1dEBnbWFpbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
