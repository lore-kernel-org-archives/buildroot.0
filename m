Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF05C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 00:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99E9410A1;
	Mon, 29 Nov 2021 00:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K82nNqToMRaL; Mon, 29 Nov 2021 00:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B7040E46;
	Mon, 29 Nov 2021 00:30:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8667A1BF96B
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 00:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7541F60755
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 00:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_mwPX7FIiNP for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 00:30:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8884660744
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 00:30:53 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id t13so30464373uad.9
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 16:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=sAW7Bc3zzEZ+mNv9Lw938YgRjmYuYlp3TlORMxA5gY4=;
 b=hkSOtdnLrne2Cu1myeMdRy++hB2g8i9Jb2A3U1Kz7Sjrl/5esA0KI6Y+J4N7grpvML
 b54ita8YJWLypcaSUQjNaKVHtbCW+EFzaH8F12Pby7rbxlT6K9qmkqNoYQv/CqPRHcbG
 BQLvGv/cCrVkKyP8p0EeuNFOotylrQs9k4TyTO14JpDgYTK6AuPqRQ+plY7yB1MgHEqn
 6jxgI42YwYY+fVCRyuvFUlOcbeCxj7Vje4cJsP0BHKJCdBG9SIndUyTk6e4HjttYH6TB
 ZuSPpRuKeQVb5iRM4YSMSKoH071hQQUf4y78zFISWkbYNUPfrJvFm2VMhGTX1TcW4PaK
 lWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=sAW7Bc3zzEZ+mNv9Lw938YgRjmYuYlp3TlORMxA5gY4=;
 b=6bxCeDJAGkqNF9hBPVdCsxSvkJSj0A5jDb14hsFHe5KxqpXiPUOoFrLsE1v8EaGsL2
 ndZnmEBfbsxk7RU1oNuoy7MEAvmiX2mjcKsoZe/PyDu3f42x+r7RiyYudyep83Yd10fR
 DDbCuW8VDvLjUS21reaOSUAHlnx0HdcjywtQLm1PdA0Yo/GKPBgYHRhMAgeVe52yCSTq
 poEz6GUww3oW2e1uSzsRKBQxHkWhhIeq8Q/7BQGXU1g4cVgSP0cv1fsMKjGUp0cF45DS
 VlWeuUDNQ42sSDsjDr/6ce4Dpto5aVyLMoO3D6yE6Ereub8+oRN6WQNsnQW/uPQy0cSC
 2PRg==
X-Gm-Message-State: AOAM530r8Kbroefpt05ISOzTaG5kaMD1OZVxCb8dI5HINvSs4CP2hG2J
 68OpwVRP3zxeBJP4f2UT3VM=
X-Google-Smtp-Source: ABdhPJwR3p7Tl9vjeEhGTVwnYiE3olqNCqOpA93BsRiDt94QNG/3G0CX1xaRpmdNkDQq/v0uGWnZ9w==
X-Received: by 2002:a05:6102:508c:: with SMTP id
 bl12mr28711799vsb.73.1638145852427; 
 Sun, 28 Nov 2021 16:30:52 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id a188sm7412196vsa.2.2021.11.28.16.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 16:30:52 -0800 (PST)
Date: Sun, 28 Nov 2021 21:30:50 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: fontaine.fabrice@gmail.com, 
 arnout@mind.be
Message-ID: <61a41f3a8fec1_1336b9ec-350@xultri.mail>
References: <CAPi7W83ni9L-Qa0ACpKYNUACV_eHSdr=97yibictPmo646RH_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_61a41f38636cb_1336b9ec-462";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH/next 1/1] utils/checkpackagelib/lib_mk.py:
 check typo in define
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_61a41f38636cb_1336b9ec-462
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fabrice,=0D
Arnout,=0D
=0D
On Fri, Nov 26, 2021 at 02:26 PM, Fabrice Fontaine wrote:=0D
=0D
> Dear Arnout,=0D
> =0D
> Le ven. 26 nov. 2021 =C3=A0 08:42, Arnout Vandecappelle <arnout@mind.be=
> a =C3=A9crit :=0D
>>=0D
>>=0D
>>=0D
>> On 25/11/2021 22:56, Fabrice Fontaine wrote:=0D
>> > Check typo in define to detect SMAKE_LINUX_CONFIG_FIXUPS in smack=0D=

>> > (fixed by 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)=0D
=0D
Great to have this new check.=0D
=0D
>> >=0D
>> > Add GCC_TARGET in ALLOWED variable to avoid the following warnings:=0D=

>> >=0D
>> > arch/arch.mk:12: possible typo: GCC_TARGET_ARCH -> *ARCH*=0D
>> > arch/arch.mk:13: possible typo: GCC_TARGET_ABI -> *ARCH*=0D
>> > arch/arch.mk:14: possible typo: GCC_TARGET_NAN -> *ARCH*=0D
>> > arch/arch.mk:15: possible typo: GCC_TARGET_FP32_MODE -> *ARCH*=0D
>> > arch/arch.mk:16: possible typo: GCC_TARGET_CPU -> *ARCH*=0D
>> > arch/arch.mk:17: possible typo: GCC_TARGET_FPU -> *ARCH*=0D
>> > arch/arch.mk:18: possible typo: GCC_TARGET_FLOAT_ABI -> *ARCH*=0D
>> > arch/arch.mk:19: possible typo: GCC_TARGET_MODE -> *ARCH*=0D
>> >=0D
>> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>=0D
>> > ---=0D
>> >   utils/checkpackagelib/lib_mk.py | 7 ++++---=0D
>> >   1 file changed, 4 insertions(+), 3 deletions(-)=0D
>> >=0D
>> > diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib=
/lib_mk.py=0D
>> > index d09922f724..9178931276 100644=0D
>> > --- a/utils/checkpackagelib/lib_mk.py=0D
>> > +++ b/utils/checkpackagelib/lib_mk.py=0D
>> > @@ -236,6 +236,7 @@ class TypoInPackageVariable(_CheckFunction):=0D
>> >           "BR_CCACHE_INITIAL_SETUP",=0D
>> >           "BR_LIBC",=0D
>> >           "BR_NO_CHECK_HASH_FOR",=0D
>> > +        "GCC_TARGET",=0D
>> >           "LINUX_EXTENSIONS",=0D
>> >           "LINUX_POST_PATCH_HOOKS",=0D
>> >           "LINUX_TOOLS",=0D
>> > @@ -248,7 +249,7 @@ class TypoInPackageVariable(_CheckFunction):=0D
>> >           "TARGET_FINALIZE_HOOKS",=0D
>> >           "TARGETS_ROOTFS",=0D
>> >           "XTENSA_CORE_NAME"]))=0D
>> > -    VARIABLE =3D re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=3D")=
=0D
>> > +    VARIABLE =3D re.compile(r"^(define )?([A-Z0-9_]+_[A-Z0-9_]+)")=0D=

=0D
Do not assume that there will be only one space after 'define':=0D
-    VARIABLE =3D re.compile(r"^(define )?([A-Z0-9_]+_[A-Z0-9_]+)")=0D
+    VARIABLE =3D re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")=0D
=0D
If we decide to check, for instance, that we always want only one space a=
fter=0D
'define', we could do it (there would be 2 warnings today), but IMO it sh=
ould be=0D
a different rule (a new function in the lib_mk.py).=0D
=0D
>>=0D
>>   This no longer matches inline assignments... So I think this should =
be=0D
>> something like=0D
>> ^(define )?([A-Z0-9_]+_[A-Z0-9_]+)|^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=3D=
=0D
> Can you give me an example of an inline assignment that is not catched =
anymore?=0D
> =0D
> This new expression will catch:=0D
> SMAKE_CONF_OPTS=0D
> as well as=0D
> define SMAKE_LINUX_CONFIG_FIXUPS=0D
> =0D
> I made only two modifications:=0D
>  - add (define )? which will match "define " but also an empty value.=0D=

> Thanks to this, the second group will always contain the variable=0D
> name.=0D
>  - remove \s*(\+|)=3D which seems superfluous=0D
=0D
Indeed, I was unable to come up with a snippet to justify to keep the=0D
\s*(\+|)=3D part.=0D
=0D
So, with the change from space to \s+ mentioned above, you can add my=0D
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>=0D
=0D
>>=0D
>>   Ideally, we should have a runtime test that validates that check-pac=
kage=0D
>> catches the errors we want it to catch...=0D
=0D
Working on this, I hope I can send it in December.=0D
I created some unit tests but I still need to connect them to the runtime=
 test=0D
infra.=0D
https://gitlab.com/RicardoMartincoski/check-package/-/blob/13bda7652063a7=
2cc3f6137b20dd9b9064e757f3/pytest/test_lib_mk.py#L198=0D
=0D
Regards,=0D
Ricardo=0D
=0D
>>=0D
>> >=0D
>> >       def before(self):=0D
>> >           package, _ =3D os.path.splitext(os.path.basename(self.file=
name))=0D
>> > @@ -258,7 +259,7 @@ class TypoInPackageVariable(_CheckFunction):=0D
>> >           # linux extensions do not use LINUX_EXT_ prefix for variab=
les=0D
>> >           package =3D package.replace("LINUX_EXT_", "")=0D
>> >           self.package =3D package=0D
>> > -        self.REGEX =3D re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+=
)".format(package))=0D
>> > +        self.REGEX =3D re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)=
".format(package))=0D
>> >           self.FIND_VIRTUAL =3D re.compile(=0D
>> >               r"^{}_PROVIDES\s*(\+|)=3D\s*(.*)".format(package))=0D
>> >           self.virtual =3D []=0D
>> > @@ -268,7 +269,7 @@ class TypoInPackageVariable(_CheckFunction):=0D
>> >           if m is None:=0D
>> >               return=0D
>> >=0D
>> > -        variable =3D m.group(1)=0D
>> > +        variable =3D m.group(2)=0D
>>=0D
>>   Ah, with the regex that matches both, this will be tricky... Perhaps=
 we should=0D
>> use named groups then.=0D
>>=0D
>>=0D
>>   Regards,=0D
>>   Arnout=0D
>>=0D
>>=0D
>> >=0D
>> >           # allow to set variables for virtual package this package =
provides=0D
>> >           v =3D self.FIND_VIRTUAL.search(text)=0D
>> >=0D
> Best Regards,=0D
> =0D
> Fabrice=0D
=0D

----==_mimepart_61a41f38636cb_1336b9ec-462
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_61a41f38636cb_1336b9ec-462--
