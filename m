Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438EC5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA81B80F0F;
	Sat, 22 Aug 2026 12:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUImYf05uR5H; Sat, 22 Aug 2026 12:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787401916;
	bh=EXci6ENTsffj49vjLX8aPU2wJiZnmuKIwruKwDdp6JM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GsVaYWwWoxHJ9TFCfm6mml6ddcFfenPK1jXQM17zH8YekSlNGXry6jgjqnpgzjbcz
	 zVpZjHC1nrq6I1+D4v3WmMtw3wciteuJs9Ud1jUKUc/v0BCH9tud5/m4mDW90eqZ2K
	 9cWN48vkgJna6nErdvb8++EmRBFDREcf6SNQr8hBuvW6qaWEOdJKoldLXF7dKYH8DM
	 +fGxJPXBhElgaMMTcaxZ1zqDwK8IBo5FT3EXHcA1LUoaWRjlZ03I+XrlEDvea0T2DK
	 XLTOiFJcs4P/nj5louUQqmoto4mtpl12XNyPIGBX+obg/ap4Dsbct6a2fctUBz0Y3C
	 afXiEvV4XLm7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B94380EE7;
	Sat, 22 Aug 2026 12:31:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C40B9118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AABE660608
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJje5FtJy744 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A0D605FA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:31:52 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c15f020a223so284925166b.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787401911; x=1788006711;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lNcGkSb0cLB1JYqVAzpUJf+/H6pLhgtsAeqTvjy3boc=;
 b=HgPpjM7zNmk75OXkNrnBQpajaewhx2Y4SFfegFqDbMc1H9BkEMZ0joo5qOR1BFN0Ll
 yZmHqBhdV17cobJxRbF6Im96yjeQrzlfW4nXgFwF8FhCB/tNnchVRFrGAQuihxwbFt0N
 m8VSBeEx7P8zqfAwOfj85VsRU9/suNp0tY0UKFeQG/VE9W4+piQjbaw9xL6vdrwxqt/P
 HXOhR1h7w335tOTnS/igf/rlGKoAW3NwIBNWgmUTzVrp05yEkqy6ggH/9suqq81a7rsO
 WfvdQ7s+dOkHSjYCDT2959iUoZNhUbVMp+qEaEO/kX96ka49+s+HZiihZhgkzJfzMFko
 cSlg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrRajAoGy5GuO3qdRlf3mXJnx0qmHZT0diZPdoflvwFGEfmtRIkrfAdWLUJ3ju9Ng8Yd/sNAdpzDPw=@buildroot.org
X-Gm-Message-State: AFuF++mwRBiORzJ9kkXKCqAetaGAUceihiGQqacrN4Uxa0/UfTxzBEan
 tFBBln+uypsMwhXfEOAwmIrHvMSGivVrcnmBliNdgayi2TgoJDEEVZjkLL9u2QKu4oc=
X-Gm-Gg: AR+sD11DtAmc+XDxtRjZF6aM8/+uIuFkxOZejeYpqHUZHgg3k4r/rZlPTaQiHWR6Tul
 wPUWi1FnlHmgPbUQcldhBrlfFsahqKvFO+oUcTE4YnyjR/ISInIinIKZx4Rf4QFzrOnSBv6Vqhm
 zBn1n8bWDlUiVRTcIeHDUGIdgLhwim+gEgjCI6S1PG9zOe02eQpVt7uOpvvaS1xaH1x1US9XYQy
 nW02p/tO55noVliRI+O/KHxcBq3GBCe6mPLNJ9cvAeK9vLzEbI/opIavDLZ1upwSQDJuzOtJrg/
 RIFJMjJKZ/XN+3GNbPDkiTX3rbJMxypYFPFDc+iFyFAtghzj69nmGh8ocrfLuhUMXWFFUmCK66w
 DSk+3b6Y+CGu2VF7HwpLw1xrH9Ml+J1xrfTEO2KcR2BKMb3lWh/poJcjflUTz/X+VI0oN/Hkm+P
 wT0+OivnW5TTN4Sd9VBe/LevjHzwZ0jWfJUSVERUFqQiIayqbnyan8CFqVXmBxpHChjusya+G9z
 IeO0YTZhjaHxOzcTcoTBv7IMNdNJlkVmBzrGNSQD+9myGHz
X-Received: by 2002:a17:907:934d:b0:c20:9447:bd5e with SMTP id
 a640c23a62f3a-c246a5f6d65mr1476122566b.9.1787401910971; 
 Sat, 22 Aug 2026 05:31:50 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a8fasm356907566b.8.2026.08.22.05.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:31:50 -0700 (PDT)
Message-ID: <bf60f5fd-0f74-40b2-af6d-361f26e97dcb@mind.be>
Date: Sat, 22 Aug 2026 14:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Franciszek Stachura <fbstachura@gmail.com>, buildroot@buildroot.org
References: <20260814190051.2970501-2-fbstachura@gmail.com>
Content-Language: en-US
In-Reply-To: <20260814190051.2970501-2-fbstachura@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/memcached: security bump version to
 1.6.45
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

On 14/08/26 21:00, Franciszek Stachura wrote:
> https://github.com/memcached/memcached/wiki/ReleaseNotes1644
>> Hot on the heels of the last security release is...
>> another security release
> https://github.com/memcached/memcached/wiki/ReleaseNotes1645
>> So this is a lot of crash and security bugs.
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
> ---
> I'm wondering, are packages in Buildroot master supposed to be
> bleeding-edge? The maintainer also left this in the release notes:
>
>> If you decide to deploy this please be cautious; use a canary server
>> and let it bake, just in case.
> That said, 1.6.45 was released a month ago and I don't see any critical
> bugs reported in Github issues. (there are two AI-generated reports, one
> is not considered a security issue, the POC of the other does not work).

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
