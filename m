Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB5CE7737A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E750941DE1;
	Sat, 30 Sep 2023 16:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E750941DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwaVdd9hR8eo; Sat, 30 Sep 2023 16:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4C041E2C;
	Sat, 30 Sep 2023 16:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4C041E2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63FB11BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC8360F66
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC8360F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csmlJdUveYXZ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:41:19 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D56F960F27
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56F960F27
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2c008042211so244967701fa.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696092076; x=1696696876;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qI/hnNScI5Mol7BG514XhwVtM612Fgy2xCIo0ku1TfY=;
 b=d6zdfhW/HliDPSy0iZ3/wGtRz1U227OTs1PjRH9LS8QlDsyTuPn5W4XlJd/2IZjrX2
 Bd7LeQyQI/atiekqFGrosilgxMQ1UsSTTyCZANUY/7mdT49VkYSTYKf54GmQWw+MWeAq
 w9clW75GZa0LuuSieZwDPBUp9lq+fTXDfImiUxtHIc0TliN1OZnpPcNp0d56KtO864qG
 g2YucOKStq6NNig7dpU5af+baXg4N+L+MzZdH5cBwf4DNoFnQJQn9mZdZY74BqWPAfvz
 SvuOxX4eWQZMGeUjTDHcbVYW4QS8qMOzi4uGf6mQCrXsjYSBUvlnQWy7X74v6gqseynS
 Xbsg==
X-Gm-Message-State: AOJu0Yyv+W7leRBBEtLzE7vTQ5fohkYPnyhG9UqUOR9NCFK9bAfyFe8J
 5yIedzsvSzB6SplnhcUxDJGNsFMKfUg=
X-Google-Smtp-Source: AGHT+IGNFGx1+YSlxblQbiEfI4OhhwknpnIlNh5W9MzxLsk7BHBYZe2KNe1JUy7fOA8arJaUCFwKzA==
X-Received: by 2002:a2e:88cf:0:b0:2b6:ea3b:f082 with SMTP id
 a15-20020a2e88cf000000b002b6ea3bf082mr6730374ljk.38.1696092076050; 
 Sat, 30 Sep 2023 09:41:16 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 d21-20020a2e8915000000b002c00c076840sm4561960lji.133.2023.09.30.09.41.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 09:41:15 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so23418896e87.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:41:15 -0700 (PDT)
X-Received: by 2002:a19:ee12:0:b0:503:cca:e52f with SMTP id
 g18-20020a19ee12000000b005030ccae52fmr5807032lfb.51.1696092075686; Sat, 30
 Sep 2023 09:41:15 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 30 Sep 2023 18:41:04 +0200
X-Gmail-Original-Message-ID: <CACXRmJgnxXirm83N6AV0qmzHiEO_xwZfmaE-jrE08dQERgucaA@mail.gmail.com>
Message-ID: <CACXRmJgnxXirm83N6AV0qmzHiEO_xwZfmaE-jrE08dQERgucaA@mail.gmail.com>
To: 20230413142927.3137190-1-aperez@igalia.com, 
 Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Subject: [Buildroot] Fwd: package/webkitgtk: allow both X11 and Wayland
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
Content-Type: multipart/mixed; boundary="===============0163119507387522272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0163119507387522272==
Content-Type: multipart/alternative; boundary="000000000000ad81a606069635b7"

--000000000000ad81a606069635b7
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,


This patch has been merged and can be dropped from patchwork:
https://patchwork.ozlabs.org/project/buildroot/patch/20230413142927.3137190-1-aperez@igalia.com/

Merged in commit:
https://github.com/buildroot/buildroot/commit/a23251d3f738b44eab40375fc8822e0358d70517

Note that the added -DENABLE_GLES2 flag is in the meantime dropped in
webkitgtk 2.42, see my new bump series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=375404

I also explicitly added the -DUSE_OPENGL_OR_ES flag since it depends on
GLES and EGL which is not necessarily selected for X11.

Kr,

Thomas Devoogdt

--000000000000ad81a606069635b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Adrian,<div dir=3D"auto"><br></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">This patch has been merged and can be dropped fr=
om patchwork:=C2=A0</div><div dir=3D"auto"><a href=3D"https://patchwork.ozl=
abs.org/project/buildroot/patch/20230413142927.3137190-1-aperez@igalia.com/=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs.=
org/project/buildroot/patch/20230413142927.3137190-1-aperez@igalia.com/</a>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Merged in commit:</div>=
<div dir=3D"auto"><a href=3D"https://github.com/buildroot/buildroot/commit/=
a23251d3f738b44eab40375fc8822e0358d70517" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://github.com/buildroot/buildroot/commit/a23251d3f738b4=
4eab40375fc8822e0358d70517</a><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Note that the added -DENABLE_GLES2 flag is in the meantime dropp=
ed in webkitgtk 2.42, see my new bump series:</div><div dir=3D"auto"><a hre=
f=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D375404" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs.or=
g/project/buildroot/list/?series=3D375404</a><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I also explicitly added the -DUSE_OPENGL_OR_ES fl=
ag since it depends on GLES and EGL which is not necessarily selected for X=
11.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Thomas Devoogdt=C2=A0</div></div>

--000000000000ad81a606069635b7--

--===============0163119507387522272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0163119507387522272==--
