Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70272C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 07:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E229C607B1;
	Sat, 31 May 2025 07:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCUzkK0vvTXf; Sat, 31 May 2025 07:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C4A60728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C4A60728;
	Sat, 31 May 2025 07:45:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD4F127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 07:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E962400EA
 for <buildroot@buildroot.org>; Sat, 31 May 2025 07:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qs4ktJ28vvvc for <buildroot@buildroot.org>;
 Sat, 31 May 2025 07:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.177;
 helo=mail-lj1-f177.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01C9E400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01C9E400A1
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01C9E400A1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 07:45:22 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30c416cdcc0so24587361fa.2
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748677520; x=1749282320;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ho/sNknfnbxkVoT/CnDwhGFrU8172gfjmLE7nfwQTM0=;
 b=PkWEWp7xAJHH492nBFnalODlvygqqBT7H3AZlyHowPSWgRbXz46xzKmlPIha2K8j8M
 coZaBKv6GBL87E8aZKm4SoeRc/hWFB3z+n4OotPvzvPLEMOEc3OLXmwvvIwLR80qy/3u
 vzNMsKiFGm+pTeSV2/Boq3dWk3/im7Pc+oa2s4l5K6zXfJg3KVC0bj/TjZrDDFL0r0uv
 gSxQonGUTVqr45XpgVw6U0kShJwsO2z0O4DTJtT3Fob7D8dAoBwQHqXtKCqLoXvAq4ky
 oSAqPQYDVWum/gZ44+fLOkrsTpBMi8rcUsFG7nXyoE8oo+5XmiCTNl8fAL4sgfB5izDS
 mxdQ==
X-Gm-Message-State: AOJu0YzLo/3YcTRePeDEwVg+8/J4VDP2tmX0KFD0x7/WxCJbiSnMCx7I
 sGm5/gfppkg9GRIzFYOWImuGJfrZ5esnWyA0UCMjTizCNuer2x2Lk+OUrhRn/j8C
X-Gm-Gg: ASbGncuj6HhNTbmuzbdCJH0JZJeu745iRdcLzxW1Qm7pD5WwIv7pncjjlOcoUiBKZG1
 s0X007locvZcqwSheKfpNkPQmAtduFIN0X+2XhkudKcH5nx+kjOUOAcBFNjl0vD8eE8qIQAy1e3
 MQOYvSZYAaE8x9U6af1IwbaJ/GHyTjx4Wy+eM9WMQstCpNuBSU0K7s1cMLa+571YMwZRGCVUTGO
 P2WUECPCX5s7O9iR1fgB68lw8pzdOYIS1t9aopRpvh8NG988R7701hAovBZFszBmfoQJ7mxPxYy
 I0yszH9q1Y+zswB1CQYCUJ02VnTKvXDMgFOMiP+98V4T7q5HYhk+Y48D3MslA9Zp3RUr1Z5Kz8b
 hfxJYaQo/HyCKK8Z93gNUR/foW/s=
X-Google-Smtp-Source: AGHT+IFLpbA1dhfDNOcjKQH6KmbjR+oif8V5L9/DixVI0aG0NX6E3hqIVAu/0Qxz8mwIHEjfua4GpQ==
X-Received: by 2002:a2e:b8ca:0:b0:32a:8c7a:832b with SMTP id
 38308e7fff4ca-32a90647128mr19050041fa.4.1748677519955; 
 Sat, 31 May 2025 00:45:19 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bc5044sm8450851fa.80.2025.05.31.00.45.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 May 2025 00:45:19 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30effbfaf4aso27982711fa.3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:45:19 -0700 (PDT)
X-Received: by 2002:a05:651c:543:b0:32a:648e:7ee3 with SMTP id
 38308e7fff4ca-32a907a68bemr19542011fa.25.1748677519248; Sat, 31 May 2025
 00:45:19 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 31 May 2025 09:45:07 +0200
X-Gmail-Original-Message-ID: <CACXRmJjfEMb4zGfoWxbDLsV4aw7a3cp+PiJXRuE9kdfKYUmOcQ@mail.gmail.com>
X-Gm-Features: AX0GCFu2R98_JnkUgygZjSyt_jC8yXMjiYlcKsCqgAK8CUr2PHKFxAnteAY0Y_k
Message-ID: <CACXRmJjfEMb4zGfoWxbDLsV4aw7a3cp+PiJXRuE9kdfKYUmOcQ@mail.gmail.com>
To: stefan.nickl@gmail.com
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
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
Content-Type: multipart/mixed; boundary="===============0014794339950572496=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0014794339950572496==
Content-Type: multipart/alternative; boundary="0000000000005c9386063669b62a"

--0000000000005c9386063669b62a
Content-Type: text/plain; charset="UTF-8"

Hi,


>> The main advantage is that it also works for private GitHub repositories
after logging in with "gh auth login".

If you have to call "gh auth login" on your server, why don't you call "gh
auth setup-git". This command will register a helper script to your global
git configuration, doing exactly what you want. Namely adding the relevant
headers to your git https calls.

https://cli.github.com/manual/gh_auth_setup-git


Kr,

Thomas Devoogdt

--0000000000005c9386063669b62a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">&gt;&gt; The main advantage is that it also works for p=
rivate GitHub repositories after logging in with &quot;gh auth login&quot;.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you have to call &qu=
ot;gh auth login&quot; on your server, why don&#39;t you call &quot;gh auth=
 setup-git&quot;. This command will register a helper script to your global=
 git configuration, doing exactly what you want. Namely adding the relevant=
 headers to your git https calls.=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><a href=3D"https://cli.github.com/manual/gh_auth_setup-git"=
>https://cli.github.com/manual/gh_auth_setup-git</a></div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,=C2=A0</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thomas Devoogdt=C2=A0</div></div=
>

--0000000000005c9386063669b62a--

--===============0014794339950572496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0014794339950572496==--
