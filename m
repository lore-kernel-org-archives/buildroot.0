Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ED0F34C4D
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 12:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18F760FCC;
	Mon, 13 Apr 2026 12:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jA8n7SY2J1n5; Mon, 13 Apr 2026 12:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8239560F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776083229;
	bh=upbMhvH0Q0Mx6woEmfpzwhQmWtwjxzyy3Y4orMuGmo0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AxQMfp5lzrAjsWgH9z4KqJXqGv7WQ0cPfhLSuphosSV7IUsJuPYZ9IN1q1CeAue/Y
	 I/kCBfsBauwR6s+qLumghfRHT9ZDQVmi0meHgDrrw95O+qszQYlfrFFbQDGViBinSU
	 apknWCsLwWeCqr5djsBe11DiL+vsX5E8lD87eSRuoCYc3PbF8UDAiFTlhKEve+On0X
	 69T8o5YPXXcnUPP2r6Ws7ywamnwM1UtKdbMPvWAxmFKI4td1bxASLpon2S75FSUsfg
	 DIFKYZNwzgJjACykHerlNHxGp9bh51YvB8uU8DrBjBSrD+Xk07SSEUTIxysMT3k4um
	 pk7UogjIGdiHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8239560F44;
	Mon, 13 Apr 2026 12:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89F4C283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FBFE60F44
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXsA6pyThQh5 for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 12:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E22960F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E22960F3E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E22960F3E
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:27:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso74646f8f.0
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776083224; x=1776688024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZEyyc7cgmiFlmE49+rsfKB6egux23bcgXzh6DBAnB2I=;
 b=BEI0gTQLRrZw/xjt/LCUhzsUB2mQjE8/LButWcYoHNAFyqFk/mPTSBYqMH50M2vzV9
 9BdGnDTA8xLk7qcDN+q55dO86xhjzxqyI9/QBlgGp0LgRVU/3ut3gpIkkRt6a/Ac+cnd
 Rr/pT59zqLf5HOBBJ/VU21FQZ+hhKDWODlwYluU43leY9LMZaKllc3byo3lZ5aB5FtYn
 WrvA45I0gtdfYL7JrW/lEvNwFg/pP4ASeoKOum7uzvtQhCsiqjGMdlqDK9cM4T30EUhe
 Yw9JsQzhmyoaSv1OO2ocqlW2PsftdNHwYEyrAa+ptwoC3szYLpQHuKjn2eio0h74vobR
 UrVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+N0CtTNozr8Q5cr5ijGhjHMbdE4/qcSl3Em+4LDdmKqrdMAtPsT83Vu8ql6QPRcZafVgJ/ZYbBXQ4=@buildroot.org
X-Gm-Message-State: AOJu0Ywtadeh2GwBWENp3EN35f06aIEhbIJuXUsUlG+q0/e40jWm04Hr
 2ZByJDvfa88LZW/DoWVfj7ZhOMprSAIyDpTcE+uC7fHN7LlKlD/r7TcSgYWZqtf90I9pX66qztv
 d/AxG
X-Gm-Gg: AeBDievZ8sEJZ1Dyi6L/EsPj39Of3RrFbnNZutM1r7HaHeq0mlAyN3xfVIt/0nOPcWS
 JmvxjJ/ki2WFXRP6nVd+3MM8BF5YrpFBt0snLMuB4t5UI21mIlb4IBu3Qnqk0wRq6YXzlTQ7Rwv
 dVA1rVSRuS+tmnXwADVhwTek05nYiallAZYUYMCgwrXKtJbXaM3sQykkoJ9QjGXKtIS25LaGUEC
 Bm6aqhcpVFpFb/r0/cLKNr+qgNS+HUZyyxOSZo3uLsvK3Uu5l39pf/0AgykEGJde+ofKB06rSMy
 Lkimsh3MF72V+N7Vn9pwhH/kH5q+CM5vwKEsMFU1x0ZRf4mYZVGdRNjKJBSsmcqHebvj2LPr+Mk
 qdsy1vgraWPbIiUzBB/E+x5BnfPjMw4ReSMj2NObVmnIgzlz/LBhdANh7eVI8D7CgtJnkig6qHM
 z/xK40Uv3aRIq/7/0BWc0RcshjAHE9WdM2P3la9O6o+dywRWlW7jDLyIMx08pb
X-Received: by 2002:a05:6000:2c02:b0:43d:75a2:44a1 with SMTP id
 ffacd0b85a97d-43d75a2463emr7381347f8f.47.1776083224260; 
 Mon, 13 Apr 2026 05:27:04 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec295sm32359450f8f.14.2026.04.13.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 05:27:03 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 buildroot@buildroot.org, guenther.harrasser@mobileye.com
Date: Mon, 13 Apr 2026 14:27:02 +0200
Message-ID: <20260413122702.58499-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b4ab5d3f-e0e7-4c97-9df6-7cfd4ba3db9a@cherry.de>
References: <b4ab5d3f-e0e7-4c97-9df6-7cfd4ba3db9a@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776083224; x=1776688024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZEyyc7cgmiFlmE49+rsfKB6egux23bcgXzh6DBAnB2I=;
 b=KkCAoue/GghLGfeLi3QVxN5G6EwnnSpxkh6j/Dkx0oODXbOnGy10oQiXs2WM0TGZkJ
 1uYgCcLnaSRifO9t5Y8uYjm/1hOIPTMlGXVpBmTlTzeqXnO7j7SuOIOoReHLjvfyJcHG
 9lHxn0sgOjfrDmc6s29c7D1/qza07Q73A+zHrcqMAUnmUtr39+oApdLn/cFEkGreOs2i
 y4WkNPociKX1M7PL48tTWWYHFOp7RgMS7vlQotyorsdLCOD+SXQqUV2y/65QnAGMPHLr
 CKtWB/MQ0MiMAGvDuDxIf3Skej2uG26c8XJQ32T86EUgWNJoSnFP8uZWRr0I1XCuI+xc
 bKWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KkCAoue/
Subject: Re: [Buildroot] [PATCH 2025.02.x v2] Package/libopenssl: security
 bump to version 3.5.4
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

Hi Jimmy, Quentin,

I will need to backport the following commit as well:

1. 359908d33c package/ibm-sw-tpm2: add upstream patch to fix builds against libopenssl 3.5.x
2. a01c07f572 package/libspdm: bump version to 3.8.0

I made a 2025.02.x specific backport for libspdm (https://patchwork.ozlabs.org/project/buildroot/patch/20260413122459.58318-1-thomas.perale@mind.be/).

Let me know if you see any other package that will break and that I missed. I
will try to apply this series by the end of the week.

PERALE Thomas

In reply of:
> Hi Jimmy,
> 
> Your series is somehow malformed, all patches have v2 instead of v2 x/5. Your v1 had it correct so I'm not sure what happened since.
> 
> I highly suggest to use b4 (https://b4.docs.kernel.org/en/latest/ and https://pypi.org/project/b4/) if you can. Otherwise, I believe you can generate the series with
> git format-patch --cover-letter -v 2 --subject-prefix "PATCH 2025.02.x" -M -s -o outgoing origin/2025.02.x
> as hinted by the docs in 22.5.4. Patches for maintenance branches.
> 
> On 3/19/26 1:42 PM, Jimmy Durand Wesolowski wrote:
> > As indicated by Quentin Schulz <quentin.schulz@cherry.de>, OpenSSL 3.4 is
> > EoL at the end of 2026, and thus earlier than the Buildroot LTS 2025.02
> > (end of 2027).
> > OpenSSL version thus needs to be bumped to 3.5.x, which is currently
> > 3.5.4. Note that a new 3.5.5 release is in the making.
> > This series brings all the related commits from master to 2025.02.x.
> > 
> Considering we're using this series in one of our products and that before that series we had backported the patches internally and they were the same as in this series:
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
