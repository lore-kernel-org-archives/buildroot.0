Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75774C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3827F406E8;
	Wed,  5 Feb 2025 12:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJzMGXBsYTuZ; Wed,  5 Feb 2025 12:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E774C40E5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E774C40E5A;
	Wed,  5 Feb 2025 12:02:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11665CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF5484094D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w326MzMctIpv for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 885B440715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 885B440715
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 885B440715
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:02:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso67436325e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 04:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738756971; x=1739361771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3D8nQEE6DBu5hfyTcCDg/0htmipPeoB5gf7ekZIhgw=;
 b=vxIDF2oD4otPkt1coCLpYnzM6mD1iAuEbvP+JOmvGHCzp+PGEgabpRn4i4fCmKTXMy
 8o8dUxTrKW7TzpOJieZw1H4AtD5c09UfG7s/QIjtAhmQdd77ogoeHCjFEC5+a7LXWM//
 Lzeu83u2Qv80jgWncktKV1QNhpq3c6zyVQWQ97THrFQdjwiJWY3cXEXWZtOyiODqLiOK
 pJq/egTqMesS3NV7RXzzh/FZrFwzEahzR9ZcTNy9vLDyvl+E5WZZJy9gU2Ry1ezMGspt
 k8fGNRgdk47H35LDhBwpKR2r6Y90KsRC/iAX67tAYbwvc5UJKdE9dFOhFfIJxdd2dmXT
 bCaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAGIw2RjSfieDYx8lW0fs+ucOifrJX1sha7BcdG9xmIgpKGufNxklnky9vQmHUNzoIt5tj3qcW26o=@buildroot.org
X-Gm-Message-State: AOJu0YwYZUuHHDywZj/Agic93hqPCQ4eGzG7qLl9/QtxS7fYEFdIOUfr
 gGE/Rv/5ZCGhQXPjfsbXTltfQVuSyl4twcrwyjnIxXOh9wTrN77WqzB1Ym41MdTt1DDN4bsFbzP
 G
X-Gm-Gg: ASbGncsPWQnxUpCGorbptL3Y6H/9FBUCwLjQ1p6PWwkB2MYFpOWkyn6GJk5lLrau085
 XDd7rAiiOcDiYzi26utCYE2h8mVnTOpj9+TNyhHhEkIqDXzIxE3EQMnFdvBrqa6BEurUUOIlKUX
 DgsSDEpxuldNmyizAtnmWsTfGlLhpbkpErrbdGPa+eROSoWmAWrrTJzENWPsTl7kgh/avp3pLYk
 FjtpfgJQE+rWo8YTTs+Q8oPMTLiAFlxKisKxE1YyFbAan/n/ktRjSKIww5kpCE2kMY7OClswaKz
 vCkNtLWCZ868tn59qNK8wvN3QtHpxI0v7dsEI3ENkmElESY=
X-Google-Smtp-Source: AGHT+IHQq/IDeEkxwlVO24JjD3f1MyZXelgZ2qvBMOaXhDlhR1BEZ7v4kiDk96FJf7aJDvM//bBxgg==
X-Received: by 2002:a05:600c:512a:b0:436:5165:f1ec with SMTP id
 5b1f17b1804b1-4390d56d5b7mr21318115e9.30.1738756971354; 
 Wed, 05 Feb 2025 04:02:51 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390da89fb5sm18665535e9.34.2025.02.05.04.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 04:02:50 -0800 (PST)
Message-ID: <e332ee2d-da83-4134-b57d-4079fc086253@mind.be>
Date: Wed, 5 Feb 2025 13:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain
 <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20241107191634.378670-1-james.hilliard1@gmail.com>
 <20241107191634.378670-2-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241107191634.378670-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738756971; x=1739361771; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+3D8nQEE6DBu5hfyTcCDg/0htmipPeoB5gf7ekZIhgw=;
 b=OuwYT0UfXePLOP//n5VCkf7uK9Cxwz8O1lByx/HuL/GmHvhBOp2qpW9+Q2rJlJbPhb
 sgioio20ItkwvbKJDO225ex6U8kpA8c1gNy3FmMZC0Frc+WCs4/QRSyJVNn0bKPoghVu
 q/0A4xsQ06Ojwv4QnMP5MUChZF4v4peLKeHnGFJu3pS9o3kE+lX+x0omhOxDwUiLpPXC
 j4WEg8WSpL8JnHPwjmNpCPADL5ldudht9pY27TMYgpEYe645QC7iIjBMiVZpDpLRk5hq
 GH/bpUGLHRskkV2KXoyO5fIJWfkr+VA8zMfkmnJMkY3d4icwozX0c6GYjdMh/7tIe/Nm
 n++Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OuwYT0Uf
Subject: Re: [Buildroot] [PATCH v5 2/4] package/{python-}protobuf: bump to
 version 28.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/11/2024 20:16, James Hilliard wrote:
> Migrate protobuf build from autotools to cmake.
> 
> Migrate protobuf-python to use pypi sources which are now required
> for setup.py builds:
> https://github.com/protocolbuffers/protobuf/tree/v28.1/python#building-from-setuppy
> 
> The BR2_or1k workaround is removed, as protobuf depends on
> libabseil-cpp, which isn't available on OpenRISC.
> 
> The BR2_TOOLCHAIN_HAS_GCC_BUG_85180 workaround is removed, as this
> workaround is for Microblaze, and protobuf depends on libabseil-cpp,
> which isn't avialable on Microblaze.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Unfortunately I get some errors in dependent packages, e.g. host-ola:

checking protoc version... expr: syntax error: unexpected argument '2'
configure: error: protoc version too old libprotoc 28.1 < 2.3.0


criu:

WARNING: All log messages before absl::InitializeLog() is called are written to 
STDERR
E0000 00:00:1738756538.816027 3415172 command_line_interface.cc:1548] Built-in 
generator --c_out specifies a maximum edition PROTO3 which is not the protoc 
maximum 2023.

(repeated many times)


  There are a bunch of other reverse dependencies of protobuf that I didn't get 
around to testing.

  Could you take a look? If not we'll need to revert.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
