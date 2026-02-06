Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E55EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8E5611E3;
	Fri,  6 Feb 2026 08:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnTc5yI5bsKW; Fri,  6 Feb 2026 08:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B3F861173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365516;
	bh=fG+hGG/yD8xekT8O4wwPLiZzo5NrWsqNSC65c2fmZz8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PxyX3GAjrczFJixxiOGao89vOvwGiGh6ODI6R4VqW+Ndcw62AeYBhYWvQSfH88dQF
	 ZRCNGNDTUOuiVyJVFE820xkFXRr/mRncchITgXL9TrxGnoGzhPA2fcMB5T/GGVqsl2
	 C59lr28JzOIF2H3XW5IGz9n6IFOjNntB3n90opA4eDXtsyiJR18m0g85sby+8TEUqY
	 ZKvCxviyWGiEfsBs2GS9B+2WjmeVRgag2NwDXtO7vKOW8toa5qSxQbXDeKOvX8uBUu
	 FpMZ33J1c4jQ5MPm31G7Q8KwsjE0jpgRHxYyzk0JyUDu89i9hhAfdACLz2y9DCtsTA
	 wmx6MstK3C1Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B3F861173;
	Fri,  6 Feb 2026 08:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE9C173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F0B36117B
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CqhP9Ze8SMC for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36E8861175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E8861175
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36E8861175
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso15387305e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365510; x=1770970310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2s5Br2E2BsKfjdRtLbMv14++0jBcPfKpawa5Uxj7fkY=;
 b=iSxD4Nc+8a7sbDicAENk4/ftjklywV1tnxbzcAh7N3HopIfqwyWMzA/qpH+yQsP6Dc
 FtA+JdZI3g+954oFWzfOYGTM8GDPaDLbuYuQ1gO91o9yxS+CkzX2TgE93ay0e+Yo1dAa
 troc3k5gZwm8YEhq/oxxitPD4jYu0pKw/ywPGQ1AtP3imiDQPCxU8DaYKP+RWcecjHGi
 KZYSePgON97RtMyrDmaR1U41bA8KlWGfA+FFsL1oifxkrVBawcWFo3588k0Hu196y49s
 5cY9bP9F/zq7io9qpCZlhK699zCfPy29JeFAinZqTTe6Xdrkb/JVemqR5m1OF40vSMyM
 yk4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLeCGxLCN40gVNh1LKkJL8h+I8Ki47GjVJ7k+kvZYnGFhgXvQoiaWWdH+pceiE1TXMu+yi+IzramE=@buildroot.org
X-Gm-Message-State: AOJu0YxERd1kAE30/Gf66ipVn/xcuxkkD857ZxOElkbcFKsSccy1k3Vw
 syQaVKTvlQ+BzG/LWI9qwMuR0FGiFPln5khTSDvwS/A1WwzywMHuqRx7Ad5B+NMaUf8=
X-Gm-Gg: AZuq6aI3pw9LQPoOYEqxBP/nKhMqm9qbRvQ7q6QjKSSeTDZh7ym3Ri58/HxWXLI0H6p
 tZvA1ej5y5GxvNl7cnjnNQMs1rRSB4UmebWho2rfGv0z2+uOViioRc7C6q0kkO6Gwa0K56ypyvc
 KLYksdO0Xr3NH44ZOqLFNJaTgRVVkvVtbkz3hOj/LbvbOf5JEth9PUf5Ql5Upi8v68ImDJH5kFl
 b34CpRmqakD5ti2za0IBYgjpuGpku3x5uun16VnJM2hlNFl1EGm6w9uRbG7O/EIYpb4qtayoffy
 jjufFij6QCTGUWw/7bmt1R+mA0RJwcXfKscRa7KviMcrEN047bGC4IWZIjnv7vwxkmhVuFfL1k4
 dCrG5CzcH4BsbM9PFlgeuYKIweZA3RgF6vEum52XajgrdlAFrytBsEyP45vfglT03FIsfhbk/Vr
 yBLWs=
X-Received: by 2002:a05:6000:2c13:b0:435:a0f5:c271 with SMTP id
 ffacd0b85a97d-4362967ded6mr2524180f8f.31.1770365510045; 
 Fri, 06 Feb 2026 00:11:50 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2d43sm3977677f8f.8.2026.02.06.00.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:49 -0800 (PST)
To: Danomi Manchego <danomimanchego123@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:49 +0100
Message-ID: <20260206081149.32086-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117180751.465-1-danomimanchego123@gmail.com>
References: <20260117180751.465-1-danomimanchego123@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365510; x=1770970310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2s5Br2E2BsKfjdRtLbMv14++0jBcPfKpawa5Uxj7fkY=;
 b=DMe2Bomdb4m7U4ddN+rOUGr9zf33fy9QttrhxVQg1x3obRXstKCtkXrM+VgYw/MPTv
 5s1AGjZR2aWeprVO8w9W38gJREzfJs5A1AWHKPePMpBK8O4nRbWJJgLmIokG0mDCYLNr
 cyyxUTZGEfC5ArCTH79x4hqVOKqIQ8WarDaZgurqThE0q5s6vYSmcbkMm2hr5Whujzex
 MTAbzUlmq8UuUB1Kil2li6Ll+IeeR/Buxz+EgwRZ9HMnx+Q6jYsgD9JjaynAFcbsPYj6
 dy+01EGwSFeo+vP+LcsfIRBNwdfW2x7fi7VkjTW5xrZNXjLBwaBslI2MTTZA62dLQPeJ
 JOKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DMe2Bomd
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop unsupported
 system ffi option
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
> The --with-system-ffi was removed back in Python-3.12.0.  From the
> release notes:
> 
>   - gh-100540: Removed the ``--with-system-ffi`` ``configure`` option;
>     ``libffi`` must now always be supplied by the system on all non-Windows
>     platforms.  The option has had no effect on non-Darwin platforms for
>     several releases, and in 3.11 only had the non-obvious effect of invoking
>     ``pkg-config`` to find ``libffi`` and never setting
>     ``-DUSING_APPLE_OS_LIBFFI``.  Now on Darwin platforms ``configure`` will
>     first check for the OS ``libffi`` and then fall back to the same
>     processing as other platforms if it is not found.
> 
> The commit drops the now defunct option.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/python3/python3.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 0189a505b4..a92e969f39 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -206,7 +206,6 @@ PYTHON3_CONF_OPTS += \
>  	--without-ensurepip \
>  	--without-cxx-main \
>  	--with-build-python=$(HOST_DIR)/bin/python3 \
> -	--with-system-ffi \
>  	--disable-pydoc \
>  	--disable-test-modules \
>  	--disable-tk \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
