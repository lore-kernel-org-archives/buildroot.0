Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF28EDEC70
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 15:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 980EB40A16;
	Wed, 13 Sep 2023 15:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980EB40A16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5inoHslfQCq; Wed, 13 Sep 2023 15:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A801C414C8;
	Wed, 13 Sep 2023 15:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A801C414C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C07C1BF42E
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3288D82D17
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 15:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3288D82D17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFfnuimJr0Ee for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 15:12:27 +0000 (UTC)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7E8082D12
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 15:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E8082D12
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d7ecdb99b7aso6307158276.3
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 08:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694617946; x=1695222746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kwz2CI77g3Nl6AejPPLRmduXLdWUg84Nl5VPF+cuusI=;
 b=SGDgd7MKEesMPoWHJJCcC8X47Mn9hIiSbBsxkY+AMRe2ZksS6a3KAxg6RFz5taqKnC
 Rf51z5U8WKbsoI9XyNVhNDjpsAlwR2bePyC9UBpExkiPWBdbrSi0/aMLkJOMFuzWR8SD
 oS8MbJortl0crbKVlO320I+q7doA6T480Ks/K6aMABsD6P39NW+Jt6Q74I3t3cBN3mU0
 dgrOaA+Up9J6u/8d+y+8nweczmLMJY8ZgdZDFQszNfjwhmlnnQ4/6ieeabQzNjo7JUak
 OCxbtSX+umy4EPgce5aXoNVG5FeeAqZNfsw4Sdl5vXjOpmT2KIkA+u4I7Xx3MkqO5ZLn
 UF/A==
X-Gm-Message-State: AOJu0Yz6LDh7WpyayE0wpCcg5wZzoznTDmMrlpxhVp4DvF1bqFMXTFQi
 j+aCiaaPcUb/CxIuAoUdivzYm8ax9DdrUutiQS10mCX1Zbu+Kg==
X-Google-Smtp-Source: AGHT+IHpn/GBXDQATwHpQXmlXy4fyjry9xWFsTfKdDpiH2aFdRqKLlZS4CSs6+raZFMqoiCKya6T3ulkCCuyXMKBl9s=
X-Received: by 2002:a25:eb02:0:b0:d81:67a2:a3bb with SMTP id
 d2-20020a25eb02000000b00d8167a2a3bbmr1319270ybs.51.1694617945675; Wed, 13 Sep
 2023 08:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk> <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
 <87msyb548w.fsf@48ers.dk>
 <CABWt4etN4AfouYoaLc_-VgO=qU8F_o_ZU6RgMye8BzcB4w28Gg@mail.gmail.com>
 <CABWt4esbyORmNNs6HJASgpHW0TRU=5WNg6Hmo3xrYGYo5GSDhA@mail.gmail.com>
In-Reply-To: <CABWt4esbyORmNNs6HJASgpHW0TRU=5WNg6Hmo3xrYGYo5GSDhA@mail.gmail.com>
From: Robert Smigielski <ptdropper@gmail.com>
Date: Wed, 13 Sep 2023 11:12:14 -0400
Message-ID: <CABWt4espLpT2Pz+LHJvqexGVDT3sbMKDQbUOqdp6GHJ-mvkBnA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694617946; x=1695222746; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kwz2CI77g3Nl6AejPPLRmduXLdWUg84Nl5VPF+cuusI=;
 b=YDCHuLAhJKKAg5kMErpyl02AmY2yxfaiVpLyuWoGAPBD3wSV9DbArMgb2Sc5e4mQvG
 kmlcJCQRAeZlklXOUxGl0TvNWA3gDyhS9fFPKnSJW/TrQZkrEdnv0pUWK8KUkQ2NXrnl
 rm2yt2zWzMwX14aubiiHkH6I1VnXAQWUR/j7Td1pcrtQOm2l4RzErGjNjEuLcXo5ZNYl
 8jT+u3xjJR5jWPI+sIAt23YUDB422JgjeFvtplqitZ33L/za37XLGy+Tqawvk4Kih9qY
 RuoU9kekKoqkXSo0JxDNXHVe7m+WORDZp7rythlkRm5WUdpSyH0RvQmrak53B2sbolLU
 bbUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YDCHuLAh
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
Content-Type: multipart/mixed; boundary="===============0876058050445008060=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0876058050445008060==
Content-Type: multipart/alternative; boundary="000000000000ae9e2c06053efc95"

--000000000000ae9e2c06053efc95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Based on the intent of CPE (
https://owasp.org/www-community/Component_Analysis)
"Historically, known vulnerabilities referred to entries (CVEs) in the
National Vulnerability Database (NVD). The NVD describes (via CPE) three
types of components: Applications (includes libraries and frameworks),
Operating Systems and Hardware"

- Additionally -

"Centralized databases such as the CPE Product Dictionary maintained by
NIST adds additional fragmentation as the CPE vendor and product names
often do not reflect reality." I know for certain that the NVD has errors
that are not managed.

- Finally -

The Package URL specification provides a decentralized and uniform way to
represent components.

    scheme:type/namespace/name@version?qualifiers#subpath

PURL seems to be the right long term mechanism to identify a specific
software component by using a URL, a package name, and a package version.
Personally I find the PURL data from Buildroot to be an excellent way to
know exactly what component is in use in a product SBOM.
As an example for a PURL in an actual product I am working on, the
following entry is in the CycloneDX-Buildroot SBOM output JSON file:
   "purl": "pkg:generic/dbus@1.12.24?download_url=3D
https://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz"
Works beautifully for this open source project "dbus" that is out on the
internet from the freedesktop.org provider/supplier/manufacturer (select
your favorite english word to represent where dbus comes from).

On Tue, Aug 29, 2023 at 9:38=E2=80=AFAM Robert Smigielski <ptdropper@gmail.=
com>
wrote:

> Found the PURL types at this github repository, it mentions that
> "buildroot" is in the list of "other candidate types to define"
> https://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst
>
> That is why I am using the "generic" PURL "type" because it is flexible
> and clearly is generic. I am reading up on the data in this github repo t=
o
> learn more about purl. It will take some time. But maybe this is the info
> for what Buildroot needs. My limited research on PURL vs CPE says CPE is
> for big projects like operating systems. PURL can just work for a package
> at a version in a location.
>
>
> OK. It doesn't sound like it will bring a lot of advantages for the
>>> effort to maintain PURL identifiers :/
>>>
>>
>> From my view point - if Buildroot supports PURL I will add that data to
>> my project. If not, that is okay.
>>
>>>
>>>  > each with a distinct PURL. We could start our own namespace, but
>>>  > that's kind of pointless unless we also issue advisories...
>>>
>>
>> Yes, Buildroot could consider itself a package manager, because it does
>> that. That idea is a possibility.
>>
>>
>>> I guess we should use the one matching where we get the source code fro=
m
>>> (if any). The cyclonedx tool uses a "generic"
>>> pkg:generic/$name?download_url=3D$site/$tarball, so we could default to
>>> that and just use pypi/github/whatever for the special cases where ther=
e
>>> is a more accurate one
>>>
>>
>> Yes, the tool I wrote uses the "generic"  package. There is a place
>> holder out there in PURL for Buildroot if you want to go that way in the
>> future.
>>
>> --
> Robert Smigielski
>


--=20
Robert Smigielski

--000000000000ae9e2c06053efc95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Based on the intent of CPE (<a href=3D"ht=
tps://owasp.org/www-community/Component_Analysis">https://owasp.org/www-com=
munity/Component_Analysis</a>)=C2=A0</div><div dir=3D"ltr">&quot;Historical=
ly, known vulnerabilities referred to entries (CVEs) in the National Vulner=
ability Database (NVD). The NVD describes (via CPE) three types of componen=
ts: Applications (includes libraries and frameworks), Operating Systems and=
 Hardware&quot;</div><div dir=3D"ltr"><br></div><div>- Additionally -</div>=
<div><br></div><div>&quot;Centralized databases such as the CPE Product Dic=
tionary maintained by NIST adds additional fragmentation as the CPE vendor =
and product names often do not reflect reality.&quot; I know for certain th=
at the NVD has errors that are not managed.<br></div><div><br></div><div>- =
Finally -</div><div><br></div><div>The Package URL specification provides a=
 decentralized and uniform way to represent components.<br><br>=C2=A0 =C2=
=A0 scheme:type/namespace/name@version?qualifiers#subpath<br></div><div><br=
></div><div>PURL seems to be the right long term mechanism to identify a sp=
ecific software component by using a URL, a package name, and a package ver=
sion. Personally I find the PURL data from Buildroot to be an excellent way=
 to know exactly what component is in use in a product SBOM.</div><div>As a=
n example for a PURL in an actual product I am working on, the following en=
try is in the CycloneDX-Buildroot SBOM output JSON file:</div><div>=C2=A0 =
=C2=A0&quot;purl&quot;: &quot;pkg:generic/dbus@1.12.24?download_url=3D<a hr=
ef=3D"https://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz">https=
://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz</a>&quot;</div><d=
iv>Works beautifully for this open source project &quot;dbus&quot; that is =
out on the internet from the <a href=3D"http://freedesktop.org">freedesktop=
.org</a> provider/supplier/manufacturer (select your favorite english word =
to represent where dbus comes from).</div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 29, 2023 at 9:38=E2=80=
=AFAM Robert Smigielski &lt;<a href=3D"mailto:ptdropper@gmail.com">ptdroppe=
r@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Found the PURL types at this g=
ithub repository, it mentions that &quot;buildroot&quot; is in the list of =
&quot;other candidate types to define&quot;=C2=A0<a href=3D"https://github.=
com/package-url/purl-spec/blob/master/PURL-TYPES.rst" target=3D"_blank">htt=
ps://github.com/package-url/purl-spec/blob/master/PURL-TYPES.rst</a><br><di=
v><br></div><div>That is why I am using the &quot;generic&quot; PURL &quot;=
type&quot; because it is flexible and clearly is generic. I am reading up o=
n the data in this github repo to learn more about purl. It will take some =
time. But maybe this is the info for what Buildroot needs. My limited resea=
rch on PURL vs CPE says CPE is for big projects like operating systems. PUR=
L can just work for a package at a version in a location.=C2=A0</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr">Robert Smigielski<br><span></span><spa=
n></span></div></div></div></div></div></div>

--000000000000ae9e2c06053efc95--

--===============0876058050445008060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0876058050445008060==--
