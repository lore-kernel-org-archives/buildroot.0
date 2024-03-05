Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F119C54E49
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 23:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23D428230D;
	Tue,  5 Mar 2024 23:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P_oHojFMVAcn; Tue,  5 Mar 2024 23:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135E682310
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135E682310;
	Tue,  5 Mar 2024 23:53:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2ECD1BF2C5
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 23:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0B1882310
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 23:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPtyqsNbXkpv for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 23:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93D308230D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D308230D
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93D308230D
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 23:53:06 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso5485014a12.3
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 15:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709682785; x=1710287585;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AoTaZqjmqLpKWTQRecX4Ij/PToKD7xFNGP64d1JRZ+o=;
 b=bwolZwYPn3xLFHHBWrJhuJrIMjH1P9qUpxgL/U4YD9MZ/St77PP9d33ED/qhYMi2TR
 2Cfttp776MQ0f4JiWq3pcPdiXwFtkg3gpHM6BOrzGewqtoIzoxKIzGT/M5DRcrYHoDDI
 E7CqeUKOi++QSrY2JwxQouu9eh7nWY/7p1o323nRHVuMaWRZkYF7wM1XhCp3XAQfQh0K
 /zKthpP8kn0yWpn+Tx7bu9U7W+T84CjgRq+HueUf4F1EAAIzu8+IswndiPFeJtVDkvmi
 8xsK9y6im0Md8AfgZa6EQLtyS99UTBjqQ5B2ZzbrlgeRKSBjQT5pfg9zitjhNj08Uuu5
 bLaA==
X-Gm-Message-State: AOJu0Ywgg5HSlYe3B55Mj7NXNndnOTKh4G0+i0pDOQFyxpQGrZWvfMAr
 +dEtph9pOaZxCKE/mie9+S+zk01f8Ul1aVeHO9xtElGEvr3B461cN3XzYjoWDgS9CaedRxW7ALR
 4Gq+M3EiNwYisr4XypgBzIFigDQMJGjX54f6f0L5IBC6QifZWb50=
X-Google-Smtp-Source: AGHT+IHQJCqQEMO716LcPXBmyhUjqhRmRMoCj6EMSxboq7cNsySFLf0hL9uLFDxJie9G5A1sE1dwtbxRJ3HYKTGWBFw=
X-Received: by 2002:a17:90a:ab06:b0:299:2cba:7588 with SMTP id
 m6-20020a17090aab0600b002992cba7588mr12724182pjq.1.1709682785517; Tue, 05 Mar
 2024 15:53:05 -0800 (PST)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Tue, 5 Mar 2024 18:52:54 -0500
Message-ID: <CAJ6EmCf4nJrk385n6onjMgEDuBUj4x5dXHJ40YTgS1z-pQ+F+w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1709682785; x=1710287585; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AoTaZqjmqLpKWTQRecX4Ij/PToKD7xFNGP64d1JRZ+o=;
 b=XMf8rYXa2edeK1EBMrFAZoN7xk5LfcXYGTVHkLLKB6emCU75L6PZ902p2hVvKKnbwn
 P2sOpqZ9/AEO/ewQDuS+LuHhk8L0jwd4D/J7WHd2G1WMXo49ujNqScvmwEeEOtm8SmrB
 cTdAAcf7TARXaR54Y7qrDKCcwsgH4luOUgH7vriV0nCbxa4YZLndMevKCZx1RJ/DyTDo
 As5gWxcQ0G87nj7Xjv5vEFSC6Mzz8JfPKszoArbmPttwG2RoD654UktZ9dimMZgn3siR
 i4NFgV4lvrlX14UKaM6MIMg1qYiysXa0ddCw/mJO9fwosaeb02ZGtB8Ew4YNbRbFT0d+
 hBWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=XMf8rYXa
Subject: [Buildroot] React app will not start on target (Buildroot version
 2023.11)
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
Content-Type: multipart/mixed; boundary="===============8155643874758551945=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8155643874758551945==
Content-Type: multipart/alternative; boundary="0000000000001c24110612f28b1d"

--0000000000001c24110612f28b1d
Content-Type: text/plain; charset="UTF-8"

I created a testapp using "npx create-react-app".  It runs just fine on my
host system using "npm start".  I cannot get it to work at all on the
target.   Any suggestions would be much appreciated!

 I have the following Buildroot package mk file for the react app:

FRONTENDUI_COMMON_VERSION = 1.0.0
FRONTENDUI_LICENSE = MIT
FRONTENDUI_SITE = ../packages/frontend-ui
FRONTENDUI_SITE_METHOD = local
FRONTENDUI_DEPENDENCIES = nodejs

define FRONTENDUI_TARGET_MKDIR
mkdir -p $(TARGET_DIR)/var/www/frontend-ui/
endef
FRONTENDUI_PRE_INSTALL_TARGET_HOOKS += FRONTENDUI_TARGET_MKDIR

define FRONTENDUI_INSTALL_TARGET_CMDS
cp -rf ../packages/frontend-ui $(TARGET_DIR)/var/www; \
cd $(TARGET_DIR)/var/www/frontend-ui; \
$(HOST_DIR)/bin/npm install
endef

$(eval $(generic-package))


For NPM additional modules, I have the following configured:
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="yarn webpack webpack-cli
create-react-app style-loader escape-unicode"

The output I'm getting on the target is as follows:

# npm start --offline

> frontend-ui@0.1.0 start
> react-scripts start

/var/www/frontend-ui/node_modules/webpack/lib/RuntimeTemplate.js:64
trimmed.match(/^[_\p{L}][_0-9\p{L}]*$/iu) ||
             ^^^^^^^^^^^^^^^^^^^^^^^^^^

SyntaxError: Invalid regular expression: /^[_\p{L}][_0-9\p{L}]*$/iu:
Invalid property name in character class
    at internalCompileFunction (node:internal/vm:73:18)
    at wrapSafe (node:internal/modules/cjs/loader:1153:20)
    at Module._compile (node:internal/modules/cjs/loader:1205:27)
    at Module._extensions..js (node:internal/modules/cjs/loader:1295:10)
    at Module.load (node:internal/modules/cjs/loader:1091:32)
    at Module._load (node:internal/modules/cjs/loader:938:12)
    at Module.require (node:internal/modules/cjs/loader:1115:19)
    at require (node:internal/modules/helpers:130:18)
    at Object.<anonymous>
(/var/www/frontend-ui/node_modules/webpack/lib/Compilation.js:54:25)
    at Module._compile (node:internal/modules/cjs/loader:1241:14)

Node.js v20.9.0

-- 
Patricia A. Holden

--0000000000001c24110612f28b1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I created a testapp using &quot;npx create-react-app&quot;=
.=C2=A0 It runs just fine on my host system using &quot;npm start&quot;.=C2=
=A0 I cannot get it to work at all on the target.=C2=A0 =C2=A0Any suggestio=
ns would be much appreciated!<div><br></div><div>=C2=A0I have the following=
 Buildroot package mk file for the react app:<div><br></div><div>FRONTENDUI=
_COMMON_VERSION =3D 1.0.0<br>FRONTENDUI_LICENSE =3D MIT<br>FRONTENDUI_SITE =
=3D ../packages/frontend-ui<br>FRONTENDUI_SITE_METHOD =3D local<br>FRONTEND=
UI_DEPENDENCIES =3D nodejs<br><br>define FRONTENDUI_TARGET_MKDIR<br>	mkdir =
-p $(TARGET_DIR)/var/www/frontend-ui/<br>endef<br>FRONTENDUI_PRE_INSTALL_TA=
RGET_HOOKS +=3D FRONTENDUI_TARGET_MKDIR<br><br>define FRONTENDUI_INSTALL_TA=
RGET_CMDS<br>	cp -rf ../packages/frontend-ui $(TARGET_DIR)/var/www; \<br>	c=
d $(TARGET_DIR)/var/www/frontend-ui; \<br>	$(HOST_DIR)/bin/npm install<br>e=
ndef<br><br>$(eval $(generic-package))<br><div><br></div><div><br></div><di=
v>For NPM additional modules, I have the following configured:</div><div>BR=
2_PACKAGE_NODEJS_MODULES_ADDITIONAL=3D&quot;yarn webpack webpack-cli create=
-react-app style-loader escape-unicode&quot;<br></div><div><br></div><div>T=
he output I&#39;m getting on the target is as follows:</div><div><br></div>=
<div># npm start --offline<br><br>&gt; frontend-ui@0.1.0 start<br>&gt; reac=
t-scripts start<br><br>/var/www/frontend-ui/node_modules/webpack/lib/Runtim=
eTemplate.js:64<br>		trimmed.match(/^[_\p{L}][_0-9\p{L}]*$/iu) ||<br>		 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^<br>=
<br>SyntaxError: Invalid regular expression: /^[_\p{L}][_0-9\p{L}]*$/iu: In=
valid property name in character class<br>=C2=A0 =C2=A0 at internalCompileF=
unction (node:internal/vm:73:18)<br>=C2=A0 =C2=A0 at wrapSafe (node:interna=
l/modules/cjs/loader:1153:20)<br>=C2=A0 =C2=A0 at Module._compile (node:int=
ernal/modules/cjs/loader:1205:27)<br>=C2=A0 =C2=A0 at Module._extensions..j=
s (node:internal/modules/cjs/loader:1295:10)<br>=C2=A0 =C2=A0 at Module.loa=
d (node:internal/modules/cjs/loader:1091:32)<br>=C2=A0 =C2=A0 at Module._lo=
ad (node:internal/modules/cjs/loader:938:12)<br>=C2=A0 =C2=A0 at Module.req=
uire (node:internal/modules/cjs/loader:1115:19)<br>=C2=A0 =C2=A0 at require=
 (node:internal/modules/helpers:130:18)<br>=C2=A0 =C2=A0 at Object.&lt;anon=
ymous&gt; (/var/www/frontend-ui/node_modules/webpack/lib/Compilation.js:54:=
25)<br>=C2=A0 =C2=A0 at Module._compile (node:internal/modules/cjs/loader:1=
241:14)<br><br>Node.js v20.9.0<br></div><div><br></div><span class=3D"gmail=
_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</di=
v></div></div></div></div>

--0000000000001c24110612f28b1d--

--===============8155643874758551945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8155643874758551945==--
