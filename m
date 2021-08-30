Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CF8C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:26:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D97961102
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 11:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D97961102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F44580F1B;
	Mon, 30 Aug 2021 11:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZ95yO1iHR2Q; Mon, 30 Aug 2021 11:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC25380F1E;
	Mon, 30 Aug 2021 11:26:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00F6B1BF39C
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F168D80F1E
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 11:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BHIOiMCq9JI for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 11:26:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D5C280F19
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 11:26:10 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id b10so19335454ioq.9
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgyHB3zzLs3meL9cRT0GXDC6Ljsnrh22TEdJ/aG5ILk=;
 b=T9D+JpSWQEhb1pdycvr9jvvkrz+ufVR/1p9PiUXoeD+O86t4Wjz1XmGufzHnITLS21
 DcNtVkHfD0IymsfS4PZWy6v2wRgM5rvCRLKXufGuMH91RtYXp0bJCRrxeN1RaXxa1zU/
 t/SkTYmTDfXBuGw1o8og8Sq9E2eknygy4R76xkjxQWeZqmroN8rL3z6+FiBnrQikllB9
 6uZX8+GIIY0nq2x7kgq8toOql9WcloceKpDO/y08Sm9jGzMUQot1IzztbxLLQpPhFvKa
 VlQPUfaGRo4PSXvTD4lFn3tArF8gVXLwalo8YTXYPclh4TMfOOzDb50N85dyQ8RBy+G4
 Enwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgyHB3zzLs3meL9cRT0GXDC6Ljsnrh22TEdJ/aG5ILk=;
 b=XQlwUEfLs2s7uRqdwUOerodLLrVS1q+GjHKu/jP8aaQzct5Tmy12HtEUXm9qfCsF9p
 iGAQSpK2dM7tp9YKHqhl0UMpBASVpbcsKXx6t+01tQ6iEwT7fzugoMCq5Oj3YA1CklDW
 XD+Bkx5UJZLLvJbfIxXHo+v6c9Q9M+57ajrP8b0/N2XRjy0F+WD2RBBRSdakVMi0ymCb
 zoVR5U0ADvH1BR/g1xk230d1t7jHfYPUU2ARaLRZtbKDfDQ4BebzTOjKSrrTWMsyM0TR
 r6WhrPqjPrhtL+a5hx4C9qsDY0xCCqGXFGNJXUNpf6yHvqPuUzIZFDKOAIy1i5pPN8U7
 FgSA==
X-Gm-Message-State: AOAM533ozZp/SMDm/g0A6TRWvC2gbaik8rq44QCaEhWG1HBsVirrcitB
 dVBghGj2tDvS9TWAr1zldB63mjkUc23rVUu0PZyTkkKavY55yTBRun8=
X-Google-Smtp-Source: ABdhPJw+KPUm5fdbpTrtyHHXNcIjd6dP1DNHSJg1IpMa6KhU5rTuQlvoAGkP/fzm9SFw4JuSBRQO+FTqudG5/9tW24A=
X-Received: by 2002:a05:6602:2c07:: with SMTP id
 w7mr4870426iov.122.1630322769088; 
 Mon, 30 Aug 2021 04:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210823235332.994567-1-illia.bitkov@mind.be>
In-Reply-To: <20210823235332.994567-1-illia.bitkov@mind.be>
From: Illia Bitkov <illia.bitkov@mind.be>
Date: Mon, 30 Aug 2021 13:25:58 +0200
Message-ID: <CA+vtFZPNjAy5B=b2T1sjT5gKNPQikF9CSfz+7OJPvhht0HXgBA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mono: fix external
 libatomic_ops linkage
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0028527371272931543=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0028527371272931543==
Content-Type: multipart/alternative; boundary="000000000000856da905cac519d9"

--000000000000856da905cac519d9
Content-Type: text/plain; charset="UTF-8"

Hello,
Just in case a bit more detailed description: bdwgc uses libatomic-ops
functions only on platform ARMv5(and probably older ones) on newer ARM
architectures it uses builtin in gcc atomic.
bdwgc doesn't link external libatomic-ops at all and so build fails only
for ARMv5.

New test build link because patch lists pretty old ones.
http://autobuild.buildroot.net/results/03255f212e088397d44aacdd72d9b43e31f199d8/

On Tue, Aug 24, 2021 at 1:53 AM Illia Bitkov <illia.bitkov@mind.be> wrote:

> Problem is due to the fact that external libatomic_ops doesn't link with
> libraries.
> It's a problem of internal version of bdwgc.
>
> Error:
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
> gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'
>
> Fixes:
>
> http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
>
> http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
> Signed-off-by
> <http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/Signed-off-by>:
> Illia Bitkov <illia.bitkov@mind.be>
> ---
>  ...-system-libatomic_ops-shared-library.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644
> package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
>
> diff --git
> a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
> b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
> new file mode 100644
> index 0000000000..0a88b45515
> --- /dev/null
> +++
> b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
> @@ -0,0 +1,51 @@
> +From 02a44ee1df8176c72e75fd706d1a8f063d3196d5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 5 Nov 2018 22:50:40 +0100
> +Subject: Fix linkage with a system libatomic_ops shared library
> +
> +Issue #247 (bdwgc).
> +
> +When bdwgc is linked with the external libatomic_ops, bdw-gc.pc must
> +contain the needed dynamic libraries (such as -latomic_ops) otherwise
> +build of applications could fail on the link stage on some hosts:
> +* libgc.so: undefined reference to 'AO_fetch_compare_and_swap_emulation'
> +* libgc.so: undefined reference to 'AO_store_full_emulation'
> +
> +So, this commit sets ATOMIC_OPS_LIBS to "-latomic_ops" when a system
> +atomic_ops library is used and uses ATOMIC_OPS_LIBS in bdw-gc.pc.in.
> +
> +* bdw-gc.pc.in (Libs): Add @ATOMIC_OPS_LIBS@.
> +* configure.ac [$with_libatomic_ops!=no && $with_libatomic_ops!=none
> +&& $THREADS!=none] (ATOMIC_OPS_LIBS): Set to -latomic_ops; do AC_SUBST.
> +
> +cherry-picked by Illia Bitkov
> +
> +Link to original commit
> https://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=02a44ee1df8176c72e75fd706d1a8f063d3196d5&diff=unified
>
> +
> +
> +diff --git a/external/bdwgc/bdw-gc.pc.in b/external/bdwgc/bdw-gc.pc.in
> +index ef4c2341..a32e7598 100644
> +--- a/external/bdwgc/bdw-gc.pc.in
> ++++ b/external/bdwgc/bdw-gc.pc.in
> +@@ -6,5 +6,5 @@ includedir=@includedir@
> + Name: Boehm-Demers-Weiser Conservative Garbage Collector
> + Description: A garbage collector for C and C++
> + Version: @PACKAGE_VERSION@
> +-Libs: -L${libdir} -lgc
> ++Libs: -L${libdir} @ATOMIC_OPS_LIBS@ -lgc
> + Cflags: -I${includedir}
> +diff --git a/external/bdwgc/configure.ac b/external/bdwgc/configure.ac
> +index 21abe8fa..9ffe81de 100644
> +--- a/external/bdwgc/configure.ac
> ++++ b/external/bdwgc/configure.ac
> +@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
> + AC_MSG_CHECKING([which libatomic_ops to use])
> + AS_IF([test x"$with_libatomic_ops" != xno],
> +   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
> +-          [ AC_MSG_RESULT([external]) ],
> ++          [ AC_MSG_RESULT([external])
> ++            ATOMIC_OPS_LIBS="-latomic_ops"
> ++            AC_SUBST([ATOMIC_OPS_LIBS]) ],
> +           [ AC_MSG_RESULT([none])
> +             AS_IF([test x"$THREADS" != xnone],
> +                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
> --
> 2.25.1
>
>

--000000000000856da905cac519d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>Just in case a bit more detailed des=
cription: bdwgc uses libatomic-ops functions only on platform ARMv5(and pro=
bably older ones) on newer ARM architectures it uses builtin in gcc atomic.=
</div><div>bdwgc doesn&#39;t link external libatomic-ops at all and so buil=
d fails only for ARMv5.<br></div><div><br></div><div>New test build link be=
cause patch lists pretty old ones.</div><div><a href=3D"http://autobuild.bu=
ildroot.net/results/03255f212e088397d44aacdd72d9b43e31f199d8/">http://autob=
uild.buildroot.net/results/03255f212e088397d44aacdd72d9b43e31f199d8/</a></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Aug 24, 2021 at 1:53 AM Illia Bitkov &lt;<a href=3D"mailto:illia=
.bitkov@mind.be">illia.bitkov@mind.be</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Problem is due to the fact that extern=
al libatomic_ops doesn&#39;t link with libraries.<br>
It&#39;s a problem of internal version of bdwgc.<br>
<br>
Error:<br>
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/..=
/lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-=
linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in fu=
nction `GC_steal_mark_stack&#39;:<br>
gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation&#39;<b=
r>
<br>
Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea=
4f1fdd3e1b086e0/" rel=3D"noreferrer" target=3D"_blank">http://autobuild.bui=
ldroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/</a><br>
<a href=3D"http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a7=
09d84acf854d298/Signed-off-by" rel=3D"noreferrer" target=3D"_blank">http://=
autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/<b=
r>
Signed-off-by</a>: Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be"=
 target=3D"_blank">illia.bitkov@mind.be</a>&gt;<br>
---<br>
=C2=A0...-system-libatomic_ops-shared-library.patch | 51 ++++++++++++++++++=
+<br>
=C2=A01 file changed, 51 insertions(+)<br>
=C2=A0create mode 100644 package/mono/0001-Fix-linkage-with-a-system-libato=
mic_ops-shared-library.patch<br>
<br>
diff --git a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shar=
ed-library.patch b/package/mono/0001-Fix-linkage-with-a-system-libatomic_op=
s-shared-library.patch<br>
new file mode 100644<br>
index 0000000000..0a88b45515<br>
--- /dev/null<br>
+++ b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-libr=
ary.patch<br>
@@ -0,0 +1,51 @@<br>
+From 02a44ee1df8176c72e75fd706d1a8f063d3196d5 Mon Sep 17 00:00:00 2001<br>
+From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" t=
arget=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
+Date: Mon, 5 Nov 2018 22:50:40 +0100<br>
+Subject: Fix linkage with a system libatomic_ops shared library<br>
+<br>
+Issue #247 (bdwgc).<br>
+<br>
+When bdwgc is linked with the external libatomic_ops, bdw-gc.pc must<br>
+contain the needed dynamic libraries (such as -latomic_ops) otherwise<br>
+build of applications could fail on the link stage on some hosts:<br>
+* libgc.so: undefined reference to &#39;AO_fetch_compare_and_swap_emulatio=
n&#39;<br>
+* libgc.so: undefined reference to &#39;AO_store_full_emulation&#39;<br>
+<br>
+So, this commit sets ATOMIC_OPS_LIBS to &quot;-latomic_ops&quot; when a sy=
stem<br>
+atomic_ops library is used and uses ATOMIC_OPS_LIBS in <a href=3D"http://b=
dw-gc.pc.in" rel=3D"noreferrer" target=3D"_blank">bdw-gc.pc.in</a>.<br>
+<br>
+* <a href=3D"http://bdw-gc.pc.in" rel=3D"noreferrer" target=3D"_blank">bdw=
-gc.pc.in</a> (Libs): Add @ATOMIC_OPS_LIBS@.<br>
+* <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> [$with_libatomic_ops!=3Dno &amp;&amp; $with_libatomic_ops!=3D=
none<br>
+&amp;&amp; $THREADS!=3Dnone] (ATOMIC_OPS_LIBS): Set to -latomic_ops; do AC=
_SUBST.<br>
+<br>
+cherry-picked by Illia Bitkov<br>
+<br>
+Link to original commit <a href=3D"https://github.com/ivmai/bdwgc/commit/0=
2a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=3D02a44ee1df8176c72e75fd706d=
1a8f063d3196d5&amp;diff=3Dunified" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5=
?branch=3D02a44ee1df8176c72e75fd706d1a8f063d3196d5&amp;diff=3Dunified</a>=
=C2=A0 <br>
+<br>
+<br>
+diff --git a/external/bdwgc/<a href=3D"http://bdw-gc.pc.in" rel=3D"norefer=
rer" target=3D"_blank">bdw-gc.pc.in</a> b/external/bdwgc/<a href=3D"http://=
bdw-gc.pc.in" rel=3D"noreferrer" target=3D"_blank">bdw-gc.pc.in</a><br>
+index ef4c2341..a32e7598 100644<br>
+--- a/external/bdwgc/<a href=3D"http://bdw-gc.pc.in" rel=3D"noreferrer" ta=
rget=3D"_blank">bdw-gc.pc.in</a><br>
++++ b/external/bdwgc/<a href=3D"http://bdw-gc.pc.in" rel=3D"noreferrer" ta=
rget=3D"_blank">bdw-gc.pc.in</a><br>
+@@ -6,5 +6,5 @@ includedir=3D@includedir@<br>
+ Name: Boehm-Demers-Weiser Conservative Garbage Collector<br>
+ Description: A garbage collector for C and C++<br>
+ Version: @PACKAGE_VERSION@<br>
+-Libs: -L${libdir} -lgc<br>
++Libs: -L${libdir} @ATOMIC_OPS_LIBS@ -lgc<br>
+ Cflags: -I${includedir}<br>
+diff --git a/external/bdwgc/<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">configure.ac</a> b/external/bdwgc/<a href=3D"http://=
configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
+index 21abe8fa..9ffe81de 100644<br>
+--- a/external/bdwgc/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ b/external/bdwgc/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
+@@ -1081,7 +1081,9 @@ AS_IF([test x&quot;$with_libatomic_ops&quot; =3D xno=
 \<br>
+ AC_MSG_CHECKING([which libatomic_ops to use])<br>
+ AS_IF([test x&quot;$with_libatomic_ops&quot; !=3D xno],<br>
+=C2=A0 =C2=A0[ AS_IF([test x&quot;$with_libatomic_ops&quot; !=3D xnone -a =
x&quot;$THREADS&quot; !=3D xnone],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ AC_MSG_RESULT([external]) ],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ AC_MSG_RESULT([external])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ATOMIC_OPS_LIBS=3D&quot;-latomi=
c_ops&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST([ATOMIC_OPS_LIBS]) ],<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ AC_MSG_RESULT([none])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_IF([test x&quot;$THREAD=
S&quot; !=3D xnone],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ AC_=
DEFINE([GC_BUILTIN_ATOMIC], [1],<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000856da905cac519d9--

--===============0028527371272931543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0028527371272931543==--
