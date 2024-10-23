Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE3CF5398
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 14:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BB660771;
	Wed, 23 Oct 2024 14:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjl-Txj-y-go; Wed, 23 Oct 2024 14:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1F560775
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1F560775;
	Wed, 23 Oct 2024 14:45:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CF14C2A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 000EB403E2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzBdDKC44rHV for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 14:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=andreynech@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EAF7403CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EAF7403CB
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EAF7403CB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:45:56 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5e5a0519d00so3090396eaf.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 07:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729694756; x=1730299556;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rwah0PEbgdsGUipbow86F0Zbpza86rAv0jGgYiVUdBo=;
 b=GcKDrqF7tqsrOA9jXlK7aFxBF8BxbD9y9X3zyfvAOj2Yzwrq7toOOfx17rM6r6OzMh
 v9KDCEhnnC6KvmVfzomwdJOfLhlGFC7FcOZWealdDtd403IHY2OigVUFIaMDRujtgFRa
 TGX/PMkAudDH7FaGEBBRhmpG61vDOleJse6RgkT9O8CXTaBajejZh3OIohtQSqe+sthc
 agUsfDvwX733SJUHLgxdQZ4qtuKPrKS6XUxRvYpyZfNwMV8hQss6lw1RaMNgJUH6Hjmk
 jhFSmt6sOftuBIXw6Ox7APrNLiP65izkV4gdGI7vcwpb/sk9foXFuW8K+7BwCfHVHZYy
 EIlw==
X-Gm-Message-State: AOJu0Ywgf+ha1b9uvHw2E6OeCr9KI3l1XA7Wy0V0bmMxCFyyra5r5H3k
 jUIGMqaMW04VV4uHz81svqBaJBPHdco+aTc1fvmxmgSgeUkaOnehKF2WQxRlPncD5Omo6gtIJTi
 A6SQJk7hOsZg6ZjQQYdr8EBNrDHHTNG5oqx4=
X-Google-Smtp-Source: AGHT+IHDMoGqGKmBLPucG02sl3rdAJw4X7zS528cOcWnEGCweReDa2w6E60X8+HutE0ZN9USYfkpCxDlQDbGMlWYsco=
X-Received: by 2002:a05:6871:692:b0:286:f24f:c231 with SMTP id
 586e51a60fabf-28ccb844c57mr3077669fac.25.1729694755748; Wed, 23 Oct 2024
 07:45:55 -0700 (PDT)
MIME-Version: 1.0
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 23 Oct 2024 16:45:44 +0200
Message-ID: <CAOiXNkA9JLTKRte0_uKPeujF0CNZ7WahxF7pvnvVUsTNoGQvmg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729694756; x=1730299556; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rwah0PEbgdsGUipbow86F0Zbpza86rAv0jGgYiVUdBo=;
 b=nVGYt7rbQr7PzfvydftwvcGZm8/3ChLq8dEi1fphCnSARzZRG7TB+y0AAecn4R5EOP
 GtzUlJ/GHc7/Ys0UaU4uFK0RpyZ+hrEyGW2CNl2a+ztl44ZVzdoaHKY+WFwIaIhBFrX7
 TMcO7bY0R3oCN3+gla8eFSmCGSI5eQ6PI3odqBuKwRClrD0/HDArFNQPrR0M4+hLUjsN
 cx1Ek1T8+q6HT9DCL1/jXoRGUjljq3+1bdyVJ3eLKbxh1xBAl9sdWJMFu197v3cKJmYq
 6x6m3WV5bRYhlMASg5iLENVHeBqsrSrgv81wfnmuMy0xLm7ahQDajjrfJfz8YMQoZhxG
 FIrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nVGYt7rb
Subject: [Buildroot] HOST_MFGTOOLS dependency in BR v2024.08.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Folks,

I am currently building images for the iMX8 board (BR2_aarch64) and also
want to make the HOST_MFGTOOLS package. However, this package depends on
BR2_arm (not BR2_aarch64) and could not be selected in menuconfig.

I am wondering if this dependency is correct or am I missing something?

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
