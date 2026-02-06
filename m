Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D89EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9296118C;
	Fri,  6 Feb 2026 08:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZuDyWMa-aTh; Fri,  6 Feb 2026 08:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D0FB612AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365552;
	bh=o+DWuaroyMyMJZNKOYqkrtCqssfyWxhVbpitcK4RQdM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MSURGkhJA/F2122LfJOn4MZMix2kxr2R1FJv1acmmt0tiU7GX6vG6Ah4aXEjlHxLi
	 7kAJUjkQndvL1kU+G+VFKljjOkhNOcg+iUA18lWIXcK3mKADZVTJoHA/NuMkyrnsvz
	 joX8tBWpdzHzSpqHM03KxhLmdrkMP4FfFu/j89plTwFtk3/cLVCRNyPmqrDUyC6xuM
	 OwQ8Q9Dxy5fIdSAW5UDd2MwF1w8K0buCWttudXflsukGVcaJs4vbfSbik5bqr9Xrqh
	 6YSzNxdmDsMyv+BZiTZqOQJiuZoZbh83i6zknRtbziAxzgGRczGo1nmEYKEbnD7u7x
	 e1FZcYkeErdfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0FB612AE;
	Fri,  6 Feb 2026 08:12:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D23173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C510C61249
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMnSgVKjNjCC for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67ABE61242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67ABE61242
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67ABE61242
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4362d18bb65so101173f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365529; x=1770970329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UnWsLL/cY1vhV3jW/f8P6N1+NnBkP4VQka8nw9Qs8wY=;
 b=ZwEFFjm9HKvm9WX869sMby56LpMdk4L5dK2iNedgO8CLVzDLaViLQ23lj7aelw1g7O
 76oqq55co7/vrKAR5FgnnhNOxNBDhUSj/AcfLCo3DK0ur+9UpPvfFgSw411T8M8/y0ej
 UIKBJZbn3gMAfQ2/c+/k2IwL18vt6pC42JhAJ202HceuN8gDpYBg8NbT74IOCbr7duE2
 /WaTWcJsVG/A/aED9hy7hn80C7ou6bscdTLgpJ+k3Sd04KvmWJ7HQMJU3owlkhXjxIxW
 /TlMvef6Tl5PnxQmV2xnmGdSub5VPo696Mm5MTpaH57RAKB6ezkmtlvnlDzeDPTaXvEH
 WpBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCCwywL9Dc01An0yHBzPW8TqyUUQk5QEGXhViuOs6jc4ESSuF1HYCD2NzgFkZIIAZTWOFypIcUU5I=@buildroot.org
X-Gm-Message-State: AOJu0YyplNS/usbKwAlksjxYsjMawEBTCDgWzgyDLz4RXhkfcGMczGBQ
 QmZdYI05vM1TkhHoxY01HKbVUPqrhhkQAaLe5t77rDtGBLSiZxPAc18S/tROjAfboc8=
X-Gm-Gg: AZuq6aKy+7z/WVAcg5KHMM9jHalRAWY0fWK7gkrE3F1uZF8Qd/xBPj5o9hLBg4GmGyN
 aP3lNbx98UJN8FxT5eqAHXNQGohI3unFZMgnULLwdz30cqymv0nf43a40kzNX2X4chuTtS6A5Kn
 3g7ou4+uJlQdYzZ3jJEpkxbHU4vubhQkWUcN4NSvWMY83Dv37WHBkSKfOo3HK0f7NUUlpLo3Oba
 E56lTHEcGO6/jBE2eWAoS9bB/rKIwotn2vnG3L24mdxRhjfLP8WD88fOU6+NhtF5MsF9iYzpEhl
 H5lW29NcfACYm5ttGv9jNjCzPUPEwDzQ0aBGU4i1CnaqRl0gpD7pT8Q5/pD7kNuxXVJFr2TgOLt
 8bXSj7wIKZ+F6ctSTQv/IyuAulBxme2zO526DUst/IJumcCcjRAXU+r/F4mAbivNsH8fKeHF2rn
 am1QY=
X-Received: by 2002:a05:6000:2c02:b0:435:e520:d1d7 with SMTP id
 ffacd0b85a97d-43629386511mr2878999f8f.63.1770365529247; 
 Fri, 06 Feb 2026 00:12:09 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629730992sm3680791f8f.21.2026.02.06.00.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:08 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:08 +0100
Message-ID: <20260206081208.33249-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127163528.283380-1-peter@korsgaard.com>
References: <20260127163528.283380-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365529; x=1770970329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnWsLL/cY1vhV3jW/f8P6N1+NnBkP4VQka8nw9Qs8wY=;
 b=GyUsVUYWP+NM94m/As0SRHDElFfvJ+00H1DzrwAE4YKehhPqt8gFkkd85bcorN9N/3
 Ps6J5++vCrh5JGGHLMWPh0gI1tHKSY7y0Md/wosxoedIskYiqGQl6EPpca7nsmywR/jh
 b6nw4P+FuipyAIQnaZq7K+WeICgiTddcwCS5i5x3P+HT2D2MII79S5CLuAq4RDae5vFw
 vLa/9AFkqnxKj+CZygTfMBcjOnEl9xccK8EINmJzVFM2LelPKfrjOgpotHe/JVhEWhqs
 TFw7LgHICR1VIGe8EWqyneXIo/y4u1/RDM+KS1FgaMkl0TOvf2w22tJk7OYIzI9Ah0Ow
 tEkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GyUsVUYW
Subject: Re: [Buildroot] [PATCH 1/2] system/Config.in: do not reference md5
 for sha256 option
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

In reply of:
> Commit bf3626002f ("system cfg: remove mkpasswd MD5 format option") dropped
> the MD5 option, so stop referring to it from the sha256 one to limit
> confusion.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  system/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 0652b94a3b..98bbd93092 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -67,7 +67,7 @@ choice
>  config BR2_TARGET_GENERIC_PASSWD_SHA256
>  	bool "sha-256"
>  	help
> -	  Use SHA256 to encode passwords which is stronger than MD5.
> +	  Use SHA256 to encode passwords.
>  
>  config BR2_TARGET_GENERIC_PASSWD_SHA512
>  	bool "sha-512"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
