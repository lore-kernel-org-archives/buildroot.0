Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED28C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EBE260699;
	Thu,  9 May 2024 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAo5MheQLW7E; Thu,  9 May 2024 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01BC1606EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01BC1606EC;
	Thu,  9 May 2024 20:58:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31E941BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2A440725
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVuweMOZAbRQ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C00D540604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00D540604
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C00D540604
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:58:42 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ed012c1afbso11470765ad.1
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715288322; x=1715893122;
 h=mime-version:content-language:accept-language:in-reply-to
 :references:message-id:date:thread-index:thread-topic:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RoyKJ1KUi3KLPlEX3Bg9oDz4bl1oMCR/gZnOl/++9N0=;
 b=iL7im3OnJzBrSroXJdWM3c43hUPEDH4jboTPVEMjFuMCKV1S8z63zIGdW7pYPdVlEv
 s8xCqCOp3fNcj0dxY7YX3TZC776qAbjHLhBkrgEt+fB3rBnQiaXHg/LZc2cVctL0T6cl
 UuylojQUv51w3w/p6U3hc3HC/25PSKC0y7udjxK0xL0V2Z0t5/xluQpSkW1Ahsp/pLyB
 yJA2QySQKohSg+zN5YKP2YUA1slN9bSstbwp7PEnjJojDqBzzInkHmN58pjF0vXxJsZX
 WZY5vYi7l2yr/YsZASV0A6txUrtYqywu+z4mNXlWpgKqBBFWngxtNI6fJ2t4/3V9DmUr
 1DHg==
X-Gm-Message-State: AOJu0YwG1gBaLD1GpErgZsyGl0GK91mZth1hTr7BAsxqIweMIkPtyRv1
 CSkoqk+O1A0KbSr821fgjc8lNGWV5FTbimENwwbm4l2hUU/yxcvm
X-Google-Smtp-Source: AGHT+IG9gS+H1+FDsxPzvTcO7/HbvG1utErRwwQXTQP+DYXUcdM20PJQfXloa2sEF3obYHnsrR3ttw==
X-Received: by 2002:a17:902:c950:b0:1dd:dcd3:662c with SMTP id
 d9443c01a7336-1eef9f346femr64219815ad.4.1715288321724; 
 Thu, 09 May 2024 13:58:41 -0700 (PDT)
Received: from AS8P193MB1670.EURP193.PROD.OUTLOOK.COM ([2603:1026:c03:64e2::5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf30fc7sm18570535ad.133.2024.05.09.13.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 13:58:41 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>
Thread-Topic: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new
 package
Thread-Index: AW4ueTk1EjKmawEUnfFqHidomUD9HG4ueTk1ODIuNDBmNTU0ZNCDBP6T
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 9 May 2024 20:58:34 +0000
Message-ID: <AS8P193MB167085D49F6B529F43B6B21FF6E62@AS8P193MB1670.EURP193.PROD.OUTLOOK.COM>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-3-roy.kollen.svendsen@akersolutions.com>
 <20240509164507.4682bee8@windsurf>
 <f51e0c2d-efa3-46ae-8155-7b6552c6563f@mind.be>
In-Reply-To: <f51e0c2d-efa3-46ae-8155-7b6552c6563f@mind.be>
Accept-Language: nl-NL, en-US
Content-Language: nl-NL
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715288322; x=1715893122; darn=buildroot.org;
 h=mime-version:content-language:accept-language:in-reply-to
 :references:message-id:date:thread-index:thread-topic:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=RoyKJ1KUi3KLPlEX3Bg9oDz4bl1oMCR/gZnOl/++9N0=;
 b=NGtAjVU2fWWtEGeHksMb9Wge9zw8LVGG+IoTIz5cdAgCfXeluIjIq9DG8ym6U6SAra
 LJJyIP81P+Vrf3s7y9M3Ymt2FT9j7RqjZ7uTDtBNo5eim/VVGqA5gyyCyflahzMD70tR
 DBkPgrT5C+MQlM/3HepsKEyUNRY6K23Ul1tso+xcc0WblJqPMDLexiE+HBeHIeSOYKlD
 hlhtxJ66Q7Bie75S+k9NdRoKssH5syfx6SwaPc2R7OCcmAG/Kcnjc22KH77Nl6NYkBM6
 Qx6ZF+iBxkW5zhCZ/2yV1cTEj76JFWLeQQVmlXHBjFnxCIewuHKvYlOXVTaYP4blqQaD
 ZWow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NGtAjVU2
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============0350920658977880166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0350920658977880166==
Content-Language: nl-NL
Content-Type: multipart/alternative;
	boundary="_000_AS8P193MB167085D49F6B529F43B6B21FF6E62AS8P193MB1670EURP_"

--_000_AS8P193MB167085D49F6B529F43B6B21FF6E62AS8P193MB1670EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Arnout Vandecappelle <arnout@mind.be>
Sent: Thursday, May 9, 2024 10:50:03 pm
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Roy Kollen Svendsen <r=
oykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Roy Kollen Svendsen =
<roy.kollen.svendsen@akersolutions.com>; Zoltan Gyarmati <zgyarmati@zgyarma=
ti.de>; Jesse Van Gavere <jesseevg@gmail.com>; Samuel Martin <s.martin49@gm=
ail.com>; Yann E. MORIN <yann.morin.1998@free.fr>; Peter Korsgaard <peter@k=
orsgaard.com>; Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6shadertools: new p=
ackage



On 09/05/2024 16:45, Thomas Petazzoni wrote:
> Hello,
>
> Added some Buildroot maintainers in Cc, for a question below.
>
> On Wed, 17 Apr 2024 10:05:24 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
>> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.co=
m>
>> ---
>> Changes v1 -> v2:
>>    - don't add unnecessary Config.in.host
>>    - add required BR2_PACKAGE_HOST_QT6BASE_GUI config element to qt6base=
/Config.in
>
> It would be good to expand the commit log with some explanations on why
> host-qt6base needs to be built with GUI support for this package to
> build for the target. Indeed, this is a non-trivial packaging thing, so
> it makes sense to clarify it explicitly.
>
>
>> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.=
in
>> index 3b15d40c83..5b598aa938 100644
>> --- a/package/qt6/qt6base/Config.in
>> +++ b/package/qt6/qt6base/Config.in
>> @@ -1,3 +1,6 @@
>> +config BR2_PACKAGE_HOST_QT6BASE_GUI
>> +    bool
>
> My question to other maintainers: do we want this blind option that
> allows to enable GUI support in the *host* qt6base to be present in the
> Config.in file (normally reserved for options for the target package),
> or do we want a simple Config.in.host, which even if it doesn't have a
> visible option for host-qt6base would carry this blind option allowing
> to enable GUI support in host-qt6base ?

  It should be in Config.in.host. We have a few examples like that already,=
 e.g.
package/systemd/Config.in.host. In that case, there's also a comment in the=
 file
to explain when it should be selected, and I think that's appropriate here =
as well.

  Regards,
  Arnout

>
> Thanks for your feedback,
>
> Thomas

Hey,


It was something I struggled a bit with how to properly do that dependency =
too since it's quite hefty if you don't need it and the qt one is a bit tri=
cky as you always need it anyway and it's only relevant for that package, s=
o to me not splitting it up seemed an ok way to do it, but if it's already =
done in a separate host file for other packages might be best to stay consi=
stent, and in the case of eudev it's there also relevant only for the packa=
ge itself, so that seems like an agreeable solution.

Regards,
Jesse

--_000_AS8P193MB167085D49F6B529F43B6B21FF6E62AS8P193MB1670EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
</div>
<div dir=3D"auto"><br>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Arnout Vandecappelle &lt;arnout@mind.be&gt;<br>
<strong>Sent:</strong> Thursday, May 9, 2024 10:50:03 pm<br>
<strong>To:</strong> Thomas Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;;=
 Roy Kollen Svendsen &lt;roykollensvendsen@gmail.com&gt;<br>
<strong>Cc:</strong> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt=
;; Roy Kollen Svendsen &lt;roy.kollen.svendsen@akersolutions.com&gt;; Zolta=
n Gyarmati &lt;zgyarmati@zgyarmati.de&gt;; Jesse Van Gavere &lt;jesseevg@gm=
ail.com&gt;; Samuel Martin &lt;s.martin49@gmail.com&gt;; Yann
 E. MORIN &lt;yann.morin.1998@free.fr&gt;; Peter Korsgaard &lt;peter@korsga=
ard.com&gt;; Romain Naour &lt;romain.naour@smile.fr&gt;<br>
<strong>Subject:</strong> Re: [Buildroot] [PATCH v2 03/11] package/qt6/qt6s=
hadertools: new package<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 09/05/2024 16:45, Thomas Petazzoni wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; Added some Buildroot maintainers in Cc, for a question below.<br>
&gt; <br>
&gt; On Wed, 17 Apr 2024 10:05:24 +0200<br>
&gt; Roy Kollen Svendsen &lt;roykollensvendsen@gmail.com&gt; wrote:<br>
&gt; <br>
&gt;&gt; Signed-off-by: Roy Kollen Svendsen &lt;roy.kollen.svendsen@akersol=
utions.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Changes v1 -&gt; v2:<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; - don't add unnecessary Config.in.host<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; - add required BR2_PACKAGE_HOST_QT6BASE_GUI conf=
ig element to qt6base/Config.in<br>
&gt; <br>
&gt; It would be good to expand the commit log with some explanations on wh=
y<br>
&gt; host-qt6base needs to be built with GUI support for this package to<br=
>
&gt; build for the target. Indeed, this is a non-trivial packaging thing, s=
o<br>
&gt; it makes sense to clarify it explicitly.<br>
&gt; <br>
&gt; <br>
&gt;&gt; diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/C=
onfig.in<br>
&gt;&gt; index 3b15d40c83..5b598aa938 100644<br>
&gt;&gt; --- a/package/qt6/qt6base/Config.in<br>
&gt;&gt; +++ b/package/qt6/qt6base/Config.in<br>
&gt;&gt; @@ -1,3 +1,6 @@<br>
&gt;&gt; +config BR2_PACKAGE_HOST_QT6BASE_GUI<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; bool<br>
&gt; <br>
&gt; My question to other maintainers: do we want this blind option that<br=
>
&gt; allows to enable GUI support in the *host* qt6base to be present in th=
e<br>
&gt; Config.in file (normally reserved for options for the target package),=
<br>
&gt; or do we want a simple Config.in.host, which even if it doesn't have a=
<br>
&gt; visible option for host-qt6base would carry this blind option allowing=
<br>
&gt; to enable GUI support in host-qt6base ?<br>
<br>
&nbsp; It should be in Config.in.host. We have a few examples like that alr=
eady, e.g. <br>
package/systemd/Config.in.host. In that case, there's also a comment in the=
 file <br>
to explain when it should be selected, and I think that's appropriate here =
as well.<br>
<br>
&nbsp; Regards,<br>
&nbsp; Arnout<br>
<br>
&gt; <br>
&gt; Thanks for your feedback,<br>
&gt; <br>
&gt; Thomas<br>
</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">Hey,</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">It was something I struggled a bit wi=
th how to properly do that dependency too since it's quite hefty if you don=
't need it and the qt one is a bit tricky as you always need it anyway and =
it's only relevant for that package,
 so to me not splitting it up seemed an ok way to do it, but if it's alread=
y done in a separate host file for other packages might be best to stay con=
sistent, and in the case of eudev it's there also relevant only for the pac=
kage itself, so that seems like
 an agreeable solution.</div>
<div class=3D"PlainText" dir=3D"auto"><br>
</div>
<div class=3D"PlainText" dir=3D"auto">Regards,</div>
<div class=3D"PlainText" dir=3D"auto">Jesse</div>
</span></font></div>
</body>
</html>

--_000_AS8P193MB167085D49F6B529F43B6B21FF6E62AS8P193MB1670EURP_--

--===============0350920658977880166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0350920658977880166==--
