Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216CACE8D56
	for <buildroot@archiver.kernel.org>; Fri, 14 Nov 2025 16:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2879607C4;
	Fri, 14 Nov 2025 16:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cwzAJDQBX-Q; Fri, 14 Nov 2025 16:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34CA607DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F34CA607DE;
	Fri, 14 Nov 2025 16:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5120E230
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 16:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A6C5840A1
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 16:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjxEJIAdAG9X for <buildroot@buildroot.org>;
 Fri, 14 Nov 2025 16:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78AF584055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78AF584055
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78AF584055
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 16:52:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so3714890a12.0
 for <buildroot@buildroot.org>; Fri, 14 Nov 2025 08:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763139160; x=1763743960;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N4rVnZODdgs7W4iWTEWIAy3JkFltdu7kfFEFskfnn/c=;
 b=pCjgk2geS7QxLB6jafOWg5hRalhmVwB6+kcM/rycXP/h9lczSnuV6RAMCNiUyEDbN5
 v77WOez2CgS40eIRDND1mPzIFXIV2CP+l6kTEMK9Ay6rESFg2Vgo1qcQ1bPxAsTxkQNO
 w1kvCEk3osgcXWXUgrLkRG85YRa9mjaICHU3lKwYYplUnhll+kiQ10fFTh41Km+aCkyC
 eQm7ol1rkSHKfu+Yhuri42vWbg6niT9Kuo2WUXMxfcQK2RH4uHHWFx9syIQ27CCapMKt
 arc1EouxQYKKpUxnlfq8JK0jlZhh0VA8htCcgL5e+OI7HGG7ZXt8BPm60iQaujHD8wof
 sUWw==
X-Gm-Message-State: AOJu0YzOhZYjTVR8kc7Gz9YAs7mimz7bWMKyqbtf/lk764Yj68FXFWz8
 XzlIGGrI1XeNWYgzT8b1kK9kLc79n58lAJvRcY6T58UxLu0epxo7PF9VvRFo
X-Gm-Gg: ASbGncuSgejFfyG5sk7i2DJv12DN79c7XhTSSR2r3Vod0JxYKOKtxsHbT9ALwhXeAZn
 uPzvyM9SP9yB79RZzI7blMp6jUTMESWTpQaHjKh0tBiMFZEXySslxNZFbzWdvBw5ubrKJFzJyhf
 4T5Omlfv6pbYyGBa7TkrutPJtOTLvSFeCG6cwVR5b12hsMck/H7dQz1rNX/C6rk+NpYk6DV7f7X
 YFRB89zYySYou4y2zClCc1WDqycF1vW2cMyh4FBRo4HiEr7s8mZ/WGu84TPVq0nlaqYJISZJA6r
 PLNgqZH0z6Cp6M2mqRKmByswnSn7PO3PO1wfxT08qSSmhNuZe5FAOm19Sn6Bb/1bt0WNrVJT7Gg
 77g6FbmVsGwF6uer70oNQ8eQ/G15RseHPukVJlgj76Gm+enuiDZOo8r0LsJreuFKZUGLZHNFD7n
 +er3NMr0adLYBmQpAZQV33vnnJJ6phqKWH33vttb8TbSsNv49NevoojrA=
X-Google-Smtp-Source: AGHT+IGGembUQjaS4G0tqD3TlGcbdvOjrGe9rhPabLfeITgW4nAqB+6KQqINXwk3vEwTj1yGS9L43Q==
X-Received: by 2002:a05:6402:2711:b0:640:ae02:d7cc with SMTP id
 4fb4d7f45d1cf-64350def135mr3442134a12.3.1763139160116; 
 Fri, 14 Nov 2025 08:52:40 -0800 (PST)
Received: from ?IPV6:2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab?
 ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f8eb0sm4246177a12.12.2025.11.14.08.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 08:52:39 -0800 (PST)
Message-ID: <53647f31-6b2a-4bb0-b2f2-2e32b1212803@gmail.com>
Date: Fri, 14 Nov 2025 17:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20251107151112.1105070-1-shirokovalexs@gmail.com>
 <87y0obq9kt.fsf@dell.be.48ers.dk>
Content-Language: en-US, ru-RU
From: Alexander <shirokovalexs@gmail.com>
In-Reply-To: <87y0obq9kt.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763139160; x=1763743960; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N4rVnZODdgs7W4iWTEWIAy3JkFltdu7kfFEFskfnn/c=;
 b=IvZpB3qfM8++lULjRGxaWqYLP7plyEzFeBfN2h7AsEzD7MuXd3tF+ExgNq0T7HizVe
 Pfmqf5y2wLCzCo2B21DaxmXQNWQBaobaWpB+u1blW0myJn7yXd2p0EwxirnHAbcn4ko/
 T+8xKQmjdC0ro3JDVaHiy9DASFFjMaQA8t9/mwxD6mAG6x5CWjI36NAEHuv/f+7Jw9Ba
 mro7ISg9E75fa+k2apYVaNiDjjLiYNWZjVaK24AWIV/gtgyvGJQcD8U5s9SsKVmdjtvg
 bGFGlfdpn+JjU54/hT/bQpa//XeNoLPFKWbjgYTSR76mmPIq12PYyp9/ln2hGkmWtb3D
 6KEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IvZpB3qf
Subject: Re: [Buildroot] [v1, 1/1] package/broot:new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks a lot Peter, All

On 11/12/25 9:28 PM, Peter Korsgaard wrote:
>>>>>> "Alexander" == Alexander Shirokov <shirokovalexs@gmail.com> writes:
>   > This commit adds `broot` a fast and powerful file manager written
>   > in Rust and licensed under MIT license. It supports filters, regular
>   > expressions, and real-time "show-as-you-type" search for quick and easy
>   > navigation, even in complex directory structures.
>
>   > Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
>   > ---
>   >  DEVELOPERS               |  1 +
>   >  package/Config.in        |  1 +
>   >  package/broot/Config.in  | 11 +++++++++++
>   >  package/broot/broot.hash |  3 +++
>   >  package/broot/broot.mk   | 12 ++++++++++++
>   >  5 files changed, 28 insertions(+)
>   >  create mode 100644 package/broot/Config.in
>   >  create mode 100644 package/broot/broot.hash
>   >  create mode 100644 package/broot/broot.mk
>
>   > diff --git a/DEVELOPERS b/DEVELOPERS
>   > index b14c6e3875..dbd3b1517c 100644
>   > --- a/DEVELOPERS
>   > +++ b/DEVELOPERS
>   > @@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
>   >  F:	package/cpp-httplib/
>   
>   >  N:	Alexander Shirokov <shirokovalexs@gmail.com>
>   > +F:	package/broot/
>   >  F:	package/nnn/
>   
>   >  N:	Alessandro Partesotti <a.partesotti@gmail.com>
>   > diff --git a/package/Config.in b/package/Config.in
>   > index 930f368058..1152748d8e 100644
>   > --- a/package/Config.in
>   > +++ b/package/Config.in
>   > @@ -2950,6 +2950,7 @@ endmenu
>   
>   >  menu "Text editors and viewers"
>   >  	source "package/bat/Config.in"
>   > +	source "package/broot/Config.in"
>   >  	source "package/bvi/Config.in"
>   >  	source "package/ed/Config.in"
>   >  	source "package/joe/Config.in"
>   > diff --git a/package/broot/Config.in b/package/broot/Config.in
>   > new file mode 100644
>   > index 0000000000..bffdf7aaad
>   > --- /dev/null
>   > +++ b/package/broot/Config.in
>   > @@ -0,0 +1,11 @@
>   > +config BR2_PACKAGE_BROOT
>   > +	bool "broot"
>   > +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>   > +	depends on BR2_PACKAGE_HOST_RUSTC
>
> It makes more sense to select rustc instead of depending on it, similar
> to E.G. kmon.
>
> Committed with that fixed, thanks.
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
