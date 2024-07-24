Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1B3C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E2C481372;
	Wed, 24 Jul 2024 10:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25Ym357NY2nI; Wed, 24 Jul 2024 10:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68ED481376
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68ED481376;
	Wed, 24 Jul 2024 10:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 068E01BF396
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 10:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5D1C4047E
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 10:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZM1xEvds09pz for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 10:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F9E34043D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9E34043D
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F9E34043D
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 10:17:17 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6512866fa87so63956517b3.2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 03:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721816236; x=1722421036;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wdYnvAf6qllc9xYnq3k2nXdPgem/xotycmeZS9oKHmk=;
 b=S+9e4ngf6Bbhfjws4K6XCDusojTQHqSLpcQP6s+OPIceNUDOGFfm05AGMBE5SfO1v6
 7hdJKFGl/L9Y8n006u+psAe7JX0Kcs7+RMpMJ+a4kAqdyHJlUpY0XMUk6gWL72X0ukwg
 m8qDobqPvXZEzUk7q1MN8FSjBM6ZdvPDiPPE/QzVKSxbmW4lddzllTeftEkLmHAkyuRP
 PXZIi/2o50v0QErqwAjJ7R9EakouGjVTmOKMuk+q8R9sVB0W4IcBHC4vXFWE8MUUXsA8
 rszwMQpHdFsev3n3MpxDp5bUxhuBQLMz7xrGFSBwIEG7uPyHw+N45A3/EGKLXgCOo9VX
 B4pA==
X-Gm-Message-State: AOJu0Yxdpi/2kLfBg+N/zTH9Os0xObpS9P/iaUwugk/qrxIU5RbhMl0e
 +tAt2OWMcTl51rhSsBINo6MABcL/Yx2Ni+GR5RB+5qiQtHeLNl78Q3/UHXPJSfVaqUXm0hEUUv5
 fc4dIwruHqL9DwAzAEmRKLlgmBLYcJBM=
X-Google-Smtp-Source: AGHT+IGsAdzmsZt/6320SmGT/HLcd+EDuESsPodYGmE1/8SpS0gf+Em0GgkDV0TIGNskH8ZHadzCwEUpvkXUUv/N8Uk=
X-Received: by 2002:a05:690c:7108:b0:672:e49d:430e with SMTP id
 00721157ae682-672e49d4598mr11329717b3.15.1721816236001; Wed, 24 Jul 2024
 03:17:16 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Wed, 24 Jul 2024 12:16:39 +0200
Message-ID: <CAFAK9+cph-594kM4jz+4zYV3zTkQZa22o9OwQpsaFBrCrL598g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721816236; x=1722421036; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wdYnvAf6qllc9xYnq3k2nXdPgem/xotycmeZS9oKHmk=;
 b=lEwaJSxqxPyAXz7982JDOfO4SPitg96JwDHEKju6l4Zqwq+m9au7mrf0zVF/nq/G5A
 AYrU3sYiA9YccEFneWJcPv9pzC5djSyZbAIpTbbRXizlRF3CkJGOwrRvNJxR3HShmn9z
 YkURpJsk0KetcHI8okY60RQevPc644yI45L1MJX3lm9Rp5a7WJsBrhCWiVrtLWo/EhcW
 YR6og53Q1sSKoiPK/TIpVf7ZmKCZtBJtOiul9sZC8hPLu6paKHmYHrj2U3yoHn/7PB7x
 T65YkAnUfBf6mzYp43dr0gqaBq0tuAx8RfNGVUDh1W+5AopJav9q9n9NDPVkPKeRC2ER
 ngbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lEwaJSxq
Subject: [Buildroot] RaspberryPi U-Boot watchdog
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
Content-Type: multipart/mixed; boundary="===============0064633298316125566=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0064633298316125566==
Content-Type: multipart/alternative; boundary="0000000000001d98b4061dfb959c"

--0000000000001d98b4061dfb959c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to build a system with redundant rootfs partitions for a
Raspberry Pi 4 with U-Boot.

I'm trying to test the recovery of this system but I can't seem to get the
raspberry pi to reset after a kernel panic on a non-working rootfs.

To provoke this kernel panic I am simply deleting all the files in the
particular rootfs. The system seems to just hang there after the panic:

.....
[    3.374273] Kernel panic - not syncing: No working init found.  Try
passing init=3D option to kernel. See Linux
Documentation/admin-guide/init.rst for guidance.
[    3.388444] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 6.1.61-v8 #2
[    3.394627] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[    3.400456] Call trace:
[    3.402897]  dump_backtrace.part.0+0xe8/0x100
[    3.407264]  show_stack+0x20/0x30
[    3.410579]  dump_stack_lvl+0x88/0xb4
[    3.414246]  dump_stack+0x18/0x34
[    3.417561]  panic+0x1a0/0x370
[    3.420618]  kernel_init+0x138/0x140
[    3.424197]  ret_from_fork+0x10/0x20
[    3.427776] SMP: stopping secondary CPUs
[    3.431701] Kernel Offset: 0x1353c00000 from 0xffffffc008000000
[    3.437617] PHYS_OFFSET: 0x0
[    3.440492] CPU features: 0x80000,2013c080,0000421b
[    3.445368] Memory Limit: none
[    3.448423] ---[ end Kernel panic - not syncing: No working init found.
Try passing init=3D option to kernel. See Linux
Documentation/admin-guide/init.rst for guidance. ]---

What I've tried:
- From `Target packages`: watchdog, watchdogd
- Busybox watchdog
- From linux-menuconfig > device drivers > watchdog
- From uboot-menuconfig > device drivers > watchdog

None of these seem to be working for me.

Best regards,

Jos=C3=A9 Mendes

--0000000000001d98b4061dfb959c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I&#39;m trying to build a system with redun=
dant rootfs partitions for a Raspberry Pi 4 with U-Boot.<br><br>I&#39;m try=
ing to test the recovery of this system but I can&#39;t seem to get the ras=
pberry pi to reset after a kernel=C2=A0panic on a non-working rootfs.<br><b=
r>To provoke=C2=A0this kernel panic I am simply deleting all the files in t=
he particular rootfs. The system seems to just hang there after the panic:<=
br><br>.....<br>[ =C2=A0 =C2=A03.374273] Kernel panic - not syncing: No wor=
king init found.=C2=A0 Try passing init=3D option to kernel. See Linux Docu=
mentation/admin-guide/init.rst for guidance.<br>[ =C2=A0 =C2=A03.388444] CP=
U: 3 PID: 1 Comm: swapper/0 Not tainted 6.1.61-v8 #2<br>[ =C2=A0 =C2=A03.39=
4627] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)<br>[ =C2=A0 =C2=A0=
3.400456] Call trace:<br>[ =C2=A0 =C2=A03.402897] =C2=A0dump_backtrace.part=
.0+0xe8/0x100<br>[ =C2=A0 =C2=A03.407264] =C2=A0show_stack+0x20/0x30<br>[ =
=C2=A0 =C2=A03.410579] =C2=A0dump_stack_lvl+0x88/0xb4<br>[ =C2=A0 =C2=A03.4=
14246] =C2=A0dump_stack+0x18/0x34<br>[ =C2=A0 =C2=A03.417561] =C2=A0panic+0=
x1a0/0x370<br>[ =C2=A0 =C2=A03.420618] =C2=A0kernel_init+0x138/0x140<br>[ =
=C2=A0 =C2=A03.424197] =C2=A0ret_from_fork+0x10/0x20<br>[ =C2=A0 =C2=A03.42=
7776] SMP: stopping secondary CPUs<br>[ =C2=A0 =C2=A03.431701] Kernel Offse=
t: 0x1353c00000 from 0xffffffc008000000<br>[ =C2=A0 =C2=A03.437617] PHYS_OF=
FSET: 0x0<br>[ =C2=A0 =C2=A03.440492] CPU features: 0x80000,2013c080,000042=
1b<br>[ =C2=A0 =C2=A03.445368] Memory Limit: none<br>[ =C2=A0 =C2=A03.44842=
3] ---[ end Kernel panic - not syncing: No working init found.=C2=A0 Try pa=
ssing init=3D option to kernel. See Linux Documentation/admin-guide/init.rs=
t for guidance. ]---<br><br>What I&#39;ve tried:<br>- From `Target packages=
`: watchdog, watchdogd<br>- Busybox watchdog<br>- From linux-menuconfig &gt=
; device drivers &gt; watchdog<br>- From uboot-menuconfig=C2=A0&gt; device =
drivers &gt; watchdog<br><br>None of these seem to be working for me.<br><b=
r>Best=C2=A0regards,<br><br>Jos=C3=A9 Mendes</div>

--0000000000001d98b4061dfb959c--

--===============0064633298316125566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0064633298316125566==--
