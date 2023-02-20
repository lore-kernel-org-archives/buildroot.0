Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B480DC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 05:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0272941677;
	Mon, 20 Feb 2023 05:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0272941677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAeGIkn8R2Am; Mon, 20 Feb 2023 05:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA98A41688;
	Mon, 20 Feb 2023 05:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA98A41688
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 325AC1BF40A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 05:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C187400FE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 05:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C187400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-_-MHk1DaMS for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 05:20:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A9AF400F3
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A9AF400F3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 05:20:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i34so1932114lfv.7
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 21:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B7VlQnT11gjC2h/+2q+UFpoVkVyCjcE87lFkaQqz7R0=;
 b=ZsUS7mWGfCq9xhXzkDxEOiUyYy4BzLojOuqKNbxuluGOj17Nm8PO5auFjKuysDZvbI
 SHWyyits9j6KaZnVhJg5LHNMTpm022X+nrjosT5Kwqye5EmWNuEYKO4H8te7+g45mpyh
 gUAlmUKKap2ZADrM+SZMB2Roo51i+PX9rVErsc0hPrzjUpuCtIoZ4UEqw5JR7QlQBPY9
 J/oAS6eIr8EVFxPinu6nGapoRGyR9Yx8A3JP13qz4Dhfda2YrmJTWTX3vz87fByVcthx
 AfpfHrV9INfsu2/hKBrs6L95GkOeYh2dP94pXacNF12RZSWEDqdyLPP+/OXcJhw8aEja
 fZ9A==
X-Gm-Message-State: AO0yUKUOUxZAIBaG58ykkGt1GzNNhdCA8sXQPJxB/FuwLk3xPcgtJCyW
 +jOwvIx9lSEgIHmDzSeZWo2tz+OwspZiPZuX6FI=
X-Google-Smtp-Source: AK7set9hlsC4k2HHdoDhcx4ObUi3BOdDGmjvMx7mDQMIznzix5u6hMB7orGCAefAya0TpQZeUjnne+FDTkPba9J38QE=
X-Received: by 2002:ac2:5387:0:b0:4d5:ca42:aeeb with SMTP id
 g7-20020ac25387000000b004d5ca42aeebmr301927lfh.11.1676870430670; Sun, 19 Feb
 2023 21:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20230208162534.28581-1-ps.report@gmx.net>
 <20230208174305.1af25bae@windsurf>
In-Reply-To: <20230208174305.1af25bae@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 20 Feb 2023 13:20:18 +0800
Message-ID: <CAFkzVZbQSgDJKi1cqBcj5Lau7jyO=QqDYAGLSnrFL16kfnqWig@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B7VlQnT11gjC2h/+2q+UFpoVkVyCjcE87lFkaQqz7R0=;
 b=OBVbk9K4a0raUpeuoo8v/RSzt4GEuesJ9X7eNTpVUz36MKPSlDrh3Rol0fkJuKzVQ7
 tvJj0JWDcj3YI/nf5+2Oe6ZIgUuqyt352uKZpgrzvpxG7bTfwk/kp754fP6ONvAxW872
 C+18gTmNhWi4KnJOxRxqwRskFLUM96WBStrTP98b2G26RZwhONJX1sRmME+M9hqGRjvu
 vydG5WBwqoF+xMhgcG3HCv6WWSXnPnED2gfUpayqLBfrkD6ez0ycuyYCdge/Je/PZKCM
 gVjd2cfEBznDId+YRpOu7W4/fVd6hqGdArGP0H4gcICsxXx/8L6QJ33hHn/Y9e6yjcun
 Naqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OBVbk9K4
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: security bump to
 version 1.1.1t
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
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8098824720720716976=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8098824720720716976==
Content-Type: multipart/alternative; boundary="0000000000005ac1b505f51ad225"

--0000000000005ac1b505f51ad225
Content-Type: text/plain; charset="UTF-8"

it should also apply to the 2022.02.x branch.

Scott Fan


On Thu, Feb 9, 2023 at 12:43 AM Thomas Petazzoni via buildroot <
buildroot@buildroot.org> wrote:

> On Wed,  8 Feb 2023 17:25:34 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Changelog (for details see [1] and [2]):
> >
> >  Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
> >
> >   *) Fixed X.400 address type confusion in X.509 GeneralName.
> >
> >      There is a type confusion vulnerability relating to X.400 address
> processing
> >      inside an X.509 GeneralName. X.400 addresses were parsed as an
> ASN1_STRING
> >      but subsequently interpreted by GENERAL_NAME_cmp as an ASN1_TYPE.
> This
> >      vulnerability may allow an attacker who can provide a certificate
> chain and
> >      CRL (neither of which need have a valid signature) to pass arbitrary
> >      pointers to a memcmp call, creating a possible read primitive,
> subject to
> >      some constraints. Refer to the advisory for more information.
> Thanks to
> >      David Benjamin for discovering this issue. (CVE-2023-0286)
> >
> >      This issue has been fixed by changing the public header file
> definition of
> >      GENERAL_NAME so that x400Address reflects the implementation. It
> was not
> >      possible for any existing application to successfully use the
> existing
> >      definition; however, if any application references the x400Address
> field
> >      (e.g. in dead code), note that the type of this field has changed.
> There is
> >      no ABI change.
> >      [Hugo Landau]
> >
> >   *) Fixed Use-after-free following BIO_new_NDEF.
> >
> >      The public API function BIO_new_NDEF is a helper function used for
> >      streaming ASN.1 data via a BIO. It is primarily used internally to
> OpenSSL
> >      to support the SMIME, CMS and PKCS7 streaming capabilities, but may
> also
> >      be called directly by end user applications.
> >
> >      The function receives a BIO from the caller, prepends a new
> BIO_f_asn1
> >      filter BIO onto the front of it to form a BIO chain, and then
> returns
> >      the new head of the BIO chain to the caller. Under certain
> conditions,
> >      for example if a CMS recipient public key is invalid, the new
> filter BIO
> >      is freed and the function returns a NULL result indicating a
> failure.
> >      However, in this case, the BIO chain is not properly cleaned up and
> the
> >      BIO passed by the caller still retains internal pointers to the
> previously
> >      freed filter BIO. If the caller then goes on to call BIO_pop() on
> the BIO
> >      then a use-after-free will occur. This will most likely result in a
> crash.
> >      (CVE-2023-0215)
> >      [Viktor Dukhovni, Matt Caswell]
> >
> >   *) Fixed Double free after calling PEM_read_bio_ex.
> >
> >      The function PEM_read_bio_ex() reads a PEM file from a BIO and
> parses and
> >      decodes the "name" (e.g. "CERTIFICATE"), any header data and the
> payload
> >      data. If the function succeeds then the "name_out", "header" and
> "data"
> >      arguments are populated with pointers to buffers containing the
> relevant
> >      decoded data. The caller is responsible for freeing those buffers.
> It is
> >      possible to construct a PEM file that results in 0 bytes of payload
> data.
> >      In this case PEM_read_bio_ex() will return a failure code but will
> populate
> >      the header argument with a pointer to a buffer that has already
> been freed.
> >      If the caller also frees this buffer then a double free will occur.
> This
> >      will most likely lead to a crash.
> >
> >      The functions PEM_read_bio() and PEM_read() are simple wrappers
> around
> >      PEM_read_bio_ex() and therefore these functions are also directly
> affected.
> >
> >      These functions are also called indirectly by a number of other
> OpenSSL
> >      functions including PEM_X509_INFO_read_bio_ex() and
> >      SSL_CTX_use_serverinfo_file() which are also vulnerable. Some
> OpenSSL
> >      internal uses of these functions are not vulnerable because the
> caller does
> >      not free the header argument if PEM_read_bio_ex() returns a failure
> code.
> >      (CVE-2022-4450)
> >      [Kurt Roeckx, Matt Caswell]
> >
> >   *) Fixed Timing Oracle in RSA Decryption.
> >
> >      A timing based side channel exists in the OpenSSL RSA Decryption
> >      implementation which could be sufficient to recover a plaintext
> across
> >      a network in a Bleichenbacher style attack. To achieve a successful
> >      decryption an attacker would have to be able to send a very large
> number
> >      of trial messages for decryption. The vulnerability affects all RSA
> padding
> >      modes: PKCS#1 v1.5, RSA-OEAP and RSASVE.
> >      (CVE-2022-4304)
> >      [Dmitry Belyavsky, Hubert Kario]
> >
> >  Changes between 1.1.1r and 1.1.1s [1 Nov 2022]
> >
> >   *) Fixed a regression introduced in 1.1.1r version not refreshing the
> >      certificate data to be signed before signing the certificate.
> >      [Gibeom Gwon]
> >
> >  Changes between 1.1.1q and 1.1.1r [11 Oct 2022]
> >
> >   *) Fixed the linux-mips64 Configure target which was missing the
> >      SIXTY_FOUR_BIT bn_ops flag. This was causing heap corruption on that
> >      platform.
> >      [Adam Joseph]
> >
> >   *) Fixed a strict aliasing problem in bn_nist. Clang-14 optimisation
> was
> >      causing incorrect results in some cases as a result.
> >      [Paul Dale]
> >
> >   *) Fixed SSL_pending() and SSL_has_pending() with DTLS which were
> failing to
> >      report correct results in some cases
> >      [Matt Caswell]
> >
> >   *) Fixed a regression introduced in 1.1.1o for re-signing certificates
> with
> >      different key sizes
> >      [Todd Short]
> >
> >   *) Added the loongarch64 target
> >      [Shi Pujin]
> >
> >   *) Fixed a DRBG seed propagation thread safety issue
> >      [Bernd Edlinger]
> >
> >   *) Fixed a memory leak in tls13_generate_secret
> >      [Bernd Edlinger]
> >
> >   *) Fixed reported performance degradation on aarch64. Restored the
> >      implementation prior to commit 2621751 ("aes/asm/aesv8-armx.pl:
> avoid
> >      32-bit lane assignment in CTR mode") for 64bit targets only, since
> it is
> >      reportedly 2-17% slower and the silicon errata only affects 32bit
> targets.
> >      The new algorithm is still used for 32 bit targets.
> >      [Bernd Edlinger]
> >
> >   *) Added a missing header for memcmp that caused compilation failure
> on some
> >      platforms
> >      [Gregor Jasny]
> >
> > [1] https://www.openssl.org/news/cl111.txt
> > [2] https://www.openssl.org/news/vulnerabilities.html
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/libopenssl/libopenssl.hash | 4 ++--
> >  package/libopenssl/libopenssl.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000005ac1b505f51ad225
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>it should also apply to the 2022.02.x branch.</div><d=
iv><br></div><div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr">Scott Fan<br></div></div></=
div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Feb 9, 2023 at 12:43 AM Thomas Petazzoni via bu=
ildroot &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed,=C2=A0 8 Feb 2023 17:25:34 +0100<br>
Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" target=3D"_blank">p=
s.report@gmx.net</a>&gt; wrote:<br>
<br>
&gt; Changelog (for details see [1] and [2]):<br>
&gt; <br>
&gt;=C2=A0 Changes between 1.1.1s and 1.1.1t [7 Feb 2023]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed X.400 address type confusion in X.509 GeneralName=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 There is a type confusion vulnerability relating t=
o X.400 address processing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 inside an X.509 GeneralName. X.400 addresses were =
parsed as an ASN1_STRING<br>
&gt;=C2=A0 =C2=A0 =C2=A0 but subsequently interpreted by GENERAL_NAME_cmp a=
s an ASN1_TYPE. This<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vulnerability may allow an attacker who can provid=
e a certificate chain and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CRL (neither of which need have a valid signature)=
 to pass arbitrary<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pointers to a memcmp call, creating a possible rea=
d primitive, subject to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 some constraints. Refer to the advisory for more i=
nformation. Thanks to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 David Benjamin for discovering this issue. (CVE-20=
23-0286)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 This issue has been fixed by changing the public h=
eader file definition of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GENERAL_NAME so that x400Address reflects the impl=
ementation. It was not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 possible for any existing application to successfu=
lly use the existing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 definition; however, if any application references=
 the x400Address field<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (e.g. in dead code), note that the type of this fi=
eld has changed. There is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 no ABI change.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Hugo Landau]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed Use-after-free following BIO_new_NDEF.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 The public API function BIO_new_NDEF is a helper f=
unction used for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 streaming ASN.1 data via a BIO. It is primarily us=
ed internally to OpenSSL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 to support the SMIME, CMS and PKCS7 streaming capa=
bilities, but may also<br>
&gt;=C2=A0 =C2=A0 =C2=A0 be called directly by end user applications.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 The function receives a BIO from the caller, prepe=
nds a new BIO_f_asn1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filter BIO onto the front of it to form a BIO chai=
n, and then returns<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the new head of the BIO chain to the caller. Under=
 certain conditions,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for example if a CMS recipient public key is inval=
id, the new filter BIO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 is freed and the function returns a NULL result in=
dicating a failure.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 However, in this case, the BIO chain is not proper=
ly cleaned up and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BIO passed by the caller still retains internal po=
inters to the previously<br>
&gt;=C2=A0 =C2=A0 =C2=A0 freed filter BIO. If the caller then goes on to ca=
ll BIO_pop() on the BIO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 then a use-after-free will occur. This will most l=
ikely result in a crash.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (CVE-2023-0215)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Viktor Dukhovni, Matt Caswell]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed Double free after calling PEM_read_bio_ex.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 The function PEM_read_bio_ex() reads a PEM file fr=
om a BIO and parses and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 decodes the &quot;name&quot; (e.g. &quot;CERTIFICA=
TE&quot;), any header data and the payload<br>
&gt;=C2=A0 =C2=A0 =C2=A0 data. If the function succeeds then the &quot;name=
_out&quot;, &quot;header&quot; and &quot;data&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 arguments are populated with pointers to buffers c=
ontaining the relevant<br>
&gt;=C2=A0 =C2=A0 =C2=A0 decoded data. The caller is responsible for freein=
g those buffers. It is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 possible to construct a PEM file that results in 0=
 bytes of payload data.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 In this case PEM_read_bio_ex() will return a failu=
re code but will populate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the header argument with a pointer to a buffer tha=
t has already been freed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 If the caller also frees this buffer then a double=
 free will occur. This<br>
&gt;=C2=A0 =C2=A0 =C2=A0 will most likely lead to a crash.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 The functions PEM_read_bio() and PEM_read() are si=
mple wrappers around<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PEM_read_bio_ex() and therefore these functions ar=
e also directly affected.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 These functions are also called indirectly by a nu=
mber of other OpenSSL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 functions including PEM_X509_INFO_read_bio_ex() an=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SSL_CTX_use_serverinfo_file() which are also vulne=
rable. Some OpenSSL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 internal uses of these functions are not vulnerabl=
e because the caller does<br>
&gt;=C2=A0 =C2=A0 =C2=A0 not free the header argument if PEM_read_bio_ex() =
returns a failure code.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (CVE-2022-4450)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Kurt Roeckx, Matt Caswell]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed Timing Oracle in RSA Decryption.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 A timing based side channel exists in the OpenSSL =
RSA Decryption<br>
&gt;=C2=A0 =C2=A0 =C2=A0 implementation which could be sufficient to recove=
r a plaintext across<br>
&gt;=C2=A0 =C2=A0 =C2=A0 a network in a Bleichenbacher style attack. To ach=
ieve a successful<br>
&gt;=C2=A0 =C2=A0 =C2=A0 decryption an attacker would have to be able to se=
nd a very large number<br>
&gt;=C2=A0 =C2=A0 =C2=A0 of trial messages for decryption. The vulnerabilit=
y affects all RSA padding<br>
&gt;=C2=A0 =C2=A0 =C2=A0 modes: PKCS#1 v1.5, RSA-OEAP and RSASVE.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (CVE-2022-4304)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Dmitry Belyavsky, Hubert Kario]<br>
&gt; <br>
&gt;=C2=A0 Changes between 1.1.1r and 1.1.1s [1 Nov 2022]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed a regression introduced in 1.1.1r version not ref=
reshing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 certificate data to be signed before signing the c=
ertificate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Gibeom Gwon]<br>
&gt; <br>
&gt;=C2=A0 Changes between 1.1.1q and 1.1.1r [11 Oct 2022]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed the linux-mips64 Configure target which was missi=
ng the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SIXTY_FOUR_BIT bn_ops flag. This was causing heap =
corruption on that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 platform.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Adam Joseph]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed a strict aliasing problem in bn_nist. Clang-14 op=
timisation was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 causing incorrect results in some cases as a resul=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Paul Dale]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed SSL_pending() and SSL_has_pending() with DTLS whi=
ch were failing to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 report correct results in some cases<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Matt Caswell]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed a regression introduced in 1.1.1o for re-signing =
certificates with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 different key sizes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Todd Short]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Added the loongarch64 target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Shi Pujin]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed a DRBG seed propagation thread safety issue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Bernd Edlinger]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed a memory leak in tls13_generate_secret<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Bernd Edlinger]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Fixed reported performance degradation on aarch64. Rest=
ored the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 implementation prior to commit 2621751 (&quot;aes/=
asm/<a href=3D"http://aesv8-armx.pl" rel=3D"noreferrer" target=3D"_blank">a=
esv8-armx.pl</a>: avoid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 32-bit lane assignment in CTR mode&quot;) for 64bi=
t targets only, since it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 reportedly 2-17% slower and the silicon errata onl=
y affects 32bit targets.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 The new algorithm is still used for 32 bit targets=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Bernd Edlinger]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*) Added a missing header for memcmp that caused compilati=
on failure on some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 platforms<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [Gregor Jasny]<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.openssl.org/news/cl111.txt" rel=3D"noreferr=
er" target=3D"_blank">https://www.openssl.org/news/cl111.txt</a><br>
&gt; [2] <a href=3D"https://www.openssl.org/news/vulnerabilities.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.openssl.org/news/vulnerabilit=
ies.html</a><br>
&gt; <br>
&gt; Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net"=
 target=3D"_blank">ps.report@gmx.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/libopenssl/libopenssl.hash | 4 ++--<br>
&gt;=C2=A0 package/libopenssl/<a href=3D"http://libopenssl.mk" rel=3D"noref=
errer" target=3D"_blank">libopenssl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
Applied to master, thanks.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000005ac1b505f51ad225--

--===============8098824720720716976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8098824720720716976==--
