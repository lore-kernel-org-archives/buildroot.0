Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB43C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 06:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BE04182D;
	Thu,  9 Mar 2023 06:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69BE04182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBWpBdj8oJlT; Thu,  9 Mar 2023 06:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B27841797;
	Thu,  9 Mar 2023 06:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B27841797
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42C611BF5AA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 06:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1524981F10
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 06:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1524981F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sncCLE8She28 for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 06:58:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE76E81EEC
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE76E81EEC
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 06:58:35 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id m5so474547uae.11
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 22:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678345114;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WO5IqF4jkPPx65sIBSxX0mdKbrKs2QhAPwnW8zh6D70=;
 b=PPImSNBb7WtOCvAq8WCVc413vsH6mfzRe7B4hLkaeqG/bO62J4tABBtZjNy49pgAU0
 DbjW0+nr3zVGYi3pM/VjQBXLyNqWvmhPkzzywxk0GYNFZbPYH993B++eZ0Y8IZiSqF8n
 U3hbEAX6foI9HK3yTkapQyXj8X6P4I2xykz/ne2sayJO9TVCFRiarl8JhjE0OlYFU59E
 ChVHFa/tLU1FD2Bep265iiVMACzkYDPHmr/B1YK68iOJK6Zx3uuoopl9y4ZVlvp1Jub1
 VhQKSIq7OVfcxxQzshttEh+ywYmglUWPXXZjtlZOImxOAjScp6+GBiYC8Og3qnVhxkCN
 Xpdg==
X-Gm-Message-State: AO0yUKVEOxmUhruGD/g833WL35DLXlBpR4XSxVG7fc6Ne4VP50WHlWMa
 t7NTLsxrivZkhfWptcy4NXWXeQzC0NShNeX1I/LQzJvf
X-Google-Smtp-Source: AK7set/l+7YbFLJ/hDRgkGfGjKT/np1ZmyXSNUQ5R9BOsgIwEoT1/qRjgM6b5W/706aT1wZi/dqlHGb8QvwPM09qgm0=
X-Received: by 2002:a1f:e584:0:b0:413:1498:e843 with SMTP id
 c126-20020a1fe584000000b004131498e843mr12993386vkh.0.1678345114219; Wed, 08
 Mar 2023 22:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20230130104308.483243-1-marcus.folkesson@gmail.com>
 <CAM8FrKJbGWDCB66E50cSYDG=AjLJH1UXK3jRgOv2nFTZMfGgfg@mail.gmail.com>
In-Reply-To: <CAM8FrKJbGWDCB66E50cSYDG=AjLJH1UXK3jRgOv2nFTZMfGgfg@mail.gmail.com>
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 9 Mar 2023 07:58:22 +0100
Message-ID: <CAM8FrK+-UvjVKHJhkEz8fJLiqOC=KAiA91o6LRnncgjU9phT2A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678345114;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WO5IqF4jkPPx65sIBSxX0mdKbrKs2QhAPwnW8zh6D70=;
 b=W7xiDol1C7zNxWSANHnwNom0Usk3p0f6T/bSDThmY4ZoGCqZQH9Gk02IlliWIg0KNY
 BZWO1l1pL4wcr8UgP0ff0LIlNwHNdfAXQ8FI959N2459UUUK0gpWkJym/bX8SkztBw9q
 F5W+Qf5imysXMz9Fv0CQw+6wfSHbV6soxRS1CoHXO0oPk42HAYr/Cf4+R7yQr1M5ngky
 YxVRFuXPWfLx2Jyt0NgGiljN2iZOpqjOLLiOvEqRQPklb27KMTM0jC0pGWBPLSX/AB/O
 vnoYxMQb1qC7872IwS8j+FiWsxeLZuTLkVtVJfogXFEnMyHXX5Hkm0ILbCPqFUTNsV7s
 iqXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W7xiDol1
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-kconfig.mk new
 <pkg>-show-fragment target
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
Content-Type: multipart/mixed; boundary="===============4858336841717875272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4858336841717875272==
Content-Type: multipart/alternative; boundary="00000000000057fa0405f6722cc3"

--00000000000057fa0405f6722cc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.

Med v=C3=A4nliga h=C3=A4lsningar / Best regards
Marcus Folkesson


Den tis 14 feb. 2023 kl 07:38 skrev Marcus Folkesson <
marcus.folkesson@gmail.com>:

> Ping
>
> Den m=C3=A5n 30 jan. 2023 kl 11:43 skrev Marcus Folkesson <
> marcus.folkesson@gmail.com>:
>
>> This patch introduce the new target to simplify the generation of
>> configuration fragments as the output could be directly copied into a
>> fragment file as-is.
>>
>> It is *heavily* based on the <pkg>-diff-config target, but serves a
>> different purpose.
>>
>> Output from linux-diff-config:
>> -CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y
>> -CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n
>> -CONFIG_GCC_PLUGIN_LATENT_ENTROPY n
>> -CONFIG_GCC_PLUGIN_RANDSTRUCT n
>> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n
>> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n
>> -CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n
>> -CONFIG_STACKPROTECTOR_PER_TASK y
>> CONFIG_CRYPTO_DH n -> y
>> CONFIG_CRYPTO_KPP m -> y
>> CONFIG_GCC_PLUGINS y -> n
>> CONFIG_KEY_DH_OPERATIONS n -> y
>> CONFIG_PKCS8_PRIVATE_KEY_PARSER n -> y
>> CONFIG_VIDEO_IMX274 n -> m
>>
>> Output from linux-show-fragment:
>> CONFIG_CRYPTO_DH=3Dy
>> CONFIG_CRYPTO_KPP=3Dy
>> CONFIG_KEY_DH_OPERATIONS=3Dy
>> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
>> CONFIG_VIDEO_IMX274=3Dm
>>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> ---
>>  package/pkg-kconfig.mk | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
>> index f4f35bf96a..ee96525c47 100644
>> --- a/package/pkg-kconfig.mk
>> +++ b/package/pkg-kconfig.mk
>> @@ -309,12 +309,26 @@ $(1)-diff-config: $(1)-check-configuration-done
>>         $$(Q)cp -a $$($(2)_DIR)/.config.dc.bak
>> $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
>>         $$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
>>
>> +# Target to output differences between the configuration obtained via t=
he
>> +# defconfig + fragments (if any) and the current configuration.
>> +# Output format is suitable to be used as-is in fragment files.
>> +# Note: it preserves the timestamp of the current configuration when
>> moving it
>> +# around.
>> +$(1)-show-fragment: $(1)-check-configuration-done
>> +       $$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
>> $$($(2)_DIR)/.config.dc.bak
>> +       $$(call
>> kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG=
),\
>> +               $$($(2)_KCONFIG_FRAGMENT_FILES))
>> +       $$(Q)utils/diffconfig -m $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)=
 \
>> +                $$($(2)_DIR)/.config.dc.bak
>> +       $$(Q)cp -a $$($(2)_DIR)/.config.dc.bak
>> $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
>> +       $$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
>>
>>  endif # package enabled
>>
>>  .PHONY: \
>>         $(1)-diff-config \
>>         $(1)-check-configuration-done \
>> +       $(1)-show-fragment \
>>         $$($(2)_DIR)/.kconfig_editor_% \
>>         $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
>>
>> --
>> 2.38.1
>>
>>

--00000000000057fa0405f6722cc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature">Med v=C3=A4nliga h=C3=
=A4lsningar / Best regards<br>Marcus Folkesson</div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den tis=
 14 feb. 2023 kl 07:38 skrev Marcus Folkesson &lt;<a href=3D"mailto:marcus.=
folkesson@gmail.com">marcus.folkesson@gmail.com</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Ping</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den m=C3=A5n =
30 jan. 2023 kl 11:43 skrev Marcus Folkesson &lt;<a href=3D"mailto:marcus.f=
olkesson@gmail.com" target=3D"_blank">marcus.folkesson@gmail.com</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch introd=
uce the new target to simplify the generation of<br>
configuration fragments as the output could be directly copied into a<br>
fragment file as-is.<br>
<br>
It is *heavily* based on the &lt;pkg&gt;-diff-config target, but serves a<b=
r>
different purpose.<br>
<br>
Output from linux-diff-config:<br>
-CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y<br>
-CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n<br>
-CONFIG_GCC_PLUGIN_LATENT_ENTROPY n<br>
-CONFIG_GCC_PLUGIN_RANDSTRUCT n<br>
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n<br>
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n<br>
-CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n<br>
-CONFIG_STACKPROTECTOR_PER_TASK y<br>
CONFIG_CRYPTO_DH n -&gt; y<br>
CONFIG_CRYPTO_KPP m -&gt; y<br>
CONFIG_GCC_PLUGINS y -&gt; n<br>
CONFIG_KEY_DH_OPERATIONS n -&gt; y<br>
CONFIG_PKCS8_PRIVATE_KEY_PARSER n -&gt; y<br>
CONFIG_VIDEO_IMX274 n -&gt; m<br>
<br>
Output from linux-show-fragment:<br>
CONFIG_CRYPTO_DH=3Dy<br>
CONFIG_CRYPTO_KPP=3Dy<br>
CONFIG_KEY_DH_OPERATIONS=3Dy<br>
CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy<br>
CONFIG_VIDEO_IMX274=3Dm<br>
<br>
Signed-off-by: Marcus Folkesson &lt;<a href=3D"mailto:marcus.folkesson@gmai=
l.com" target=3D"_blank">marcus.folkesson@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-kconfig.mk</a> | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" t=
arget=3D"_blank">pkg-kconfig.mk</a> b/package/<a href=3D"http://pkg-kconfig=
.mk" rel=3D"noreferrer" target=3D"_blank">pkg-kconfig.mk</a><br>
index f4f35bf96a..ee96525c47 100644<br>
--- a/package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-kconfig.mk</a><br>
+++ b/package/<a href=3D"http://pkg-kconfig.mk" rel=3D"noreferrer" target=
=3D"_blank">pkg-kconfig.mk</a><br>
@@ -309,12 +309,26 @@ $(1)-diff-config: $(1)-check-configuration-done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_=
DIR)/$$($(2)_KCONFIG_DOTCONFIG)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(Q)rm -f $$($(2)_DIR)/.config.dc.bak<br>
<br>
+# Target to output differences between the configuration obtained via the<=
br>
+# defconfig + fragments (if any) and the current configuration.<br>
+# Output format is suitable to be used as-is in fragment files.<br>
+# Note: it preserves the timestamp of the current configuration when movin=
g it<br>
+# around.<br>
+$(1)-show-fragment: $(1)-check-configuration-done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONF=
IG) $$($(2)_DIR)/.config.dc.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(call kconfig-package-merge-config,$(2),$$($(=
2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$$($(2)_KCONFIG_FRA=
GMENT_FILES))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)utils/diffconfig -m $$($(2)_DIR)/$$($(2)_K=
CONFIG_DOTCONFIG) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $$($(2)_DIR)/.conf=
ig.dc.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_=
DIR)/$$($(2)_KCONFIG_DOTCONFIG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak<br>
<br>
=C2=A0endif # package enabled<br>
<br>
=C2=A0.PHONY: \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-diff-config \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(1)-check-configuration-done \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(1)-show-fragment \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$($(2)_DIR)/.kconfig_editor_% \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))<br=
>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000057fa0405f6722cc3--

--===============4858336841717875272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4858336841717875272==--
