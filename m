Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBCBC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5439400E2;
	Thu, 16 Mar 2023 16:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5439400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJSjaz-2cK-Z; Thu, 16 Mar 2023 16:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73884038B;
	Thu, 16 Mar 2023 16:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C73884038B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA11F1BF3BD
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 16:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C08E240936
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 16:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08E240936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDu8Q_U-IpDG for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 16:33:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8DF5408EC
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8DF5408EC
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 16:33:54 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id c11so1787330oiw.2
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 09:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678984433;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JksNmiUD9Q8OTq4rwYQHoaeyWJ8r5Zanmg9/RaPFAKc=;
 b=wqmbXsYbYXE6WomA+8n7cgq2AxXI5w/fmXuzutyV46U6+HWH7lSWLZl1ebtMsimLbz
 dde9Yai8OOhLeEo0fO0WKkKs1js63fIFfwgFZMxF0aDNVHzxlm6Tovna+T3WPHbI+BoJ
 nLXWiKSSaUsLbthqNBaNU1z8Bc0hcJ9EmsiWDag+tRyVi116u1slRUWAMBZwReLPbBZ5
 5ELOrH/xdgIH4LYaXQfAISD+V4j/zGjg2Bp87K9vLMOfq75CnP+Zb3GpvSk+Qx+pou/l
 FAGkYJOlRoA1Q60qSKssyn6Bi+Vj9jI0KLFaA2XU7cBtoBkGRRkJnWA7SMG3UwAlMfaU
 6rfg==
X-Gm-Message-State: AO0yUKVwA5XnJUfuSm+yH25/OAt8C1dPBOYBsGpfwI832Dzzxr9oz16p
 EGKOtL5rv9Bc2P+W3mww5lfZj2NLtxUjYu0I2RMVyXCDwnqUX3MgZ6h6Sw==
X-Google-Smtp-Source: AK7set/c+WEyfUm4vMmex9ptCpu9HWUmFcRDLRggsBN++hbzCZ830SSqogb/Szkaw/OPOY2swOYQcCL/Rz33Mk+RkKs=
X-Received: by 2002:a54:4415:0:b0:386:96b9:e19d with SMTP id
 k21-20020a544415000000b0038696b9e19dmr2057208oiw.1.1678984433559; Thu, 16 Mar
 2023 09:33:53 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Bittner <jbittner.br.bugs@gmail.com>
Date: Thu, 16 Mar 2023 12:33:42 -0400
Message-ID: <CANgJbdVKFO_HvXOvrMcJW_bb=QXnpB6T7M9T+r1ypR7icwfPWA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678984433;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JksNmiUD9Q8OTq4rwYQHoaeyWJ8r5Zanmg9/RaPFAKc=;
 b=gnVV0Md5vVGLy+vQQH4/CBDQ2Ik52U7NLsY4IAeY4svHMDlJEZUAzb3k0DnXdQOVmH
 6Y2vJ1HLs25bPIrjTcCRdRBEWMDR/lWN320a/HZaTVfQSTtKoh9pmHFtk8NuwPSPRpWT
 jXabME202aZx1c0JAB+bra37GYakDzWLqC0dcZg5x8PDfuhrcRqKW0bmRKSiKJ3m7AgO
 paoTmjNFkuR3gG2Rv2aQqqdVoDGD1VyqOsjn6o0Xn7Y4wjUWMxK4KhJao4p7WO+siI2v
 XUSPbdiO3nbMbtQLpNNY8M4XxFqaYaD/ls8/qBXknfS0pC7SHoDELB4wDLgca95t2JK5
 oCNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gnVV0Md5
Subject: [Buildroot] Troubles with SELinux
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
Content-Type: multipart/mixed; boundary="===============0881481939225590389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0881481939225590389==
Content-Type: multipart/alternative; boundary="000000000000beeb4605f70706ce"

--000000000000beeb4605f70706ce
Content-Type: text/plain; charset="UTF-8"

I'm developing an embedded config on an Intel Atom board. It is a
government app and will go through vetting. Likely it will be compared to
the RedHat and Ubuntu Security Technical Implementation Guides (STIGs) as
there no specific embedded Linux STIGs.

That means I need features like iptables, displaying the government
computer warning message, preserved logs. and SELinux.

System parameters: busybox init, GUI via nodm and openbox, ext4 file
system, bootloader varies with both grub and syslinux (extlinux), sshd

I've found a few issues and fixed them with the help of audit2allow and
made a custom policy and loaded it to address some of the issues.  I think
there are some mislabels and confusion since the /var/run folder is on a
tmpfs (I tried to set a context in the fstab but that broke it worse).

On boot up, the auditd which helps so much with debugging SELinux can't
even run because it can't obtain permissions for its log files and .pid
file.  But after boot up, I can manually start it.  It might be because
restorecond runs AFTER auditd in the init order.  I also lose out on acpid
which starts earlier and it can't open it's socket (/run/acpid.socket).
Lack of early logging means I don't have enough info to add to the policy.
I've also tried to tweak /etc/selinux/restorecond.conf and move its init
script to earlier in the start up.

The system doesn't recognize /.autorelabel  and is also missing semanage
(python script not built, python hooks to libsemanage are needed even if it
was, they were deprecated in 2015)

Lastly, I can't log in via ssh as user as it can't determine my user's
default context.  Googling the error shows some results, many are decades
old.  I tried adding to the policy's local.users file but that didn't help.

I have root ssh logins working via public keys. I enabled the relevant
boolean and sshd_config values.

I wanted to see ask if anyone was actively using SELinux and was hoping you
could share some of your knowledge, tweaks, policies, and other hints.  I'm
especially interested in getting the labels correct on the image before
first boot.

Thanks,
Jonathan

--000000000000beeb4605f70706ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m developing an embedded config on an Intel Atom boa=
rd. It is a government app and will go through vetting. Likely it will be c=
ompared to the RedHat and Ubuntu Security Technical Implementation Guides (=
STIGs) as there no specific embedded Linux STIGs.=C2=A0=C2=A0<div><br></div=
><div>That means I need features like iptables, displaying the government c=
omputer warning message, preserved logs. and SELinux.</div><div><br></div><=
div>System parameters: busybox init, GUI via nodm and openbox, ext4 file sy=
stem, bootloader varies with both grub and syslinux (extlinux), sshd</div><=
div><br></div><div>I&#39;ve found a few issues and fixed them with the help=
 of audit2allow and made a custom policy and loaded it to address=C2=A0some=
 of the issues.=C2=A0 I think there are some mislabels and confusion since =
the /var/run folder is on a tmpfs (I tried to set a context in the fstab bu=
t that broke it worse).</div><div><br></div><div>On boot up, the auditd whi=
ch helps so much with debugging SELinux can&#39;t even run because=C2=A0it =
can&#39;t obtain permissions for its log files and .pid file.=C2=A0 But aft=
er boot up, I can manually start it.=C2=A0 It might be because restorecond =
runs AFTER auditd in the init order.=C2=A0 I also lose out on acpid which s=
tarts earlier and it can&#39;t open it&#39;s socket (/run/acpid.socket).=C2=
=A0 Lack of early logging means I don&#39;t have enough info to add to the =
policy.=C2=A0 I&#39;ve also tried to tweak /etc/selinux/restorecond.conf an=
d move its init script to earlier in the start up.</div><div><br></div><div=
>The system doesn&#39;t recognize /.autorelabel=C2=A0 and is also missing s=
emanage (python script not built, python hooks to libsemanage are needed ev=
en if it was, they were deprecated in 2015)</div><div><br></div><div>Lastly=
, I can&#39;t log in via ssh as user as it can&#39;t determine my user&#39;=
s default context.=C2=A0 Googling the error shows some results, many are de=
cades old.=C2=A0 I tried adding to the policy&#39;s local.users file but th=
at didn&#39;t help.</div><div><br></div><div>I have root ssh logins working=
 via public keys. I enabled the relevant boolean and sshd_config values.</d=
iv><div><br></div><div>I wanted to see ask if anyone was actively using SEL=
inux and was hoping you could share some of your knowledge, tweaks, policie=
s, and other hints.=C2=A0 I&#39;m especially interested in getting the labe=
ls correct on the image before first boot.</div><div><br></div><div>Thanks,=
</div><div>Jonathan</div></div>

--000000000000beeb4605f70706ce--

--===============0881481939225590389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0881481939225590389==--
