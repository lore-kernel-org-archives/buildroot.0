Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 00:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD4140C6A;
	Wed, 30 Mar 2022 00:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWBvJwoQ9eos; Wed, 30 Mar 2022 00:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C40540C64;
	Wed, 30 Mar 2022 00:54:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 223DA1BF5F8
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 00:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D3E400FF
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 00:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBa5FUoKvc-F for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 00:54:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA3A24005D
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 00:54:31 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id f38so34488250ybi.3
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 17:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=JN79hV0mVOZusFDMPYqGRm9cAGhJeZLDHzNGSm6s9FE=;
 b=MeWxXIwnHAKOOw3DCwf4uuxpqPIvJN+ZqRjjG7p3VUF3PkpWyaCXGGm81P8Soqac6u
 rgJwdm/PbQLkPkzHEJUZyKU38UdDymA8PU54084Z7iuhqtpKIon7qIaUZXc021u2wfv6
 iulpmX1I3dAEZsuG7Y0KwVw45CSadkZ5zUvQnTPlAkXkKAn9fGI0wglyrcKrTCLZtYcA
 X+BbfnrKxjhjapHjnpVeNM+0FLQgTml8d9kuZIYWR21Sw2bzq/Zxc3zfmm4ltnTUrTwu
 RXTdho4Relbl2cSnktYBmFkyGSAvf6XeJQJtmRz3BBm/FJHtctwvgAB4Pc+y19Z525e8
 r5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=JN79hV0mVOZusFDMPYqGRm9cAGhJeZLDHzNGSm6s9FE=;
 b=rqAd1nQc4H9TwoAH9jiyyVMojqhheOsIqnUYUpyFtTM4Ou5YzF9uaVVpEC7OYkof1L
 7o6CFvQ0VPCsXDKMzkGzd4+frlM91SfqBcUjYgpvuQNmiur9m1/R4If6H7eePAlmfqQi
 RYQxKOLRCrJHCWWH+eBESsakGyuDMBMP9vvI2rwcPPhpC0QkRwN13WGIbU8UvOBCLOyG
 1TdKfNIcZ4rUqWiPaFOSa7AiO65maCCCp5sa5u68JK6iOlbNDZ0vNfZsXoOs85A3I+Zb
 W/jhu5xUAX2qByt965vTXFsExJ2TkeIt7XiduDuxyQ+HA8hm+Yj3shCaWpvP/e0y6Cpd
 s71Q==
X-Gm-Message-State: AOAM531XgbhZUEG2O+PSDKsgCseFncK/yJ3HRSkVknEJ+iNpYArRKcEp
 Byb2Av9U4T/hqcvNNKA7gx8aMPdfGOEW2uihCsHdcDQmLlw=
X-Google-Smtp-Source: ABdhPJyCLC/lHAvIPWYcEXRh7gyU/e/5/UnW1P6shkfEmUBd7i3RHrp5oGVWzYM8IKoahjYbuBAYSRlkrjSHm8EBWNA=
X-Received: by 2002:a25:51c8:0:b0:633:91ae:c476 with SMTP id
 f191-20020a2551c8000000b0063391aec476mr29279714ybb.337.1648601669525; Tue, 29
 Mar 2022 17:54:29 -0700 (PDT)
MIME-Version: 1.0
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Tue, 29 Mar 2022 21:54:18 -0300
Message-ID: <CAM70yxAwLLiC0CZCvOXgfFBydhyqT_EDztfEvhcQpwKyB4+51w@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] python-argon2-cffi no longer works
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
Cc: james.hilliard1@gmail.com, yann.morin.1998@free.fr
Content-Type: multipart/mixed; boundary="===============1936575561958430275=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1936575561958430275==
Content-Type: multipart/alternative; boundary="000000000000e3651305db64fcfd"

--000000000000e3651305db64fcfd
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

Commit https://github.com/buildroot/buildroot/commit
e2957f5ce743cfaf4fb3aaa98d619e83e8e6989e breaks the argon2-cffi Python
package for my ARM target (Beaglebone Black).

The installation of the argon2-cffi Python package somehow got broken with
the version bump. Just before that commit, I get (via serial terminal):

# python -c 'help("modules")' | grep argon2
__future__          argon2              gzip                selectors

# python -c 'from argon2 import PasswordHasher;
print(PasswordHasher().hash("cor
rect horse battery staple"));'
$argon2id$v=19$m=102400,t=2,p=8$qHc/evoNvfGlp98pE26Ayw$tZWcHYjxFTKDUoaSysapPA

And just after that commit, I get:
# python -c 'help("modules")' | grep argon2
_argon2_cffi_bindings ast                 hmac                shutil

Traceback (most recent call last):
  File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'argon2'

argon2-cffi is the only Python package I have enabled via make xconfig for
this test.

Any hints on how I can track down the problem would be appreciated. Note
that I'm not an expert in Python or how its package management system
works. I'm working on a project that is dependent on another Python project
that depends on argon2-cffi.

I submitted this bug report: https://bugs.busybox.net/show_bug.cgi?id=14721

Cheers,
Emile Cormier

--000000000000e3651305db64fcfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Everyone,</div><div><br></div><div>Commit <a href=
=3D"https://github.com/buildroot/buildroot/commit">https://github.com/build=
root/buildroot/commit</a> e2957f5ce743cfaf4fb3aaa98d619e83e8e6989e breaks t=
he argon2-cffi Python package for my ARM target (Beaglebone Black).</div><b=
r>The installation of the argon2-cffi Python package somehow got broken wit=
h the version bump. Just before that commit, I get (via serial terminal):<b=
r><br># python -c &#39;help(&quot;modules&quot;)&#39; | grep argon2<br>__fu=
ture__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argon2 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0gzip =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0selectors<br><br># python -c &#39;from argon2 import PasswordHasher; =
print(PasswordHasher().hash(&quot;cor<br>rect horse battery staple&quot;));=
&#39;<br>$argon2id$v=3D19$m=3D102400,t=3D2,p=3D8$qHc/evoNvfGlp98pE26Ayw$tZW=
cHYjxFTKDUoaSysapPA<br><br>And just after that commit, I get:<br># python -=
c &#39;help(&quot;modules&quot;)&#39; | grep argon2<br>_argon2_cffi_binding=
s ast =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hmac =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil<br><br>Traceback (mo=
st recent call last):<br>=C2=A0 File &quot;&lt;string&gt;&quot;, line 1, in=
 &lt;module&gt;<br>ModuleNotFoundError: No module named &#39;argon2&#39;<br=
><br><div>argon2-cffi is the only Python package I have enabled via make xc=
onfig for this test.</div><div><br></div><div>Any hints on how I can track =
down the problem would be appreciated. Note that I&#39;m not an expert in P=
ython or how its package management system works. I&#39;m working on a proj=
ect that is dependent on another Python project that depends on argon2-cffi=
.</div><div><br></div><div>I submitted this bug report: <a href=3D"https://=
bugs.busybox.net/show_bug.cgi?id=3D14721">https://bugs.busybox.net/show_bug=
.cgi?id=3D14721</a></div><div><br></div><div>Cheers,</div><div>Emile Cormie=
r<br></div></div>

--000000000000e3651305db64fcfd--

--===============1936575561958430275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1936575561958430275==--
