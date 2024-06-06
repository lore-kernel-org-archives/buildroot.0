Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB15FC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9571184300;
	Thu,  6 Jun 2024 09:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUPHRJVaCYqB; Thu,  6 Jun 2024 09:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7A9843F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7A9843F5;
	Thu,  6 Jun 2024 09:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBE31BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C42240474
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKz4IwXo5yZG for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=stephan.lukits@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3868401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3868401F1
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3868401F1
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:28:10 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b938587a4so832168e87.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717666088; x=1718270888;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mKo7dpt7FmbH2A7oP354jA7tGuA3ZGEEKH9fZYRG1sQ=;
 b=m4YyWN0XY///oHwhbHutY1Lm12G2m0rqfpVQZ46Kr2LEJf58CqHOMts+kwy/btcjGm
 CjeFJyEJoHafKIIoCZNQeU/yNvpjXRgzrhcQL1+nMrBmWIoxO3LFfr29qqFgSXWkOs03
 2sAi3JfVxWfI8LxrBxR4ry0F/YfjBnAZyK8Fr7mNjnd10oKRx5aPGHtKHkH9ZcTCW1e7
 FVxY4i6XyVR1MMNVyVY24xYhtUnhnMMDLL5cXgOxi9QuNLfkYz8CBj45RXpSRnIlUzqK
 Yx84DRSqmmdtPHwyYEP3b6ZNcbe3qpPbsLRh98rOrtm7cN+4jOJoqDOJBhcKRjlxW1AF
 rHCQ==
X-Gm-Message-State: AOJu0YyHwfwsfftnkjyHzC+WAkFmiRgqyN5f6EKegJ3OKNRdnXJF/+ZP
 otwluACYiEKF8/40WP317YKCkmRwYLvQJBJGcGfCBTtgLP2FlrlOOwEXFg==
X-Google-Smtp-Source: AGHT+IHkLDmMLJFm4mdTL1G/CguP15i4RtqwDE51e4NC/gbrJ5Zu8h4qhElGawFAaWnmH3QGSB8Xyw==
X-Received: by 2002:a05:6512:6d3:b0:52b:aa6a:32ac with SMTP id
 2adb3069b0e04-52bab4c8189mr3222731e87.5.1717666088205; 
 Thu, 06 Jun 2024 02:28:08 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2de8:6f00:d9ca:cd2c:1414:c520?
 ([2001:9e8:2de8:6f00:d9ca:cd2c:1414:c520])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a59a3sm15228985e9.22.2024.06.06.02.28.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 02:28:07 -0700 (PDT)
Message-ID: <56f8f9c3-8a68-45de-8388-70038144d64d@gmail.com>
Date: Thu, 6 Jun 2024 11:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Stephan Lukits <stephan.lukits@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717666088; x=1718270888; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKo7dpt7FmbH2A7oP354jA7tGuA3ZGEEKH9fZYRG1sQ=;
 b=lYTuPUE0HGs5yUVhgfezFXfzPXeWK12dxJOqByV1sKaCeYuQD++hzPX/YKxR4HJ5V9
 qM2pE542ErqPCUKIHJZD1j4kTQtWcl/ZoB9BbaAFkuWtE81Df4L5QwPfIhPMmyMxEIjW
 WIvk2g/FEmBMEAZEp2bN0eQwm2RjVGY1WmFGWsj0EaZzf/UcxHNPHEH+b/DgXo8hb8q6
 WnfgljHmqO2gpy6Cog6zlf04JXubyDs+6VZZ5mprrJi9T8vInDiP9dckrz+j09XLrvey
 QAb7eKQjIpUrImUKrkxXa0TWmeSfV++7faLwotD/dMU7L+wtBsH533ZxQfut0vChAqni
 QG1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lYTuPUE0
Subject: [Buildroot] make fails for raspberrypi3_qt5we_defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R29vZCBhZnRlcm5vb24sIGFmdGVyIGJlaW5nIGFibGUgdG8gZml4IHRoZSBmaXJzdCB0aHJlZSBi
dWlsZCBmYWlscyBhcyAKcmVwb3J0ZWQgaW4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRy
b290L2Q5NDg5NmEzLTk4OWEtNDI5Zi05YzNkLWY4Yjc0NGFhOTFiOEBnbWFpbC5jb20vVC8jCkkn
bSBzdHVjayB3aXRoIHRoZSBmb3J0aDoKCjIwMjQtMDYtMDZUMDk6MTY6NTAgCi4uLy4uLzNyZHBh
cnR5L2Nocm9taXVtL2dwdS9jb21tYW5kX2J1ZmZlci9zZXJ2aWNlL3Byb2dyYW1fbWFuYWdlci5j
Yzo2MjM6MjU6IAplcnJvcjog4oCYdXNpbmcgU3RyaW5nUGllY2UgPSBjbGFzcyBhYnNsOjpzdHJp
bmdfdmlld+KAmSB7YWthIOKAmGNsYXNzIAphYnNsOjpzdHJpbmdfdmlld+KAmX0gaGFzIG5vIG1l
bWJlciBuYW1lZCDigJhhc19zdHJpbmfigJkKMjAyNC0wNi0wNlQwOToxNjo1MCA2MjMgfCAgIHJl
dHVybiBvdXRwdXQgKyBpbnB1dC5hc19zdHJpbmcoKTsKMjAyNC0wNi0wNlQwOToxNjo1MCB8ICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgoKQW55IGhlbHAgd291bGQgYmUgdmVyeSBt
dWNoIGFwcHJlY2lhdGVkLCBTdGVwaGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
