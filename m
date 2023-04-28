Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966ECC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E07A420E6;
	Fri, 28 Apr 2023 15:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E07A420E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BptxsB2ueVTu; Fri, 28 Apr 2023 15:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0022F42128;
	Fri, 28 Apr 2023 15:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0022F42128
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 468A01BF57B
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 15:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C96442A03
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 15:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C96442A03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYpW1sCBvLS3 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 15:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F54C400B9
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F54C400B9
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 15:25:35 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-54fb9384c2dso119450527b3.2
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 08:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682695534; x=1685287534;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ws0YQaivcEpSxzq5STeehhNHZTPpIp2RGGJZCyaaIsI=;
 b=US26c9v6WwVciFkM4POQUwMcaCYPgmXOhd+aLzde2GK9CkFUe+FvG4j6wOe8m6Sq+q
 mc5mpyt2sMHfCOWoeTz4K+25R92I/LESFjRax8RpFABSZ8XR4w0qMY+T9a5aPNRu07rU
 EWQU29bYdn0IZSZI2wH6EZpllLf7eV/1Qn+o74aTSuSLczS8y3zNYpCCGRKIKethlYM1
 5SNyhf192irAq4KQgvi+zF3q9l+6s68GBWrnC+67stBnSgO6x8k64kojV7fB9tqa/iu/
 Ogt7rA7Xbs2cbR5dyHTuzk8TfwdZgJTEeXkLatJYNyyhQomkkQ8KmItsCBbHMj1Cx1rg
 F8zg==
X-Gm-Message-State: AC+VfDyxGup2ZpSnEk06yax2yaoGlkGLMAcIfmW1N9fHf0V3kVug3E2n
 tA68kyAqYLbHwZVX1I/r9HcHxqCWrOmbR/JdBifjy1T8gz0WnPlQqBwV
X-Google-Smtp-Source: ACHHUZ7GXnl7hCBx3e5LCNkJ2qKg/l5EP5/PE2N2q2s3ZWs1GPy9RrLFrXeZnkH1jTn4pFFnmq2W5xvpB7osDYm7xfQ=
X-Received: by 2002:a81:530a:0:b0:552:a0fc:6827 with SMTP id
 h10-20020a81530a000000b00552a0fc6827mr3749279ywb.52.1682695534292; Fri, 28
 Apr 2023 08:25:34 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 Apr 2023 11:25:23 -0400
Message-ID: <CAOSAz36QEnWSGBW__+GanpD4C==z+uQ+4LW7VCKXTpaO-9XBmg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sense.com; s=google; t=1682695534; x=1685287534;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ws0YQaivcEpSxzq5STeehhNHZTPpIp2RGGJZCyaaIsI=;
 b=X/wCCdBG8xdFOUBuwba5/iTpeJKY1PNlcfvMOidca9VP91LwNUpaa2womoToxX2ACI
 Bc2I43VcflFqg52f6KvST80Ut3070nOw76/2VolgpsjWUiGZuFmL5Cponvx6pYmsaohX
 KTBDkbfLbvHbiz6GCMaFMDBOhWc7ILP+4vb2M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=sense.com header.i=@sense.com
 header.a=rsa-sha256 header.s=google header.b=X/wCCdBG
Subject: [Buildroot] libopenssl CVEs
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
From: Matt Casperson via buildroot <buildroot@buildroot.org>
Reply-To: Matt Casperson <matt.casperson@sense.com>
Content-Type: multipart/mixed; boundary="===============4643302545943012298=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4643302545943012298==
Content-Type: multipart/alternative; boundary="000000000000964be905fa6715a4"

--000000000000964be905fa6715a4
Content-Type: text/plain; charset="UTF-8"

Based on
https://lore.kernel.org/buildroot/20230424053608.ADC944058F@smtp2.osuosl.org/
I see a few libopenssl vulnerabilities and I was curious if there were any
plans to provide a patch in an upcoming release. I did review Chapter 24 in
the User Manual and other sections on patches but wasn't able to find
anything specific on patching timelines. Or if you have a general approach
to libopenssl that would also be good to know for future reference. I'm new
to buildroot so apologies if I'm stumbling around here.

Matt
-- 

*Matt Casperson*

Security Architect

603.781.3733

<https://sense.com/>
<http://facebook.com/sense> <https://twitter.com/sense>
<https://www.linkedin.com/company/sense>
--
This email, and any attachments are strictly confidential and intended for
the addressee(s) only. The content may also contain legal, professional or
other privileged information. If you are not the intended recipient, please
notify the sender immediately and then delete the e-mail and any
attachments. You should not disclose, copy or take any action in reliance
on this transmission.

--000000000000964be905fa6715a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Based on=C2=A0<a href=3D"https://lore.kernel.org/buildroot=
/20230424053608.ADC944058F@smtp2.osuosl.org/">https://lore.kernel.org/build=
root/20230424053608.ADC944058F@smtp2.osuosl.org/</a> I see a few libopenssl=
 vulnerabilities and I was curious if there were any plans to provide a pat=
ch in an upcoming release. I did review Chapter 24 in the User Manual and o=
ther sections on patches but wasn&#39;t able to find anything specific on p=
atching timelines. Or if you have a general approach to libopenssl that wou=
ld also be good to know for future reference. I&#39;m new to buildroot so a=
pologies if I&#39;m stumbling around here.=C2=A0<div><br></div><div>Matt<br=
><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
p style=3D"color:rgb(34,34,34);line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"color:rgb(153,153,153);font-family:Arial;font-size:10=
pt;white-space:pre-wrap"><b>Matt Casperson</b></span></p><p style=3D"color:=
rgb(34,34,34);line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"color:rgb(153,153,153);font-family:Arial;font-size:10pt;white-space:pr=
e-wrap">Security Architect</span><br></p><p dir=3D"ltr" style=3D"color:rgb(=
34,34,34);line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:10pt;font-family:Arial;color:rgb(153,153,153);vertical-align:bas=
eline;white-space:pre-wrap">603.781.3733</span></p><p dir=3D"ltr" style=3D"=
color:rgb(34,34,34);line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a h=
ref=3D"https://sense.com/" target=3D"_blank"><span style=3D"font-size:10pt;=
font-family:Arial;color:rgb(17,85,204);vertical-align:baseline;white-space:=
pre-wrap"><span style=3D"border:none;display:inline-block;overflow:hidden;w=
idth:96px;height:19px"><img src=3D"https://lh3.googleusercontent.com/Hx_q55=
k6wNnVztYgBWGGPYfDtQVRn8ZfFNhenLqzrmFKwPHbeq8tEZMxtAiQgoPcr6S8wz51NuNaBqTvI=
B673RBdUTfOqfCi0Y5hN0s6ZMyEmD5y6ZZk4b_sgzwhK3Tl2dmg5eAz6Y3dHn5ncbP2_zAfOPHY=
PLdFhT_NoSoqzrWU2NiT9wkKzM0" width=3D"96" height=3D"19" style=3D"margin-lef=
t:0px;margin-top:0px"></span></span></a></p><a href=3D"http://facebook.com/=
sense" target=3D"_blank"><span style=3D"font-size:10pt;font-family:Arial;co=
lor:rgb(17,85,204);vertical-align:baseline;white-space:pre-wrap"><span styl=
e=3D"border:none;display:inline-block;overflow:hidden;width:16px;height:16p=
x"><img src=3D"https://lh3.googleusercontent.com/p1uRJv0fvnN6IZJuaAeBRM8kkQ=
NTizJ5CsTEe0kch4GewALIBBoPvdEyeQ_SQLGPlBwvAtbRmqCqe1izc_Wc28mimUQ7WWVRC_UVz=
vLxKkGOSPDphOxqgIThj97fFLE8hTSzhxgjQplY2J7OXIdDbUTTz0hUFcEKGvcxFK3lW6fKVxC8=
Qa2uvQQ" width=3D"16" height=3D"16" style=3D"margin-left:0px;margin-top:0px=
"></span></span></a><span style=3D"font-size:10pt;font-family:Roboto,sans-s=
erif;color:rgb(0,0,0);vertical-align:baseline;white-space:pre-wrap"> </span=
><a href=3D"https://twitter.com/sense" target=3D"_blank"><span style=3D"fon=
t-size:10pt;font-family:Roboto,sans-serif;color:rgb(17,85,204);vertical-ali=
gn:baseline;white-space:pre-wrap"><span style=3D"border:none;display:inline=
-block;overflow:hidden;width:16px;height:16px"><img src=3D"https://lh5.goog=
leusercontent.com/kBdPSHz8Bmipxvji8OwBDtJ6YPNIXJ2dzqmrRdV3oawxoz17jCso8jDGc=
XtoX20kiJzOSAvMCwvnNGcQe1chm7N5JwX9w5mWuaC-68iQg6KYet-sUiPqe7fG0rtR7ypIDqEc=
5QnQ-0_i8S-WWH38koEV7DAGd0z6-AyHfp1Jc1m6N_C4FYcMgFk" width=3D"16" height=3D=
"16" style=3D"margin-left:0px;margin-top:0px"></span></span></a><span style=
=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(0,0,0);vertical-=
align:baseline;white-space:pre-wrap">=C2=A0</span><a href=3D"https://www.li=
nkedin.com/company/sense" target=3D"_blank"><span style=3D"font-size:10pt;f=
ont-family:Roboto,sans-serif;color:rgb(17,85,204);vertical-align:baseline;w=
hite-space:pre-wrap"><span style=3D"border:none;display:inline-block;overfl=
ow:hidden;width:16px;height:17px"><img src=3D"https://lh4.googleusercontent=
.com/akAeQa7GyjT47QwiireASwIoyFgqUsss7eHccksl73bQ_7VOZCrUrHDQc5PG3iFrw1MdZC=
b6uoD53lrOKglPqx-v8CTa3Ag3O-9oyzZ7Jhho3iNzK8m2b0m4umAjJoEQl_vBfJA9xMdogKQme=
SZBLRBqaE_Ea7QEHlbPt83zpdPCB8CTRyMth48" width=3D"16" height=3D"17" style=3D=
"margin-left:0px;margin-top:0px"></span></span></a><br><div>--</div><div><s=
pan style=3D"color:rgb(34,34,34)">This email, and any attachments are stric=
tly confidential and intended for the addressee(s) only. The content may al=
so contain legal, professional or other privileged information. If you are =
not the intended recipient, please notify the sender immediately and then d=
elete the e-mail and any attachments. You should not disclose, copy or take=
 any action in reliance on this transmission.</span><br></div></div></div><=
/div></div>

--000000000000964be905fa6715a4--

--===============4643302545943012298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4643302545943012298==--
