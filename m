Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006C2C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 10:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3FB81E69;
	Mon, 20 Feb 2023 10:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B3FB81E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEjzQRydO2hY; Mon, 20 Feb 2023 10:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF5281E84;
	Mon, 20 Feb 2023 10:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF5281E84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 031AE1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA02400F6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEA02400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBLcalMBokx8 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 10:10:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D476400CF
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D476400CF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 10:10:37 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y8so730559oiy.6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 02:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJIdYh07XvqJTYbuoFMPDnlZj+vO6xpAldHm3WmKBlQ=;
 b=MWtpsWJ2hAiZGpXGJpia72ZjwKoDIJBfEXXq1DV2YpWO5L+6VueJEowIcnYd3H80St
 ACUE1ba5a8cgLyS8DpQOzJUFkfrUK3UM3ElgQ/Nlke0XS9gbVg6WBO8y7vPOe2L+pirM
 aJzAPxlvDT/BRRyLnMwBDtXB2EFAYS9ypsx0KGZvA9iF1lpCMxMkFgct7/7OiL/If0zL
 4fbJDjl+fu+LF8Cm02CfH78pyHSL2c8zu76gTOxN/neyDMk+UdqCeysSnadNU0IyLrnF
 2ENZFV7LV+bYC583usKtPkW6U5rmmEZhd28QrMdPora8S/1/xs/EFGtxVkYqWlR8Ip3b
 h/Wg==
X-Gm-Message-State: AO0yUKWA8rgROyy/MmRBFKe4p6VTvyJT1zgFVbsUuKjN+e+GhslpUslY
 66POb4ERhgiPHHuQEZuy5YSWwshhaOn7T1rC+a6KMJXUi0E=
X-Google-Smtp-Source: AK7set9zDb3xQd2ZTFkXkwatQNQS8bI3QtmFeYFcapPuBqhw/morkT7mOpBcQLlFiqa57T8pHefPAVbkfpGclJRtI+c=
X-Received: by 2002:a05:6808:2385:b0:367:18a6:eb14 with SMTP id
 bp5-20020a056808238500b0036718a6eb14mr1264085oib.208.1676887836650; Mon, 20
 Feb 2023 02:10:36 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf> <20230218142115.GC2718518@scaer>
 <20230218153216.GD2718518@scaer>
 <CADYjeStKgyabCLrM8QaoU3fsUZ3KChGxzYw6mr2tMmPgYBxYFw@mail.gmail.com>
 <CADYjeSt_z3340YvtL26u=R2u9ofosbO=RTqsYEZdoSL8AUkfYw@mail.gmail.com>
 <CADYjeSvNkOYY=RCeC9Jg2aX610XyzB5YN2aCq1nYo8U-LGAfTA@mail.gmail.com>
 <20230219131753.GE2718518@scaer>
In-Reply-To: <20230219131753.GE2718518@scaer>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 20 Feb 2023 11:10:27 +0100
Message-ID: <CADYjeSuO_dCsRBQScV_AP86_oUSRw1nsnN7NMG+tTrYWLSqPWA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="000000000000d5255305f51edfbd"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gJIdYh07XvqJTYbuoFMPDnlZj+vO6xpAldHm3WmKBlQ=;
 b=junTBdHpO4j2lDakY2YqX9/emP+tz/04rWu0rCCZU3QLqHIyhfsjWtfbo1zS4zL1dl
 LMuPZlF+WaRl42TGJKY9FaS6d6GKI0Jb2TCrL1QhmLX1U7ayPDk0bFRMHNP4esibydzi
 oifzNT2j45fQzjy0KUkOc+QSltc833cya3xDE2fDjoGywi81QicTNp0FB6d9Lm9LyhcF
 WfMPv/d+PROe4CEX57PuqKtU0oxt2ugOylMwNC6AjirQsUrwXh5IiHui3lO9Dvf4oZCo
 o5qjvIUshGUR751fnnw9j4WLXniDAjWB3F4BHhIqEZMszZXeK8+AV/kFYwdGmqs4pPN5
 BPiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=junTBdHp
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000d5255305f51edfbd
Content-Type: multipart/alternative; boundary="000000000000d5255105f51edfbb"

--000000000000d5255105f51edfbb
Content-Type: text/plain; charset="UTF-8"

HI Yann, All,

Yes, will do it. I am testing it now

New changes:

define CA_CERTIFICATES_GEN_BUNDLE
        # Create symlinks to certificates under /etc/ssl/certs
        # and generate the bundle
        cd $(TARGET_DIR) ;\
        for i in `find usr/local/share/ca-certificates -name "*.crt" |
LC_COLLATE=C sort` ; do \
                ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem
;\
                cat $$i ;\
        done >>$(BUILD_DIR)/ca-certificates.crt

        # Create symlinks to the certificates by their hash values
        $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs

        # Install the certificates bundle
        $(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
                $(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
endef

So, after "make" new local CA is added to trust-store. So far so good.

But now I did "make clean" and "make". And no certificates are installed!.
Even the default certificates (from mozilla) are not installed. I could't
find /usr/share/ca-certificates in the target.
Any idea why this is happening?

On Sun, 19 Feb 2023 at 14:17, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Sourabh, All,
>
> On 2023-02-19 13:53 +0100, Sourabh Hegde spake thusly:
> > I think the issue is during build, the [1]ca-certificates.mk is not
> available in the output/build/ca-certificates/ dir. Only
> > Makefile and ca-certificates.crt file is present.
> > So how can I patch the makefile?
>
> This is a patch agaisnt Buildroot itself. Apply it to Buildroot.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--000000000000d5255105f51edfbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI=C2=A0Yann, All,<div><br></div><div>Yes, will do it. I a=
m testing it now</div><div><br></div><div>New changes:</div><div><br></div>=
<div>define CA_CERTIFICATES_GEN_BUNDLE<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cre=
ate symlinks to certificates under /etc/ssl/certs<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # and generate the bundle<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $(TARGET=
_DIR) ;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find usr/local/share/ca-c=
ertificates -name &quot;*.crt&quot; | LC_COLLATE=3DC sort` ; do \<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../$$i etc/s=
sl/certs/`basename $${i} .crt`.pem ;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 cat $$i ;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 done &gt;&g=
t;$(BUILD_DIR)/ca-certificates.crt<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Cre=
ate symlinks to the certificates by their hash values<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # Install the certificates bundle<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 $(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/etc/s=
sl/certs/ca-certificates.crt<br>endef<br></div><div><br></div><div>So, afte=
r &quot;make&quot; new local CA is added to trust-store. So far so good.</d=
iv><div><br></div><div>But now I did &quot;make clean&quot; and &quot;make&=
quot;. And no certificates are installed!. Even the default certificates (f=
rom mozilla) are not installed. I could&#39;t find /usr/share/ca-certificat=
es in the target.</div><div>Any idea why this is happening?</div><div></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, 19 Feb 2023 at 14:17, Yann E. MORIN &lt;<a href=3D"mailto:yann.mor=
in.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Sourabh, All,<br>
<br>
On 2023-02-19 13:53 +0100, Sourabh Hegde spake thusly:<br>
&gt; I think the issue is during build, the [1]<a href=3D"http://ca-certifi=
cates.mk" rel=3D"noreferrer" target=3D"_blank">ca-certificates.mk</a> is no=
t available in the output/build/ca-certificates/ dir. Only<br>
&gt; Makefile and ca-certificates.crt file is present.<br>
&gt; So how can I patch the makefile?=C2=A0<br>
<br>
This is a patch agaisnt Buildroot itself. Apply it to Buildroot.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000d5255105f51edfbb--

--000000000000d5255305f51edfbd
Content-Type: application/octet-stream; name="ca-certificates.mk"
Content-Disposition: attachment; filename="ca-certificates.mk"
Content-Transfer-Encoding: base64
Content-ID: <f_lecnpemf0>
X-Attachment-Id: f_lecnpemf0

IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIwojIGNhLWNlcnRpZmljYXRlcwojCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCgpDQV9DRVJUSUZJQ0FURVNfVkVSU0lPTiA9IDIwMjExMDE2CkNBX0NFUlRJ
RklDQVRFU19TT1VSQ0UgPSBjYS1jZXJ0aWZpY2F0ZXNfJChDQV9DRVJUSUZJQ0FURVNfVkVSU0lP
TikudGFyLnh6CkNBX0NFUlRJRklDQVRFU19TSVRFID0gaHR0cHM6Ly9zbmFwc2hvdC5kZWJpYW4u
b3JnL2FyY2hpdmUvZGViaWFuLzIwMjExMDIyVDE0NDkwM1ovcG9vbC9tYWluL2MvY2EtY2VydGlm
aWNhdGVzCkNBX0NFUlRJRklDQVRFU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1w
eXRob24zCkNBX0NFUlRJRklDQVRFU19MSUNFTlNFID0gR1BMLTIuMCsgKHNjcmlwdCksIE1QTC0y
LjAgKGRhdGEpCkNBX0NFUlRJRklDQVRFU19MSUNFTlNFX0ZJTEVTID0gZGViaWFuL2NvcHlyaWdo
dAoKZGVmaW5lIENBX0NFUlRJRklDQVRFU19CVUlMRF9DTURTCiAgICAgICAgJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgLUMgJChARCkgY2xlYW4gYWxsCmVuZGVmCgpkZWZpbmUgQ0FfQ0VSVElG
SUNBVEVTX0lOU1RBTExfVEFSR0VUX0NNRFMKICAgICAgICAkKElOU1RBTEwpIC1kIC1tIDA3NTUg
JChUQVJHRVRfRElSKS91c3Ivc2hhcmUvY2EtY2VydGlmaWNhdGVzCiAgICAgICAgJChJTlNUQUxM
KSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvZXRjL3NzbC9jZXJ0cwogICAgICAgICQoVEFSR0VU
X01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpIGluc3RhbGwgREVTVERJUj0kKFRBUkdFVF9ESVIp
CiAgICAgICAgcm0gLWYgJChUQVJHRVRfRElSKS91c3Ivc2Jpbi91cGRhdGUtY2EtY2VydGlmaWNh
dGVzCmVuZGVmCgpkZWZpbmUgQ0FfQ0VSVElGSUNBVEVTX0dFTl9CVU5ETEUKICAgICAgICAjIENy
ZWF0ZSBzeW1saW5rcyB0byBjZXJ0aWZpY2F0ZXMgdW5kZXIgL2V0Yy9zc2wvY2VydHMKICAgICAg
ICAjIGFuZCBnZW5lcmF0ZSB0aGUgYnVuZGxlCiAgICAgICAgY2QgJChUQVJHRVRfRElSKSA7XAog
ICAgICAgIGZvciBpIGluIGBmaW5kIHVzci9sb2NhbC9zaGFyZS9jYS1jZXJ0aWZpY2F0ZXMgLW5h
bWUgIiouY3J0IiB8IExDX0NPTExBVEU9QyBzb3J0YCA7IGRvIFwKICAgICAgICAgICAgICAgIGxu
IC1zZiAuLi8uLi8uLi8kJGkgZXRjL3NzbC9jZXJ0cy9gYmFzZW5hbWUgJCR7aX0gLmNydGAucGVt
IDtcCiAgICAgICAgICAgICAgICBjYXQgJCRpIDtcCiAgICAgICAgZG9uZSA+PiQoQlVJTERfRElS
KS9jYS1jZXJ0aWZpY2F0ZXMuY3J0CgogICAgICAgICMgQ3JlYXRlIHN5bWxpbmtzIHRvIHRoZSBj
ZXJ0aWZpY2F0ZXMgYnkgdGhlaXIgaGFzaCB2YWx1ZXMKICAgICAgICAkKEhPU1RfRElSKS9iaW4v
Y19yZWhhc2ggJChUQVJHRVRfRElSKS9ldGMvc3NsL2NlcnRzCgogICAgICAgICMgSW5zdGFsbCB0
aGUgY2VydGlmaWNhdGVzIGJ1bmRsZQogICAgICAgICQoSU5TVEFMTCkgLUQgLW0gNjQ0ICQoQlVJ
TERfRElSKS9jYS1jZXJ0aWZpY2F0ZXMuY3J0IFwKICAgICAgICAgICAgICAgICQoVEFSR0VUX0RJ
UikvZXRjL3NzbC9jZXJ0cy9jYS1jZXJ0aWZpY2F0ZXMuY3J0CmVuZGVmCgpkZWZpbmUgQ0FfQ0VS
VElGSUNBVEVTX0lOU1RBTExfVEFSR0VUX0NNRFMKICAgICAgICAjIFJlbW92ZSBhbnkgZXhpc3Rp
bmcgY2VydGlmaWNhdGVzIHVuZGVyIC9ldGMvc3NsL2NlcnRzCiAgICAgICAgcm0gLWYgICQoVEFS
R0VUX0RJUikvZXRjL3NzbC9jZXJ0cy8qCgogICAgICAgICMgQ3JlYXRlIHN5bWxpbmtzIHRvIGNl
cnRpZmljYXRlcyB1bmRlciAvZXRjL3NzbC9jZXJ0cwogICAgICAgICMgYW5kIGdlbmVyYXRlIHRo
ZSBidW5kbGUKICAgICAgICBjZCAkKFRBUkdFVF9ESVIpIDtcCiAgICAgICAgZm9yIGkgaW4gYGZp
bmQgdXNyL3NoYXJlL2NhLWNlcnRpZmljYXRlcyAtbmFtZSAiKi5jcnQiIHwgTENfQ09MTEFURT1D
IHNvcnRgIDsgZG8gXAogICAgICAgICAgICAgICAgbG4gLXNmIC4uLy4uLy4uLyQkaSBldGMvc3Ns
L2NlcnRzL2BiYXNlbmFtZSAkJHtpfSAuY3J0YC5wZW0gO1wKICAgICAgICAgICAgICAgIGNhdCAk
JGkgO1wKICAgICAgICBkb25lID4kKEJVSUxEX0RJUikvY2EtY2VydGlmaWNhdGVzLmNydAoKICAg
ICAgICAjIENyZWF0ZSBzeW1saW5rcyB0byB0aGUgY2VydGlmaWNhdGVzIGJ5IHRoZWlyIGhhc2gg
dmFsdWVzCiAgICAgICAgJChIT1NUX0RJUikvYmluL2NfcmVoYXNoICQoVEFSR0VUX0RJUikvZXRj
L3NzbC9jZXJ0cwoKICAgICAgICAjIEluc3RhbGwgdGhlIGNlcnRpZmljYXRlcyBidW5kbGUKICAg
ICAgICAkKElOU1RBTEwpIC1EIC1tIDY0NCAkKEJVSUxEX0RJUikvY2EtY2VydGlmaWNhdGVzLmNy
dCBcCiAgICAgICAgICAgICAgICAkKFRBUkdFVF9ESVIpL2V0Yy9zc2wvY2VydHMvY2EtY2VydGlm
aWNhdGVzLmNydAplbmRlZgpDQV9DRVJUSUZJQ0FURVNfVEFSR0VUX0ZJTkFMSVpFX0hPT0tTICs9
IENBX0NFUlRJRklDQVRFU19HRU5fQlVORExFCgokKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQ==
--000000000000d5255305f51edfbd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000d5255305f51edfbd--
