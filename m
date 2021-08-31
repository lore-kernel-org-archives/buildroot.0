Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174E6C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 11:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0B860295
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 11:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB0B860295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=starry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B48B400C6;
	Tue, 31 Aug 2021 11:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1Y_RiOOT2PB; Tue, 31 Aug 2021 11:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E35F40203;
	Tue, 31 Aug 2021 11:12:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2106D1BF39C
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 11:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10E8C60BCE
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 11:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=starry.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANpjTHNxJWcz for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 11:12:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A43560BA5
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 11:12:00 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id 2so9647343qtw.1
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starry.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ws8VCejlsLFyJTqx+JT9Jb0GKkf9wCmvuljrpHZOCBM=;
 b=OIjtOsldf7HKxwTkMFmZtYKahfLOgS6WkERYSsXZk760tM9AK1CsI1CzIcj7q93HGf
 WRKYYUi4AvgQliJORADCwmLDgf7cb10zx/BfPPFEU5Mw19mn+YQhl8ZVeSxiVuMTa1DA
 xir7S5SKRvh8+Zoap/NVysVtNAAq0GTD5F3OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ws8VCejlsLFyJTqx+JT9Jb0GKkf9wCmvuljrpHZOCBM=;
 b=g5gHjUgHsaT7pZJnPrlhJLBE4lLtQGNDNvWkL+fjJllW/FnEmWQUS/8EUL9tUdwslH
 Jq3aPxSF9UZOOFwC1fI8xQUugS6CUtgPqBS9MUBaIDxNQ22v0S7h3buqIxz3Nvarbggl
 d2QQ60Ei8Gu5fl86HQ/iamQt36inM0J7wb24W7cOc2MYPGOSYsljBrXwzrsz0wmHkcxV
 1RjxYDhjjqgmy6mwxEqn1+U8Vy8zly8KSEizGi2XeLmoi0AOdgQpQug6ZYUDxY1NQINf
 mANYVqX4RaDcMmMBKunxfz+oFl15BQ14GBdPf7uaAZW7Coc1uPsRfPUm1vKfeZF7UUpG
 XhNQ==
X-Gm-Message-State: AOAM530IAoAdQl+mTqv9v80GmGIaGKFD0oe4zPcP/2glwfwHPgiqljEm
 3TR8LHYYS434n/PP5kKkviLQL5gFE8/7ZnlBMx8dkiOKPVs=
X-Google-Smtp-Source: ABdhPJzNfdOwh8wUSQgWvBh7rvkAl/texqkzcRC/2aVlVmoqsuF69fzmSC57Ifd6gYPZHZtAd0v9+czZ6GQNkO4OkaE=
X-Received: by 2002:a05:622a:15d2:: with SMTP id
 d18mr2193092qty.145.1630408318806; 
 Tue, 31 Aug 2021 04:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210830205357.4104461-1-nhed+buildroot@starry.com>
In-Reply-To: <20210830205357.4104461-1-nhed+buildroot@starry.com>
From: Nevo Hed <nhed+buildroot@starry.com>
Date: Tue, 31 Aug 2021 07:11:47 -0400
Message-ID: <CABGDZCngRCEfsjdy7iUpX7V8Yiz8iQzesyJre7xUxJ2zfqM-jA@mail.gmail.com>
To: buildroot@buildroot.org
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: multipart/mixed; boundary="===============5877392658730652982=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5877392658730652982==
Content-Type: multipart/alternative; boundary="000000000000ae829605cad904b9"

--000000000000ae829605cad904b9
Content-Type: text/plain; charset="UTF-8"

Hi All

This is my first contribution attempt in buildroot.

Just noticed a couple of typos (missing words actually) in the top commit
message.  Should I wait for other feedback or work on replacement patch
asap (won't be in office for at least 5 from now).

On Mon, Aug 30, 2021, 4:54 PM Nevo Hed <nhed+buildroot@starry.com> wrote:

> Though several patches exist in buildroot's nginx package dir they do
> not seem to address endianness.
>
> The test program generated my the script compiles but fails to run (as
> it is built for another architecture) but the script does not
> distinguish between the failure to run the program and an indication
> of certain endianness.  As such the fallback of big-endian is used.
> This setting then causes http2 headers (anything not in the satic
> dictionary) to come out as undecipherble trash.
>
> This commit includes a patch to the configure script to allow a
> `--force-endianness=big|little` flag as as setting that flag in
> buildroot's package makefile.
>
> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> ---
>  ...-of-endianness-for-cross-compilation.patch | 115 ++++++++++++++++++
>  package/nginx/nginx.mk                        |   1 +
>  2 files changed, 116 insertions(+)
>  create mode 100644
> package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
>
> diff --git
> a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> new file mode 100644
> index 0000000000..137ff6ea5d
> --- /dev/null
> +++
> b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> @@ -0,0 +1,115 @@
> +From b1a6b13d8ac2cade71bae508c7d20fbee6807e4e Mon Sep 17 00:00:00 2001
> +From: Nevo Hed <nhed+buildroot@starry.com>
> +Date: Mon, 30 Aug 2021 13:28:13 -0400
> +Subject: [PATCH] Allow forcing of endianness for cross-compilation
> +
> +Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> +---
> + auto/endianness | 61 ++++++++++++++++++++++++++++++++-----------------
> + auto/options    |  6 +++++
> + 2 files changed, 46 insertions(+), 21 deletions(-)
> +
> +diff --git a/auto/endianness b/auto/endianness
> +index 1b552b6b..4b2a3cd7 100644
> +--- a/auto/endianness
> ++++ b/auto/endianness
> +@@ -26,25 +26,44 @@ int main(void) {
> +
> + END
> +
> +-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> +-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
> +-
> +-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> +-
> +-if [ -x $NGX_AUTOTEST ]; then
> +-    if $NGX_AUTOTEST >/dev/null 2>&1; then
> +-        echo " little endian"
> ++case "${NGX_FORCE_ENDIANNESS}" in
> ++    little)
> ++        echo " little endian (forced)"
> +         have=NGX_HAVE_LITTLE_ENDIAN . auto/have
> +-    else
> +-        echo " big endian"
> +-    fi
> +-
> +-    rm -rf $NGX_AUTOTEST*
> +-
> +-else
> +-    rm -rf $NGX_AUTOTEST*
> +-
> +-    echo
> +-    echo "$0: error: cannot detect system byte ordering"
> +-    exit 1
> +-fi
> ++    ;;
> ++
> ++    big)
> ++        echo " big endian (forced)"
> ++    ;;
> ++
> ++    "")
> ++        ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> ++                  -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT
> $ngx_feature_libs"
> ++
> ++        eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> ++
> ++        if [ -x $NGX_AUTOTEST ]; then
> ++            if $NGX_AUTOTEST >/dev/null 2>&1; then
> ++                echo " little endian"
> ++                have=NGX_HAVE_LITTLE_ENDIAN . auto/have
> ++            else
> ++                echo " big endian"
> ++            fi
> ++
> ++            rm -rf $NGX_AUTOTEST*
> ++
> ++        else
> ++            rm -rf $NGX_AUTOTEST*
> ++
> ++            echo
> ++            echo "$0: error: cannot detect system byte ordering"
> ++            exit 1
> ++        fi
> ++    ;;
> ++
> ++    *)
> ++        echo
> ++        echo "$0: error: invalid
> \"--force-endianness=${NGX_FORCE_ENDIANNESS}\""
> ++        exit 1
> ++    ;;
> ++esac
> +diff --git a/auto/options b/auto/options
> +index 80be906e..85a06456 100644
> +--- a/auto/options
> ++++ b/auto/options
> +@@ -17,6 +17,8 @@ NGX_USER=
> + NGX_GROUP=
> + NGX_BUILD=
> +
> ++NGX_FORCE_ENDIANNESS=
> ++
> + CC=${CC:-cc}
> + CPP=
> + NGX_OBJS=objs
> +@@ -196,6 +198,8 @@ do
> +         --user=*)                        NGX_USER="$value"          ;;
> +         --group=*)                       NGX_GROUP="$value"         ;;
> +
> ++        --force-endianness=*)            NGX_FORCE_ENDIANNESS="$value" ;;
> ++
> +         --crossbuild=*)                  NGX_PLATFORM="$value"      ;;
> +
> +         --build=*)                       NGX_BUILD="$value"         ;;
> +@@ -432,6 +436,8 @@ cat << END
> +   --build=NAME                       set build name
> +   --builddir=DIR                     set build directory
> +
> ++  --force-endianness=<big>|<little>  force endianness
> ++
> +   --with-select_module               enable select module
> +   --without-select_module            disable select module
> +   --with-poll_module                 enable poll module
> +--
> +2.31.1
> +
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 1f996cc613..31b6e276b7 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -49,6 +49,7 @@ NGINX_CONF_ENV += \
>
>  # prefix: nginx root configuration location
>  NGINX_CONF_OPTS += \
> +       --force-endianness=$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN))) \
>         --prefix=/usr \
>         --conf-path=/etc/nginx/nginx.conf \
>         --sbin-path=/usr/sbin/nginx \
> --
> 2.31.1
>
>

--000000000000ae829605cad904b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi All<div dir=3D"auto"><br></div><div dir=3D"auto">This =
is my first contribution attempt in buildroot.=C2=A0</div><div dir=3D"auto"=
><br><div dir=3D"auto">Just noticed a couple of typos (missing words actual=
ly) in the top commit message.=C2=A0 Should I wait for other feedback or wo=
rk on replacement patch asap (won&#39;t be in office for at least 5 from no=
w).=C2=A0</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Aug 30, 2021, 4:54 PM Nevo Hed &lt;<a href=3D"=
mailto:nhed%2Bbuildroot@starry.com">nhed+buildroot@starry.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Though several patches exist in b=
uildroot&#39;s nginx package dir they do<br>
not seem to address endianness.<br>
<br>
The test program generated my the script compiles but fails to run (as<br>
it is built for another architecture) but the script does not<br>
distinguish between the failure to run the program and an indication<br>
of certain endianness.=C2=A0 As such the fallback of big-endian is used.<br=
>
This setting then causes http2 headers (anything not in the satic<br>
dictionary) to come out as undecipherble trash.<br>
<br>
This commit includes a patch to the configure script to allow a<br>
`--force-endianness=3Dbig|little` flag as as setting that flag in<br>
buildroot&#39;s package makefile.<br>
<br>
Signed-off-by: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com" =
target=3D"_blank" rel=3D"noreferrer">nhed+buildroot@starry.com</a>&gt;<br>
---<br>
=C2=A0...-of-endianness-for-cross-compilation.patch | 115 +++++++++++++++++=
+<br>
=C2=A0package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer noreferre=
r" target=3D"_blank">nginx.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 116 insertions(+)<br>
=C2=A0create mode 100644 package/nginx/0010-Allow-forcing-of-endianness-for=
-cross-compilation.patch<br>
<br>
diff --git a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compi=
lation.patch b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-com=
pilation.patch<br>
new file mode 100644<br>
index 0000000000..137ff6ea5d<br>
--- /dev/null<br>
+++ b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.=
patch<br>
@@ -0,0 +1,115 @@<br>
+From b1a6b13d8ac2cade71bae508c7d20fbee6807e4e Mon Sep 17 00:00:00 2001<br>
+From: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com" target=
=3D"_blank" rel=3D"noreferrer">nhed+buildroot@starry.com</a>&gt;<br>
+Date: Mon, 30 Aug 2021 13:28:13 -0400<br>
+Subject: [PATCH] Allow forcing of endianness for cross-compilation<br>
+<br>
+Signed-off-by: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com"=
 target=3D"_blank" rel=3D"noreferrer">nhed+buildroot@starry.com</a>&gt;<br>
+---<br>
+ auto/endianness | 61 ++++++++++++++++++++++++++++++++-----------------<br=
>
+ auto/options=C2=A0 =C2=A0 |=C2=A0 6 +++++<br>
+ 2 files changed, 46 insertions(+), 21 deletions(-)<br>
+<br>
+diff --git a/auto/endianness b/auto/endianness<br>
+index 1b552b6b..4b2a3cd7 100644<br>
+--- a/auto/endianness<br>
++++ b/auto/endianness<br>
+@@ -26,25 +26,44 @@ int main(void) {<br>
+ <br>
+ END<br>
+ <br>
+-ngx_test=3D&quot;$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_=
LD_OPT $ngx_feature_libs&quot;<br>
+-<br>
+-eval &quot;$ngx_test &gt;&gt; $NGX_AUTOCONF_ERR 2&gt;&amp;1&quot;<br>
+-<br>
+-if [ -x $NGX_AUTOTEST ]; then<br>
+-=C2=A0 =C2=A0 if $NGX_AUTOTEST &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; little endian&quot;<br>
++case &quot;${NGX_FORCE_ENDIANNESS}&quot; in<br>
++=C2=A0 =C2=A0 little)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; little endian (forced)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have=3DNGX_HAVE_LITTLE_ENDIAN . auto/hav=
e<br>
+-=C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; big endian&quot;<br>
+-=C2=A0 =C2=A0 fi<br>
+-<br>
+-=C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
+-<br>
+-else<br>
+-=C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
+-<br>
+-=C2=A0 =C2=A0 echo<br>
+-=C2=A0 =C2=A0 echo &quot;$0: error: cannot detect system byte ordering&qu=
ot;<br>
+-=C2=A0 =C2=A0 exit 1<br>
+-fi<br>
++=C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 big)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; big endian (forced)&quot;<br>
++=C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ngx_test=3D&quot;$CC $CC_TEST_FLAGS $CC_AUX_F=
LAGS \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o $NGX_AU=
TOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 eval &quot;$ngx_test &gt;&gt; $NGX_AUTOCONF_E=
RR 2&gt;&amp;1&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x $NGX_AUTOTEST ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $NGX_AUTOTEST &gt;/dev/null =
2&gt;&amp;1; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; littl=
e endian&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have=3DNGX_HAVE_L=
ITTLE_ENDIAN . auto/have<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; big e=
ndian&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $NGX_AUTOTEST*<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$0: error: cannot de=
tect system byte ordering&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 *)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$0: error: invalid \&quot;--force-=
endianness=3D${NGX_FORCE_ENDIANNESS}\&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
++=C2=A0 =C2=A0 ;;<br>
++esac<br>
+diff --git a/auto/options b/auto/options<br>
+index 80be906e..85a06456 100644<br>
+--- a/auto/options<br>
++++ b/auto/options<br>
+@@ -17,6 +17,8 @@ NGX_USER=3D<br>
+ NGX_GROUP=3D<br>
+ NGX_BUILD=3D<br>
+ <br>
++NGX_FORCE_ENDIANNESS=3D<br>
++<br>
+ CC=3D${CC:-cc}<br>
+ CPP=3D<br>
+ NGX_OBJS=3Dobjs<br>
+@@ -196,6 +198,8 @@ do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--user=3D*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NGX_USER=3D&quot;$v=
alue&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--group=3D*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NGX_GROUP=3D&quot;$v=
alue&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 --force-endianness=3D*)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NGX_FORCE_ENDIANNESS=3D&quot;$value&quot; ;;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--crossbuild=3D*)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NGX_PLATFORM=3D&quot;$value&quot;=
=C2=A0 =C2=A0 =C2=A0 ;;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--build=3D*)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NGX_BUILD=3D&quot;$v=
alue&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+@@ -432,6 +436,8 @@ cat &lt;&lt; END<br>
+=C2=A0 =C2=A0--build=3DNAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set build name<br>
+=C2=A0 =C2=A0--builddir=3DDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set build directory<br>
+ <br>
++=C2=A0 --force-endianness=3D&lt;big&gt;|&lt;little&gt;=C2=A0 force endian=
ness<br>
++<br>
+=C2=A0 =C2=A0--with-select_module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0enable select module<br>
+=C2=A0 =C2=A0--without-select_module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 disable select module<br>
+=C2=A0 =C2=A0--with-poll_module=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enable poll module<br>
+-- <br>
+2.31.1<br>
+<br>
diff --git a/package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer no=
referrer" target=3D"_blank">nginx.mk</a> b/package/nginx/<a href=3D"http://=
nginx.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">nginx.mk</a><br>
index 1f996cc613..31b6e276b7 100644<br>
--- a/package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer noreferre=
r" target=3D"_blank">nginx.mk</a><br>
+++ b/package/nginx/<a href=3D"http://nginx.mk" rel=3D"noreferrer noreferre=
r" target=3D"_blank">nginx.mk</a><br>
@@ -49,6 +49,7 @@ NGINX_CONF_ENV +=3D \<br>
<br>
=C2=A0# prefix: nginx root configuration location<br>
=C2=A0NGINX_CONF_OPTS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--force-endianness=3D$(call qstrip,$(call LOWER=
CASE,$(BR2_ENDIAN))) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix=3D/usr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --conf-path=3D/etc/nginx/nginx.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --sbin-path=3D/usr/sbin/nginx \<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000ae829605cad904b9--

--===============5877392658730652982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5877392658730652982==--
