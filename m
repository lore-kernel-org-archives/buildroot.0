Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEBAC6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61CD813C5;
	Tue, 29 Aug 2023 13:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61CD813C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGQdDEn-IYNY; Tue, 29 Aug 2023 13:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F256A81393;
	Tue, 29 Aug 2023 13:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F256A81393
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7F11BF34B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C28ED812CD
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28ED812CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKwYBtuRqQot for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:39:00 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B402380F3D
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B402380F3D
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-58d70c441d5so53524757b3.2
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 06:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693316339; x=1693921139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZT41+au89MiQ9bVFtNSVl3azZhqOm4V6I77e3J7Qwlo=;
 b=CXScJI3K4KVMYO42v6psWrxdOOFsD6TzvA5rFlr1JY5KpH/XyLkUCNtWSTBEWFS+yp
 QeefepGj9XAlxsPqFW8k5F0Ye4cm9/1Bg2W9SAKBb8Z8eY5b9GcFh8PKSRScy64OITK5
 RxnXd4ULdkzqoMf7YLRTMZlO9wGcmf5rhcuNkXhN9hblsLitFZ4f/c8IdlhvUrPYR5Qn
 rTO9i0rgANHc7MF5mpWL1nBXdaXnUJHkXnZD9xwf2V3R6A0c6mHz4JqCmD+NCmOK/mzw
 lowBIRw658NZzGxT+lsxcibNmjOX1F0DwoCq+KhdNM1/Z8Rya9HiBfrFRwinXoDHzycD
 eNQQ==
X-Gm-Message-State: AOJu0YxOVJcCT+V1Wpx1ZfqGdZl1FDVgsP0XO9Wttb6f79kjHV2F/3TP
 zAxzWT76tafthpeKeRt5RyfKn+hTkZPW5pA1qNKTBhR9uzA=
X-Google-Smtp-Source: AGHT+IEWYltg5PjYPuVp5X9mMcFeeIwZ1rogUGC95MbKwHR4XE9RW5tQwW6URXOFqwZdiOKoYqBqgTsgEeSsWK0NAPY=
X-Received: by 2002:a81:9b16:0:b0:595:b30:1dd8 with SMTP id
 s22-20020a819b16000000b005950b301dd8mr7608473ywg.18.1693316339610; Tue, 29
 Aug 2023 06:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk> <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
 <87msyb548w.fsf@48ers.dk>
 <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
In-Reply-To: <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
From: Robert Smigielski <ptdropper@gmail.com>
Date: Tue, 29 Aug 2023 09:38:48 -0400
Message-ID: <CABWt4esbyORmNNs6HJASgpHW0TRU=5WNg6Hmo3xrYGYo5GSDhA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693316339; x=1693921139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZT41+au89MiQ9bVFtNSVl3azZhqOm4V6I77e3J7Qwlo=;
 b=bYZp9qfZbtrnnx0iMZrY4aWgkaawaTC3nvHxZWe4KmfCx3JaxvqSb9WSsRFCuln74/
 HS3EudfBEVzp5Hce3oVg/0RGvdjWHtOM1k7iVyankyE8FkIsMjyS4c0eLi9Y2SbL8NJx
 IeTMhlSvb1gXGTXiXBCfIHuf5gKgAw/ZhaLHcBHO9JDm/nQoOhloa+o1zhatU/fWdBGT
 5QljnYvTDcccxCX3rrvT5fOrGXiZ5B5iVMumh46LljHAiLnOn+4Gi78YG3n3p5vg6lhF
 x1lLWKHFHznCA1HTfVHnXXUZpb0Ll5HkzW/gwCvdwP2zamsWzuVd2//WtR5PkG6Y+f5J
 ooNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bYZp9qfZ
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0429763214561452960=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0429763214561452960==
Content-Type: multipart/alternative; boundary="000000000000ea39ea06040fee38"

--000000000000ea39ea06040fee38
Content-Type: text/plain; charset="UTF-8"

Found the PURL types at this github repository, it mentions that
"buildroot" is in the list of "other candidate types to define"
https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst

That is why I am using the "generic" PURL "type" because it is flexible and
clearly is generic. I am reading up on the data in this github repo to
learn more about purl. It will take some time. But maybe this is the info
for what Buildroot needs. My limited research on PURL vs CPE says CPE is
for big projects like operating systems. PURL can just work for a package
at a version in a location.


OK. It doesn't sound like it will bring a lot of advantages for the
>> effort to maintain PURL identifiers :/
>>
>
> From my view point - if Buildroot supports PURL I will add that data to my
> project. If not, that is okay.
>
>>
>>  > each with a distinct PURL. We could start our own namespace, but
>>  > that's kind of pointless unless we also issue advisories...
>>
>
> Yes, Buildroot could consider itself a package manager, because it does
> that. That idea is a possibility.
>
>
>> I guess we should use the one matching where we get the source code from
>> (if any). The cyclonedx tool uses a "generic"
>> pkg:generic/$name?download_url=$site/$tarball, so we could default to
>> that and just use pypi/github/whatever for the special cases where there
>> is a more accurate one
>>
>
> Yes, the tool I wrote uses the "generic"  package. There is a place
> holder out there in PURL for Buildroot if you want to go that way in the
> future.
>
> --
Robert Smigielski

--000000000000ea39ea06040fee38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Found the PURL types at this github repos=
itory, it mentions that &quot;buildroot&quot; is in the list of &quot;other=
 candidate types to define&quot;=C2=A0<a href=3D"https://github.com/package=
-url/purl-spec/blob/master/PURL-TYPES.rst">https://github.com/package-url/p=
url-spec/blob/master/PURL-TYPES.rst</a><br><div><br></div><div>That is why =
I am using the &quot;generic&quot; PURL &quot;type&quot; because it is flex=
ible and clearly is generic. I am reading up on the data in this github rep=
o to learn more about purl. It will take some time. But maybe this is the i=
nfo for what Buildroot needs. My limited research on PURL vs CPE says CPE i=
s for big projects like operating systems. PURL can just work for a package=
 at a version in a location.=C2=A0</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
OK. It doesn&#39;t sound like it will bring a lot of advantages for the<br>
effort to maintain PURL identifiers :/<br></blockquote><div><br></div><div>=
From my view point - if Buildroot supports PURL I will add that data to my =
project. If not, that is okay.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>=C2=A0&gt; each with a distinct PURL. We could start our own=
 namespace, but<br>
=C2=A0&gt; that&#39;s kind of pointless unless we also issue advisories...<=
br></blockquote><div><br></div><div>Yes, Buildroot could consider itself a =
package manager, because it does that. That idea is a possibility.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess we should use the one matching where we get the source code from<br=
>
(if any). The cyclonedx tool uses a &quot;generic&quot;<br>
pkg:generic/$name?download_url=3D$site/$tarball, so we could default to<br>
that and just use pypi/github/whatever for the special cases where there<br=
>
is a more accurate one<br></blockquote><div><br></div><div>Yes, the tool I =
wrote uses the &quot;generic&quot;=C2=A0 package. There is a place holder=
=C2=A0out there in PURL for Buildroot if you want to go that way in the fut=
ure.</div><div><br></div></div></div></blockquote></div><span class=3D"gmai=
l_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div><div dir=3D"ltr">Robert Smigielski<br><span></span>=
<span></span></div></div></div></div></div>

--000000000000ea39ea06040fee38--

--===============0429763214561452960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0429763214561452960==--
