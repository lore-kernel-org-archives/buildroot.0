Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BD4C05027
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F1E140B6E;
	Wed, 15 Feb 2023 00:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1E140B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aor_9sMLIr3j; Wed, 15 Feb 2023 00:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69AC94052F;
	Wed, 15 Feb 2023 00:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69AC94052F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD95C1BF94D
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 00:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4E754091F
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 00:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E754091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkqFFe4NTMHk for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 00:10:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06B5408F0
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D06B5408F0
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 00:10:39 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-52eb7a5275aso219341767b3.2
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 16:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=25CJS3ULvqpOGBVbKsAZhp3nryg4p9fCOvEkDThGcQU=;
 b=7afhP+Vbo+ng3ZkFiOoKkVuf/JB0nMRwkSLbCBf8pgch5tmHWaBRUUUUEcnbJGwU8E
 2K7dXswqasVquVFeuaj61MxcqnseWBbZP4QrQNEdhW3v3VrLnyrBk1AL8TiH6At+5Hn9
 eOoAdwEo7WdZsFOgGof7ZMC8stwpvxS2xXU77KWhsjABnqDT+jg9B4ZJ70ze6zBSKNvU
 EoQHpA/VoE5rUf6Z4L1zlfK4eYK0fsPswSaJD3Mzud3FxFGfhv2xylTvlogFqHF0hsRB
 7X5uZvF45xcz63W+KlThCNCZb7cidpUurPOUvQsvxNBonfUcl3jLD/SGIcm0wzzYbL/Q
 YaAw==
X-Gm-Message-State: AO0yUKWD1hu3BfdptVOeVVSv2PMU/s1VB3NKngZdPX/lMNxGH9ciK8OY
 5tY4xDlsjL8+94Y1zrdlnk6RSd+JVxTBkTx58wBheNTdvDuSbg==
X-Google-Smtp-Source: AK7set86wow/KK20bJzc8wAd9T5pqGpij73hV8eSRQniW04qcQnFpOj4GfkTifDCbMXQFNDuHQB47dCjLd2gE1BjDEM=
X-Received: by 2002:a81:a212:0:b0:46a:cb68:9add with SMTP id
 w18-20020a81a212000000b0046acb689addmr60502ywg.102.1676419838554; Tue, 14 Feb
 2023 16:10:38 -0800 (PST)
MIME-Version: 1.0
From: Cem Sezer <cps@microplex.com>
Date: Tue, 14 Feb 2023 16:10:28 -0800
Message-ID: <CACw=RXJvPxp4-z1JkH33ZBpGNEo37hQXnZTfyyeqVGiqXbYEqw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microplex.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=25CJS3ULvqpOGBVbKsAZhp3nryg4p9fCOvEkDThGcQU=;
 b=jgaDC6IBzel4gyoTybYpGLCTWshJ7OqZqEOHkxb7rOFzvFRNXl+sjJ/86nagmUUore
 jkgR1TZmGI38M3D00xVCpety62dsM97BH+Yd5H37irO33M/6JFCGMeZuKp11FhY09BtD
 0IUX8bWKUbcX02ij6CCh9WIb14Yn+eT9Pj+BP19dHkSiHJNIfnBfQ6fa0vGxoy98UzRp
 cHY276yH6NjoiTF4tIckCc468BQe2CQvxZSqFQRgvlxFBRvfwfIKECXZ+ycWNFFDewZV
 PxUCiTWmLzCBComKkYDKXjNQKkYzezzw7o33hJ51P8tCtW9u7M8xUoLNPIcqQzvJcaLw
 mgcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microplex.com header.i=@microplex.com
 header.a=rsa-sha256 header.s=google header.b=jgaDC6IB
Subject: [Buildroot] Having trouble getting a simple cmake based custom
 package to work
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
Content-Type: multipart/mixed; boundary="===============8574478768861889798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8574478768861889798==
Content-Type: multipart/alternative; boundary="000000000000f8caa905f4b1e8de"

--000000000000f8caa905f4b1e8de
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm looking to continue this thread as I have the exact same problem.

http://lists.busybox.net/pipermail/buildroot/2020-August/591250.html

The latest entry in the thread is the following, discussing the error
message "*No rule to make target 'install/fast': *is where I'm stuck at the
moment:

>* However, when it is
*>* trying to install my package I have a new error. The system seems to be
*>* looking for a install/fast target, which the Makefil does not have.
*
I have no idea on that problem.  Maybe read the CMake docs again?
https://cmake.org/cmake/help/latest/command/install.html

Greets
Alex

I am still new to cmake, but I've been having trouble getting a basic
helloworld (in C) cmake package to work. I looked at that link above
for the cmake docs, but am unfamiliar with what I need to do here. My
CMakeLists.txt right now is just the following:

cmake_minimum_required(VERSION 3.1.0)

project(helloworld_c_cmake LANGUAGES C)

set(SOURCES main.c)

add_executable(${PROJECT_NAME} ${SOURCES})


Any pointers in the right direction would be appreciated. Perhaps this
is more of a cmake question than a buildroot question, but tying the
two together has been confusing, and I'm sure it must be something
simple. Thanks in advance,

Cem

--000000000000f8caa905f4b1e8de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><div><br></div><div>I&#39;m looking t=
o continue this thread as I have the exact same problem.=C2=A0</div><div><b=
r></div><a href=3D"http://lists.busybox.net/pipermail/buildroot/2020-August=
/591250.html" target=3D"_blank">http://lists.busybox.net/pipermail/buildroo=
t/2020-August/591250.html</a><br><div><br></div><div>The latest entry in th=
e thread is the following, discussing the error message &quot;<i style=3D"c=
olor:rgb(0,0,0);white-space:pre-wrap">No rule to make target &#39;install/f=
ast&#39;: </i>is where I&#39;m stuck at=C2=A0the moment:=C2=A0</div><div><b=
r></div><div><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)">&gt;<i> H=
owever, when it is
</i>&gt;<i> trying to install my package I have a new error. The system see=
ms to be
</i>&gt;<i> looking for a install/fast target, which the Makefil does not h=
ave.
</i>
I have no idea on that problem.  Maybe read the CMake docs again?

<a href=3D"https://cmake.org/cmake/help/latest/command/install.html" target=
=3D"_blank">https://cmake.org/cmake/help/latest/command/install.html</a>

Greets
Alex</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><span style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;white-space:=
normal">I am still new to cmake, but I&#39;ve been having trouble getting a=
 basic helloworld=C2=A0(in C) cmake package to work. I looked at that link =
above for the cmake docs, but am unfamiliar with what I need to do here. My=
 CMakeLists.txt right now is just the following:<br><br></span>cmake_minimu=
m_required(VERSION 3.1.0) <br><br>project(helloworld_c_cmake LANGUAGES C)<b=
r><br>set(SOURCES main.c)<br><br>add_executable(${PROJECT_NAME} ${SOURCES})=
</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><br></pre><pre s=
tyle=3D"white-space:pre-wrap;color:rgb(0,0,0)"><span style=3D"color:rgb(34,=
34,34);font-family:Arial,Helvetica,sans-serif;white-space:normal">Any point=
ers in the right direction would </span><font face=3D"arial, sans-serif"><s=
pan style=3D"color:rgb(34,34,34);white-space:normal">be appreciated</span><=
span style=3D"color:rgb(34,34,34);white-space:normal">. P</span>erhaps this=
 is more of a cmake question than a buildroot question, but tying the two t=
ogether has been confusing, and I&#39;m sure it must be something simple.=
=C2=A0Thanks in advance,=C2=A0</font></pre><pre style=3D"white-space:pre-wr=
ap;color:rgb(0,0,0)"><span style=3D"color:rgb(34,34,34);font-family:Arial,H=
elvetica,sans-serif;white-space:normal">Cem</span></pre><pre></pre><br></di=
v></div>

--000000000000f8caa905f4b1e8de--

--===============8574478768861889798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8574478768861889798==--
