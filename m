Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BD9C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 16:19:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1348B610C9
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 16:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1348B610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=starry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F0D824DC;
	Tue, 31 Aug 2021 16:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tG9bxBa4NwgF; Tue, 31 Aug 2021 16:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54D4382404;
	Tue, 31 Aug 2021 16:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD8721BF421
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 16:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA6C60664
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 16:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=starry.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jli_LZKsVT7j for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 16:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D91A56138A
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 16:19:41 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id l4so10658673qvl.12
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 09:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starry.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmkpBcpYrr8m7cjkpiRpmKjHwaB1fTYdnDLNI24F75Q=;
 b=jyVA07wrEutpTItbMHOrUX22+IWtWrUMWvYP9TvjYqkWXM0pTLaOQFX6qLFKhAMUcX
 J5UIMTuZnaxcJ/89Pv1s3QOt6gD0Q500j6Zj+sY+JVRaYlBEh729a25x70IiQV6QQBIz
 N10pmCeqvfNTA6IIizr55av3YUDUCsS+bZA7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmkpBcpYrr8m7cjkpiRpmKjHwaB1fTYdnDLNI24F75Q=;
 b=ZGgC/3gx7RGjopDxv7Ip1WoKSXzP3jZmOh/SAm3yX8i9j5LfnWtz6MlBJQSY9DrLOU
 z3uu2U5Y110Rmn3qDAqO1lac9azVptMxXY5ziGQu7xGVsnyboeZAeX7RBYe+CLG8G9Vo
 CQqy/S9V7jsbbhjMu1zDK7lLqriU2ed/zyRYTIDqwWJYkth6h2ySfVopXNMZDej60ECP
 Rs9Xrs4hdiSxqzLwzCyb9+hdWoX1jc386UebGZIalQBnUQdA59Mz2AXY4xU0JtiWpX1k
 R1mtXBVC3BLdbCWVDWpH5a2euD1dluRMyuOLulSuDP3v09sT/tUCiq4xKKYRvFXqXINr
 20iA==
X-Gm-Message-State: AOAM5328Y9gO4swEGQKAi6qEZAq/XAJWh73ZR/FiZMsfbxagKnB53wxq
 YpXWRfh1eM7P/9+PH/y9TsQorp8ieaav/JMOF9g6pA==
X-Google-Smtp-Source: ABdhPJw7eI89+roR5UNYHoZ/l7uOq9xbNU7RV6ZtNcpLldhAbdcRLSZtCa0bNn8eZkSk37EbKXs+V8lzPgQDPAiNV9c=
X-Received: by 2002:a0c:a995:: with SMTP id a21mr23289433qvb.35.1630426780549; 
 Tue, 31 Aug 2021 09:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210830205357.4104461-1-nhed+buildroot@starry.com>
 <1eda8eb9-90dd-ac8f-9aee-620079c9f17d@mind.be>
In-Reply-To: <1eda8eb9-90dd-ac8f-9aee-620079c9f17d@mind.be>
From: Nevo Hed <nhed+buildroot@starry.com>
Date: Tue, 31 Aug 2021 12:19:29 -0400
Message-ID: <CABGDZCkTAKJgsg=AuEqMdhVyirVbwuzatigVfg7Kpfnj9LhJAA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: override endianness
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7312409366588928067=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7312409366588928067==
Content-Type: multipart/alternative; boundary="000000000000168c4905cadd51a6"

--000000000000168c4905cadd51a6
Content-Type: text/plain; charset="UTF-8"

Yes Arnout, That link is my report to nginx.

I will add that comment to my patch, but quick question -
will that go on my inner or outer patch?
I don't see the word 'upstream' in any of the current nginx patches and
most of them deal with unsupported cross-compilation


On Tue, Aug 31, 2021 at 9:45 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 30/08/2021 22:53, Nevo Hed wrote:
> > Though several patches exist in buildroot's nginx package dir they do
> > not seem to address endianness.
> >
> > The test program generated my the script compiles but fails to run (as
> > it is built for another architecture) but the script does not
> > distinguish between the failure to run the program and an indication
> > of certain endianness.  As such the fallback of big-endian is used.
> > This setting then causes http2 headers (anything not in the satic
> > dictionary) to come out as undecipherble trash.
> >
> > This commit includes a patch to the configure script to allow a
> > `--force-endianness=big|little` flag as as setting that flag in
> > buildroot's package makefile.
> >
> > Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> > ---
> >  ...-of-endianness-for-cross-compilation.patch | 115 ++++++++++++++++++
> >  package/nginx/nginx.mk                        |   1 +
> >  2 files changed, 116 insertions(+)
> >  create mode 100644
> package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> >
> > diff --git
> a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> > new file mode 100644
> > index 0000000000..137ff6ea5d
> > --- /dev/null
> > +++
> b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> > @@ -0,0 +1,115 @@
> > +From b1a6b13d8ac2cade71bae508c7d20fbee6807e4e Mon Sep 17 00:00:00 2001
> > +From: Nevo Hed <nhed+buildroot@starry.com>
> > +Date: Mon, 30 Aug 2021 13:28:13 -0400
> > +Subject: [PATCH] Allow forcing of endianness for cross-compilation
> > +
> > +Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
>
>  Ideally, you should have sent the patch upstream and you should add a
> reference
> to the upstream contribution. In this case, it can be as simple as:
>
> Upstream-status: Invalid (upstream doesn't support cross-compilation)
> See https://trac.nginx.org/nginx/ticket/2240
>
>
>  Regards,
>  Arnout
>
> > +---
> > + auto/endianness | 61 ++++++++++++++++++++++++++++++++-----------------
> > + auto/options    |  6 +++++
> > + 2 files changed, 46 insertions(+), 21 deletions(-)
> > +
> > +diff --git a/auto/endianness b/auto/endianness
> > +index 1b552b6b..4b2a3cd7 100644
> > +--- a/auto/endianness
> > ++++ b/auto/endianness
> > +@@ -26,25 +26,44 @@ int main(void) {
> > +
> > + END
> > +
> > +-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> > +-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT
> $ngx_feature_libs"
> > +-
> > +-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> > +-
> > +-if [ -x $NGX_AUTOTEST ]; then
> > +-    if $NGX_AUTOTEST >/dev/null 2>&1; then
> > +-        echo " little endian"
> > ++case "${NGX_FORCE_ENDIANNESS}" in
> > ++    little)
> > ++        echo " little endian (forced)"
> > +         have=NGX_HAVE_LITTLE_ENDIAN . auto/have
> > +-    else
> > +-        echo " big endian"
> > +-    fi
> > +-
> > +-    rm -rf $NGX_AUTOTEST*
> > +-
> > +-else
> > +-    rm -rf $NGX_AUTOTEST*
> > +-
> > +-    echo
> > +-    echo "$0: error: cannot detect system byte ordering"
> > +-    exit 1
> > +-fi
> > ++    ;;
> > ++
> > ++    big)
> > ++        echo " big endian (forced)"
> > ++    ;;
> > ++
> > ++    "")
> > ++        ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> > ++                  -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT
> $ngx_feature_libs"
> > ++
> > ++        eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> > ++
> > ++        if [ -x $NGX_AUTOTEST ]; then
> > ++            if $NGX_AUTOTEST >/dev/null 2>&1; then
> > ++                echo " little endian"
> > ++                have=NGX_HAVE_LITTLE_ENDIAN . auto/have
> > ++            else
> > ++                echo " big endian"
> > ++            fi
> > ++
> > ++            rm -rf $NGX_AUTOTEST*
> > ++
> > ++        else
> > ++            rm -rf $NGX_AUTOTEST*
> > ++
> > ++            echo
> > ++            echo "$0: error: cannot detect system byte ordering"
> > ++            exit 1
> > ++        fi
> > ++    ;;
> > ++
> > ++    *)
> > ++        echo
> > ++        echo "$0: error: invalid
> \"--force-endianness=${NGX_FORCE_ENDIANNESS}\""
> > ++        exit 1
> > ++    ;;
> > ++esac
> > +diff --git a/auto/options b/auto/options
> > +index 80be906e..85a06456 100644
> > +--- a/auto/options
> > ++++ b/auto/options
> > +@@ -17,6 +17,8 @@ NGX_USER=
> > + NGX_GROUP=
> > + NGX_BUILD=
> > +
> > ++NGX_FORCE_ENDIANNESS=
> > ++
> > + CC=${CC:-cc}
> > + CPP=
> > + NGX_OBJS=objs
> > +@@ -196,6 +198,8 @@ do
> > +         --user=*)                        NGX_USER="$value"          ;;
> > +         --group=*)                       NGX_GROUP="$value"         ;;
> > +
> > ++        --force-endianness=*)            NGX_FORCE_ENDIANNESS="$value"
> ;;
> > ++
> > +         --crossbuild=*)                  NGX_PLATFORM="$value"      ;;
> > +
> > +         --build=*)                       NGX_BUILD="$value"         ;;
> > +@@ -432,6 +436,8 @@ cat << END
> > +   --build=NAME                       set build name
> > +   --builddir=DIR                     set build directory
> > +
> > ++  --force-endianness=<big>|<little>  force endianness
> > ++
> > +   --with-select_module               enable select module
> > +   --without-select_module            disable select module
> > +   --with-poll_module                 enable poll module
> > +--
> > +2.31.1
> > +
> > diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> > index 1f996cc613..31b6e276b7 100644
> > --- a/package/nginx/nginx.mk
> > +++ b/package/nginx/nginx.mk
> > @@ -49,6 +49,7 @@ NGINX_CONF_ENV += \
> >
> >  # prefix: nginx root configuration location
> >  NGINX_CONF_OPTS += \
> > +     --force-endianness=$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN))) \
> >       --prefix=/usr \
> >       --conf-path=/etc/nginx/nginx.conf \
> >       --sbin-path=/usr/sbin/nginx \
> >
>

--000000000000168c4905cadd51a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes Arnout, That link is my report to=C2=A0nginx.<div><br>=
<div>I will add that comment to my patch, but quick=C2=A0question -</div><d=
iv>will that go on my inner or outer patch?</div><div>I don&#39;t see the w=
ord &#39;upstream&#39; in any of the current nginx patches and most of them=
 deal with unsupported=C2=A0cross-compilation</div><div><div><br></div></di=
v></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Aug 31, 2021 at 9:45 AM Arnout Vandecappelle &lt;<a href=3D=
"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
<br>
On 30/08/2021 22:53, Nevo Hed wrote:<br>
&gt; Though several patches exist in buildroot&#39;s nginx package dir they=
 do<br>
&gt; not seem to address endianness.<br>
&gt; <br>
&gt; The test program generated my the script compiles but fails to run (as=
<br>
&gt; it is built for another architecture) but the script does not<br>
&gt; distinguish between the failure to run the program and an indication<b=
r>
&gt; of certain endianness.=C2=A0 As such the fallback of big-endian is use=
d.<br>
&gt; This setting then causes http2 headers (anything not in the satic<br>
&gt; dictionary) to come out as undecipherble trash.<br>
&gt; <br>
&gt; This commit includes a patch to the configure script to allow a<br>
&gt; `--force-endianness=3Dbig|little` flag as as setting that flag in<br>
&gt; buildroot&#39;s package makefile.<br>
&gt; <br>
&gt; Signed-off-by: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.=
com" target=3D"_blank">nhed+buildroot@starry.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-of-endianness-for-cross-compilation.patch | 115 ++++++++++++=
++++++<br>
&gt;=C2=A0 package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer" tar=
get=3D"_blank">nginx.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 116 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/nginx/0010-Allow-forcing-of-endiannes=
s-for-cross-compilation.patch<br>
&gt; <br>
&gt; diff --git a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-=
compilation.patch b/package/nginx/0010-Allow-forcing-of-endianness-for-cros=
s-compilation.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..137ff6ea5d<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compila=
tion.patch<br>
&gt; @@ -0,0 +1,115 @@<br>
&gt; +From b1a6b13d8ac2cade71bae508c7d20fbee6807e4e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com" tar=
get=3D"_blank">nhed+buildroot@starry.com</a>&gt;<br>
&gt; +Date: Mon, 30 Aug 2021 13:28:13 -0400<br>
&gt; +Subject: [PATCH] Allow forcing of endianness for cross-compilation<br=
>
&gt; +<br>
&gt; +Signed-off-by: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry=
.com" target=3D"_blank">nhed+buildroot@starry.com</a>&gt;<br>
<br>
=C2=A0Ideally, you should have sent the patch upstream and you should add a=
 reference<br>
to the upstream contribution. In this case, it can be as simple as:<br>
<br>
Upstream-status: Invalid (upstream doesn&#39;t support cross-compilation)<b=
r>
See <a href=3D"https://trac.nginx.org/nginx/ticket/2240" rel=3D"noreferrer"=
 target=3D"_blank">https://trac.nginx.org/nginx/ticket/2240</a><br>
<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
&gt; +---<br>
&gt; + auto/endianness | 61 ++++++++++++++++++++++++++++++++---------------=
--<br>
&gt; + auto/options=C2=A0 =C2=A0 |=C2=A0 6 +++++<br>
&gt; + 2 files changed, 46 insertions(+), 21 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/auto/endianness b/auto/endianness<br>
&gt; +index 1b552b6b..4b2a3cd7 100644<br>
&gt; +--- a/auto/endianness<br>
&gt; ++++ b/auto/endianness<br>
&gt; +@@ -26,25 +26,44 @@ int main(void) {<br>
&gt; + <br>
&gt; + END<br>
&gt; + <br>
&gt; +-ngx_test=3D&quot;$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $NGX_AUTOTEST $NGX_AUTOTEST.c =
$NGX_LD_OPT $ngx_feature_libs&quot;<br>
&gt; +-<br>
&gt; +-eval &quot;$ngx_test &gt;&gt; $NGX_AUTOCONF_ERR 2&gt;&amp;1&quot;<br=
>
&gt; +-<br>
&gt; +-if [ -x $NGX_AUTOTEST ]; then<br>
&gt; +-=C2=A0 =C2=A0 if $NGX_AUTOTEST &gt;/dev/null 2&gt;&amp;1; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; little endian&quot;<br>
&gt; ++case &quot;${NGX_FORCE_ENDIANNESS}&quot; in<br>
&gt; ++=C2=A0 =C2=A0 little)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; little endian (forced)&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have=3DNGX_HAVE_LITTLE_ENDIAN . aut=
o/have<br>
&gt; +-=C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; big endian&quot;<br>
&gt; +-=C2=A0 =C2=A0 fi<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
&gt; +-<br>
&gt; +-else<br>
&gt; +-=C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 echo<br>
&gt; +-=C2=A0 =C2=A0 echo &quot;$0: error: cannot detect system byte orderi=
ng&quot;<br>
&gt; +-=C2=A0 =C2=A0 exit 1<br>
&gt; +-fi<br>
&gt; ++=C2=A0 =C2=A0 ;;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 big)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; big endian (forced)&quot;<br=
>
&gt; ++=C2=A0 =C2=A0 ;;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 &quot;&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ngx_test=3D&quot;$CC $CC_TEST_FLAGS $CC_=
AUX_FLAGS \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $N=
GX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval &quot;$ngx_test &gt;&gt; $NGX_AUTOC=
ONF_ERR 2&gt;&amp;1&quot;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x $NGX_AUTOTEST ]; then<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $NGX_AUTOTEST &gt;/dev/=
null 2&gt;&amp;1; then<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; =
little endian&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have=3DNGX_H=
AVE_LITTLE_ENDIAN . auto/have<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; =
big endian&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$0: error: cann=
ot detect system byte ordering&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; ++=C2=A0 =C2=A0 ;;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 *)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$0: error: invalid \&quot;--f=
orce-endianness=3D${NGX_FORCE_ENDIANNESS}\&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; ++=C2=A0 =C2=A0 ;;<br>
&gt; ++esac<br>
&gt; +diff --git a/auto/options b/auto/options<br>
&gt; +index 80be906e..85a06456 100644<br>
&gt; +--- a/auto/options<br>
&gt; ++++ b/auto/options<br>
&gt; +@@ -17,6 +17,8 @@ NGX_USER=3D<br>
&gt; + NGX_GROUP=3D<br>
&gt; + NGX_BUILD=3D<br>
&gt; + <br>
&gt; ++NGX_FORCE_ENDIANNESS=3D<br>
&gt; ++<br>
&gt; + CC=3D${CC:-cc}<br>
&gt; + CPP=3D<br>
&gt; + NGX_OBJS=3Dobjs<br>
&gt; +@@ -196,6 +198,8 @@ do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--user=3D*)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NGX_USER=3D&quo=
t;$value&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--group=3D*)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NGX_GROUP=3D&=
quot;$value&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 --force-endianness=3D*)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NGX_FORCE_ENDIANNESS=3D&quot;$value&quot; ;;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--crossbuild=3D*)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NGX_PLATFORM=3D&quot;$value&q=
uot;=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--build=3D*)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NGX_BUILD=3D&=
quot;$value&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +@@ -432,6 +436,8 @@ cat &lt;&lt; END<br>
&gt; +=C2=A0 =C2=A0--build=3DNAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set build name<br>
&gt; +=C2=A0 =C2=A0--builddir=3DDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set build directory<br>
&gt; + <br>
&gt; ++=C2=A0 --force-endianness=3D&lt;big&gt;|&lt;little&gt;=C2=A0 force e=
ndianness<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0--with-select_module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enable select module<br>
&gt; +=C2=A0 =C2=A0--without-select_module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 disable select module<br>
&gt; +=C2=A0 =C2=A0--with-poll_module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0enable poll module<br>
&gt; +-- <br>
&gt; +2.31.1<br>
&gt; +<br>
&gt; diff --git a/package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferr=
er" target=3D"_blank">nginx.mk</a> b/package/nginx/<a href=3D"http://nginx.=
mk" rel=3D"noreferrer" target=3D"_blank">nginx.mk</a><br>
&gt; index 1f996cc613..31b6e276b7 100644<br>
&gt; --- a/package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer" tar=
get=3D"_blank">nginx.mk</a><br>
&gt; +++ b/package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer" tar=
get=3D"_blank">nginx.mk</a><br>
&gt; @@ -49,6 +49,7 @@ NGINX_CONF_ENV +=3D \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # prefix: nginx root configuration location<br>
&gt;=C2=A0 NGINX_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--force-endianness=3D$(call qstrip,$(call LOWERCA=
SE,$(BR2_ENDIAN))) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--prefix=3D/usr \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--conf-path=3D/etc/nginx/nginx.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--sbin-path=3D/usr/sbin/nginx \<br>
&gt; <br>
</blockquote></div>

--000000000000168c4905cadd51a6--

--===============7312409366588928067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7312409366588928067==--
