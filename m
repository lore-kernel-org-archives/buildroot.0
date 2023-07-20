Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E23EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66FDA812C5;
	Thu, 20 Jul 2023 17:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66FDA812C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QCq-wrPLJGN; Thu, 20 Jul 2023 17:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8A6812CF;
	Thu, 20 Jul 2023 17:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8A6812CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 427A91BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B2B560A6A
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B2B560A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wI8LYM2NSXGu for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:36:50 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75F5D60071
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75F5D60071
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so1631932e87.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874608; x=1690479408;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zOPoj1JFTuPPGV0YEUc5Rfg3n6NnIIDwfnEXDHPk9AE=;
 b=ih3CcaXDZ0Yz7I57z1uz3uRrrmigmmEn52ZL30cwy90Oqc25MhmKIzuRZATp52a5bZ
 tuoKD3iFw/xNHnol659tuXCTFuRMX3nHpxmj8xN8IQVYHsPiAhWc4WqeQnMt2IsMTwRT
 gX3FVBoZ9JUyLS2NqnlQkv4dBQs67Au1bggxoqK2tFq2kS+Ojm4M0QrQ9+ATVrxo5o2L
 mW+kDmnD6iGAAF1jxY7gGAx85Qu+mlYi72KP1h3hHAYl1a4OmFHsljx1TKF3eMkKQ8dB
 7gTfIa60rRwFQmjaTQAtLlZJY+0+W4fSF73njXs1T9E896SDdSA6E7XOr42CsnonDkNm
 epPg==
X-Gm-Message-State: ABy/qLbi9AZ2cNzP1aWQWZTSyhYFQQpk/1etBaHs/ks35bBOSfxpbOAv
 fUVyjOpa3zD3d+X0i3fUqygRfiVTZxv3q5L2ZY4PIde8qOubkg==
X-Google-Smtp-Source: APBJJlF4KjRa/mj/73K9MSGv4PcbFOuUtuJnVQyPHstdv73Ki4lSxPIQWtTmApRL+ziOwmfIlViP0Pb4IaJDhLbJn5Q=
X-Received: by 2002:a05:6512:291:b0:4fb:7888:7e6d with SMTP id
 j17-20020a056512029100b004fb78887e6dmr2476627lfp.46.1689874607938; Thu, 20
 Jul 2023 10:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-10-sebastian.weyer@smile.fr>
 <daee4294-ddf2-c548-07b6-4f86c2149fc3@smile.fr>
In-Reply-To: <daee4294-ddf2-c548-07b6-4f86c2149fc3@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:36:36 -0700
Message-ID: <CAFSsvmp=S214dGtENjEeGcC-9qjpg3YHYiv_LXpH9EvEQjaduw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874608; x=1690479408;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zOPoj1JFTuPPGV0YEUc5Rfg3n6NnIIDwfnEXDHPk9AE=;
 b=Vkz2GroDli48zmEAMqFkWTJDD6JxG7ooNp7b/5RS5o5ntGmStNI+k7eGFpdQDJIqOR
 XaspiUEPguEKd61zyidmMjkuKA0utVMcBFXS6N0k5z2h09sQ0da1FHBmYXboFwTQzKo7
 PmeRwPAqGmlNNkikMvgs1qkkBD2333j2GAe9tVBf8xOEuzrpIhLrq9XG+wFikRUb0Ihj
 8456nF9dgax31doV70TqiiUNEfMvHcuNtsICLXZsxNVmkq42w53JZ6jFKuV045jd4KY2
 RhvFidioT8cqs7kOf9p76SGRmZ9F54ubwDHY7fJUs+sce1mw63FeY/b46gNtMyY+odqt
 SXGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Vkz2GroD
Subject: Re: [Buildroot] [PATCH v4 09/10] package/llvm-project: bump to
 version 15.0.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Sebastian Weyer <sebastian.weyer@smile.fr>, Lang Daniel <d.lang@abatec.at>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: multipart/mixed; boundary="===============2794787088384574894=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2794787088384574894==
Content-Type: multipart/alternative; boundary="000000000000b8a3b80600ee9793"

--000000000000b8a3b80600ee9793
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Wed, Jul 12, 2023 at 6:06=E2=80=AFAM Romain Naour <romain.naour@smile.fr=
> wrote:

> Hello,
>
> Le 15/06/2023 =C3=A0 15:43, Sebastian Weyer a =C3=A9crit :
> > From: Lang Daniel <d.lang@abatec.at>
> >
> > - Add new build dependencies to lld and llvm
> > - Add host-gcc and gcc >=3D 7.x dependency since clang doesn't build wi=
th
> gcc 6.3
> >
> >   [ 28%] Building CXX object
> utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/TableGen.cpp.o
> >   output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitter.cpp: In
> instantiation of
> =E2=80=98{anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}=
::SemaRecord>)::<lambda(auto:2&)>
> [with auto:2 =3D const llvm::SmallVector<clang::RISCV::PrototypeDescripto=
r>]=E2=80=99:
> >   /usr/include/c++/6/bits/stl_algo.h:3769:5:   required from =E2=80=98_=
Funct
> std::for_each(_IIter, _IIter, _Funct) [with _IIter =3D
> std::_Rb_tree_const_iterator<llvm::SmallVector<clang::RISCV::PrototypeDes=
criptor>
> >; _Funct =3D
> {anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRec=
ord>)::<lambda(auto:2&)>]=E2=80=99
> >   output/host/include/llvm/ADT/STLExtras.h:1611:23:   required from
> =E2=80=98UnaryFunction llvm::for_each(R&&, UnaryFunction) [with R =3D
> std::set<llvm::SmallVector<clang::RISCV::PrototypeDescriptor>,
> {anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRec=
ord>)::Compare>&;
> UnaryFunction =3D
> {anonymous}::SemaSignatureTable::init(llvm::ArrayRef<{anonymous}::SemaRec=
ord>)::<lambda(auto:2&)>]=E2=80=99
> >
>  output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitter.cpp:249:64:
>  required from here
> >
>  output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitter.cpp:249:50:
> error: cannot call member function =E2=80=98void
> {anonymous}::SemaSignatureTable::insert(llvm::ArrayRef<clang::RISCV::Prot=
otypeDescriptor>)=E2=80=99
> without object
> >     llvm::for_each(Signatures, [this](auto &Sig) { insert(Sig); });
> >                                                       ^~~~~~
> >   utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/build.make:313: recipe
> for target
> 'utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/RISCVVEmitter.cpp.o' fail=
ed
> >   make[4]: ***
> [utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/RISCVVEmitter.cpp.o] Erro=
r 1
> >
> >   Indeed LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN is OFF, the
> CheckCompilerVersion.cmake
> >   trigger an error if gcc < 7.x. Indded since llvm 15 this option check
> for C++17 [1]
> >
> >   The last gcc 7.x version (7.5) has been released in 2019.
> >   Fixing llvm/clang issues for old compiler maybe it's not worth it.
> >
> > - Remove LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since
> >   gcc >=3D 7 is mendatory.
> >
> >   When updating LLVM, we also need to update the version of
> >   SPIRV_LLVM_TRANSLATOR because its CMakeLists.txt verifies the LLVM
> >   base version [2].
> >
> >   The patch
> >   package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch has
> >   been included in tag llvmorg-15.0.0 of llvm-project.
> >
> >   [1]
> https://github.com/llvm/llvm-project/commit/4c72deb613d9d8838785b431facb3=
eb480fb2f51
> >   [2]
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/blob/5be08b8bb91fc6=
ca62857792c177bc7479e5e3db/CMakeLists.txt#LL82C6-L82C6
> >
> > Signed-off-by: Daniel Lang <d.lang@abatec.at>
> > Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> > ---
> > v4: - update spirv-llvm-translator version as well
> >     - remove
> package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
> >
> > v3: - add libclc bump
> >     - llvm, clang, lld, mesa3d (llvm): add gcc >=3D 7.x dependency
> >
> > Changes v1 -> v2:
> > - Bump to 15.0.3 instead of 15.0.1
> > - llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC
> > ---
>
> I noticed a new runtime issue [1] with the ClangCompilerRT test:
>
> # fuzz_me
> =3D=3D74=3D=3DERROR: AddressSanitizer failed to allocate 0x0 (0) bytes of
> SetAlternateSignalStack (error code: 22)
>
> The issue is due to the recent ARM aarch64 toolchain bump that provide a
> glibc
> >=3D 2.34.
>
> See bug reports [2] [3].
>
> The issue has been fixed in llvm 13.0.0 [4] and it's fixed in Buildroot a=
s
> soon
> as the llvm/clang version bump to 15.0.x patch series is applied [5].
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4621046299
> [2] https://github.com/llvm/llvm-project/issues/55785
> [3] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100114
> [4]
>
> https://github.com/llvm/llvm-project/commit/82150606fb11d28813ae6da1101f5=
bda638165fe
> [5] http://patchwork.ozlabs.org/project/buildroot/list/?series=3D359890
>
> Best regards,
> Romain
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000b8a3b80600ee9793
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jul 12, 2023 at 6:06=E2=80=AFAM Romain Naour &lt;<a href=3D"=
mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Le 15/06/2023 =C3=A0 15:43, Sebastian Weyer a =C3=A9crit=C2=A0:<br>
&gt; From: Lang Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_b=
lank">d.lang@abatec.at</a>&gt;<br>
&gt; <br>
&gt; - Add new build dependencies to lld and llvm<br>
&gt; - Add host-gcc and gcc &gt;=3D 7.x dependency since clang doesn&#39;t =
build with gcc 6.3<br>
&gt; <br>
&gt;=C2=A0 =C2=A0[ 28%] Building CXX object utils/TableGen/CMakeFiles/obj.c=
lang-tblgen.dir/TableGen.cpp.o<br>
&gt;=C2=A0 =C2=A0output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitte=
r.cpp: In instantiation of =E2=80=98{anonymous}::SemaSignatureTable::init(l=
lvm::ArrayRef&lt;{anonymous}::SemaRecord&gt;)::&lt;lambda(auto:2&amp;)&gt; =
[with auto:2 =3D const llvm::SmallVector&lt;clang::RISCV::PrototypeDescript=
or&gt;]=E2=80=99:<br>
&gt;=C2=A0 =C2=A0/usr/include/c++/6/bits/stl_algo.h:3769:5:=C2=A0 =C2=A0req=
uired from =E2=80=98_Funct std::for_each(_IIter, _IIter, _Funct) [with _IIt=
er =3D std::_Rb_tree_const_iterator&lt;llvm::SmallVector&lt;clang::RISCV::P=
rototypeDescriptor&gt; &gt;; _Funct =3D {anonymous}::SemaSignatureTable::in=
it(llvm::ArrayRef&lt;{anonymous}::SemaRecord&gt;)::&lt;lambda(auto:2&amp;)&=
gt;]=E2=80=99<br>
&gt;=C2=A0 =C2=A0output/host/include/llvm/ADT/STLExtras.h:1611:23:=C2=A0 =
=C2=A0required from =E2=80=98UnaryFunction llvm::for_each(R&amp;&amp;, Unar=
yFunction) [with R =3D std::set&lt;llvm::SmallVector&lt;clang::RISCV::Proto=
typeDescriptor&gt;, {anonymous}::SemaSignatureTable::init(llvm::ArrayRef&lt=
;{anonymous}::SemaRecord&gt;)::Compare&gt;&amp;; UnaryFunction =3D {anonymo=
us}::SemaSignatureTable::init(llvm::ArrayRef&lt;{anonymous}::SemaRecord&gt;=
)::&lt;lambda(auto:2&amp;)&gt;]=E2=80=99<br>
&gt;=C2=A0 =C2=A0output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitte=
r.cpp:249:64:=C2=A0 =C2=A0required from here<br>
&gt;=C2=A0 =C2=A0output/build/host-clang-15.0.3/utils/TableGen/RISCVVEmitte=
r.cpp:249:50: error: cannot call member function =E2=80=98void {anonymous}:=
:SemaSignatureTable::insert(llvm::ArrayRef&lt;clang::RISCV::PrototypeDescri=
ptor&gt;)=E2=80=99 without object<br>
&gt;=C2=A0 =C2=A0 =C2=A0llvm::for_each(Signatures, [this](auto &amp;Sig) { =
insert(Sig); });<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt;=C2=A0 =C2=A0utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/build.make:=
313: recipe for target &#39;utils/TableGen/CMakeFiles/obj.clang-tblgen.dir/=
RISCVVEmitter.cpp.o&#39; failed<br>
&gt;=C2=A0 =C2=A0make[4]: *** [utils/TableGen/CMakeFiles/obj.clang-tblgen.d=
ir/RISCVVEmitter.cpp.o] Error 1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Indeed LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN is OFF, the Ch=
eckCompilerVersion.cmake<br>
&gt;=C2=A0 =C2=A0trigger an error if gcc &lt; 7.x. Indded since llvm 15 thi=
s option check for C++17 [1]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0The last gcc 7.x version (7.5) has been released in 2019.<=
br>
&gt;=C2=A0 =C2=A0Fixing llvm/clang issues for old compiler maybe it&#39;s n=
ot worth it.<br>
&gt; <br>
&gt; - Remove LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since<br>
&gt;=C2=A0 =C2=A0gcc &gt;=3D 7 is mendatory.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0When updating LLVM, we also need to update the version of<=
br>
&gt;=C2=A0 =C2=A0SPIRV_LLVM_TRANSLATOR because its CMakeLists.txt verifies =
the LLVM<br>
&gt;=C2=A0 =C2=A0base version [2].<br>
&gt; <br>
&gt;=C2=A0 =C2=A0The patch<br>
&gt;=C2=A0 =C2=A0package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.=
patch has<br>
&gt;=C2=A0 =C2=A0been included in tag llvmorg-15.0.0 of llvm-project.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0[1] <a href=3D"https://github.com/llvm/llvm-project/commit=
/4c72deb613d9d8838785b431facb3eb480fb2f51" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/llvm/llvm-project/commit/4c72deb613d9d8838785b431fa=
cb3eb480fb2f51</a><br>
&gt;=C2=A0 =C2=A0[2] <a href=3D"https://github.com/KhronosGroup/SPIRV-LLVM-=
Translator/blob/5be08b8bb91fc6ca62857792c177bc7479e5e3db/CMakeLists.txt#LL8=
2C6-L82C6" rel=3D"noreferrer" target=3D"_blank">https://github.com/KhronosG=
roup/SPIRV-LLVM-Translator/blob/5be08b8bb91fc6ca62857792c177bc7479e5e3db/CM=
akeLists.txt#LL82C6-L82C6</a><br>
&gt; <br>
&gt; Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" tar=
get=3D"_blank">d.lang@abatec.at</a>&gt;<br>
&gt; Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.f=
r" target=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
&gt; Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@s=
mile.fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; v4: - update spirv-llvm-translator version as well<br>
&gt;=C2=A0 =C2=A0 =C2=A0- remove package/llvm/0002-Add-missing-cstdint-head=
er-to-Signals.h.patch<br>
&gt; <br>
&gt; v3: - add libclc bump<br>
&gt;=C2=A0 =C2=A0 =C2=A0- llvm, clang, lld, mesa3d (llvm): add gcc &gt;=3D =
7.x dependency<br>
&gt; <br>
&gt; Changes v1 -&gt; v2:<br>
&gt; - Bump to 15.0.3 instead of 15.0.1<br>
&gt; - llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC<br>
&gt; ---<br>
<br>
I noticed a new runtime issue [1] with the ClangCompilerRT test:<br>
<br>
# fuzz_me<br>
=3D=3D74=3D=3DERROR: AddressSanitizer failed to allocate 0x0 (0) bytes of<b=
r>
SetAlternateSignalStack (error code: 22)<br>
<br>
The issue is due to the recent ARM aarch64 toolchain bump that provide a gl=
ibc<br>
&gt;=3D 2.34.<br>
<br>
See bug reports [2] [3].<br>
<br>
The issue has been fixed in llvm 13.0.0 [4] and it&#39;s fixed in Buildroot=
 as soon<br>
as the llvm/clang version bump to 15.0.x patch series is applied [5].<br>
<br>
[1] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/4621046299=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bui=
ldroot/-/jobs/4621046299</a><br>
[2] <a href=3D"https://github.com/llvm/llvm-project/issues/55785" rel=3D"no=
referrer" target=3D"_blank">https://github.com/llvm/llvm-project/issues/557=
85</a><br>
[3] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100114" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D100114</a><br>
[4]<br>
<a href=3D"https://github.com/llvm/llvm-project/commit/82150606fb11d28813ae=
6da1101f5bda638165fe" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/llvm/llvm-project/commit/82150606fb11d28813ae6da1101f5bda638165fe</a><br=
>
[5] <a href=3D"http://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D359890" rel=3D"noreferrer" target=3D"_blank">http://patchwork.ozlabs.org=
/project/buildroot/list/?series=3D359890</a><br>
<br>
Best regards,<br>
Romain<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000b8a3b80600ee9793--

--===============2794787088384574894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2794787088384574894==--
