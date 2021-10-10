Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34205C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:00:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD4B60D07
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BD4B60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B40760783;
	Sun, 10 Oct 2021 09:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCFfFEQ2M5cM; Sun, 10 Oct 2021 09:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B686079F;
	Sun, 10 Oct 2021 09:00:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541D81BF328
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31D7D404C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5F0wHq4yhWIa for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1008040470
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:00:17 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id k3so6342722ilu.2
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=VYVgAitXv5sdlBCeDqv+j5i3FDnj2Gc6y/bLwWDn67k=;
 b=i1u3ihdyvFPd9UQSfbCTyfT3Kuf5RAsvL4Pi6rs+1njamgbsWmMj/K4kzCeKEoScDG
 ZH2pvJJfqtsOiAFd2lAJB3JTFSCq4yeYHAdDrNR/kGed5WZm/lz9myI468HPRQYuPRSe
 5OGoaD2dsibeIQv9F1Zlq2OlFrNwzgI2vH8DAbJRi98d7BqjggStwauvlpWeY78Ieksg
 TmZYURLD36BJrri5HuJ069Grfjf3TOJ4pGHSPLr3NpTkf8YVTaVMdYe2EB3tc6CiZ1J7
 K27ZOShuV8iyUKHl3t+XsISbWg6ltRpkOsPWYj1ea/ZAomfDN9IBKKaSb11FIvST57yk
 t8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VYVgAitXv5sdlBCeDqv+j5i3FDnj2Gc6y/bLwWDn67k=;
 b=npQs2gQwoS96rLjhU5jmV4VO1uSwD7r0TOtql59Q9YpGheRzYMijGyfui5yyODjm7A
 maCEkz3vq8fPrlAi5UlltPfRAVLT88sdNmGJGkESbBOqIVq85ABuJp8x4Rj4BjZOjLLt
 p+TrfBlUj9IkAIp3LNxcxQ0mRO/RdyPTsIrBpz2Vy/oIlPduF0S2srQ3XjG5ty9h06EA
 O+CMw8XVVKQTPSxqSmHHT7WICVSfvPafgcdLU9cLGvtYMVZYdvxABJzw8d5rhKGubYd/
 3g5AyasajenkstwBM0q8U6qSAKb05bcJwAMXqtOa3jAv0aS2MDYic+KVoXGGsBlhugqc
 pB7g==
X-Gm-Message-State: AOAM530V8lwVLlYbTohXdfhZzUoqGZi6DCai0dqi25u3QN5VilIVOKDr
 towLceUjD02OgdcbQz7dXKVCCNa3asq7LEb6pFRc2SOK/A==
X-Google-Smtp-Source: ABdhPJwCrW20wauuQf8o4QkcCl93CpT2MRsMNgL3EMsmyFYkpAQr4Wn6/Wjz8JNXGOinzhP8F9F8m83fKtGCQKt1FeI=
X-Received: by 2002:a05:6e02:1a27:: with SMTP id
 g7mr14680245ile.123.1633856416453; 
 Sun, 10 Oct 2021 02:00:16 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
Date: Sun, 10 Oct 2021 09:58:52 +0200
Message-ID: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] error when i build buidroot
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
Content-Type: multipart/mixed; boundary="===============1381020592327669258=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1381020592327669258==
Content-Type: multipart/alternative; boundary="000000000000511a5605cdfbd7f1"

--000000000000511a5605cdfbd7f1
Content-Type: text/plain; charset="UTF-8"

Hey everybody ,
It is my first time to use buildroot. I have read the manual and i want to
use it for embedded linux projects .
So i have :
clone the project
build  for qemu_x86_64 by typing "qemu_x86_64_defconfig"
then type "make"

After that i have seen some error, i don't know how to solve it :

"rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude
'*~' system/skeleton/
/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/"

So this command generate a lot of errors :

rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/dev":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/profile.d":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/media":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/mnt":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/opt":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/proc":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/root":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/run":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/sys":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/tmp":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib":
Function not implemented (38)
rsync: [generator] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/sbin":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.group.nsk97w":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.hosts.yBRyXu":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.passwd.0Uncqt":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.profile.0E8enu":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.protocols.DJb4ew":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.services.AO2ruv":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.shadow.QE0FTt":
Function not implemented (38)
rsync: [receiver] failed to set permissions on
"/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/profile.d/.umask.sh.IN0rhw":
Function not implemented (38)
rsync error: some files/attrs were not transferred (see previous errors)
(code 23) at main.c(1333) [sender=3.2.3]
make: *** [package/pkg-generic.mk:333 :
/root/buildroot/output/build/skeleton-init-common/.stamp_staging_installed]
Erreur 23

Please how can i fix that ?? Because i have not seen something talk about
how to avoid it

--000000000000511a5605cdfbd7f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey everybody ,</div><div>It is my first time to use =
buildroot. I have read the manual and i want to use it for embedded linux p=
rojects .</div><div>So i have : <br></div><div>clone the project</div><div>=
build=C2=A0 for qemu_x86_64 by typing &quot;qemu_x86_64_defconfig&quot;</di=
v><div>then type &quot;make&quot; <br></div><div><br></div><div>After that =
i have seen some error, i don&#39;t know how to solve it :</div><div><br></=
div><div>&quot;rsync -a --ignore-times --exclude .svn --exclude .git --excl=
ude .hg --exclude .bzr --exclude CVS --chmod=3Du=3DrwX,go=3DrX --exclude .e=
mpty --exclude &#39;*~&#39; system/skeleton/ /root/buildroot/output/host/x8=
6_64-buildroot-linux-uclibc/sysroot/&quot;</div><div><br></div><div>So this=
 command generate a lot of errors : <br></div><div><br></div><div>rsync: [g=
enerator] failed to set permissions on &quot;/root/buildroot/output/host/x8=
6_64-buildroot-linux-uclibc/sysroot/dev&quot;: Function not implemented (38=
)<br>rsync: [generator] failed to set permissions on &quot;/root/buildroot/=
output/host/x86_64-buildroot-linux-uclibc/sysroot/etc&quot;: Function not i=
mplemented (38)<br>rsync: [generator] failed to set permissions on &quot;/r=
oot/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/profile=
.d&quot;: Function not implemented (38)<br>rsync: [generator] failed to set=
 permissions on &quot;/root/buildroot/output/host/x86_64-buildroot-linux-uc=
libc/sysroot/media&quot;: Function not implemented (38)<br>rsync: [generato=
r] failed to set permissions on &quot;/root/buildroot/output/host/x86_64-bu=
ildroot-linux-uclibc/sysroot/mnt&quot;: Function not implemented (38)<br>rs=
ync: [generator] failed to set permissions on &quot;/root/buildroot/output/=
host/x86_64-buildroot-linux-uclibc/sysroot/opt&quot;: Function not implemen=
ted (38)<br>rsync: [generator] failed to set permissions on &quot;/root/bui=
ldroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/proc&quot;: Functi=
on not implemented (38)<br>rsync: [generator] failed to set permissions on =
&quot;/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/roo=
t&quot;: Function not implemented (38)<br>rsync: [generator] failed to set =
permissions on &quot;/root/buildroot/output/host/x86_64-buildroot-linux-ucl=
ibc/sysroot/run&quot;: Function not implemented (38)<br>rsync: [generator] =
failed to set permissions on &quot;/root/buildroot/output/host/x86_64-build=
root-linux-uclibc/sysroot/sys&quot;: Function not implemented (38)<br>rsync=
: [generator] failed to set permissions on &quot;/root/buildroot/output/hos=
t/x86_64-buildroot-linux-uclibc/sysroot/tmp&quot;: Function not implemented=
 (38)<br>rsync: [generator] failed to set permissions on &quot;/root/buildr=
oot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin&quot;: Functi=
on not implemented (38)<br>rsync: [generator] failed to set permissions on =
&quot;/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr=
/lib&quot;: Function not implemented (38)<br>rsync: [generator] failed to s=
et permissions on &quot;/root/buildroot/output/host/x86_64-buildroot-linux-=
uclibc/sysroot/usr/sbin&quot;: Function not implemented (38)<br>rsync: [rec=
eiver] failed to set permissions on &quot;/root/buildroot/output/host/x86_6=
4-buildroot-linux-uclibc/sysroot/etc/.group.nsk97w&quot;: Function not impl=
emented (38)<br>rsync: [receiver] failed to set permissions on &quot;/root/=
buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.hosts.yBRy=
Xu&quot;: Function not implemented (38)<br>rsync: [receiver] failed to set =
permissions on &quot;/root/buildroot/output/host/x86_64-buildroot-linux-ucl=
ibc/sysroot/etc/.passwd.0Uncqt&quot;: Function not implemented (38)<br>rsyn=
c: [receiver] failed to set permissions on &quot;/root/buildroot/output/hos=
t/x86_64-buildroot-linux-uclibc/sysroot/etc/.profile.0E8enu&quot;: Function=
 not implemented (38)<br>rsync: [receiver] failed to set permissions on &qu=
ot;/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.p=
rotocols.DJb4ew&quot;: Function not implemented (38)<br>rsync: [receiver] f=
ailed to set permissions on &quot;/root/buildroot/output/host/x86_64-buildr=
oot-linux-uclibc/sysroot/etc/.services.AO2ruv&quot;: Function not implement=
ed (38)<br>rsync: [receiver] failed to set permissions on &quot;/root/build=
root/output/host/x86_64-buildroot-linux-uclibc/sysroot/etc/.shadow.QE0FTt&q=
uot;: Function not implemented (38)<br>rsync: [receiver] failed to set perm=
issions on &quot;/root/buildroot/output/host/x86_64-buildroot-linux-uclibc/=
sysroot/etc/profile.d/.umask.sh.IN0rhw&quot;: Function not implemented (38)=
<br>rsync error: some files/attrs were not transferred (see previous errors=
) (code 23) at main.c(1333) [sender=3D3.2.3]<br>make: *** [package/<a href=
=3D"http://pkg-generic.mk:333">pkg-generic.mk:333</a> : /root/buildroot/out=
put/build/skeleton-init-common/.stamp_staging_installed] Erreur 23</div><di=
v><br></div><div>Please how can i fix that ?? Because i have not seen somet=
hing talk about how to avoid it<br></div><div><br></div></div>

--000000000000511a5605cdfbd7f1--

--===============1381020592327669258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1381020592327669258==--
