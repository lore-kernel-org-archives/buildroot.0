Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1FFECD9A6
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 20:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB0E842DE;
	Thu,  5 Feb 2026 20:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYkSQwQB8hOc; Thu,  5 Feb 2026 20:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D81842DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770324483;
	bh=+Owg1qB1hT4Gk+VVLNTPsFAsVT1swFf6gPXtpr1EJFE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LAyCwYg3AzA+PKQmNQ7NxE/O34bR4+ugGu9XCTFX6+kEWL4fTLyo853G900TYjYsS
	 +l6ql8PcqS1oIrUgGqFEtAUeSiWCRAIxTA+xOFOsDdefcqO8GuOSiJFx6icyL9gJ0v
	 6gc9JPY+/gmDvsdaxhKZq96KnGWWwjk9HwumCG0UVKzUSVpMYs83dD0xdRQkr4yidI
	 Ke6HRkzElMsI6+pyT6Nv/Ym+LUQfNK7eYtzHhqloSSMpZXM5keHpp8skwPBhth+iqF
	 VMsco77myBQLPgLbwON5OVUQs0UB4lpvGP6BgzJkX4XT0siiiq8XLzCOBbiu3jFQrq
	 FkReBmegh67sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7D81842DF;
	Thu,  5 Feb 2026 20:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C6117A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FFFA610C7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WW65zO6_eHu6 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 20:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7BEC608C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7BEC608C2
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7BEC608C2
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:47:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so180165966b.2
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 12:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770324478; x=1770929278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wzt3C1ffrhHNhOMRZBY9PfYYbUqUfBf2meC6gyLLHvE=;
 b=oeVVII2LwE/ogBLcVARF9pZ6C5KuB+eKXlwdQFC9tA2bf6r9MdAWZ6OYRuIhhyt6Ia
 djRHL8yAJV/IebwGsfV4mj+ufBSO9PvOxTlLbtgSBkDLg1vND/tbyJVFo9KzYVZzr3an
 QZjxjPu+yDxkRBYzEJfuvw2PRbHoCXUGce8zvAVXkwqju0kotZnLNPXRGlOAje4Wcvay
 qITcPRTJbo8K3dF26T/dY1iK9d45QwFpywPQTCHMYv1S6rA5uUgZUfg0onNAQfMQZsPe
 7C9j6fueCA7JyqhSE/15W2ux4jGShk0OcGzDjXTSp7a7GWbNO9bOZl82Ca1PqB7qo4hw
 WTDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQmT0Ipowmr6qEfpieIhYtq4YSZzWNUFU51LtTR+eBlq69G5MXGpl+ZXULSkgV3nbNMHV99wvFXl0=@buildroot.org
X-Gm-Message-State: AOJu0YxDx+RH6+F7d0dO4In1Cst1YNi2SWgTWmSqcHGdPgoVxqX2FdpH
 4tw7QwQSiGuKUsy+2fAHrakn9HzKFImr3ytg2VtIRnzNswjr75dbx77s+R0aKhK0JA/r3nn7qQR
 aLUPg
X-Gm-Gg: AZuq6aJzbrfUj/GtZND2IV7orIpISA+hqgikjekyyyGMZlZjQq9G7PgiXSRrXb9UMJg
 glyIa3uoA7+DLLqYN21ETPTuJfUQvzE4ezI6c9gxC7rq+evSop+IVyLGuSVN84mmE+QoaNMKbJ8
 7uk7Tf1XWqDUCj+QOdf4s0v0dX9hTVLBDL+/+vD0VLr05x8lJqe9Orjd806C2XzRP6c6L1MF3ip
 qpXUdBKOQJ8kUEhLz01up8zAz3Sjq414OKXFUVOR4A+InX+7Ui1WoO5IULM5grIw8eJg0YhMhEI
 bWu4U/+VXyQrmZQxh6swrGyhp3SPeKGoOCHIVovey7rM2P6Dy5+TyagamEhzrXUk0zxKkhyScHY
 RjzzEQr8UsI4fWTa84wOMAgVV7ilHOQ64itbNLN0nyGIRujd8lEE6GbIp573fRlpS3GbxlHMTX9
 ujIek=
X-Received: by 2002:a17:907:9707:b0:b87:2d79:61c with SMTP id
 a640c23a62f3a-b8edf174632mr16271266b.8.1770324477903; 
 Thu, 05 Feb 2026 12:47:57 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda7a6d09sm19764366b.25.2026.02.05.12.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 12:47:57 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Date: Thu,  5 Feb 2026 21:47:56 +0100
Message-ID: <20260205204756.83279-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <836e2619-f573-489d-a886-5aca35c3b76f@bubu1.eu>
References: <836e2619-f573-489d-a886-5aca35c3b76f@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770324478; x=1770929278; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzt3C1ffrhHNhOMRZBY9PfYYbUqUfBf2meC6gyLLHvE=;
 b=W4rpq5ZsYUW7sGWnjogJfJPmu61ySUhozYvxVSiRKc90LYu3EPqSHcgAXoXnlkDn4K
 vdOAkLhHpC6xjrkRDZsTT6AzSWMzr5TLt9QzhKuk7XbJ0qh480kUwqKzImQnyrSHCZta
 CILNueIc3mHA3IoIETwfBDPiCbjjhPzHAdaib57AvPHKylVF3+LJiUUKuteTNtmMIkyg
 HBZGW8ZMkPEqOlHsOCbFAhg6vpbwNvksiZlgb7ZPiksVUlGSdwPb//DxK27vkOYKWYxR
 msZppK2nF6hrH2a0nRIBVMwKLICRbX4tlS73M0Wdo283/KvoSOy6Atrc9gzL93+F+is2
 MTug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=W4rpq5Zs
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix patch header
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

Hi Marcus,

In reply of:
> Hi Thomas,
> 
> On 2/5/26 20:04, Thomas Perale via buildroot wrote:
> > Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
> > security patches neeed to reference the vulnerability with the `CVE: `
> > trailer in the patch header.
> 
> Good to know! I was confused for a bit why this didn't make it into the deployed nightly manual yet... but i think that's because the nightly manual redirects to the stable manual currently?
> 
> At least https://nightly.buildroot.org/manual.html doesn't have this information yet.

Unfortunately it's not checked with 'check-package' yet. Because I need both
the context of the '.mk' and the patch to have a rule to check this in
check-package it's not trivial to add a check :/

> > > [1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
> > [2] 1167d0ff3d docs/manual: mention CVE trailer
> > > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > ---
> >   package/strongswan/0001-eap_mschapv2_failure_request_len.patch | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> > index 8442cc7816..7442c123c4 100644
> > --- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> > +++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> > @@ -21,7 +21,7 @@ Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
> >   overflow and causes the daemon to get aborted immediately instead.
> >   >   Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
> > -Fixes: CVE-2025-62291
> > +CVE: CVE-2025-62291
> 
> The Fixes: line is actually from the patch as taken from upstream [1], I wonder if we'd want to keep that intact and put our own metadata below it? But that would also look a bit weird I guess. Thoughts?

Personally, for the patch I send to Buildroot I tend to remove some useless tags sometime.

> [1] https://download.strongswan.org/security/CVE-2025-62291/strongswan-4.4.0-6.0.2_eap_mschapv2_failure_request_len.patch
> 
> >   Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
> >   Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> >   ---
> 
> Marcus
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
