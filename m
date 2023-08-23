Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF0EE49AD
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 04:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0201781FAF;
	Wed, 23 Aug 2023 04:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0201781FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnQsi54Pq8EX; Wed, 23 Aug 2023 04:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4E281F4F;
	Wed, 23 Aug 2023 04:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4E281F4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D62FB1BF29C
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 04:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF8A760BD9
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 04:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF8A760BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNaPuLF_HSHq for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 04:26:24 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD2AF60A70
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 04:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2AF60A70
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so6635884a12.1
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 21:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692764781; x=1693369581;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eixbU6uFz+9szmIKiRGn9wUxhKMZz87dULe2ACzc0vk=;
 b=N6lgVFBhII1/KfE5y/Ao5PdF9PKVNC/wsOdoX8ndQ6+9gVeQd+hAqajQKgXkTgrM06
 OPZP76wQ6p8wEi+8LWXnjJjK9HUqNgDVgMHUz7zlTGzmKmH9wHRLOj83E7Fr/q+HBVml
 bT5dWT1ZJ5HAVL99bnwwhrXj6W47Jma2WF8Fe+7yaqUpCCPm1RHy/JWBpgn0KvCWNG5W
 HlnOj7ZxEN4hLPSIZLusJSDvOG7X4WoNNo/Lamgr96peO5Xs2gYCKPKN5hTfPbf4kGc8
 Nu8GcOeXiMh49MrLF2Ml/eh/t3uIUr88spZf6KVQ25Ak+7Cc3CU4SQfCrBoXh1radHD4
 Fv6w==
X-Gm-Message-State: AOJu0Yw0KRUDirib56kbTgRUICz4wHafjjaAUPFr2k5+9UmxfqJjP5Ol
 v6O0RPbRGrPlgHzxKGIIIn7yNy711ntej9nxBdUS8pjkrNvMhIlo1BA=
X-Google-Smtp-Source: AGHT+IHGbz4i6eX11mTTjSaYedfE4XcHEDo3R7tOMCj4aiyyPBBRZfXaFUlNiwd2t4dHjQ6nQ/fkE0eZpvJQ414aLDQ=
X-Received: by 2002:a17:907:7714:b0:99b:6e54:bd6e with SMTP id
 kw20-20020a170907771400b0099b6e54bd6emr8214346ejc.56.1692764781438; Tue, 22
 Aug 2023 21:26:21 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Smith <ryan.smith@density.io>
Date: Tue, 22 Aug 2023 22:26:10 -0600
Message-ID: <CAM7Wg-VCtAdw276BDujEX+7g2v793st6d+m00-6qLHcRz-opQw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=density.io; s=google; t=1692764781; x=1693369581;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eixbU6uFz+9szmIKiRGn9wUxhKMZz87dULe2ACzc0vk=;
 b=YsaHimeY9u7ivdgr4ha7mjNh7qTsnESREQ8+4AgYKyZjK/MesQ/H4IWM2VBxbEKI0s
 8FDtgseDw7t9h9E3Jtvd+O1g29t2rxvv6D9GsKqAyzJjWOrfQH5KAkedKNgm6tE8rtH4
 jnVF3MZolwMgv5edXR5rYyrDpFZNXFnzbZdjk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=density.io header.i=@density.io
 header.a=rsa-sha256 header.s=google header.b=YsaHimeY
Subject: [Buildroot] Embedding Python Interpreter with pybind11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I am attempting to write a program that embeds the Python interpreter
in C++ code using pybind11. When I attempt to compile the package in
Buildroot, I get the following error message.

/src/output-internal/host/include/python3.11/pyport.h:601:2: error:
#error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
config?)."
 #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
config?)."
  ^~~~~
In file included from
/src/output-internal/host/include/python3.11/Python.h:38:0,
                 from
/src/output-internal/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/pybind11/detail/common.h:266,
                 from
/src/output-internal/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/pybind11/attr.h:13,
                 from
/src/output-internal/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/pybind11/detail/class.h:12,
                 from
/src/output-internal/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/pybind11/pybind11.h:13,
                 from
/src/output-internal/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/pybind11/embed.h:12,
                 from
/src/output-internal/build/mmwave-eventd-custom/src/event_detector.h:4,
                 from
/src/output-internal/build/mmwave-eventd-custom/src/event_detector.cpp:4:

Am I missing something, or is this way of using pybind11 in Buildroot
not supported? TIA for any pointers or suggestions.

-- 
Ryan Smith
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
