Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA2C54743
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 23:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF2B80F1E;
	Tue, 27 Aug 2024 23:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqCoBf85MWZ2; Tue, 27 Aug 2024 23:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4787680F06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4787680F06;
	Tue, 27 Aug 2024 23:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A53BC1BF831
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 23:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92789608CA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 23:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPtrNygN_q1k for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 23:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=daryl.spitzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49BE3608B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49BE3608B6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49BE3608B6
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 23:31:41 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2d3da6d3f22so4721988a91.0
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724801500; x=1725406300;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P+/6R6G3OXgvavFXguadN3miXtPZ1f+qq+unkXTfnfI=;
 b=Ia9gaTgtgtSHKl1MFjBe5wpX3BvA/Ukb1OTeSDtQkwUJNT5Xi3v6hyLreCpqWFPvjV
 rs4SZHqoOmu8RW1ibzTpbQRm89BGYNUcWxVXpZPr7yOKkOT0RvsK4uomA1MXZdX90fiB
 JvZyOgBt89Mx9kSK96BYcAjE+4UjFoCaYrvRAhEsC93UsPfwYckXmKhCoHXHFRe4Au7v
 kZvWjZ5AcH6WqmNgAiniufftJnF1Em0M5c9xJh64ldKgpZet2TJ2SexhMnSIH5GgLvIY
 Df2lhWcPptsZPMGv8FlF1mXSfC7SSwsxZUekXvmH5BbEoiUlXzx+nqmP3Coh4qN5uSUT
 PoDQ==
X-Gm-Message-State: AOJu0YxZb9F/rTbFrCMEnJZK1IoMDOyApQof1Z8mSUpl/3kxnYyDQDMe
 fTVssqmgL3imHf+zDTF3y185GPUpVlVt2inb5kP/X6NQwQhHEuQu4Qan5zhiwhmiwU0xn4N9bIq
 jeuw4Efe2JUDL2HxFTHAA/mIc4HXuPzPV
X-Google-Smtp-Source: AGHT+IEHMS45Ayy7HtTOP4NmX9k8szyxahbQhG6d6vXyEPbLzeyv15VSvJPB/PgJL93rmZSjf+TKeNTmsN7JFpccpFk=
X-Received: by 2002:a17:90b:2390:b0:2cf:7388:ad9e with SMTP id
 98e67ed59e1d1-2d646bcd7bamr14279351a91.2.1724801499850; Tue, 27 Aug 2024
 16:31:39 -0700 (PDT)
MIME-Version: 1.0
From: Daryl Spitzer <daryl.spitzer@gmail.com>
Date: Tue, 27 Aug 2024 16:31:03 -0700
Message-ID: <CAG94F8pYTZTid25CSrTR4mSo_WtAE8qOecLATN82AnNW_jcqQA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724801500; x=1725406300; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P+/6R6G3OXgvavFXguadN3miXtPZ1f+qq+unkXTfnfI=;
 b=VR6XtogVh3Wh2we8eZWd1CFkJPspnl7WQa+oEyG18W+kF9lNEEsh938hosNU1sqLYL
 5xpv/F7D4BkjKpHTXpmidDGeGXd1iq31LW3GwimufFp1i5n029tBF46PCb9KyZzLO6Sg
 rkyRmt4VG3WQ3xJdg9UDv6lfKRqy+POyZvwvYxAolLqJYraH8hHYoUWEP03a8gzw1LCH
 qILd7gCNrgOG/B4Es+wx0/kVtfRUCArKszdeEfJgMCOOaJbGQKEWHdjCkQUI5RHq3YQ/
 eP2u5XXfT3M3evYVokp1hibGkKpgMy8548HMtBX/ifHtDNlqa8sLnldmo1f5BSDLrW6F
 CSUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VR6XtogV
Subject: [Buildroot] How do I include glibc versions needed by node in my
 buildroot config?
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
Content-Type: multipart/mixed; boundary="===============0673120105679466330=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0673120105679466330==
Content-Type: multipart/alternative; boundary="000000000000b4f2630620b2a470"

--000000000000b4f2630620b2a470
Content-Type: text/plain; charset="UTF-8"

I'm building a root filesystem using buildroot (running on Ubuntu 22.04.4
LTS) for an ARM Cortex-A7 target. I'm including Node.js by selecting "[*]
nodejs" in Target packages ---> Interpreter languages and scripting --->.

After successfully flashing and booting the target, I run node in /usr/bin/ and
get:

/usr/bin # ./node
./node: /lib/libm.so.6: version `GLIBC_2.38' not found (required by ./node)
./node: /lib/libm.so.6: version `GLIBC_2.29' not found (required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libstdc++.so.6: no version information available
(required by ./node)
./node: /lib/libc.so.6: version `GLIBC_2.33' not found (required by ./node)
./node: /lib/libc.so.6: version `GLIBC_2.34' not found (required by ./node)
./node: /lib/libc.so.6: version `GLIBC_2.32' not found (required by ./node)
./node: /lib/libc.so.6: version `GLIBC_2.38' not found (required by ./node)
./node: /lib/libc.so.6: version `GLIBC_2.32' not found (required by
/usr/lib/libuv.so.1)
./node: /lib/libc.so.6: version `GLIBC_2.38' not found (required by
/usr/lib/libuv.so.1)
./node: /lib/libc.so.6: version `GLIBC_2.33' not found (required by
/usr/lib/libuv.so.1)
./node: /lib/libc.so.6: version `GLIBC_2.34' not found (required by
/usr/lib/libuv.so.1)
./node: /lib/libc.so.6: version `GLIBC_2.34' not found (required by
/usr/lib/libcares.so.2)
./node: /lib/libc.so.6: version `GLIBC_2.33' not found (required by
/usr/lib/libcares.so.2)
./node: /lib/libc.so.6: version `GLIBC_2.36' not found (required by
/usr/lib/libcares.so.2)
./node: /lib/libc.so.6: version `GLIBC_2.38' not found (required by
/usr/lib/libcares.so.2)
./node: /lib/libc.so.6: version `GLIBC_2.38' not found (required by
/usr/lib/libcrypto.so.3)
./node: /lib/libc.so.6: version `GLIBC_2.33' not found (required by
/usr/lib/libcrypto.so.3)
./node: /lib/libc.so.6: version `GLIBC_2.34' not found (required by
/usr/lib/libcrypto.so.3)
./node: /lib/libc.so.6: version `GLIBC_2.33' not found (required by
/usr/lib/libssl.so.3)
./node: /lib/libc.so.6: version `GLIBC_2.34' not found (required by
/usr/lib/libssl.so.3)

I don't see how to change the buildroot config to include the required
versions of GLIBC.

The only glibc-related config options I see (in make nconfig) is "Enable
compatibility shims to run on older kernels" in Toolchain --->, which I
checked.


(I also posted this to
https://stackoverflow.com/questions/78921025/how-do-i-include-glibc-versions-needed-by-node-in-my-buildroot-config
.)


--
Daryl Spitzer

--000000000000b4f2630620b2a470
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px 0px 1.1em;padding:0px;border:0px;fo=
nt-variant-numeric:inherit;font-variant-east-asian:inherit;font-variant-alt=
ernates:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple=
-system,&quot;system-ui&quot;,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&=
quot;,&quot;Liberation Sans&quot;,sans-serif;font-size-adjust:inherit;font-=
kerning:inherit;font-feature-settings:inherit;font-size:15px;vertical-align=
:baseline;box-sizing:inherit;clear:both;color:rgb(12,13,14)">I&#39;m buildi=
ng a root filesystem using buildroot (running on Ubuntu 22.04.4 LTS) for an=
 ARM Cortex-A7 target. I&#39;m including Node.js by selecting &quot;[*] nod=
ejs&quot; in Target packages ---&gt; Interpreter languages and scripting --=
-&gt;.</p><p style=3D"margin:0px 0px 1.1em;padding:0px;border:0px;font-vari=
ant-numeric:inherit;font-variant-east-asian:inherit;font-variant-alternates=
:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple-system=
,&quot;system-ui&quot;,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&=
quot;Liberation Sans&quot;,sans-serif;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:15px;vertical-align:baseli=
ne;box-sizing:inherit;clear:both;color:rgb(12,13,14)">After successfully fl=
ashing and booting the target, I run=C2=A0<code style=3D"margin:0px;border:=
0px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretc=
h:inherit;line-height:inherit;font-size-adjust:inherit;font-kerning:inherit=
;font-feature-settings:inherit;vertical-align:baseline;box-sizing:inherit">=
node</code>=C2=A0in=C2=A0<code style=3D"margin:0px;border:0px;font-style:in=
herit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-he=
ight:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-set=
tings:inherit;vertical-align:baseline;box-sizing:inherit">/usr/bin/</code>=
=C2=A0and get:</p><pre class=3D"gmail-lang-js gmail-s-code-block" style=3D"=
margin-top:0px;border:0px;font-variant-numeric:inherit;font-variant-east-as=
ian:inherit;font-variant-alternates:inherit;font-stretch:inherit;font-size-=
adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;vertical-=
align:baseline;box-sizing:inherit;width:auto;max-height:600px;overflow:auto=
;color:rgb(12,13,14)"><code class=3D"gmail-hljs gmail-language-javascript" =
style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant:=
inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-f=
amily:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-se=
ttings:inherit;vertical-align:baseline;box-sizing:inherit;background-color:=
transparent;white-space:inherit">/usr/bin # ./node
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libm.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.38&#39; not found (required by ./node)
./node: /lib/libm.so.6: version `</span><span class=3D"gmail-hljs-variable =
gmail-constant_" style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;font-size:13px;vertical-align:baseline;box-=
sizing:inherit">GLIBC_2</span><span class=3D"gmail-hljs-number" style=3D"ma=
rgin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fon=
t-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inher=
it;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;font-size:13px;vertical-align:baseline;box-sizing:inherit">.29</span><s=
pan class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;font=
-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit">&#39; not found (required by ./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libstdc++.so.6: no version information available (required by =
./node)
./node: /lib/libc.so.6: version `GLIBC_2.33&#39;</span> not found (required=
 by ./node)
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libc.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.34&#39; not found (required by ./node)
./node: /lib/libc.so.6: version `</span><span class=3D"gmail-hljs-variable =
gmail-constant_" style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;font-size:13px;vertical-align:baseline;box-=
sizing:inherit">GLIBC_2</span><span class=3D"gmail-hljs-number" style=3D"ma=
rgin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fon=
t-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inher=
it;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;font-size:13px;vertical-align:baseline;box-sizing:inherit">.32</span><s=
pan class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;font=
-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit">&#39; not found (required by ./node)
./node: /lib/libc.so.6: version `GLIBC_2.38&#39;</span> not found (required=
 by ./node)
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libc.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.32&#39; not found (required by /usr/lib/libuv.so.1)
./node: /lib/libc.so.6: version `</span><span class=3D"gmail-hljs-variable =
gmail-constant_" style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;font-size:13px;vertical-align:baseline;box-=
sizing:inherit">GLIBC_2</span><span class=3D"gmail-hljs-number" style=3D"ma=
rgin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fon=
t-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inher=
it;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;font-size:13px;vertical-align:baseline;box-sizing:inherit">.38</span><s=
pan class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;font=
-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit">&#39; not found (required by /usr/lib/libuv.=
so.1)
./node: /lib/libc.so.6: version `GLIBC_2.33&#39;</span> not found (required=
 by /usr/lib/libuv.<span class=3D"gmail-hljs-property" style=3D"margin:0px;=
padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight:=
inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font-s=
ize-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;font-=
size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span class=
=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-styl=
e:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;lin=
e-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:=
inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baselin=
e;box-sizing:inherit">.1</span>)
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libc.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.34&#39; not found (required by /usr/lib/libuv.so.1)
./node: /lib/libc.so.6: version `</span><span class=3D"gmail-hljs-variable =
gmail-constant_" style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;font-size:13px;vertical-align:baseline;box-=
sizing:inherit">GLIBC_2</span><span class=3D"gmail-hljs-number" style=3D"ma=
rgin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fon=
t-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inher=
it;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;font-size:13px;vertical-align:baseline;box-sizing:inherit">.34</span><s=
pan class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;font=
-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit">&#39; not found (required by /usr/lib/libcar=
es.so.2)
./node: /lib/libc.so.6: version `GLIBC_2.33&#39;</span> not found (required=
 by /usr/lib/libcares.<span class=3D"gmail-hljs-property" style=3D"margin:0=
px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weig=
ht:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;fon=
t-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fo=
nt-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span cla=
ss=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-st=
yle:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;l=
ine-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kernin=
g:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:basel=
ine;box-sizing:inherit">.2</span>)
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libc.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.36&#39; not found (required by /usr/lib/libcares.so.2)
./node: /lib/libc.so.6: version `</span><span class=3D"gmail-hljs-variable =
gmail-constant_" style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;font-size:13px;vertical-align:baseline;box-=
sizing:inherit">GLIBC_2</span><span class=3D"gmail-hljs-number" style=3D"ma=
rgin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fon=
t-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inher=
it;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;font-size:13px;vertical-align:baseline;box-sizing:inherit">.38</span><s=
pan class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;font=
-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit">&#39; not found (required by /usr/lib/libcar=
es.so.2)
./node: /lib/libc.so.6: version `GLIBC_2.38&#39;</span> not found (required=
 by /usr/lib/libcrypto.<span class=3D"gmail-hljs-property" style=3D"margin:=
0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-wei=
ght:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;fo=
nt-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;f=
ont-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span cl=
ass=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-s=
tyle:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;=
line-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerni=
ng:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:base=
line;box-sizing:inherit">.3</span>)
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libc.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.33&#39; not found (required by /usr/lib/libcrypto.so.3)
./node: /lib/libc.so.6: version `</span><span class=3D"gmail-hljs-variable =
gmail-constant_" style=3D"margin:0px;padding:0px;border:0px;font-style:inhe=
rit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-heig=
ht:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:inheri=
t;font-feature-settings:inherit;font-size:13px;vertical-align:baseline;box-=
sizing:inherit">GLIBC_2</span><span class=3D"gmail-hljs-number" style=3D"ma=
rgin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fon=
t-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inher=
it;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inhe=
rit;font-size:13px;vertical-align:baseline;box-sizing:inherit">.34</span><s=
pan class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;border:0px;=
font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:in=
herit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;font=
-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-alig=
n:baseline;box-sizing:inherit">&#39; not found (required by /usr/lib/libcry=
pto.so.3)
./node: /lib/libc.so.6: version `GLIBC_2.33&#39;</span> not found (required=
 by /usr/lib/libssl.<span class=3D"gmail-hljs-property" style=3D"margin:0px=
;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight=
:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font-=
size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;font=
-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span class=
=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-styl=
e:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;lin=
e-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning:=
inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baselin=
e;box-sizing:inherit">.3</span>)
./<span class=3D"gmail-hljs-attr" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;font-size-adjust:inherit;fo=
nt-kerning:inherit;font-feature-settings:inherit;font-size:13px;vertical-al=
ign:baseline;box-sizing:inherit">node</span>: <span class=3D"gmail-hljs-reg=
exp" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-var=
iant:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;f=
ont-family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inher=
it">/lib/</span>libc.<span class=3D"gmail-hljs-property" style=3D"margin:0p=
x;padding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weigh=
t:inherit;font-stretch:inherit;line-height:inherit;font-family:inherit;font=
-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;fon=
t-size:13px;vertical-align:baseline;box-sizing:inherit">so</span><span clas=
s=3D"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:inherit;font-size-adjust:inherit;font-kerning=
:inherit;font-feature-settings:inherit;font-size:13px;vertical-align:baseli=
ne;box-sizing:inherit">.6</span>: version <span class=3D"gmail-hljs-string"=
 style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant=
:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-=
family:inherit;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:13px;vertical-align:baseline;box-sizing:inherit">=
`GLIBC_2.34&#39; not found (required by /usr/lib/libssl.so.3)</span></code>=
</pre><p style=3D"margin:0px 0px 1.1em;padding:0px;border:0px;font-variant-=
numeric:inherit;font-variant-east-asian:inherit;font-variant-alternates:inh=
erit;font-stretch:inherit;line-height:inherit;font-family:-apple-system,&qu=
ot;system-ui&quot;,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot=
;Liberation Sans&quot;,sans-serif;font-size-adjust:inherit;font-kerning:inh=
erit;font-feature-settings:inherit;font-size:15px;vertical-align:baseline;b=
ox-sizing:inherit;clear:both;color:rgb(12,13,14)">I don&#39;t see how to ch=
ange the buildroot config to include the required versions of GLIBC.</p><p =
style=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;fon=
t-variant-east-asian:inherit;font-variant-alternates:inherit;font-stretch:i=
nherit;line-height:inherit;font-family:-apple-system,&quot;system-ui&quot;,=
&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sans&qu=
ot;,sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-feature-s=
ettings:inherit;font-size:15px;vertical-align:baseline;box-sizing:inherit;c=
lear:both;color:rgb(12,13,14)">The only glibc-related config options I see =
(in=C2=A0<code style=3D"margin:0px;border:0px;font-style:inherit;font-varia=
nt:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;fon=
t-size-adjust:inherit;font-kerning:inherit;font-feature-settings:inherit;ve=
rtical-align:baseline;box-sizing:inherit">make nconfig</code>) is &quot;Ena=
ble compatibility shims to run on older kernels&quot; in Toolchain ---&gt;,=
 which I checked.</p><p style=3D"margin:0px;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-variant-alternate=
s:inherit;font-stretch:inherit;line-height:inherit;font-family:-apple-syste=
m,&quot;system-ui&quot;,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,=
&quot;Liberation Sans&quot;,sans-serif;font-size-adjust:inherit;font-kernin=
g:inherit;font-feature-settings:inherit;font-size:15px;vertical-align:basel=
ine;box-sizing:inherit;clear:both;color:rgb(12,13,14)"><br></p><p style=3D"=
margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-variant=
-east-asian:inherit;font-variant-alternates:inherit;font-stretch:inherit;li=
ne-height:inherit;font-family:-apple-system,&quot;system-ui&quot;,&quot;Seg=
oe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-=
serif;font-size-adjust:inherit;font-kerning:inherit;font-feature-settings:i=
nherit;font-size:15px;vertical-align:baseline;box-sizing:inherit;clear:both=
;color:rgb(12,13,14)">(I also posted this to=C2=A0<a href=3D"https://stacko=
verflow.com/questions/78921025/how-do-i-include-glibc-versions-needed-by-no=
de-in-my-buildroot-config">https://stackoverflow.com/questions/78921025/how=
-do-i-include-glibc-versions-needed-by-node-in-my-buildroot-config</a>.)</p=
><p style=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit=
;font-variant-east-asian:inherit;font-variant-alternates:inherit;font-stret=
ch:inherit;line-height:inherit;font-family:-apple-system,&quot;system-ui&qu=
ot;,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation San=
s&quot;,sans-serif;font-size-adjust:inherit;font-kerning:inherit;font-featu=
re-settings:inherit;font-size:15px;vertical-align:baseline;box-sizing:inher=
it;clear:both;color:rgb(12,13,14)"><br></p><p style=3D"margin:0px;padding:0=
px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;=
font-variant-alternates:inherit;font-stretch:inherit;line-height:inherit;fo=
nt-family:-apple-system,&quot;system-ui&quot;,&quot;Segoe UI Adjusted&quot;=
,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size-adju=
st:inherit;font-kerning:inherit;font-feature-settings:inherit;font-size:15p=
x;vertical-align:baseline;box-sizing:inherit;clear:both;color:rgb(12,13,14)=
">--<br>Daryl=C2=A0Spitzer<br></p><p style=3D"margin:0px;padding:0px;border=
:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-vari=
ant-alternates:inherit;font-stretch:inherit;line-height:inherit;font-family=
:-apple-system,&quot;system-ui&quot;,&quot;Segoe UI Adjusted&quot;,&quot;Se=
goe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size-adjust:inheri=
t;font-kerning:inherit;font-feature-settings:inherit;font-size:15px;vertica=
l-align:baseline;box-sizing:inherit;clear:both;color:rgb(12,13,14)"><br></p=
></div>

--000000000000b4f2630620b2a470--

--===============0673120105679466330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0673120105679466330==--
