Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C73C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 07:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A07A461264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 07:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A07A461264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5E340435;
	Thu, 11 Nov 2021 07:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awIL5z82af4x; Thu, 11 Nov 2021 07:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41BD140389;
	Thu, 11 Nov 2021 07:55:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBE51BF2CF
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 07:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C39B60B0F
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 07:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b70cuBh9mMME for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 07:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03F0E6069E
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 07:55:28 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id bl12so5009398qkb.13
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=zHkGDObOQkHYBSceH59BHt8O5pP607bd9mm4VmHs2tc=;
 b=hBNBj2nWYpwbMRII4TJiSkNG4/cn/jsgHzPb8mOSs3CiWYl/bUbQc79SHlyE+2I/Eu
 v+VOghlWbf+Zt8P1cpK8FHHLWrGx1qSYcOi+Y1X7IMHuFeYPuy0es0hVzQFpR7j/QefV
 aR9v+G5D/wXJipP3ARo82ivawq2pyoxVAfnYQqojJWpBGSuJt6n9eAdlTUYNYxACfXNF
 Gl4NQn3s87lfXc7MMJd44yorR6khLKpILLaCsg35RTGBO2CXHX97yjbDFWQEqray20hu
 reG84kQPJEsrNLsJkvj+LJvfl3MOYenJFeEg2PzzOeHmNo/yhWS3Jk+JYvR4A7o2Fmwr
 Ucqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zHkGDObOQkHYBSceH59BHt8O5pP607bd9mm4VmHs2tc=;
 b=oMdJyyCGhdhvQJ2SJ6aWIsIHQTGvmdX1I7di3BO0uZZ6/KHcdikcn/eCikrcgfjl0F
 4UOG8ktclFCXyB1Z3uOcqEFxVzJGJzR6066FBVfvBoPp4KqHryM17ZvPfdKYRnKsfkc7
 UU07GMpL4E7/GFWOKNKDdrMRwmSeF6tmjzr4KnGX/OsIE8EhBMkOzsWDHU9bynmDh914
 UjxzRWJ+IiQW44QxzI0eeOL00g5OHozBh9imqv1FmuBjErEIMUNzAjqST/UajDXSoMgE
 s+8meAvW5ZHBue3NX7vdDvT6mQPPCiVahgojrUZtu8TF02a9y47R6IG9RfWAbEN6EGh7
 SeGQ==
X-Gm-Message-State: AOAM533BgiGg/BS4uflaDm4cswxlH7ZCnsiP4bZx/2nZ+1p4sl0eGI/j
 lVyIHlfZbFAHMooPQRj5X54JylhxSA/E9mnlHf9+/ai3+gQ=
X-Google-Smtp-Source: ABdhPJwB8eD+LnOZZC/EQpppwn9Ns+Q7aR61SGB3wk0sYqfXFYm0t/6GsDtdsApGYrwZwq3c+lnEYaz/Eppp7H7z0eE=
X-Received: by 2002:a37:b7c6:: with SMTP id h189mr4482887qkf.377.1636617327654; 
 Wed, 10 Nov 2021 23:55:27 -0800 (PST)
MIME-Version: 1.0
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Thu, 11 Nov 2021 09:55:17 +0200
Message-ID: <CACaKL1yyn2cj68Bdt+S7BRtLDWV5Ja6Pe-rHQj8dsSEK22Bu3A@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] building U-Boot fw_printenv
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
Content-Type: multipart/mixed; boundary="===============5529060824551899731=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5529060824551899731==
Content-Type: multipart/alternative; boundary="00000000000072b7fe05d07eaa2b"

--00000000000072b7fe05d07eaa2b
Content-Type: text/plain; charset="UTF-8"

Hello,


i am using BR off tag 2020.01, and using U-Boot as a bootloader (ARM
platform).
I am just unable to make U-Boot build env tools, namely fw_printenv.
I obviously verified the fw_printenv.c and makefile are indeed present in
tools/env.

I tried a few settings, but am mot able to get this tool built. None of the
settings, either from BR or Uboot seem to be able to do that.

Am i missing something  basic here ?

Thanks,
Jacques

--00000000000072b7fe05d07eaa2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div><br><div>i am using BR off tag 2=
020.01, and using U-Boot as a bootloader (ARM platform).</div></div><div>I =
am just unable to make U-Boot build env tools, namely fw_printenv.</div><di=
v>I obviously=C2=A0verified the fw_printenv.c and makefile are indeed prese=
nt in tools/env.</div><div><br></div><div>I tried a few settings, but am mo=
t able to get this tool built. None of the settings, either from BR or Uboo=
t seem to be able to do that.</div><div><br></div><div>Am i missing=C2=A0so=
mething=C2=A0=C2=A0basic here ?</div><div><br></div><div>Thanks,</div><div>=
Jacques</div></div>

--00000000000072b7fe05d07eaa2b--

--===============5529060824551899731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5529060824551899731==--
