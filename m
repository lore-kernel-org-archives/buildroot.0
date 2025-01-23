Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156AEC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 17:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF866FBB5;
	Thu, 23 Jan 2025 17:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9rINBwcAxrw; Thu, 23 Jan 2025 17:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA966FBBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA966FBBC;
	Thu, 23 Jan 2025 17:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A80FFB88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 744756FBBC
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulGar14aj5hB for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 17:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B1726FBB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1726FBB5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B1726FBB5
 for <buildroot@uclibc.org>; Thu, 23 Jan 2025 17:18:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so1004141f8f.0
 for <buildroot@uclibc.org>; Thu, 23 Jan 2025 09:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737652711; x=1738257511;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5AOT/ZWg78QrLQjbnmOJiSzTndighmg3sZfP7Ys+iFQ=;
 b=b09rzd/rRZ0DZflZxcCQYZE9t2cbz5KrAXhdG1Z41mIykR65qpZvcm1KSgPs+kZksL
 /7HPtlFaMv3lCQR4Fxnz0ZqIgEhLQxPNDB+qQoV/y7fW6kuVpjgU+fqaPGZh7CRNR4pj
 1rdt8CDvCv7zuCc4nHKQUmNe3m19I1b29YP1lQIJUlN1Lb+oR4g2BY8fpGUbdsK7j0/n
 Cfe/A/059iPBlgfvzjL27ivTMVEbnYUrRbbY9ZNJ5zv6eldGNS4A53K55AZlrVNthKdF
 e4Vl6oeyn8CIdPii7HC9zWosrVKxKu0SqpdYpF5OY89QrTs2QMtUrnNKM4Qlk/tvoHI8
 AD9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWicBhUjOO4IPBSD7uTjjaB0qZktBaTTe34eJe874xZVBCxfW24aw8/T4YotjW3wDS44k8W+QTnlIY=@uclibc.org
X-Gm-Message-State: AOJu0YyEsl6DGlDV0A+uaBUjOMoyzSRIilHCYZPDF8v7BH18ot/G6BLu
 GIxIKe2ufU7W2eXKK0PbVjz1euHYsT1rGmrzL8zRNFkGPnzSqfKGvTmtbtv1EEE=
X-Gm-Gg: ASbGncuGxppz885NMGIQ2nqU87oLcDfWSW7weQRO2LDUPDthw4DRYj6jeymoHDEZDS6
 KIz06d7+SRcv60DdtpljhaL+f8YFx8nKingxe4Vb7ZWpXXxxzD6onroaZ881qYB3b1aDHih+NBO
 dT07UXeqTTJvWNuP8QQ5S9SfixYsxPY2nVoxU87jqFrTmNNSG5bhG4uG6mROtDd52W8mlGoqUEa
 5KMY8S3+X6gCHraQ/J77Z35Dc9gPYwZ4aBiubJjrgeFtKGUOVD0THpITeBfZtX0Ul8SHYnMM4gh
 5taoE3k7COQvdUPhlTQCpFlzY+L1M3jJChM2BPE=
X-Google-Smtp-Source: AGHT+IESbbKvilchGeMucFndhaJ8lo34bz7l+EOGZztbfQyxa3qv51d7UT7ZM2MrqICZ/Z9eg5ywSg==
X-Received: by 2002:a05:6000:144e:b0:38a:88bc:d57d with SMTP id
 ffacd0b85a97d-38bf56562e1mr23415309f8f.2.1737652711170; 
 Thu, 23 Jan 2025 09:18:31 -0800 (PST)
Received: from [10.5.0.131] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188915sm232975f8f.41.2025.01.23.09.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 09:18:30 -0800 (PST)
Message-ID: <4b9b3ef0-afbe-4cf2-94c6-966496c4a92f@mind.be>
Date: Thu, 23 Jan 2025 18:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Grant Edwards <grant.b.edwards@gmail.com>, buildroot@uclibc.org
References: <vmtsjv$aba$1@ciao.gmane.io>
Content-Language: en-GB
In-Reply-To: <vmtsjv$aba$1@ciao.gmane.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1737652711; x=1738257511; darn=uclibc.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5AOT/ZWg78QrLQjbnmOJiSzTndighmg3sZfP7Ys+iFQ=;
 b=hApqwCPZKOpkiUbDgsiVgdKI0Cj4cdcgH0+kY1EvF3ceesMwSg5q/KP0Zly67d9rLI
 q8SHa6vwYqpE49EXqNwvC+0GlPm2eB84E7wuvOr9ydb9hqHp6dsPijMHc3jQ4G8CTX/x
 //A00oHvX3kiol4Aa9dP0IWpByduEO25mNuv7/SWxpG0lYRcdxTd/MZMEfcum98CT61X
 QbPawnbL1Sdyy3VFHscCfSUPwwO/PehISMQjqSa6wuGrS2/6F1fpU2tJe03ej0xozD8s
 4+2RwajCjJe/Adhn0LAps6nTy74N+wDOYc5KCiaDM1WCuK8OzCx+w8te4SEAAarmRfhm
 gQ9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hApqwCPZ
Subject: Re: [Buildroot] How to set target system PATH?
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



On 23/01/2025 18:00, Grant Edwards wrote:
> I've set the desired PATH in the config file:
> 
>    BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin:/apps/bin"
> 
> But that only seems to affect login shells, and not daemons started
> from /etc/init.d.
> 
> How do I set the _system_ PATH rather than just the login shell PATH.

  Good question! That depends on the init system (because that one is 
responsible to set the path). I looked in the source, and it looks like both 
systemd and busybox init hardcode it without any configuration option...

  So unless you convince the maintainers of your favourite init system to 
change, you won't be able to customize the system path.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
