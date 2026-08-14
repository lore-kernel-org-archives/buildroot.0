Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E951C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B7C40E5E;
	Fri, 14 Aug 2026 14:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByJ6lf0-D_tj; Fri, 14 Aug 2026 14:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E86E40E44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716747;
	bh=v+R2ZEjW9BnF0AIIPLoOC6BqZXCMeCM2ZmfJ9c8og/8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=NmFLRigZM5IB/VVCVqQOCZ5Y0N/JffZvTbmhVJsV6fP34QhUDko6CSSKA8+X/i5sj
	 FgpCq/rJYjtNqcyTX19vYvnA65FbhtBQwfVcQt4fof1mSFDizmgaaIh4Ax4BVktFhm
	 r6G1Ok7PWR9PsEHztlhjuWknQ4tvGlgOcCtJzLwAunKYOLvEnqUvrYTUNnKHNYFMwb
	 SF3DWOQXvm8Q+2eY0HvmSu9UgdNuXODy5hYtsRygbHKa/ZzI83iWZjHPchoT7sLOMh
	 GfwMr2XePVx4/kLlyu7gDID5vsSeiiIwo/u3dmq4KIObzyJy4LnoLn9/MvU6ehYYmN
	 HBiFKI5/CzyeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E86E40E44;
	Fri, 14 Aug 2026 14:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D91423F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18FA880F7E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QouAavU4219p for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAB4E80FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB4E80FA2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAB4E80FA2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:12:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so7311875e9.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716743; x=1787321543;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+9c9az8ZPwnOOLZkkoPCaScK5a/W1Sv3s+yaDocbhmU=;
 b=esixk2tspw2lLS92DtanG38ioPlH+/Z7Sw2leiIQMF0+peFJ7/ffHEzr6a9fkeqlQ/
 Et/1EwuYFhNVFSMPq6/C8n4YHQa0GKqwEHJMUB8jg1LkW9YWoYk+GsMFPM9b8boq7ddb
 L7R2OXFI52D6nf/kc0Ovn3VoTJRP7TBqJSOPLjwW9nrzgYPupuwM3d//VNOxdysGpqSJ
 1GZeySIgkCgBCI+TMINl13EbJhTFIguuQ/n5lLec16EyBd1BY1R9t2IWBTjG6WsglMab
 UDjZTQljaBla8KE/ekKhJyHmMScnfilh0x6h7R1v07Brj5EmVjeiu/piYffYOfSo1CYc
 W/PQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqtMNbsKvgxVNE2QsirUTZoke941detBL2YHXRw1t+gygMZmygRVKg3BH/Wgs/A+uP95agZzamUrn0=@buildroot.org
X-Gm-Message-State: AOJu0YxpRltEPdNno/81onb8WYs64/f7SFTSA5j0cTXU2JoLp0VbV6ZJ
 HRAMs5FoVZwTS6pjo7kM1znMqBvlfpwxAphUw3zYPI72r0/vnOs51WgAd/7VtbmGL+I=
X-Gm-Gg: AR+sD10881BeSLmiuWa8gQ4AjDo0BKVnQc3KG+lD0MisdheyYU5u3xABuiREFpvmZlb
 nLFf37wAsvzL9JIm7pfUUNHGRYaYJBZsSFWySeyKkq7CJFZEEFoWsziy0YewA78U8hrb8SB6qCV
 z3h5DIebBK4tx2Yx7m5O86bbRjR5inqw1CwODvj0AcSdjqE1RBoxnkt3lGPXu6nXT+AVD0iDARh
 vX/52uu2xpM4g+i3yizUkZ9sqzxfu/ZuB5DUuHbk/If9ptMO2Fmyr5RpA3DLoljfhGCq34fO+wt
 ipH71f6i5Q+4313fcICSGxCMc8QESvwUb0TSXkdHuD6w4b7PwvA5Yma0D6y7gAAtmTfLOVccqgd
 6a1u0tw0QMOWpASp314uHyULJinWcZSf0TepUMYrCuVCHuCiHbd4THOml0YeG3njt0kS3Coszxa
 ZmDhTrXk4F/L9gLrmPzmdXdDHAoix28sjVBdZO3B9X/wXFZXemWqamJmU2iZ7W/T0qT0NqzVdcN
 FYU0tZN9FHSr7mUhNwVLMUj/+3xQnkPM1GkdUn4RBzTehcG
X-Received: by 2002:a05:600c:1395:b0:499:872b:abd4 with SMTP id
 5b1f17b1804b1-4998797684cmr75391955e9.6.1786716742864; 
 Fri, 14 Aug 2026 07:12:22 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49989ae14f7sm32007575e9.10.2026.08.14.07.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:12:22 -0700 (PDT)
Message-ID: <5406e361-f45a-429b-b3cb-d80297b8ae85@mind.be>
Date: Fri, 14 Aug 2026 16:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ai6stJaA2hWFBHDW@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <ai6stJaA2hWFBHDW@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix for noMMU targets using
 FLAT binaries
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/06/26 15:29, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
