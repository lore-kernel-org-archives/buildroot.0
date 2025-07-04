Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49DFC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C976164E;
	Fri,  4 Jul 2025 06:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtztsH4C6E1l; Fri,  4 Jul 2025 06:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4EF61652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4EF61652;
	Fri,  4 Jul 2025 06:48:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7DF1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C0B06164C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkPX6v2KnLsb for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 500D260E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 500D260E1A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 500D260E1A
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so3158515e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611695; x=1752216495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCnBOSCRVkOstUeklazM9fGciAvEL86a4lqmYdo1eM8=;
 b=dSqJLTSilVEFaZEbsFV0mRPlw8FQ+RDtEyMWqijWXaYwD9yTf0olmyvo+CAv8QAWAw
 51uJx+1RWmE9HWWRqPQmgku0iICz9sW1er0rtCLtftHh15a98j1ZawQcRtm9mL3bhOWD
 YSx+rqQo6vNC/1e+DhP7vqBwgdRZhWpWtGsYCU7xo63mqg5p8vCyr6Y0NnFZkjoSAKMq
 go5lgJynVCAKPyZhLaQ7vg+IIAlZVElZlYqderhdRp+oBvnsQ1ubB8KVmBU0+zki5C1X
 rlR3jCcdLZjGeNmdfJ98zwL0S4E3JxGBachlsmt7/RTjQoEVrOKohnpjPWYHhLWC1hqg
 7dGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5CCM9BdRJOrZyG93v5JxLboKSl1Y4cIRi0cUB6k+wr5FCr9XkdQpavAidEQu1QeTcGhlj9XNsh9k=@buildroot.org
X-Gm-Message-State: AOJu0Yzyzuke5lKlCWDrDA+cg8sEvh0XEm3slYBLH2sPMMtMGZMy/0di
 fTtLkCE3P/O0CvYhlhumWBaj/bXs9ZHBY9JIO0ykMUQbBAhG1jN6nQQA7KwexrjbGks=
X-Gm-Gg: ASbGncsQ/B8kkhIoiQQ54CMadscLrlyP3tn6ImsWz8l4WrqnGe2cl7hzcC6ONtk5s1Z
 kEwJV4B2iYuDBhRVC7AOmNeBClP1DH/ySw+Kww4rm4kDbTiKwkFAqOZQSElrPY8btHuVfpKywvg
 0ZLDVYOj0H1qekz8BIq6/NRNai0VeTQPM+bYKf6DblN3WhJzpbGW4MOjLnZiDdogDVudKPOXiY1
 qsZF3qtXz9y2MBa3uEbB7zkhhcIrCDKIFEGIFEoSOh2PxaG1tb/+roSAxX1Yrj0TWBG1Zr/0Pze
 0AZj+nQotjRjppi8+3NfL7xoU4sPcBb3gbnRzJmi4UDD22ibrtapSOzwe+lh5bFuOwfl/osIvJr
 yRyReLU2RNA==
X-Google-Smtp-Source: AGHT+IHt4k+cfFPdjrCmPFSsQmlz5mC1H80I05WodYB/lp+PDkLI6HvgwbO7ep2yp3P7j0TNFoFjZw==
X-Received: by 2002:a05:6000:2905:b0:3a3:7ba5:960e with SMTP id
 ffacd0b85a97d-3b49704696dmr518368f8f.59.1751611695336; 
 Thu, 03 Jul 2025 23:48:15 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a2e8sm1638093f8f.75.2025.07.03.23.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:14 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:13 +0200
Message-ID: <20250704064813.4065643-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625125220.104466-1-peter@korsgaard.com>
References: <20250625125220.104466-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611695; x=1752216495; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCnBOSCRVkOstUeklazM9fGciAvEL86a4lqmYdo1eM8=;
 b=BfXWiVW1Mc9IA0H1hkO9UlZ4/8bJ3m18jg/yIn2LsAUg4aBPP1lLJ0ZitSRgxhc2v3
 0Pg5Z2TnNMy87UOwQYiazNx8EF4JEzwQkLWOFKJyrkIIv/ZwheDDdXtfbp6Ve6qONeJ4
 phhdCSxfVFHiz1Rv88AVjQ+enVPCNfGFifX30z1cmne7Nhmrj92XabDadHOYInjv7W0C
 o4c+tudjmDGbwbf6omkdCEQpmEJlI/qUTllNT14bK0cEbG2HYjc5R+o5FY02VCN53VfQ
 Rp1uqtNwqX+v26+JIerfwrJydSCivIjqwNqPz9KBwzRCrJrLaDXJ6nVbzsWKBEtb+Ts7
 N2RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BfXWiVW1
Subject: Re: [Buildroot] [PATCH] package/libcurl: unbreak threads + c-ares
 conditional
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
> Commit 0fce7a9623 ("package/libcurl: fix build w/ threads + c-ares") added a
> conditional for threads + c-ares, but ended up with a end-parenthesis too
> many - so the condition is never true.  Fix that.
> 
> Reported-by: Tibault Damman <tibault.damman@basalte.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.05.x. Thanks

> ---
>  package/libcurl/libcurl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 5a3a668f06..e390c9d1bf 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -38,7 +38,7 @@ LIBCURL_IGNORE_CVES += CVE-2024-32928
>  
>  # threaded resolver cannot be used with c-ares
>  # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
>  LIBCURL_CONF_OPTS += --enable-threaded-resolver
>  else
>  LIBCURL_CONF_OPTS += --disable-threaded-resolver
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
