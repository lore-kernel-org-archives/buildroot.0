Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372B6C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 16:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2A981EB0;
	Thu, 18 Jul 2024 16:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP10sVwfuEDl; Thu, 18 Jul 2024 16:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F2A81EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F2A81EC7;
	Thu, 18 Jul 2024 16:03:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 444A21BF35E
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 16:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30D7A400E4
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 16:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HooecscNJPQ for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 16:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF983400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF983400A4
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF983400A4
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 16:03:26 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5c690949977so448706eaf.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 09:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721318606; x=1721923406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5LU6ZcdJ/zyPakUzDyV4ypsu3Ur0Yowk9LlbqmDb9o=;
 b=rElDJTT32YKDO0N9xPUaJJ3DhwMN36VPF8XUyEXv6gPKVY51yYk3HazUF838Q2OFeJ
 0+StJTtnvXHvATh1/JkjD2lweFuUkzfQsj70kh1hk4xwXAEOtS7tqIsCjRqPImKJrBsx
 w4f6syz7dvrJBB5HUtx6vjR10E1GU+aQUQ5MZKvBWTKUJH+Ls7JOqNnnmJlD6UOJ9n4B
 D2oDRIAycvzhUHj9FVEl4rpW+AdBmExthnZHT/XzPgADOkmeEJRrEnFP6T0o7KO9bcSF
 BV+qXaHJTxZCV+JTOMfnTRkC6a9TblB7mos9kiri/2HlPraqLNK9C/yAqxFbiVqS0pGm
 CMFA==
X-Gm-Message-State: AOJu0Yw4yg8erDNnpAeaWCdeFlDLQuVh83TkP2O+d+W9vAmxQVz6OMU+
 eHMa26B8k4YOZZLS4TCfsYAP7/VBn9vwR4uv9BaCK49MVCEAPzhqHJ0OXm4Jt0zP15N6Edwo9Ik
 of6WIrSI8ytQd27Q/xCwwroirA09Ea6Dh
X-Google-Smtp-Source: AGHT+IEtM/m9ttPZlqIoFACerX9FcpWpHXVR/VYaKbQRnR/q426Nyfq/6XSQGiwP/IXTBSaYwHHJJbJwi79hn++dizc=
X-Received: by 2002:a05:6358:94a7:b0:1a8:c0fd:cf2d with SMTP id
 e5c5f4694b2df-1aca9eb972bmr296162255d.9.1721318605547; Thu, 18 Jul 2024
 09:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
 <20240611152202.951202-4-james.hilliard1@gmail.com>
 <20240716141755.1bf5473b@windsurf>
 <CADvTj4pA9E8H7=S5HKBHwUhgKq8c_+TcRcu1BAMSBxPNTwTX0Q@mail.gmail.com>
 <20240716214724.62a772d4@windsurf>
 <CADvTj4pF77Ci9k+DjaXz63DDqrJRatjSUD8kFdYz56MnP3sHwQ@mail.gmail.com>
 <20240717001758.65e4c207@windsurf>
In-Reply-To: <20240717001758.65e4c207@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 18 Jul 2024 10:03:13 -0600
Message-ID: <CADvTj4q6bU-a1e5ExUtwDdFoM8Tz+foS8n21M_fUGGsCfJLkCQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721318606; x=1721923406; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5LU6ZcdJ/zyPakUzDyV4ypsu3Ur0Yowk9LlbqmDb9o=;
 b=IndmR8I1fAiec5QolnxdFwrx3Uva0IbAP+8289//HVlXbwO7wswotCiBHto2rTY6IW
 vXh40LVc214IRXHz2nRbsHybj4GkVgytXBWsVUxG0OYnzlFHeYHo2f23MGrGb42EBsUu
 xHE87gvQk41mHvs6ds2tqxrYLTaLXWz55RXx7lvunbXECMx/eDxm63s9Er1LUm+Nq6Jo
 dlyxsk62zK2kL1VLJ1bdHizY2XXt9WHjP3/WnNyRwOq5On39kq7zT0nn03dUJfFM75j+
 cgPIUxbmJIgoQ+9aIw/eLjfMf8T4tj/TmzlDa5BWCh3MV5wVbbUGV7RNX/hnw1UU03km
 3AEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IndmR8I1
Subject: Re: [Buildroot] [PATCH v2 4/4] package/fwupd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgNDoxOOKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAxNiBKdWwgMjAyNCAx
Mzo1Njo1NiAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gU28gdWRldmRpciBpcyByZXF1aXJlZCB0byBiZSBkZWZpbmVkIGlmIHVk
ZXYgaXMgbm90IHByZXNlbnQgZHVlIHRvIHRoaXM6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vZnd1
cGQvZnd1cGQvYmxvYi8xLjkuMjEvbWVzb24uYnVpbGQjTDI3Ni1MMjgwCj4gPgo+ID4gQnV0IGlu
c3RhbGxhdGlvbiBpcyBhY3R1YWxseSBjb25kaXRpb25hbCBoZXJlIGJhc2VkIG9uIGd1ZGV2Ogo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL2Z3dXBkL2Z3dXBkL2Jsb2IvMS45LjIxL2RhdGEvbWVzb24u
YnVpbGQjTDYyLUw2NAo+ID4KPiA+IFNvIGFsd2F5cyBzZXR0aW5nIC1EdWRldmRpcj0vdXNyL2xp
Yi91ZGV2IHNlZW1zIHRvIGJlIHRoZSBiZXN0IG9wdGlvbgo+ID4gYXMgdGhlIGJ1aWxkIHN5c3Rl
bSBhbHdheXMgd2FudHMgdGhhdCBkZWZpbmVkIGV2ZW4gd2hlbiBub3QgdXNlZC4KPgo+IFRoYW5r
cyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBXb3VsZCBwZXJoYXBzIGJlIGdvb2QgdG8gc3VibWl0IGEg
YnVnCj4gdXBzdHJlYW0sIG9yIGV2ZW4gYmV0dGVyIGEgZml4LiBNYWtlcyBubyBzZW5zZSB0byBo
YXZlIHRvIGRlZmluZQo+IHVkZXZkaXIgaWYgaXQgZG9lc24ndCBnZXQgdXNlZC4KClVwc3RyZWFt
IGZpeDoKaHR0cHM6Ly9naXRodWIuY29tL2Z3dXBkL2Z3dXBkL3B1bGwvNzUwMwoKPgo+IFRob21h
cwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
