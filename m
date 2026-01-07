Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23788CFD63A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 13:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D10C76067F;
	Wed,  7 Jan 2026 13:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeESiPeThCYx; Wed,  7 Jan 2026 13:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF84C60604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794154;
	bh=/JAB7I+Odq243jy1WEq0MtfKI0GyYVUNtfyavuVoAhg=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PI0hyUFfOaM5tOxXg5XZ7Z5RKnImbK9WfuUdvgP2TBPDgq+gCWAbuFyuFFc/oORL9
	 cgrJbuR2TRMuVzZTDyfdCME+rq7Z6/G6xF8lyyX4MHTiVsO937EePcfwbCv6iRbTEn
	 PwUkk6jXGp2jVTwhCWqcPv4bDEcbLZSFZ3xO6r2dmZldoQx4ABaoFwcdfchyjs85NA
	 iXZtWzekmj9uKejJqzBrU1NRLftTBMf0rPfRgvCiq6Gm/nIxs9TDMI/pPVr/S+JP5P
	 4Azw5nf07H0GBDfnA+YebesTnST7AX1mYxuITSu3vG+nH32FCaIGS1UebKkyxtphoB
	 EEl+HO5r5gnNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF84C60604;
	Wed,  7 Jan 2026 13:55:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B5AC970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8207A8096C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 13:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTEgVk2gtJFy for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 13:55:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=umbramalison@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68DF7808C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68DF7808C0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68DF7808C0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 13:55:51 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4eda26a04bfso22362981cf.2
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 05:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767794150; x=1768398950;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o+a9Ap36X0Qdl4FpCWr0JcC2sElGd5u3WL2pCv7Ywsc=;
 b=GmgRmDN6HYtIE1tSaGypmVqwRFhsZqzTVZ8QHVnjIggmEnnsMm5aHAKvWOQFyjCT9d
 l4tRWdht5zZQ31TSxQAhIdWiWB9ZJBtjUo/Yxat0nXHEh7rBl/vM11ziKEKA24Wex2fX
 bqQRR76S7CTv9P5lltcRtCGm6I4loplOBXW+EdZLsrENgYlPjOf2QCAKZ7S74cEOoF5q
 IkIYXwUHZ/EPItWR1Bf6Bvh4m+yQ+AAVO8IiGiGhc8q3vLGV0Vbp/BXfktPtwBJC6/I3
 Th0bqi/6NqZ3c/m0iEQc5KUc60pbHBIluMLOGqiSTXhznhC3D0NXN9yxJfmvbg2SWigJ
 VxEw==
X-Gm-Message-State: AOJu0YwtXUVqvN18h7fbABLan4ZCjcsqc4+DovHhpN6j3/GSNeN584FU
 fTY1zMmXagvUuihfC+MFHvsnGJ0/c9Ze5dK9/nzG6Am2jZfOwlaWD2QbRQgiMjoRbvRzKLumyqu
 X1r64N80nVjPHaoDHobyJG5tDgghOsQoPWHiXOGc=
X-Gm-Gg: AY/fxX5Um33rFMyAaXChE4o7UpB3l1mm+6w8vJQHG5YDtxZwIIbACgAIMX/Jl3osGUV
 S1BLx7W4o9+EpoUScXtMxKNQ5TjL6AvMDRUYtwUirYlDUXVcSKUA8seQqswcrHRLDG5g5rGVoGe
 qrnHvsTQH3yUoYTZtraVYq5DBb3u+mIBVbbK1i7FRa5B9H2PePLM9Nv181jJpZ2jad4D/tM+C2Y
 rdU1qlEvnwrQ1Db1qzJnd9Cykg4cotMCJt6fcms0eO3d96zDi73yOUFBKw/4tQgK7YcQA==
X-Google-Smtp-Source: AGHT+IHChE/00ya7cbBE3p0+6ktnCVY56FNEIuTFu4rwecyQnDvYv7Pa/7xAQ1y8fdsyYkPbST0C1M048WdeiVSMBcI=
X-Received: by 2002:a05:622a:4011:b0:4ee:13dc:1055 with SMTP id
 d75a77b69052e-4ffb48bbb5emr28041941cf.3.1767794149706; Wed, 07 Jan 2026
 05:55:49 -0800 (PST)
MIME-Version: 1.0
From: Andrew Barnes <umbramalison@gmail.com>
Date: Wed, 7 Jan 2026 13:55:38 +0000
X-Gm-Features: AQt7F2rB3Ie-XAc40-BJ4o8nAdSerjNVqWLEdSzNbcNIEf0hqJLghlmtLoziuHA
Message-ID: <CAKJ_wKQYgGt=tgPX3oJa58890zx2Yhza2r0ZmtDc_Mp0nz+F+A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767794150; x=1768398950; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o+a9Ap36X0Qdl4FpCWr0JcC2sElGd5u3WL2pCv7Ywsc=;
 b=G8M4TbmzWDfjCr+VWZItcMvuQl+cDJgJJaFeLqLUi9qPsYY9pqh08gAmEnBAsYVjvZ
 eC8+/QlVjzloI2OxqDsUE1ZvBOQK6sLGuSB3+7Ii7uvnIffQkXprLJzJqNQEQdPnnVIS
 hLyram7e0M/6STWNAnAHhR/sAFNDlU7XIFyJJ38/o3wh6RO+hYgENouuG0pvp/Z5nd68
 hR2/Ge04mSRge69oviqN37jKtYct3uR7diZxM81VqKjxg1GCh6lT936Z/RuLTdDknhff
 qryjIeO0LaiITYxVitGYorVwIeIIQxEGCGFZI2soOrhivWTQy4igxMr0LH8Pl4Dn4E0m
 jwSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G8M4Tbmz
Subject: [Buildroot] External BR overriding upstream packages
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
Content-Type: multipart/mixed; boundary="===============2208882117234228291=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2208882117234228291==
Content-Type: multipart/alternative; boundary="00000000000054501f0647cca659"

--00000000000054501f0647cca659
Content-Type: text/plain; charset="UTF-8"

External BR projects can curate their own packages, but they can't easily
modify a package if it already exists upstream.

Ideally such modifications should be made to buildroots package and
upstreamed.
but if the modification is not to be accepted upstream, then we need
another way.

Real examples for just one project i'm working on:
1. downgrade libinput version (Touch screen doesn't work with later
versions, pending investigation)
2. mesa3d - enable legacy api for wpewebkit/cog (wpewebkit will be adopting
the new mesa3d api soon)
3. odd fix for getting QT6 to compile (raised already in mailing list,
could be an upstream patch)
4. complete instrumentation of wpewebkit options (unsure if is worth
upstreaming, will discuss it later)

All these changes can be managed as patches that are applied ontop of BR,
once the changes stablise that can work too.

However, in an IRC discussion, I suggested it could be that BR allows
duplicate packages, and uses the version from the external project instead
of the internal one.

here is a patch to do that:

diff --git a/Makefile b/Makefile
index ff25027c13..efb577b2b2 100644
--- a/Makefile
+++ b/Makefile
@@ -532,7 +532,11 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
 -include $(PACKAGE_OVERRIDE_FILE)
 endif

-include $(sort $(wildcard package/*/*.mk))
+EXTERNAL_PACKAGE_MKS = $(foreach dir,$(BR2_EXTERNAL_DIRS),$(wildcard
$(dir)/package/*/*.mk))
+EXTERNAL_PROVIDED_PACKAGES = $(sort $(notdir $(patsubst %/,%,$(dir
$(EXTERNAL_PACKAGE_MKS)))))
+BUILTIN_PACKAGE_MKS = $(filter-out $(addprefix package/,$(addsuffix
/%,$(EXTERNAL_PROVIDED_PACKAGES))),$(sort $(wildcard package/*/*.mk)))
+
+include $(BUILTIN_PACKAGE_MKS)

 include boot/common.mk
 include linux/linux.mk


Happy to turn this into a proper patch email, I haven't done that this time
because I think it's more for interest than a serious suggestion.

Kind regards,

Andy

--00000000000054501f0647cca659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">External BR projects can curate their own packages, but th=
ey can&#39;t easily modify a package if it already exists upstream.<br><br>=
Ideally such modifications should be made to buildroots package=C2=A0and up=
streamed.<br>but if the modification is not to be accepted upstream, then w=
e need another way.<br><br>Real examples for just one project i&#39;m worki=
ng on:<br>1. downgrade libinput version (Touch screen doesn&#39;t work with=
 later versions, pending investigation)<div>2. mesa3d - enable legacy api f=
or wpewebkit/cog (wpewebkit will be adopting the new mesa3d api soon)</div>=
<div>3. odd fix for getting QT6 to compile (raised already in mailing list,=
 could be an upstream patch)</div><div>4. complete instrumentation of wpewe=
bkit options (unsure if is worth upstreaming, will discuss it later)<br><br=
>All these changes can be managed as patches that are applied ontop of BR, =
once the changes stablise that can work too.=C2=A0<br><br>However, in an IR=
C discussion, I suggested it could be that BR allows duplicate packages, an=
d uses the version from the external project instead of the internal one.<b=
r><br>here is a patch to do that:<br><br>diff --git a/Makefile b/Makefile<b=
r>index ff25027c13..efb577b2b2 100644<br>--- a/Makefile<br>+++ b/Makefile<b=
r>@@ -532,7 +532,11 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)<br>=C2=A0-include =
$(PACKAGE_OVERRIDE_FILE)<br>=C2=A0endif<br>=C2=A0<br>-include $(sort $(wild=
card package/*/*.mk))<br>+EXTERNAL_PACKAGE_MKS =3D $(foreach dir,$(BR2_EXTE=
RNAL_DIRS),$(wildcard $(dir)/package/*/*.mk))<br>+EXTERNAL_PROVIDED_PACKAGE=
S =3D $(sort $(notdir $(patsubst %/,%,$(dir $(EXTERNAL_PACKAGE_MKS)))))<br>=
+BUILTIN_PACKAGE_MKS =3D $(filter-out $(addprefix package/,$(addsuffix /%,$=
(EXTERNAL_PROVIDED_PACKAGES))),$(sort $(wildcard package/*/*.mk)))<br>+<br>=
+include $(BUILTIN_PACKAGE_MKS)<br>=C2=A0<br>=C2=A0include boot/<a href=3D"=
http://common.mk">common.mk</a><br>=C2=A0include linux/<a href=3D"http://li=
nux.mk">linux.mk</a><br></div><div><br></div><div><br></div><div>Happy to t=
urn this into a proper patch email, I haven&#39;t done that this time becau=
se I think it&#39;s more for interest than a serious suggestion.=C2=A0<br><=
br>Kind regards,<br><br>Andy</div></div>

--00000000000054501f0647cca659--

--===============2208882117234228291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2208882117234228291==--
