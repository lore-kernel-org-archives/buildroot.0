Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1D4C433F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 06:10:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3133660231
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 06:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3133660231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4B3C400CF;
	Mon,  1 Nov 2021 06:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjKMVWA2Ephd; Mon,  1 Nov 2021 06:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5BE04022A;
	Mon,  1 Nov 2021 06:10:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F148C1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 06:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB106400CF
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 06:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cC_2maUhstnb for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 06:10:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2D2F4022E
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 06:10:31 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id j28so10960852ila.1
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 23:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :mime-version; bh=iZFDuHwN3ow7qHp7uUHkZvNgBBfva/MMXZniw69B2nw=;
 b=k7mVWljgZ2v/tc6jgUm7PdQeUTV53HHD/11uXPb+rpVRCMFnjJGInYJ96uV1BSD5k6
 /naw2eRMK4ww5c5QYXbUwlSeudoIYtrKozYDOyZFg7zi+NpXK6sJLU3sGWWN8ZDfd6zH
 4nqylCWf3TSHr5tP8WuoE9f3rgQIsMxbM3pHSRdypUkOOSIPoQPM304hCzZWtlDeZ+lM
 IVkSh8FnK4OsqFksXxPZqc05P1sSjnZJa2YuazjtjlVJeMhMkRpDfJHP2mhlNsXKxRZy
 rLthVtDvzlKPfT6IXFqpctIvHWgEcQ+s9SWMHFaD4IjG1LaPPot4Eyux94eVst/5vy/y
 QIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:mime-version;
 bh=iZFDuHwN3ow7qHp7uUHkZvNgBBfva/MMXZniw69B2nw=;
 b=krUVMxQ3oRkPGI4PAOCd6l7D8jyCQtkBjgkUluSn5e2xtOpDY/+wAGAmBYmahYlPZK
 hA6nBZnrRDcbg7U5j2TQS4kzGOp4iThKhxsaaoot+d2kXDWZKhLP0zEa+CqqHP984zJ9
 xQQjqmD8Y9B0SKB2mCuZSLffyqZuj8XEZJYIlcGZzD+lylGT3ssX8bvIIekFn11dlS79
 YggWyThYYR9avIxHn/ldKCD3ix8ReDypZpdogLfKA7c5yJcsfXUzoPx8+7voRbSxI7bJ
 p9muwKBASD9P5l0eJQoBpEYIk7Df5hcu3e4Vg20vhcvxzQs46+qgEM3Y7uSGv2c7KNLk
 4wPA==
X-Gm-Message-State: AOAM531MDLzSmnZ1hlYdmxKZ/3b2x/RywS8E6/exFNq8nkZ4ulnKr0wG
 6klUwlsmmVYXEamHVthw3b4=
X-Google-Smtp-Source: ABdhPJyf2fUwT4a/lo/O53+SWfx7zRoh9eDTQeOlLXW7oo5WpfaTwa9bzqrYmXCX7gsK7UkEeH2kng==
X-Received: by 2002:a05:6e02:18c9:: with SMTP id
 s9mr20060388ilu.213.1635747030706; 
 Sun, 31 Oct 2021 23:10:30 -0700 (PDT)
Received: from BY5PR19MB3668.namprd19.prod.outlook.com
 ([2603:1036:307:4062::5])
 by smtp.gmail.com with ESMTPSA id m2sm2752282iow.6.2021.10.31.23.10.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 Oct 2021 23:10:30 -0700 (PDT)
From: ratbert90 <aduskett@gmail.com>
To: Romain Naour <romain.naour@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
Thread-Index: AXJpLTEyQyh3V1J7iD3can1b6S7Cs8rLc99n
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 1 Nov 2021 06:10:28 +0000
Message-ID: <BY5PR19MB36687517E13A0EE264B37A5FFB8A9@BY5PR19MB3668.namprd19.prod.outlook.com>
References: <20211031224207.1385633-1-romain.naour@gmail.com>
In-Reply-To: <20211031224207.1385633-1-romain.naour@gmail.com>
Accept-Language: en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
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
Cc: Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>
Content-Type: multipart/mixed; boundary="===============3660595457592007745=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3660595457592007745==
Content-Language: it-IT
Content-Type: multipart/alternative;
	boundary="_000_BY5PR19MB36687517E13A0EE264B37A5FFB8A9BY5PR19MB3668namp_"

--_000_BY5PR19MB36687517E13A0EE264B37A5FFB8A9BY5PR19MB3668namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello;

Shouldn=92t this go in systemd.mk?

Adam
________________________________
Da: buildroot <buildroot-bounces@buildroot.org> per conto di Romain Naour <=
romain.naour@gmail.com>
Inviato: Sunday, October 31, 2021 3:42:07 PM
A: buildroot@buildroot.org <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@gmail.com>; Antoine Tenart <atenart@kernel.o=
rg>
Oggetto: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg modu=
le when systemd is enabled

policy/modules/system/systemd.te requires xdg module enabled [1]
otherwise refpolicy fail to build:

policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is no=
t declared' at token ';' on line 508447:

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470

[1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/pol=
icy/modules/system/systemd.te#L288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>
---
 package/refpolicy/refpolicy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.m=
k
index 975c3b584c..b1d101e311 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -69,6 +69,7 @@ REFPOLICY_MODULES =3D \
         sysnetwork \
         unconfined \
         userdomain \
+       $(if $(BR2_PACKAGE_SYSTEMD),xdg) \
         $(PACKAGES_SELINUX_MODULES) \
         $(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES)) \
         $(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
--
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_000_BY5PR19MB36687517E13A0EE264B37A5FFB8A9BY5PR19MB3668namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div>
<div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" d=
ir=3D"ltr">
Hello;</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" d=
ir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" d=
ir=3D"ltr">
Shouldn=92t this go in systemd.mk?</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" d=
ir=3D"ltr">
<br>
</div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" d=
ir=3D"ltr">
Adam</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Da:</b> buildroot &lt;buildroot=
-bounces@buildroot.org&gt; per conto di Romain Naour &lt;romain.naour@gmail=
.com&gt;<br>
<b>Inviato:</b> Sunday, October 31, 2021 3:42:07 PM<br>
<b>A:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Cc:</b> Romain Naour &lt;romain.naour@gmail.com&gt;; Antoine Tenart &lt;=
atenart@kernel.org&gt;<br>
<b>Oggetto:</b> [Buildroot] [PATCH] package/refpolicy: enable refpolicy's x=
dg module when systemd is enabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">policy/modules/system/systemd.te requires xdg modu=
le enabled [1]<br>
otherwise refpolicy fail to build:<br>
<br>
policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is no=
t declared' at token ';' on line 508447:<br>
<br>
Fixes:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468">ht=
tps://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468</a><br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470">ht=
tps://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470</a><br>
<br>
[1] <a href=3D"https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_2=
0210908/policy/modules/system/systemd.te#L288">
https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/=
modules/system/systemd.te#L288</a><br>
<br>
Signed-off-by: Romain Naour &lt;romain.naour@gmail.com&gt;<br>
Cc: Antoine Tenart &lt;atenart@kernel.org&gt;<br>
---<br>
&nbsp;package/refpolicy/refpolicy.mk | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.m=
k<br>
index 975c3b584c..b1d101e311 100644<br>
--- a/package/refpolicy/refpolicy.mk<br>
+++ b/package/refpolicy/refpolicy.mk<br>
@@ -69,6 +69,7 @@ REFPOLICY_MODULES =3D \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysnetwork \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unconfined \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; userdomain \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(if $(BR2_PACKAGE_SYSTEMD),xdg) \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(PACKAGES_SELINUX_MODULES=
) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(call qstrip,$(BR2_REFPOL=
ICY_EXTRA_MODULES)) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(foreach d,$(REFPOLICY_EX=
TRA_MODULES_DIRS),\<br>
-- <br>
2.31.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
buildroot@buildroot.org<br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">https://=
lists.buildroot.org/mailman/listinfo/buildroot</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BY5PR19MB36687517E13A0EE264B37A5FFB8A9BY5PR19MB3668namp_--

--===============3660595457592007745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3660595457592007745==--
