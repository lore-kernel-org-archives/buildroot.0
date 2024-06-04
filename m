Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FA4C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 15:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63236066B;
	Tue,  4 Jun 2024 15:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yNyovlwBZSd; Tue,  4 Jun 2024 15:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A0F760BD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A0F760BD5;
	Tue,  4 Jun 2024 15:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57C401BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 15:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50442846FB
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 15:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoREBdaHWQ2q for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 15:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEA34846E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA34846E3
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEA34846E3
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 15:48:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a68a4a9946cso372972966b.1
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 08:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717516092; x=1718120892;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZB3MR988Niw+T+y+3ExhfJ8T12j7MRVjQd2hxOQx4h0=;
 b=ZSmZSeZDGKHCdmldQN21FvJoTTSzBUeVMuY/dQNjlUwq1XeaW2n9GAe+MdqnPqq7/E
 ZUR1FK8xAKL6BXY6J17i6gSsEUTWbJiwcjxfE4UV7gp0ef+Ggqr/A/JNSko9ZH2V09d/
 Y0lCcR11ScfMPWmZ3t0qqUuLBpWQTi6mBz0qnRJr8AUJc4YXVbJ5mDpzsxIW/EisYO0k
 Fg/BzXL3pI5+3G3fHQST6iDBrW/SjH8NaVEoeJzdf1f5P7vg4akagrcbjGrNg3FNZtci
 584pU4QPufkQHg86IIaNf1c6RAjy/vOmss9eZipCLiZbl/XGJr7jP+ZpqMFH7E2IcXXT
 8s6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx93VLINoWE3W35xShw2v2OYWSs41aEWlYyaFYKp3nFaMZxuTDhAPuTal0xu2/eyI6zrNLDcKyUPutQY9Z2btuyvaVqb2ufg==
X-Gm-Message-State: AOJu0YytFl6ooeS3bqC2WU2TjTpkr0rI78vXV+jA/2T/qz7eWyovnTih
 W016q1H+x8nk9oyCr1LB/fqVItCfFNVM+ekGkG4PBiADiGpbauktUo/i+s7ws9zseoxoUv1pyr9
 T
X-Google-Smtp-Source: AGHT+IHr+QVZoohJpmhCvSLl0n4Ush/e6+6oSW+mHb3Dpj9i+GsSx4UbJmdiVhWHKJlNF+KByh+HUQ==
X-Received: by 2002:a17:906:aa48:b0:a5d:107b:60be with SMTP id
 a640c23a62f3a-a682272efd5mr775324366b.69.1717516092045; 
 Tue, 04 Jun 2024 08:48:12 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68519892c8sm605628366b.65.2024.06.04.08.48.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 08:48:11 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so601889866b.0
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 08:48:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXvZWIA+xNBuP5Cj6mWHjjoFfBh+Nlkf6+xf8jE4OyrejS7IBFNlJ567c5PyfcSsU2p5CD1qlWaMgjK5NqON3QBEmVXpBEKPQ==
X-Received: by 2002:a17:906:f9ce:b0:a69:65a7:420e with SMTP id
 a640c23a62f3a-a6965b685b8mr137027466b.35.1717516090953; Tue, 04 Jun 2024
 08:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda>
 <87a5k3ljy8.fsf@dell.be.48ers.dk> <874ja8g88f.fsf@dell.be.48ers.dk>
In-Reply-To: <874ja8g88f.fsf@dell.be.48ers.dk>
Date: Tue, 4 Jun 2024 08:47:59 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
Message-ID: <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1717516092; x=1718120892; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZB3MR988Niw+T+y+3ExhfJ8T12j7MRVjQd2hxOQx4h0=;
 b=J9rGhWhL2hgUIRpqXpk/IccwrYda2lhmGE2R6C2JlxQk+C+FU7gcXfnZ4uhFWMNlrf
 xI2Rf0EvWgmYqS5C7SQO+6wfO0erA7AQadUHQ7UqW9Jpj9dx9ItAli5aYJUShDDZah2t
 BkENddQQvXR9kBTd2QyV+l8l+Zf6xwcUV7PY5f+AQItEx+CfM6VEawfdRHZcZMT0eQSX
 GWpGVjDLieimdv7GB50Oz32PVe/CxKBjKe+2hKPx0CuqZwX2d1QWtMEwKEo1hYRZn6wh
 h52DcgYsi0PDF278UwOxZVrqdoohDVLoIr+0RY85xP1cElGWfKQ0/up1brkqlK6Mp+kE
 R/oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=J9rGhWhL
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4474123682669828239=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4474123682669828239==
Content-Type: multipart/alternative; boundary="0000000000007f5ef6061a12600c"

--0000000000007f5ef6061a12600c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter,

On Tue, Jun 4, 2024, 6:15=E2=80=AFAM Peter Korsgaard <peter@korsgaard.com> =
wrote:

> >>>>> "Peter" =3D=3D Peter Korsgaard <peter@korsgaard.com> writes:
>
>  >> $ make docker-compose-source
>  >> [...]
>  >> go: downloading dario.cat/mergo v1.0.0
>  >> [...]
>  >> go: downloading github.com/imdario/mergo v0.3.16
>  >> [...]
>  >> go: github.com/docker/compose/v2/cmd/compose imports
>  >> github.com/docker/cli/cli/command/container imports
>  >> github.com/docker/cli/cli/compose/loader imports
>  >> dario.cat/mergo: unrecognized import path "dario.cat/mergo": https
> fetch: Get "https://dario.cat/mergo?go-get=3D1": dial tcp: lookup dario.c=
at
> on 127.0.0.53:53: server misbehaving
>
>  >> As I understand it, dario.cat is a "vanity URL" [0] so it should not
> be
>  >> resolved by the resolver, but by go-pkg, but apparently that did not
>  >> happen for me...
>
>  > I believe the domain simply expired:
>
>  > Registry Expiry Date: 2024-06-01T07:05:04.361
>
>  > I reported it upstream to their issue tracker:
>
>  > https://github.com/darccio/mergo/issues/252
>
> This is now fixed:
>
> Registry Expiry Date: 2025-06-01T07:05:04.361Z
>
> But we still have the hash mismatch:
>
> ERROR: while checking hashes from
> package/docker-compose/docker-compose.hash
> ERROR: docker-compose-2.27.0-go2.tar.gz has wrong sha256 hash:
> ERROR: expected:
> 448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046e638df
> ERROR: got     :
> 42e9d2a33806656bd145ec742a3ba00b64acc3f88b500793d3b78319c39e25e0
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> What to do? Do we have the original tarball somewhere so we can compare
> to see what changed? I see there is a 2.27.1 version that we could bump
> to but I would feel more confident if we understood what went wrong
> here.
>

Is this the correct version? (I'm on my phone and don't have a chance to
check right now).

https://mirror.skiffos.com/docker-compose/docker-compose-2.27.0-go2.tar.gz

It seems to me that there is a difference between either Go versions
vendor/ format OR there is a difference between architectures (amd64 or
arm).

Hopefully we can tell the difference from the tarball above

Thanks,
Christian Stewart

--0000000000007f5ef6061a12600c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Peter,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Jun 4, 2024, 6:15=E2=80=AFAM Peter Korsg=
aard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;=
Peter&quot; =3D=3D Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.co=
m" target=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt; writes:=
<br>
<br>
=C2=A0&gt;&gt; $ make docker-compose-source<br>
=C2=A0&gt;&gt; [...]<br>
=C2=A0&gt;&gt; go: downloading <a href=3D"http://dario.cat/mergo" rel=3D"no=
referrer noreferrer" target=3D"_blank">dario.cat/mergo</a> v1.0.0<br>
=C2=A0&gt;&gt; [...]<br>
=C2=A0&gt;&gt; go: downloading <a href=3D"http://github.com/imdario/mergo" =
rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/imdario/mergo</a=
> v0.3.16<br>
=C2=A0&gt;&gt; [...]<br>
=C2=A0&gt;&gt; go: <a href=3D"http://github.com/docker/compose/v2/cmd/compo=
se" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/docker/compo=
se/v2/cmd/compose</a> imports<br>
=C2=A0&gt;&gt; <a href=3D"http://github.com/docker/cli/cli/command/containe=
r" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/docker/cli/cl=
i/command/container</a> imports<br>
=C2=A0&gt;&gt; <a href=3D"http://github.com/docker/cli/cli/compose/loader" =
rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/docker/cli/cli/c=
ompose/loader</a> imports<br>
=C2=A0&gt;&gt; <a href=3D"http://dario.cat/mergo" rel=3D"noreferrer norefer=
rer" target=3D"_blank">dario.cat/mergo</a>: unrecognized import path &quot;=
<a href=3D"http://dario.cat/mergo" rel=3D"noreferrer noreferrer" target=3D"=
_blank">dario.cat/mergo</a>&quot;: https fetch: Get &quot;<a href=3D"https:=
//dario.cat/mergo?go-get=3D1" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://dario.cat/mergo?go-get=3D1</a>&quot;: dial tcp: lookup <a href=
=3D"http://dario.cat" rel=3D"noreferrer noreferrer" target=3D"_blank">dario=
.cat</a> on <a href=3D"http://127.0.0.53:53" rel=3D"noreferrer noreferrer" =
target=3D"_blank">127.0.0.53:53</a>: server misbehaving<br>
<br>
=C2=A0&gt;&gt; As I understand it, <a href=3D"http://dario.cat" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">dario.cat</a> is a &quot;vanity URL&qu=
ot; [0] so it should not be<br>
=C2=A0&gt;&gt; resolved by the resolver, but by go-pkg, but apparently that=
 did not<br>
=C2=A0&gt;&gt; happen for me...<br>
<br>
=C2=A0&gt; I believe the domain simply expired:<br>
<br>
=C2=A0&gt; Registry Expiry Date: 2024-06-01T07:05:04.361<br>
<br>
=C2=A0&gt; I reported it upstream to their issue tracker:<br>
<br>
=C2=A0&gt; <a href=3D"https://github.com/darccio/mergo/issues/252" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://github.com/darccio/mergo/is=
sues/252</a><br>
<br>
This is now fixed:<br>
<br>
Registry Expiry Date: 2025-06-01T07:05:04.361Z<br>
<br>
But we still have the hash mismatch:<br>
<br>
ERROR: while checking hashes from package/docker-compose/docker-compose.has=
h<br>
ERROR: docker-compose-2.27.0-go2.tar.gz has wrong sha256 hash:<br>
ERROR: expected: 448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046=
e638df<br>
ERROR: got=C2=A0 =C2=A0 =C2=A0: 42e9d2a33806656bd145ec742a3ba00b64acc3f88b5=
00793d3b78319c39e25e0<br>
ERROR: Incomplete download, or man-in-the-middle (MITM) attack<br>
<br>
What to do? Do we have the original tarball somewhere so we can compare<br>
to see what changed? I see there is a 2.27.1 version that we could bump<br>
to but I would feel more confident if we understood what went wrong<br>
here.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Is this the correct version? (I&#39;m on my phone and don&#39;t have a=
 chance to check right now).</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><a href=3D"https://mirror.skiffos.com/docker-compose/docker-compose-2.=
27.0-go2.tar.gz">https://mirror.skiffos.com/docker-compose/docker-compose-2=
.27.0-go2.tar.gz</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>It seems to me that there is a difference between either Go versions vendo=
r/ format OR there is a difference between architectures (amd64 or arm).=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Hopefully we can tel=
l the difference from the tarball above</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian Stewart=C2=A0</div=
></div>

--0000000000007f5ef6061a12600c--

--===============4474123682669828239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4474123682669828239==--
