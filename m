Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B55C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B73D611AD
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B73D611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19040400A4;
	Sat, 13 Nov 2021 17:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aakDzMOJTMlm; Sat, 13 Nov 2021 17:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E93E40150;
	Sat, 13 Nov 2021 17:48:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 132DE1BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F08BB40180
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xiBw-wSeGXn for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:48:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 059B240165
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:48:56 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id k2so17829491lji.4
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=3RJTfwRiaI0W3wRVpHjGCWHbSgxjCLUtj9NyIJdzGpg=;
 b=SlK2tReHXmEFsWrDV6XXZMOdMTXoWjE0pr4fgNwLnAUDtSsPdoJv0R+z5ys78hf/yk
 JCEIgy1hzqZSMTlePCavD61XkhAMjuqkNrPeQ6E8droz7VBO+Y3v356AjYYmAejOZqn3
 bHEPKr2+QgI0bXcqKBR1beHI40aB9VCy/m0ulyQculwJokvxkF0VgqGrezaXVemqiu/r
 6a05gx6Lu2a2hallSfeTiIedtDR12Nb55NSTLWOQmUZhbdo/lUPoBeAlG05NpK1gTTro
 j+rJZ0hSIdFyp2DNXQr4Vn5Y3BUt2W5Q40lr+Fjo82X76YzMcY6A0rkgSqXoqeqHtkCN
 fqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=3RJTfwRiaI0W3wRVpHjGCWHbSgxjCLUtj9NyIJdzGpg=;
 b=wGhCa10vIRfvjVsn2aNPkJrsWUvLCeYXcoBHd1GOYnGSljIvnwPA91xGvVK7OPbaDG
 zmNTzBZEYxM6PMqK66EIIkMauqxMNqzZaCCfUdYqPzM01WNm60sUc7x+8RFi5oCisJvt
 hMZTUOBXn7Hi06i3Lyf7930Ot9OLXXlK3nPkUO0kuQVuayYSMmWUNxbRjlWoYMXiQvdP
 UHWm8UWOlzsrjGA0D7lohdJkgwHoxT3X9j5FLYMjBtJTfO4YydUkOn2ptfGEdj7D9Y/E
 MlUYWBZZuSY7kcm5Z0MXVWngQokYfJHuqyrGShMLAlsQ6uH6ppNgSLMp8I3RUghUgRGp
 Yngw==
X-Gm-Message-State: AOAM533eF00T5EOgdQuPc+xRVZze1AdGQhShMr4pMCvvFrZWDu5uVr57
 ihnTupf9YOe+GRVi62+1RxucqzlXzZo=
X-Google-Smtp-Source: ABdhPJxdxOi1PTiNmDCA+K/YZ+AIOZdHofMQm5OLjBUgNXY20Uko658OEKFj7UkQ2hUpBVq7iJ9qvA==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr25467649lji.218.1636825734714; 
 Sat, 13 Nov 2021 09:48:54 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.87])
 by smtp.gmail.com with ESMTPSA id r132sm247784lff.206.2021.11.13.09.48.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 09:48:54 -0800 (PST)
To: buildroot@buildroot.org
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <492e9395-791c-b4bf-9caa-30513a7e9550@gmail.com>
Date: Sat, 13 Nov 2021 20:48:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5CFD4C98C7CABE32E4A0FDE4"
Content-Language: ru-RU
Subject: [Buildroot] Enable external RTC on orange pi zero
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------5CFD4C98C7CABE32E4A0FDE4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Enable external RTC on orange pi zero.

--------------5CFD4C98C7CABE32E4A0FDE4
Content-Type: application/gzip;
 name="Enable external RTC on orange pi zero.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Enable external RTC on orange pi zero.tar.gz"

H4sIACr6j2EAA+1a63OiSBDfr/JXzGWrtu6WoDPDy5jLViwlxqr4ODXu7icKlSTUKniAueSu
7n+/HtD4CK5CVpKto4NiepruGX4zPY/uqeEP7wrvDkoYY1WWEdyJKuP5nbD7EyEiEUlUVRGr
IsJExFR+h+TDViukmecbLlTFM91b83G73K7yeTue7j8JTQP8BwftATHwlyRFYvhTWczwT4MW
+A8cwx0dqBfEwJ+KCgb8JVHM8E+F1vF3XMO+NafWj+0I8fCXAX+FSFKGfxq0Bf/FD+Fv03Ve
2hvizP+EUIQpVkmGfyq0F/5jy549COaD7xpefujYN9ZtHBvwPhRJ2oo/kUXyNP5lEMBUktn8
jw/V6FX6n+P/HnlTa2Tec5VW86Je07vtOvtUtf7ZI8cFpch23EVxo1cF/vIfvXWht8udXned
y7Q0W511ZoPK7SIO1f5luebY9Dw0dFxzIfS53tGutO6KrspFrYgpISuKypUNzkJG/6x96W1o
H7nWvel6Twauys1QwrFH5sSwR2g4nd245p/o1gHBlYZW2tf6RUf7Q69qF+Xrq55ea/X1VrOq
NcrNaqhDiEMg3zGNMfKtiYmGY2f4Df3a6VV+S6Cna/rIe/R8cxJqu3GdCXL9IUaGjwaO4wfs
RUPAiH5Z6bW6X1fe6woTGtivV7SzI6bhiLWrPPOdieFbQ2M8fkSecW+umfOdwNiqKlDTa11W
1vXPmc/1Vy3PGIxNNPNCkAYza+wLlh2+llUV1U5fL1cIxmf2Jrt73VTqkewvjA1mtAcfEIVX
Hr5tx0b+nYksOgSD3upzzX5Da6zXvd7sXejhGNgwUO3C5lTdxtcrWrN33fkK5a89sPekvfx/
IGR6SdcBseZ/Cvt/SkUp2/+nQrHwD9YB8XtBLPxhLYCpKONs/5cKJcAfmicL5U5DGPmeEAoK
c0kB3Ksw8pgrzAcPBTZ2rf+wKC7wxwpREBapzMZ/tv47PI2smxskzJDgIqGJjILhQncw3EmB
LSQKgHDBm9lFS7ijwnQ8W+A9hzsP5WgQ/xkOFjJJbOUoLPQEAhdFRC1huSTT/NKH8FjEmON5
PkmdlrpFRHGJwCXni6JyQiVJpXPd5+dIgM3psYh4dgPR83MO5aAL+TMPnaEj55vxeHQKrJk3
wLo10kemL9xOLYeV/v4BfiAFQe1r7XoLlja9el/TL+u1y0+nqPARtWtQ9LHAoX9POZ7jP8Bo
wugfjn9uAEpz4TgrsdXYuVIM5HJDZwLjzmLLKxAewQrO8I5DQfZULueat6wm+EEpfgoYz1Xn
mHX4vHbXzCgFCv0/8wJ57+5ANtj8j/H2+Z9QshH/kWACyPx/GvT+l8LAsgsDw7vjNucCcKPo
E8rnC5rNNmzsACjYUQmw6REce2PuDyf8zGv8XBSOf+PtxP9kGsT/JDVb/6dBC/zfXPyPZvin
Qev4v6H4X7b/T4W24P9a8T8qBed/WCWZ/0+F9sL/sPE/LKkh/lQV2XcQ/8vOf9KhLP6XLP73
2rj9KIqxtUtsY8f4FxVVedr/U5H5f6IoWfw/Fdrc88edB1D81JH56W/cx5YHtDBbyCWilsTi
lsPf5KqDs1+qlrCUpycq+wPW8uyXFNnRL3xTOTj55dD3XAna05fwHB83C4Dflk6QRNOeCQV8
ZEZBBHcj5B80b8+kAj4yqyCCG2VjR2IBvyWzYJO/SC2I4Ae5BYGt72cX8BHpBXx0fsGmlacE
g+iClQyDWEM3eQhv13hKrnkfR5Bce46cqFjABC6ExRLGcCXxFy+owbOQEvNYJ/IJlZWT1ZAS
Pob6kGOiMqfCv05Ijj9wTO5wQTk+MirHR4Tl+BfG5fggMAfjfxmai4rNMYGI6Nzu8Nzz+Fxk
gC6M0GUhuowyyuhl9B/xQdr0ADgAAA==
--------------5CFD4C98C7CABE32E4A0FDE4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------5CFD4C98C7CABE32E4A0FDE4--
