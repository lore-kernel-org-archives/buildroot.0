Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25457C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E216360A67;
	Fri,  7 Aug 2026 11:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7qGKEHBFoyu; Fri,  7 Aug 2026 11:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B29A60A66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103414;
	bh=OKeP7eCrDp29IJGENCT8N/HG40n/Uz8MoHbqtHKiZCk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rERuq76sBXYwZc2T+fBNgfHmybmhIRqOLQu7q5eM030HCAUpan22unYZAq3JWvwR2
	 0N+NnyLD9S9v+PhowoS2CMZtqE9ea4qh4T8xOGgZqvzoBODq7dm6pkFwi6rB57JZeY
	 IgsczH/FZqDatpFKUWDQfY7tgr+aCXMUXMI1bNUtMG6Vb4+zlCUIpIc0aeIWUSq9fc
	 dCC/goXZgi1WXyA1EWhHef/urdlamv98e9eytXzyv7Ddi2A1y0ZZ0Q0udoBjuHQg4s
	 LPeRJZSBzjgW5qF1riitIF9aP8OYH5kQJ0NAyLqXubOKcHU3erk5k/qwezYkGMEmRc
	 nymaK2yORwBWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B29A60A66;
	Fri,  7 Aug 2026 11:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA7BF282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCC2C8115B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVMoqxNSYkWs for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F25F281105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F25F281105
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F25F281105
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:50:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47f59f25ec4so1387048f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103410; x=1786708210;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oY7eYFjCiJOXqYHQ5zYfSF98QXHWo9ier8mxs90FH+M=;
 b=QDTDSVyEuYmFqnPsm1SgdnZSzsyNc1f5I84GHaNdVp46aNRiQhTF3MwHUFVjnJCrVj
 vqCMcP3wYq3RTBGqbeo2n6h4YqTrT5Sk8bSQQ3VQjoQE6PElTx/G256jJhQ3lSJPTFjL
 7rlpRfG5W3zs6Ic/91KPe38Oo2IS8AMmJ9iLbBsQj4LMAlrL58qsYPxjENk/z7QZjeMa
 wZjO6jS5j3iC1pFHgWtdTgvttnAsfMhoaYzW42gsL9rkN1IrTT1LnRFMY0k7V6x2O+Jq
 A2wPvfaRhwdmprPD/AxhCFcoRU9RnA9GI6DSzMjZ1P2+8t9EoquSst6nBghuT2/TJOKa
 gjog==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDzHtnbN85L6wAycY66vECjMGRwjy7ZFfpsEKx7JGwai2Fb5sBsPryRXi5+Gd+jJysskiCsAet0B8=@buildroot.org
X-Gm-Message-State: AOJu0Yy8TpvBZ1su9DQYtukq72rE1YCVpo1CdnrDazwp3xMPZ4fGIe1Q
 z8Jq7DgzzHQQ4ir9sJAyuDU3WNAZDLBRHUIG21eb+f+47piDwNeqnubMvRCwueGCKr3sXkS8n7Y
 Otj2j
X-Gm-Gg: AR+sD13KZiGCFDzRP5bhrUa9iBRn73f/16TGjUCFQqi2eZj2MBna29VlgCigdrqDEj6
 +6eu7dZdA220lVEerUPUNnzI5V0Eh8GKBlyFF84Koo6uidGBR9lwDgfpy5y/g0fFAbYbI6e+gHm
 MoKm8JDhlv8atfr2Sw9Z58Hltyj5/tl6D7+o9RcioqeAaM+o88gfuHoLVOQdMhXuouB94lZdx4K
 ewlHKEm6ksZmiRgLMdlCj2OlhOA1LJ8J/JobnBOGKm2cjrUqu2OepUjUSrzjqQFr7++AXXfyxmr
 RllrmQktvZESe/MotIeyararnVhK2oOWdZDOPGjHjiIFPfGF/Ba2PqfoV4WwMSJBuyWDCmVofEN
 Ob5NsW+fiPG002UydfmA7mILI+GowMPkXjB8Kj6ZzfU3wgJrowueLewBcOYi5tIt8iQL7B4Y+Sj
 ATlpX43iJgwotiHsyG8EKTGeOrm32V6eq/wSPs4t0StxbKjFf/rLUatdZIVrHZ8infRIZQn1ID2
 P/NN6CiZYk1t57ehMeo0wGIaDK2Gkiz2RHuznCcB1O7ZJFVX0NYIqFVA30=
X-Received: by 2002:a05:6000:2798:b0:47f:6981:a043 with SMTP id
 ffacd0b85a97d-47ffd982040mr9659595f8f.26.1786103409779; 
 Fri, 07 Aug 2026 04:50:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e902dsm5060048f8f.21.2026.08.07.04.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:50:09 -0700 (PDT)
Message-ID: <a570d6e9-05d0-416f-8718-ced470b769ca@mind.be>
Date: Fri, 7 Aug 2026 13:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260730183524.1145030-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260730183524.1145030-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103410; x=1786708210; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oY7eYFjCiJOXqYHQ5zYfSF98QXHWo9ier8mxs90FH+M=;
 b=grOE10wlPDtnNq+dY4xEPU4AXAXxyJ3k7zEqPDPa/bZoloPyIguVIFZ2rShG1av2Ki
 KHJChSPflbNeuL5HtZpu0wq1qQ4X+0XPR//khbTf8A0DIo6I8Uwonu8hE0LAWHDfjWTM
 Wbkg9vUaIWUW7aJ/GgZG1+uKzdAWCGfi51Za8QO3bBRl4BasIDKKoFvw7jQQtNROMi1u
 3x201gqm2+V6gan5PGdvqCDofkwqypG9kmvXy1ttAt6+1fIhTl0WfXjmXaSGzWJK2HGa
 KmhZPs/BtRyx7AW1AznBxfm/cdPKl2p+czGI9ixzP/R0rdKiuwGevx4pPz3R8g6kQOko
 QClw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=grOE10wl
Subject: Re: [Buildroot] [PATCH 1/2] package/php: remove CFLAGS for OPcache
 extension
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

On 30/07/26 20:35, Bernd Kuhls wrote:
> Buildroot commit aedf131da66d2f2ebce64788deab07be17ce33eb bumped the
> package to 8.5.0 which made opcache a mandatory dependency but kept the
> CFLAGS added in 2015 with buildroot commit
> e05476491720f96fcbeb926b4599d111efb598a6.
>
> As it turns out we need to remove the CFLAGS to fix the build with the
> bootlin-aarch64-glibc-old defconfig as detected by the Gitlab pipelines:
>
> ext/opcache/shared_alloc_posix.o: In function `create_segments':
> shared_alloc_posix.c:(.text+0xcc): undefined reference to `shm_open'
> shared_alloc_posix.c:(.text+0x11c): undefined reference to `shm_unlink'
> shared_alloc_posix.c:(.text+0x19c): undefined reference to `shm_unlink'
> shared_alloc_posix.c:(.text+0x1b8): undefined reference to `shm_unlink'
>
> as they seem to disturb the detection of librt.
>
> It is unclear which upstream commits added since 2015 fixed the original
> problem so a backport to LTS branches is not advised.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
