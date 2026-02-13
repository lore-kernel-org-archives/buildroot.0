Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10194EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A5341A64;
	Fri, 13 Feb 2026 19:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpULie5ZhQko; Fri, 13 Feb 2026 19:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0789D40D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011693;
	bh=WQySIHIQYHsRKLc3QIl1s6u0wEPBVPElZzE6VXWgiFk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X2hK3GFgL16BgH7d+YdzZCj5RTmEopTTa8UuNoSJKrgK1NZSy/Oo1x8whktUERfHr
	 aCyeClpGYoszndTi4/YNqWJ6E7mUge6PYcQVqah+xzoRERNamxN/p7UO2TTEM7GuIP
	 NWf69nuLuwgivrWOmf9ADpFIVnsqcRtNxpUaN8fwjGmesBRaFZb3SC+q+KUhJxiwH+
	 ufEFn8BNCuab9dlMG5tBqU8zCnAS0PsXySt12P0PSPOSBpwmilzrRkZgKU0K4Bbgh4
	 Uelqy846QTb2YEcD2G4EosXdi7Nx4KeU3kLPdGdQ9Ah8mURp/YElgrBlKqHtQjc/1f
	 VDDEcYhd/oucg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0789D40D92;
	Fri, 13 Feb 2026 19:41:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6DFEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26CED61414
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIofybquFyMq for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 000FC61427
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 000FC61427
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 000FC61427
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso11780625e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011680; x=1771616480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mUbxcVK29gniH2s+B8V6HLfs13fnkWmeSAAi6XIZyUs=;
 b=EPP/D1BAxxvl+1TZcqtY+xQ9/pCw2UmnBn5DZMPYX5vmp8vXrEpJNFo+k7pnH71Wc5
 m49HJ8VoCIF7oT1m+3Hal7LbqdGK0ZeL+EjoOTdmONQ5ouRRZ6YArkFnZKhmi0O7LaXG
 Wr6NafiP/hBVLbVHeuS+xkWTNAXE448Sdt0Q23sc3q2wLfMA8iowMFxLo+ufLpPnsj6L
 dH2xt7HG/0V7t8/9KgDNOz6HKTuK6QGTeQxbZAMSF/hdUGXn94rjNY0EHldAoD1AhQ5+
 pEKKup7YXu9nvQVPZfVLygbFhE/CxcE/v5f/b9WatHP0Ey2CEexyWXT3MZhxO0mm4ax1
 LZLg==
X-Gm-Message-State: AOJu0YyCf2y85nZAE+ouwDGUIs/aylMx7e+ghJVe9U9Np6kwV1HHcq+a
 XIdLJqn2stQCJEyNkAE8r3YO2hxzjA070f0T1TAEy4Kumx5AS1jwH+ZkWjo13IslcGU=
X-Gm-Gg: AZuq6aJEkoIHVxMJTphw+x4ydtOopxzWJxsPuTN8CpW2EvFSr27Z4kEIJhbOCs7hAFr
 dO3aUOo+u1YE4ON8faAPD3Um7TgG7HE59wyguxrYrS7NmuGdH6u7XeWA4LsJ6uKYw89/jExFC5e
 S3DCG2xSrV5Jx5kjgADYiAA5bAB0IPH1RpDy/4mKkS3oSp9e+1/1Kpyon3OTvLcQrL8wx3g8shB
 +RFH7FhpQ+iANX/GckMmTaqazq2/MGNDtwcUNxs0O+cxoiXZ6YnBp7nOQmzadqiWWotHDO7TTAO
 ZTnd4d/+F8GgiGYlhhUgqE4DVn/Dqq+iZCwZKlOBFiRgisAIwaF/08aYw+e9hhQoBrlrjeumIuh
 rxLGvV6w5chFKjJ8+kPxwrQdZE2R/TxBJV2XBi387uiUqSv3PhsBoRo8H6if0Tnk5JLkqV5/sEV
 oGceR/UEaOrr5sGUk=
X-Received: by 2002:a05:600c:528f:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-48373a08490mr56723415e9.3.1771011679858; 
 Fri, 13 Feb 2026 11:41:19 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483719b8e71sm76771715e9.2.2026.02.13.11.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:19 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:19 +0100
Message-ID: <20260213194119.49220-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205190410.523140-1-thomas.perale@mind.be>
References: <20260205190410.523140-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011680; x=1771616480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUbxcVK29gniH2s+B8V6HLfs13fnkWmeSAAi6XIZyUs=;
 b=iFgD6sGyc8Q1sugTsnlhlM6CfdscXsrQVh67uXoq3uhxlu8QR/c7SD9clmT2Wt+XS7
 HRP8vGYHiIt8XGLLP4Fu3ICv7o+CGSgNgw18lhAccS4JE4kYavETgmth8GbVrkvy9N1q
 FdKiLGDUwRhIp3Pd5sKZy94miJL/tlxzvrQa8ZTGB8rdRqIuaOZ5zmOM5QvdfALXY/Zg
 EURHlVDGQ+HDmKr+IKml9/RPY9PlKqilSZrlu1vVkenE7l6K2j2iQ+5gHHfP31H7suIE
 91WqMAHNINokp7mY+Z5oJBgH3GnhwX21ZksFIFmyaSIn7h0vnXEDPJ3H52mMZ7Xz3yp1
 aP3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iFgD6sGy
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

In reply of:
> Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
> security patches neeed to reference the vulnerability with the `CVE: `
> trailer in the patch header.
> 
> [1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
> [2] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/strongswan/0001-eap_mschapv2_failure_request_len.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> index 8442cc7816..7442c123c4 100644
> --- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> +++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> @@ -21,7 +21,7 @@ Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
>  overflow and causes the daemon to get aborted immediately instead.
>  
>  Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
> -Fixes: CVE-2025-62291
> +CVE: CVE-2025-62291
>  Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
>  Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>  ---
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
