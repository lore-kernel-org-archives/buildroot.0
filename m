Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C8DC12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:08:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE2A06121F
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE2A06121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9008D400C9;
	Wed, 21 Jul 2021 19:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5i4HD3pyMfWo; Wed, 21 Jul 2021 19:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F5F400F5;
	Wed, 21 Jul 2021 19:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5050C1BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D8958291C
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nklabs-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIKsxYmiANeb for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 19:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2761828F7
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 19:08:03 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id e13so3256059ilc.1
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ELW3rijIasSYTUYKYegCWILg3/qJlXPaZao/7kDy0I=;
 b=qx9sUhZASkJ17Gv2vwEijv+dg4SgkltMppzmwAhOKItnBl8IuYJzErKxGPAkUGN2VQ
 dqhoyXfoYHCc7s2oq+VFctlpNQZd0VcnuApGEKbrmWE4dWVlL9IfhqXjMtmATZ0xUX7f
 QLUgkun5pqTrsXBCvIK7jNr9dJwZAjrfNJ7XFk0uzgvMY1nJ1S82gNzeHmrtYrsqOW+Q
 j2Vq4XcheFLoRGlwF2tFnl5UsdR1s/aECLWPrKuVuVrLUawVITKPaQ6WQzZmXwNUnCvC
 bf45cMzXVomZ4MOuUpHfFgTBV7dqWK08S9e+LLEGwppmx+lAt0rlSEyKnZkWwbsv84dg
 vIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ELW3rijIasSYTUYKYegCWILg3/qJlXPaZao/7kDy0I=;
 b=D/L59MiXx/rhKCJ94+sul8/BA3D1ZDVdJ08Ihkc8Q662+rU2EfGGMkK3YTko+TCUTb
 QEKME5YgQxjn0ujioV0OfMkDMHR5iw4v7fHcba3282HpQf2reaW1lZGf/AbZB16298Gg
 5lpe1dlDR893jC2oZQDrXhPvEtcm7R/Z+lrHZDDHBJFhT06vzz9J5ENyUG3pJCevXgg0
 eUc2KcDmX9ybzbvM670O+FBRJYkK77J0y1h4NKrGxMxAIvaeg1McHP4sXVXlBSiAiMRZ
 g6w7J2FUydF3kdpKrITbLyqirqjTu1zninjEnDQic9RSChrghlONyn5aE125pHGrcdCA
 elWw==
X-Gm-Message-State: AOAM5326YzAKBOUOeeX15cqBjlbrK63GLWDsLCVlrUF07khxyXoyDO3l
 jmavP3m9dH1eVay/YtAaVBwmNg99ryouvHgrO576AHtoe9ln6A==
X-Google-Smtp-Source: ABdhPJws5gxdyS2tc5zmY4EE2qhLkHHTNFerROhX/dO0Bu0Wq4Tuw10ZS3vh5eujWX+oNMkGvVu0WLW34dzgP5+YSg0=
X-Received: by 2002:a92:d58f:: with SMTP id a15mr8399440iln.18.1626894483120; 
 Wed, 21 Jul 2021 12:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
In-Reply-To: <20210721094154.74005093@windsurf>
From: Patricia Holden <pholden@nklabs.com>
Date: Wed, 21 Jul 2021 15:07:52 -0400
Message-ID: <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="000000000000c11c3905c7a6e3f7"
Subject: Re: [Buildroot] Question about pkg-config pc files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--000000000000c11c3905c7a6e3f7
Content-Type: multipart/alternative; boundary="000000000000c11c3705c7a6e3f5"

--000000000000c11c3705c7a6e3f5
Content-Type: text/plain; charset="UTF-8"

I looked into QQmlApplication examples, they all use pc files.

I'm attaching the files that are doing the import of pkg-config pc files.
This is the customer's implementation.

The attached URL provides examples that use the same implementation.  Note
all their examples use the "import" statement at top, this is what is
looking for pc files:

https://doc.qt.io/qt-5/qtmultimedia-multimedia-video-qmlvideo-example.html

On Wed, Jul 21, 2021 at 3:41 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Wed, 21 Jul 2021 02:23:55 -0400
> Patricia Holden <pholden@nklabs.com> wrote:
>
> > Yes, QQmlApplucation I am porting for a client it is using pc at
> > runtime.  Would it help to see what they are doing?
>
> Ah, it is your customer-specific application that is using the .pc
> files, not QT itself ?
>
> If it's your customer-specific application, then it would be useful to
> check why they are doing this, as it feels odd.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
Patricia A. Holden

--000000000000c11c3705c7a6e3f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I looked into QQmlApplication=C2=A0examples, they all use =
pc files.<div><br></div><div>I&#39;m attaching the files that are doing the=
 import of pkg-config pc files.=C2=A0 This is the customer&#39;s implementa=
tion.</div><div><br></div><div>The attached URL provides examples that use =
the same implementation.=C2=A0 Note all their examples use the &quot;import=
&quot; statement at top, this is what is looking for pc files:</div><div><b=
r></div><div><a href=3D"https://doc.qt.io/qt-5/qtmultimedia-multimedia-vide=
o-qmlvideo-example.html">https://doc.qt.io/qt-5/qtmultimedia-multimedia-vid=
eo-qmlvideo-example.html</a><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 3:41 AM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello,<br>
<br>
On Wed, 21 Jul 2021 02:23:55 -0400<br>
Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank"=
>pholden@nklabs.com</a>&gt; wrote:<br>
<br>
&gt; Yes, QQmlApplucation I am porting for a client it is using pc at<br>
&gt; runtime.=C2=A0 Would it help to see what they are doing?<br>
<br>
Ah, it is your customer-specific application that is using the .pc<br>
files, not QT itself ?<br>
<br>
If it&#39;s your customer-specific application, then it would be useful to<=
br>
check why they are doing this, as it feels odd.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</div></div>

--000000000000c11c3705c7a6e3f5--

--000000000000c11c3905c7a6e3f7
Content-Type: text/x-c++src; charset="US-ASCII"; name="main.cpp"
Content-Disposition: attachment; filename="main.cpp"
Content-Transfer-Encoding: base64
Content-ID: <f_krduvbu71>
X-Attachment-Id: f_krduvbu71

I2luY2x1ZGUgPFFHdWlBcHBsaWNhdGlvbj4KI2luY2x1ZGUgPFFRbWxBcHBsaWNhdGlvbkVuZ2lu
ZT4KI2luY2x1ZGUgPFF0R3VpL1FHdWlBcHBsaWNhdGlvbj4KI2luY2x1ZGUgPFF0UXVpY2svUVF1
aWNrVmlldz4KI2luY2x1ZGUgPFF0UW1sL1FRbWxDb250ZXh0PgojaW5jbHVkZSA8UXRRbWwvUVFt
bEVuZ2luZT4KI2luY2x1ZGUgPFF0TXVsdGltZWRpYS9RQWJzdHJhY3RWaWRlb1N1cmZhY2U+CiNp
bmNsdWRlICJtYW51YWxjYWxpYnJhdGlvbi5oIgojaW5jbHVkZSAidmlkZW9zdHJlYW0uaCIKI2lu
Y2x1ZGUgInZpZGVvYWRhcHRlci5oIgojaW5jbHVkZSAic2lnbmFsaGFuZGxlci5oIgojaW5jbHVk
ZSA8UVByb2Nlc3M+CiNpbmNsdWRlIDxnc3QvZ3N0Lmg+CiNpbmNsdWRlIDxRdENvcmUvcW9iamVj
dC5oPgoKaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKewogICAgUVByb2Nlc3MgcHJv
Y2VzczsKCiAgICBxSW5mbygpPDwiVlBBIENhbGlicmF0aW9uIEFwcCBJRCA6ICI8PFFDb3JlQXBw
bGljYXRpb246OmFwcGxpY2F0aW9uUGlkKCk7CiAgICBRQ29yZUFwcGxpY2F0aW9uOjpzZXRBdHRy
aWJ1dGUoUXQ6OkFBX0VuYWJsZUhpZ2hEcGlTY2FsaW5nKTsKCiAgICBRR3VpQXBwbGljYXRpb24g
YXBwKGFyZ2MsIGFyZ3YpOwogICAgUVFtbEFwcGxpY2F0aW9uRW5naW5lIGVuZ2luZTsKICAgIFFR
bWxEZWJ1Z2dpbmdFbmFibGVyIGVuYWJsZXI7CgogICAgVmlkZW9BZGFwdGVyIGFkYXB0ZXI7CiAg
ICBTaWduYWxIYW5kbGVyICpzaWduYWxIYW5kbGVyID0gU2lnbmFsSGFuZGxlcjo6Z2V0SW5zdGFu
Y2UoKTsKCiAgICBlbmdpbmUucm9vdENvbnRleHQoKS0+c2V0Q29udGV4dFByb3BlcnR5KFFMYXRp
bjFTdHJpbmcoInZpZGVvQWRhcHRlciIpLCAmYWRhcHRlcik7CgogICAgY29uc3QgUVVybCB1cmwo
UVVybDo6ZnJvbUxvY2FsRmlsZSgibWFpbi5xbWwiKSk7CiAgICBRT2JqZWN0Ojpjb25uZWN0KCZl
bmdpbmUsICZRUW1sQXBwbGljYXRpb25FbmdpbmU6Om9iamVjdENyZWF0ZWQsCgkJICAgICAmYXBw
LCBbdXJsXShRT2JqZWN0ICpvYmosIGNvbnN0IFFVcmwgJm9ialVybCkgewoJCSAgICAgICBpZiAo
IW9iaiAmJiB1cmwgPT0gb2JqVXJsKQoJCQkgUUNvcmVBcHBsaWNhdGlvbjo6ZXhpdCgtMSk7CgkJ
ICAgICB9LCBRdDo6UXVldWVkQ29ubmVjdGlvbik7CiAgICBlbmdpbmUubG9hZCh1cmwpOwogICAg
aWYgKGVuZ2luZS5yb290T2JqZWN0cygpLmlzRW1wdHkoKSkKICAgICAgICByZXR1cm4gLTE7Cgog
ICAgTWFudWFsQ2FsaWJyYXRpb24gbWFudWFsQ2FsaWJyYXRpb247CiAgICBWaWRlb1N0cmVhbSAq
dmlkZW9TdHJlYW0gPSBWaWRlb1N0cmVhbTo6Z2V0SW5zdGFuY2UoKTsKICAgIFFPYmplY3QgKnJv
b3RPYmplY3QgPSBlbmdpbmUucm9vdE9iamVjdHMoKS5maXJzdCgpOwoKICAgIFFPYmplY3Q6OmNv
bm5lY3QoJm1hbnVhbENhbGlicmF0aW9uLFNJR05BTChzaWdDaGFuZ2VWaWRlb1Bvc2l0aW9uKFJl
dGljdWxlTFVUKSksdmlkZW9TdHJlYW0sU0xPVChvbkNoYW5nZVZpZGVvUG9zaXRpb24oUmV0aWN1
bGVMVVQpKSk7CiAgICBRT2JqZWN0Ojpjb25uZWN0KHJvb3RPYmplY3QsIFNJR05BTChzaWdJbmNW
aWRlb0RpYW1ldGVyKCkpLCZtYW51YWxDYWxpYnJhdGlvbiwgU0xPVChvbkluY1ZpZGVvRGlhbWV0
ZXIoKSkpOwogICAgUU9iamVjdDo6Y29ubmVjdChyb290T2JqZWN0LCBTSUdOQUwoc2lnRGVjVmlk
ZW9EaWFtZXRlcigpKSwmbWFudWFsQ2FsaWJyYXRpb24sIFNMT1Qob25EZWNWaWRlb0RpYW1ldGVy
KCkpKTsKICAgIFFPYmplY3Q6OmNvbm5lY3Qocm9vdE9iamVjdCwgU0lHTkFMKHNpZ1VwKCkpLCZt
YW51YWxDYWxpYnJhdGlvbiwgU0xPVChvblVwKCkpKTsKICAgIFFPYmplY3Q6OmNvbm5lY3Qocm9v
dE9iamVjdCwgU0lHTkFMKHNpZ0Rvd24oKSksJm1hbnVhbENhbGlicmF0aW9uLCBTTE9UKG9uRG93
bigpKSk7CiAgICBRT2JqZWN0Ojpjb25uZWN0KHJvb3RPYmplY3QsIFNJR05BTChzaWdSaWdodCgp
KSwmbWFudWFsQ2FsaWJyYXRpb24sIFNMT1Qob25SaWdodCgpKSk7CiAgICBRT2JqZWN0Ojpjb25u
ZWN0KHJvb3RPYmplY3QsIFNJR05BTChzaWdMZWZ0KCkpLCZtYW51YWxDYWxpYnJhdGlvbiwgU0xP
VChvbkxlZnQoKSkpOwogICAgUU9iamVjdDo6Y29ubmVjdChyb290T2JqZWN0LCBTSUdOQUwoc2ln
U2F2ZURhdGEoKSksJm1hbnVhbENhbGlicmF0aW9uLCBTTE9UKG9uU2F2ZURhdGEoKSkpOwogICAg
UU9iamVjdDo6Y29ubmVjdChyb290T2JqZWN0LCBTSUdOQUwoc2lnQ2hhbmdlRGlzdGFuY2UoaW50
KSksJm1hbnVhbENhbGlicmF0aW9uLCBTTE9UKG9uQ2hhbmdlRGlzdGFuY2UoaW50KSkpOwoKICAg
IFFPYmplY3Q6OmNvbm5lY3Qoc2lnbmFsSGFuZGxlciwgU0lHTkFMKHNpZ0NhbGlicmF0aW9uQ29u
dHJvbChFQ29tbWFuZElEKSksJm1hbnVhbENhbGlicmF0aW9uLCBTTE9UKG9uQ2FsaWJyYXRpb25D
b250cm9sKEVDb21tYW5kSUQpKSk7CgogICAgUU9iamVjdDo6Y29ubmVjdCgmbWFudWFsQ2FsaWJy
YXRpb24sIFNJR05BTChzaWdDaGFuZ2VEaXN0YW5jZVVJKFFWYXJpYW50KSkscm9vdE9iamVjdCwg
U0xPVChjaGFuZ2VEaXN0YW5jZVVJKFFWYXJpYW50KSkpOwogICAgUU9iamVjdDo6Y29ubmVjdCgm
bWFudWFsQ2FsaWJyYXRpb24sIFNJR05BTChzaWdBZGREaXN0YW5jZShRVmFyaWFudCkpLHJvb3RP
YmplY3QsIFNMT1Qob25BZGREaXN0YW5jZShRVmFyaWFudCkpKTsKICAgIFFPYmplY3Q6OmNvbm5l
Y3QodmlkZW9TdHJlYW0sIFNJR05BTChzaWdFbmFibGVDb250cm9sKFFWYXJpYW50KSksIHJvb3RP
YmplY3QsIFNMT1Qob25FbmFibGVDb250cm9scyhRVmFyaWFudCkpKTsKICAgIFFPYmplY3Q6OmNv
bm5lY3QoJmFwcCxTSUdOQUwoYWJvdXRUb1F1aXQoKSksdmlkZW9TdHJlYW0sU0xPVChjbHMoKSkp
OwogICAgbWFudWFsQ2FsaWJyYXRpb24uaW5pdCgpOwoKICAgIEdzdEVsZW1lbnQgKnZpZGVvU2lu
ayA9IGdzdF9lbGVtZW50X2ZhY3RvcnlfbWFrZSgicXR2aWRlb3NpbmsiLCBOVUxMKTsKICAgIHZp
ZGVvU3RyZWFtLT5zdGFydFN0ZWFtaW5nKHZpZGVvU2luayk7CiAgICByZXR1cm4gYXBwLmV4ZWMo
KTsKfQo=
--000000000000c11c3905c7a6e3f7
Content-Type: text/x-qml; charset="US-ASCII"; name="main.qml"
Content-Disposition: attachment; filename="main.qml"
Content-Transfer-Encoding: base64
Content-ID: <f_krduvbsz0>
X-Attachment-Id: f_krduvbsz0

aW1wb3J0IFF0UXVpY2sgMi45CmltcG9ydCBRdFF1aWNrLldpbmRvdyAyLjAKaW1wb3J0IFF0UXVp
Y2suQ29udHJvbHMgMi4wCmltcG9ydCBRdE11bHRpbWVkaWEgNS4wCgpXaW5kb3cgewogICAgc2ln
bmFsIHNpZ1VwKCk7CiAgICBzaWduYWwgc2lnRG93bigpOwogICAgc2lnbmFsIHNpZ1JpZ2h0KCk7
CiAgICBzaWduYWwgc2lnTGVmdCgpOwogICAgc2lnbmFsIHNpZ0luY1ZpZGVvRGlhbWV0ZXIoKTsK
ICAgIHNpZ25hbCBzaWdEZWNWaWRlb0RpYW1ldGVyKCk7CiAgICBzaWduYWwgc2lnQ2hhbmdlRGlz
dGFuY2UoaW50IGRpc3QpOwogICAgc2lnbmFsIHNpZ1NhdmVEYXRhKCk7CgogICAgZnVuY3Rpb24g
b25FbmFibGVDb250cm9scyhpc0VuYWJsZWQpewogICAgICAgIGNtYkRpc3RhbmNlLmVuYWJsZWQg
PSBpc0VuYWJsZWQ7CiAgICAgICAgYnRuRGVjVmlkZW9EaWFtZXRlci5lbmFibGVkID0gaXNFbmFi
bGVkOwogICAgICAgIGJ0bkluY1ZpZGVvRGlhbWV0ZXIuZW5hYmxlZCA9IGlzRW5hYmxlZDsKICAg
ICAgICBidG5Eb3duLmVuYWJsZWQgPSBpc0VuYWJsZWQ7CiAgICAgICAgYnRuTGVmdC5lbmFibGVk
ID0gaXNFbmFibGVkOwogICAgICAgIGJ0blJpZ2h0LmVuYWJsZWQgPSBpc0VuYWJsZWQ7CiAgICAg
ICAgYnRuVXAuZW5hYmxlZCA9IGlzRW5hYmxlZDsKICAgICAgICBidG5TYXZlLmVuYWJsZWQgPSBp
c0VuYWJsZWQ7CiAgICB9CgogICAgZnVuY3Rpb24gb25BZGREaXN0YW5jZSggZGlzdGFuY2Upewog
ICAgICAgIHZhciBhcnIgPSBkaXN0YW5jZS5zcGxpdCgiLCIpOwogICAgICAgIG1vZGVsLmNsZWFy
KCk7CiAgICAgICAgZm9yKHZhciBpPTA7aTwzO2krKyl7CiAgICAgICAgICAgIGNvbnNvbGUubG9n
KCdhcnIgOiAnK2FycltpXSk7CiAgICAgICAgICAgIG1vZGVsLmFwcGVuZCh7dGV4dDphcnJbaV19
KTsKICAgICAgICB9CiAgICAgICAgY21iRGlzdGFuY2UuY3VycmVudEluZGV4ID0gMDsKICAgIH0K
CiAgICBmdW5jdGlvbiBjaGFuZ2VEaXN0YW5jZVVJKGluZGV4KXsKICAgICAgICBjbWJEaXN0YW5j
ZS5jdXJyZW50SW5kZXggPSBpbmRleDsKICAgIH0KCiAgICBpZDp3aW5kb3cKICAgIHZpc2libGU6
IHRydWUKICAgIHdpZHRoOiAzMjAKICAgIGhlaWdodDogMjQwCiAgICB4OjAKICAgIHk6MAogICAg
Y29sb3I6IiNmZmZmZmYiCiAgICBmbGFnczogUXQuRnJhbWVsZXNzV2luZG93SGludHxRdC5XaW5k
b3cKICAgIFZpZGVvIHsKICAgICAgICBpZDogdmlkZW8KICAgICAgICB4OjAKICAgICAgICB5OjAK
ICAgICAgICB3aWR0aDogMzIwCiAgICAgICAgaGVpZ2h0OiAyNDAKICAgICAgICBzdXJmYWNlOiB2
aWRlb1N1cmZhY2UxIC8vYm91bmQgb24gdGhlIGNvbnRleHQgZnJvbSBtYWluKCkKICAgIH0KCiAg
ICBSZWN0YW5nbGUgewogICAgICAgIGlkOiBtYW51YWxDYWxpYnJhdGlvbgogICAgICAgIGNvbG9y
OiAndHJhbnNwYXJlbnQnCiAgICAgICAgd2lkdGg6IDMyMAogICAgICAgIGhlaWdodDogMjQwCiAg
ICAgICAgQ29tYm9Cb3ggewogICAgICAgICAgICB4OjUKICAgICAgICAgICAgaWQ6IGNtYkRpc3Rh
bmNlCiAgICAgICAgICAgIHk6NQogICAgICAgICAgICB3aWR0aDo5MAogICAgICAgICAgICBoZWln
aHQ6IDMwCiAgICAgICAgICAgIGVkaXRhYmxlOiBmYWxzZQogICAgICAgICAgICBmb250LnBpeGVs
U2l6ZTogMTYKCiAgICAgICAgICAgIG1vZGVsOiBMaXN0TW9kZWwgewogICAgICAgICAgICAgICAg
aWQ6IG1vZGVsCgogICAgICAgICAgICB9CiAgICAgICAgICAgIG9uQWNjZXB0ZWQ6IHsKICAgICAg
ICAgICAgICAgIGlmIChmaW5kKGVkaXRUZXh0KSA9PT0gLTEpCiAgICAgICAgICAgICAgICAgICAg
bW9kZWwuYXBwZW5kKHt0ZXh0OiBlZGl0VGV4dH0pCiAgICAgICAgICAgIH0KICAgICAgICAgICAg
Q29tcG9uZW50Lm9uQ29tcGxldGVkOiB7CiAgICAgICAgICAgICAgICBjb250ZW50SXRlbS5oZWln
aHQgPSAzMAogICAgICAgICAgICAgICAgY21iRGlzdGFuY2UucG9wdXAud2lkdGggID0gOTAKICAg
ICAgICAgICAgICAgIGNtYkRpc3RhbmNlLnBvcHVwLmhlaWdodCA9IDEyMDsKICAgICAgICAgICAg
ICAgIGZvbnQucGl4ZWxTaXplID0gMTYKCiAgICAgICAgICAgIH0KICAgICAgICAgICAgcG9wdXAu
Zm9udC5waXhlbFNpemU6IDE2CiAgICAgICAgICAgIHBvcHVwLmNvbnRlbnRJdGVtLmhlaWdodDog
MjAKICAgICAgICAgICAgb25DdXJyZW50SW5kZXhDaGFuZ2VkOiB7CiAgICAgICAgICAgICAgICBj
b25zb2xlLmxvZygiY3VycmVudEluZGV4IGNoYW5nZWQiKTsKICAgICAgICAgICAgICAgIHNpZ0No
YW5nZURpc3RhbmNlKGNtYkRpc3RhbmNlLmN1cnJlbnRJbmRleCk7CiAgICAgICAgICAgIH0KICAg
ICAgICB9CgogICAgICAgIEJ1dHRvbiB7CiAgICAgICAgICAgIGlkOmJ0bkRlY1ZpZGVvRGlhbWV0
ZXIKICAgICAgICAgICAgeDoxMAogICAgICAgICAgICB5OjE4NQogICAgICAgICAgICB3aWR0aDoz
MAogICAgICAgICAgICBoZWlnaHQ6IDMwCiAgICAgICAgICAgIGF1dG9SZXBlYXQ6dHJ1ZQogICAg
ICAgICAgICB0ZXh0OiAiLSIKICAgICAgICAgICAgZm9udC5waXhlbFNpemU6IDE2CiAgICAgICAg
ICAgIG9uQ2xpY2tlZDogewogICAgICAgICAgICAgICAgc2lnRGVjVmlkZW9EaWFtZXRlcigpOwog
ICAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgIEJ1dHRvbiB7CiAgICAgICAgICAgIGlkOmJ0
bkluY1ZpZGVvRGlhbWV0ZXIKICAgICAgICAgICAgeDo1MAogICAgICAgICAgICB5OjE4NQogICAg
ICAgICAgICB3aWR0aDozMAogICAgICAgICAgICBoZWlnaHQ6IDMwCiAgICAgICAgICAgIGF1dG9S
ZXBlYXQ6dHJ1ZQogICAgICAgICAgICB0ZXh0OiAiKyIKICAgICAgICAgICAgZm9udC5waXhlbFNp
emU6IDE2CiAgICAgICAgICAgIG9uQ2xpY2tlZDogewogICAgICAgICAgICAgICAgc2lnSW5jVmlk
ZW9EaWFtZXRlcigpOwogICAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgIFRleHQgewogICAg
ICAgICAgICB4OjEwCiAgICAgICAgICAgIHk6MjIwCiAgICAgICAgICAgIHdpZHRoOjMwCiAgICAg
ICAgICAgIGZvbnQucGl4ZWxTaXplOiAxNAogICAgICAgICAgICBjb2xvcjogJ3doaXRlJwogICAg
ICAgICAgICB0ZXh0OiBxc1RyKCJWaWRlbyBEaWFtZXRlciIpCiAgICAgICAgfQoKICAgICAgICBU
ZXh0IHsKICAgICAgICAgICAgeDoyMjAKICAgICAgICAgICAgeTo1CiAgICAgICAgICAgIGNvbG9y
OiAnd2hpdGUnCiAgICAgICAgICAgIGZvbnQucGl4ZWxTaXplOiAxNAogICAgICAgICAgICB0ZXh0
OiBxc1RyKCJMYXNlciBQb3NpdGlvbiIpCiAgICAgICAgfQoKICAgICAgICBCdXR0b24gewogICAg
ICAgICAgICBpZDpidG5VcAogICAgICAgICAgICB4OjI3NQogICAgICAgICAgICB5OjI1CiAgICAg
ICAgICAgIHdpZHRoOjIwCiAgICAgICAgICAgIGhlaWdodDoyMAogICAgICAgICAgICBmb250LnBp
eGVsU2l6ZTogMTYKICAgICAgICAgICAgYXV0b1JlcGVhdDp0cnVlCiAgICAgICAgICAgIHRleHQ6
ICI8Zm9udCBjb2xvcj0nIzAwMDAwMCc+XHUyNUI0PC9mb250PiIKICAgICAgICAgICAgb25DbGlj
a2VkOiB7CiAgICAgICAgICAgICAgICBzaWdVcCgpOwogICAgICAgICAgICB9CiAgICAgICAgfQog
ICAgICAgIEJ1dHRvbiB7CiAgICAgICAgICAgIGlkOmJ0bkRvd24KICAgICAgICAgICAgeDoyNzUK
ICAgICAgICAgICAgeTo2NQogICAgICAgICAgICB3aWR0aDoyMAogICAgICAgICAgICBoZWlnaHQ6
MjAKICAgICAgICAgICAgZm9udC5waXhlbFNpemU6IDE2CiAgICAgICAgICAgIGF1dG9SZXBlYXQ6
dHJ1ZQogICAgICAgICAgICB0ZXh0OiAiPGZvbnQgY29sb3I9JyMwMDAwMDAnPlx1MjVCRTwvZm9u
dD4iCiAgICAgICAgICAgIG9uQ2xpY2tlZDogewogICAgICAgICAgICAgICAgc2lnRG93bigpOwog
ICAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgIEJ1dHRvbiB7CiAgICAgICAgICAgIGlkOmJ0
bkxlZnQKICAgICAgICAgICAgeDoyNTQKICAgICAgICAgICAgeTo0NQogICAgICAgICAgICB3aWR0
aDoyMAogICAgICAgICAgICBoZWlnaHQ6MjAKICAgICAgICAgICAgYXV0b1JlcGVhdDp0cnVlCiAg
ICAgICAgICAgIGZvbnQucGl4ZWxTaXplOiAxNgogICAgICAgICAgICB0ZXh0OiAiPGZvbnQgY29s
b3I9JyMwMDAwMDAnPlx1MjVDMjwvZm9udD4iCiAgICAgICAgICAgIG9uQ2xpY2tlZDogewogICAg
ICAgICAgICAgICAgc2lnTGVmdCgpCiAgICAgICAgICAgIH0KICAgICAgICB9CiAgICAgICAgQnV0
dG9uIHsKICAgICAgICAgICAgaWQ6YnRuUmlnaHQKICAgICAgICAgICAgeDoyOTQKICAgICAgICAg
ICAgeTo0NQogICAgICAgICAgICB3aWR0aDoyMAogICAgICAgICAgICBoZWlnaHQ6MjAKICAgICAg
ICAgICAgYXV0b1JlcGVhdDp0cnVlCiAgICAgICAgICAgIGZvbnQucGl4ZWxTaXplOiAxNgogICAg
ICAgICAgICB0ZXh0OiAiPGZvbnQgY29sb3I9JyMwMDAwMDAnPlx1MjVCODwvZm9udD4iCiAgICAg
ICAgICAgIG9uQ2xpY2tlZDogewogICAgICAgICAgICAgICAgc2lnUmlnaHQoKQogICAgICAgICAg
ICB9CiAgICAgICAgfQoKICAgICAgICBCdXR0b257CiAgICAgICAgICAgIGlkOmJ0blNhdmUKICAg
ICAgICAgICAgeDoyMzAKICAgICAgICAgICAgeToyMDAKICAgICAgICAgICAgd2lkdGg6ODAKICAg
ICAgICAgICAgaGVpZ2h0OjMwCiAgICAgICAgICAgIHRleHQ6ICJDYWxpYnJhdGUiCiAgICAgICAg
ICAgIGZvbnQucGl4ZWxTaXplOiAxNAogICAgICAgICAgICBvbkNsaWNrZWQ6IHsKICAgICAgICAg
ICAgICAgIHNpZ1NhdmVEYXRhKCk7CiAgICAgICAgICAgIH0KICAgICAgICB9CiAgICB9Cn0K
--000000000000c11c3905c7a6e3f7
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--000000000000c11c3905c7a6e3f7--
