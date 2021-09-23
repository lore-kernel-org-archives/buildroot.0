Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321DFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADACB61216
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADACB61216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AAD440151;
	Thu, 23 Sep 2021 09:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyZkUUF0lZIz; Thu, 23 Sep 2021 09:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEABB40706;
	Thu, 23 Sep 2021 09:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80AA01BF318
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EFC5606ED
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piuYMMMhRd2g for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 09:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86F80606FF
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 09:08:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u27so20811593edi.9
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JaKqw2+PDefEJDxPO6FyECucW9qAys7jEk46R2SAXDA=;
 b=ddwJFCAX+10ZI09B2zmuGUkL2KB8mS3sy88r7hM7chXZ4PV28t4B7B/BBoLPsH8jcf
 sfT80IhfvTTqvOc3yBQBhNBizP/TxTgI6z9UBPnGZlOCiUTW6RtE4d0RmA9zI82CxRfP
 lnTAwsnEf8hy38cZfXRbFhV89y0qYOY+AacFD5QDFGYjbGy2fVj9XAOhbgT6HRB7/u83
 QlD+gf6KvbtX9pN+Vgr+JsRwljc8MeqLoRjWg61ni6vxWzngAwbZLDEzVo7s1CDXwkmA
 ATpwEYnVGgIvSwk04BOuNOtEGqku29zpz03Ed+/WcVM2G6s2/0JAyx3yoPQj4cTLhaZS
 QS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaKqw2+PDefEJDxPO6FyECucW9qAys7jEk46R2SAXDA=;
 b=7Avdqd61F6szXEoJsELLXJyiCAQcW3t9L/nu8hqMV5/MyXCtLuZM3QjXOLLjDBwyJj
 whEfULA+dLJzbknjEyXG2xIzPBAoqYBgWJ0L4GKQ28TCNfjFQmMDX0NjLe8ls8KHLpkP
 uQHdb5+EjgGXZVirHYDctQQqxKqp3PD5r39K4iFg0RCgvYWNQHdpHOpAYPL+bOBPu3dT
 nCSfsVLzSk345M/H0WmaOAA3EtZtRVFwYmfQwEymlNSo5BmFoVGBISuwq4acTxkWuMnZ
 WQaLiqqL3jVO4sGpRPUy/7QVrta2y8c0CXjja42Vu09TRNefY/Iv+NIV3nyByenH+4jp
 jgtA==
X-Gm-Message-State: AOAM533InZOhp3LXxEDK4hXFa3mY8ZyP5Rm+tYq5KOOQj52NgXn1Oiyo
 smo9SMYDcqpS6joa1Z54StF3KvmfyjJVB7o/lVpHSQ==
X-Google-Smtp-Source: ABdhPJwsP3LYLFxxewGroY2xpL0A1EwcKZtD/XatiOzDsCYvYysvg01T7e4fi4aFVvDW9F93Y9K/5GTNvszjShJwPaU=
X-Received: by 2002:a05:6402:1a53:: with SMTP id
 bf19mr4222934edb.235.1632388118625; 
 Thu, 23 Sep 2021 02:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
 <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
 <163232062091.4283.13096713479109144471@kwain>
 <CAJPV9MpWep997PN1v+R0E6RKhe4EOwY=ogFECnyfG0ppz2ekww@mail.gmail.com>
 <163238398624.3979.10768324598204859494@kwain>
In-Reply-To: <163238398624.3979.10768324598204859494@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Thu, 23 Sep 2021 12:08:28 +0300
Message-ID: <CAJPV9MqnsNV5zjWMPDZJWCTBSpqZnsO53Gq23DtfKD3JOG0GRQ@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8223957216491967664=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============8223957216491967664==
Content-Type: multipart/alternative; boundary="000000000000f2562305cca5f9f5"

--000000000000f2562305cca5f9f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 10:59 AM Antoine Tenart <atenart@kernel.org> wrote:

> Quoting Jos=C3=A9 Pekkarinen (2021-09-23 08:26:02)
> >  On Wed, Sep 22, 2021 at 5:23 PM Antoine Tenart <[1]atenart@kernel.org>
> >  wrote:
> >
> >    However I'm surprised as my understanding was the summary was requir=
ed
> >    for the refpolicy configuration step to succeed (I did use a summary
> >    for all my tests because of this). When removing a summary from a
> module
> >    I always get the following error, and the Buildroot build stops.
> >
> >      doc/policy.xml:8376: element module: validity error : Element modu=
le
> >    content does not follow the DTD, expecting (summary , desc? ,
> required?
> >    , (interface | template)* , (bool | tunable)*), got ()
> >      Document doc/policy.xml does not validate against doc/policy.dtd
> >
> >    Do you have an idea what made your build to succeed even though you
> did
> >    not have a summary in your module?
> >
> >  I believe it is validating to the summary prior to the module,
> >  the one you put in metadata.xml, but not any internal summary for
> >  the interface. This is how policy.xml looks like in a case where I
> didn't
> >  apply the mitigation:
> >  <layer name=3D"buildroot">
> >  <summary>Buildroot extra modules</summary>
> >  <module name=3D"base" filename=3D"policy/modules/buildroot/base.if">
> >  </module>
> >  <module name=3D"secure" filename=3D"policy/modules/buildroot/secure.if=
">
> >  </module>
> >  </layer>
> >
> >  With this the modules.conf comes as:
> >
> >  # Layer: buildroot
> >  # Module: base
> >  #
> >  # Layer: buildroot
> >  # Module: secure
> >  #
> >
> >  There is a summary followed by a module, validation pass, but
> >
> >  the module is not built. If I add the following lines in the build
> folder
> >  modules[1]
> >  and run make.conf:
> >  [1] refpolicy-2.20200818/policy/modules/buildroot/secure.if: ##
> >  <summary>External secure module.</summary>
> >  refpolicy-2.20200818/policy/modules/buildroot/base.if: ##
> >  <summary>External base module.</summary>
> >
> >  The policy.xml looks like:
> >
> >  <layer name=3D"buildroot">
> >  <summary>Buildroot extra modules</summary>
> >  <module name=3D"base" filename=3D"policy/modules/buildroot/base.if">
> >  <summary>External base modules.</summary>
> >  </module>
> >  <module name=3D"secure" filename=3D"policy/modules/buildroot/secure.if=
">
> >  <summary>External secure os vm module.</summary>
> >  </module>
> >  </layer>
> >
> >  Then policy/modules.conf looks this way:
> >
> >  # Layer: buildroot
> >  # Module: base
> >  #
> >  # External base modules.
> >  #
> >  base =3D module
> >
> >  # Layer: buildroot
> >  # Module: secure
> >  #
> >  # External secure os vm module.
> >  #
> >  secure =3D module
> >
> >  And this produces the modules to get into the policy.32 file.
> >  Does it makes any sense on your end?
>
> The above does not reproduce for me. But I might know what's going on:
> do you have xmllint installed on your machine?
>
> If not, the validation step is skipped but the build is not stopped,
> which would explain the difference in behaviour we have between our
> tests:
>
>   Makefile:453:
>   $(verbose) if test -x $(XMLLINT) && test -f $(xmldtd); then \
>           $(XMLLINT) --noout --path $(dir $(xmldtd)) --dtdvalid $(xmldtd)
> $@ ;\
>           else \
>           echo "$@ XML validation not run. Please install the xmllint
> tool." ;\
>   fi
>
> I believe we should make refpolicy depend on host-libxml2 and force it
> to use the Buildroot version of xmllint by setting XMLLINT in the
> configuration step.
>
> Do the following fixes the issue[1] on your side?
>
>   diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/
> refpolicy.mk
>   index 1180f0d38bae..ecd8cf226b45 100644
>   --- a/package/refpolicy/refpolicy.mk
>   +++ b/package/refpolicy/refpolicy.mk
>   @@ -14,7 +14,8 @@ REFPOLICY_DEPENDENCIES =3D \
>           host-policycoreutils \
>           host-python3 \
>           host-setools \
>   -       host-gawk
>   +       host-gawk \
>   +       host-libxml2
>
>    ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
>    REFPOLICY_VERSION =3D $(call
> qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
>   @@ -30,6 +31,7 @@ endif
>    # Cannot use multiple threads to build the reference policy
>    REFPOLICY_MAKE =3D \
>           PYTHON=3D$(HOST_DIR)/usr/bin/python3 \
>   +       XMLLINT=3D$(LIBXML2_HOST_BINARY) \
>           TEST_TOOLCHAIN=3D$(HOST_DIR) \
>           $(TARGET_MAKE_ENV) \
>           $(MAKE1)
>
>
Confirmed, the patch *works*:


Creating policy.xml
echo '<?xml version=3D"1.0" encoding=3D"ISO-8859-1" standalone=3D"no"?>' >
doc/policy.xml
echo '<!DOCTYPE policy SYSTEM "policy.dtd">' >> doc/policy.xml
echo '<policy>' >> doc/policy.xml
for i in admin apps buildroot kernel roles services system; do echo "<layer
name=3D\"$i\">" >> doc/policy.xml; cat doc/tmp/$i.xml >> doc/policy.xml; ec=
ho
"</layer>" >> doc/policy.xml; done
cat doc/global_tunables.xml doc/global_booleans.xml >> doc/policy.xml
echo '</policy>' >> doc/policy.xml
if test -x /output/br_admin/output_x86_qemu/host/bin/xmllint && test -f
doc/policy.dtd; then \
       /output/br_admin/output_x86_qemu/host/bin/xmllint --noout --path
doc/ --dtdvalid doc/policy.dtd doc/policy.xml ;\
       else \
       echo "doc/policy.xml XML validation not run. Please install the
xmllint tool." ;\
fi
doc/policy.xml:8373: element module: validity error : Element module
content does not follow the DTD, expecting (summary , desc? , required? ,
(interface | template)* , (bool | tunable)*), got ()
doc/policy.xml:8375: element module: validity error : Element module
content does not follow the DTD, expecting (summary , desc? , required? ,
(interface | template)* , (bool | tunable)*), got ()

Thanks!


Jos=C3=A9.

--000000000000f2562305cca5f9f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 23, 2021 at 10:59 AM Anto=
ine Tenart &lt;<a href=3D"mailto:atenart@kernel.org">atenart@kernel.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quot=
ing Jos=C3=A9 Pekkarinen (2021-09-23 08:26:02)<br>
&gt;=C2=A0 On Wed, Sep 22, 2021 at 5:23 PM Antoine Tenart &lt;[1]<a href=3D=
"mailto:atenart@kernel.org" target=3D"_blank">atenart@kernel.org</a>&gt;<br=
>
&gt;=C2=A0 wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 However I&#39;m surprised as my understanding was the sum=
mary was required<br>
&gt;=C2=A0 =C2=A0 for the refpolicy configuration step to succeed (I did us=
e a summary<br>
&gt;=C2=A0 =C2=A0 for all my tests because of this). When removing a summar=
y from a module<br>
&gt;=C2=A0 =C2=A0 I always get the following error, and the Buildroot build=
 stops.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 doc/policy.xml:8376: element module: validity erro=
r : Element module<br>
&gt;=C2=A0 =C2=A0 content does not follow the DTD, expecting (summary , des=
c? , required?<br>
&gt;=C2=A0 =C2=A0 , (interface | template)* , (bool | tunable)*), got ()<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 Document doc/policy.xml does not validate against =
doc/policy.dtd<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Do you have an idea what made your build to succeed even =
though you did<br>
&gt;=C2=A0 =C2=A0 not have a summary in your module?<br>
&gt;<br>
&gt;=C2=A0 I believe it is validating to the summary prior to the module,<b=
r>
&gt;=C2=A0 the one you put in metadata.xml, but not any internal summary fo=
r<br>
&gt;=C2=A0 the interface. This is how policy.xml looks like in a case where=
 I didn&#39;t<br>
&gt;=C2=A0 apply the mitigation:<br>
&gt;=C2=A0 &lt;layer name=3D&quot;buildroot&quot;&gt;<br>
&gt;=C2=A0 &lt;summary&gt;Buildroot extra modules&lt;/summary&gt;<br>
&gt;=C2=A0 &lt;module name=3D&quot;base&quot; filename=3D&quot;policy/modul=
es/buildroot/base.if&quot;&gt;<br>
&gt;=C2=A0 &lt;/module&gt;<br>
&gt;=C2=A0 &lt;module name=3D&quot;secure&quot; filename=3D&quot;policy/mod=
ules/buildroot/secure.if&quot;&gt;<br>
&gt;=C2=A0 &lt;/module&gt;<br>
&gt;=C2=A0 &lt;/layer&gt;<br>
&gt;<br>
&gt;=C2=A0 With this the modules.conf comes as:<br>
&gt;<br>
&gt;=C2=A0 # Layer: buildroot<br>
&gt;=C2=A0 # Module: base<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Layer: buildroot<br>
&gt;=C2=A0 # Module: secure<br>
&gt;=C2=A0 #<br>
&gt;<br>
&gt;=C2=A0 There is a summary followed by a module, validation pass, but<br=
>
&gt;<br>
&gt;=C2=A0 the module is not built. If I add the following lines in the bui=
ld folder<br>
&gt;=C2=A0 modules[1]<br>
&gt;=C2=A0 and run make.conf:<br>
&gt;=C2=A0 [1]=C2=A0refpolicy-2.20200818/policy/modules/buildroot/secure.if=
: ##<br>
&gt;=C2=A0 &lt;summary&gt;External secure module.&lt;/summary&gt;<br>
&gt;=C2=A0 refpolicy-2.20200818/policy/modules/buildroot/base.if: ##<br>
&gt;=C2=A0 &lt;summary&gt;External base module.&lt;/summary&gt;<br>
&gt;<br>
&gt;=C2=A0 The policy.xml looks like:<br>
&gt;<br>
&gt;=C2=A0 &lt;layer name=3D&quot;buildroot&quot;&gt;<br>
&gt;=C2=A0 &lt;summary&gt;Buildroot extra modules&lt;/summary&gt;<br>
&gt;=C2=A0 &lt;module name=3D&quot;base&quot; filename=3D&quot;policy/modul=
es/buildroot/base.if&quot;&gt;<br>
&gt;=C2=A0 &lt;summary&gt;External base modules.&lt;/summary&gt;<br>
&gt;=C2=A0 &lt;/module&gt;<br>
&gt;=C2=A0 &lt;module name=3D&quot;secure&quot; filename=3D&quot;policy/mod=
ules/buildroot/secure.if&quot;&gt;<br>
&gt;=C2=A0 &lt;summary&gt;External secure os vm module.&lt;/summary&gt;<br>
&gt;=C2=A0 &lt;/module&gt;<br>
&gt;=C2=A0 &lt;/layer&gt;<br>
&gt;<br>
&gt;=C2=A0 Then policy/modules.conf looks this way:<br>
&gt;<br>
&gt;=C2=A0 # Layer: buildroot<br>
&gt;=C2=A0 # Module: base<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # External base modules.<br>
&gt;=C2=A0 # =C2=A0<br>
&gt;=C2=A0 base =3D module<br>
&gt;<br>
&gt;=C2=A0 # Layer: buildroot<br>
&gt;=C2=A0 # Module: secure<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # External secure os vm module.<br>
&gt;=C2=A0 # =C2=A0<br>
&gt;=C2=A0 secure =3D module<br>
&gt;<br>
&gt;=C2=A0 And this produces the modules to get into the policy.32 file.<br=
>
&gt;=C2=A0 Does it makes any sense on your end?<br>
<br>
The above does not reproduce for me. But I might know what&#39;s going on:<=
br>
do you have xmllint installed on your machine?<br>
<br>
If not, the validation step is skipped but the build is not stopped,<br>
which would explain the difference in behaviour we have between our<br>
tests:<br>
<br>
=C2=A0 Makefile:453:<br>
=C2=A0 $(verbose) if test -x $(XMLLINT) &amp;&amp; test -f $(xmldtd); then =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(XMLLINT) --noout --path $(dir $(xmldtd=
)) --dtdvalid $(xmldtd) $@ ;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$@ XML validation not run. Pl=
ease install the xmllint tool.&quot; ;\<br>
=C2=A0 fi<br>
<br>
I believe we should make refpolicy depend on host-libxml2 and force it<br>
to use the Buildroot version of xmllint by setting XMLLINT in the<br>
configuration step.<br>
<br>
Do the following fixes the issue[1] on your side?<br>
<br>
=C2=A0 diff --git a/package/refpolicy/<a href=3D"http://refpolicy.mk" rel=
=3D"noreferrer" target=3D"_blank">refpolicy.mk</a> b/package/refpolicy/<a h=
ref=3D"http://refpolicy.mk" rel=3D"noreferrer" target=3D"_blank">refpolicy.=
mk</a><br>
=C2=A0 index 1180f0d38bae..ecd8cf226b45 100644<br>
=C2=A0 --- a/package/refpolicy/<a href=3D"http://refpolicy.mk" rel=3D"noref=
errer" target=3D"_blank">refpolicy.mk</a><br>
=C2=A0 +++ b/package/refpolicy/<a href=3D"http://refpolicy.mk" rel=3D"noref=
errer" target=3D"_blank">refpolicy.mk</a><br>
=C2=A0 @@ -14,7 +14,8 @@ REFPOLICY_DEPENDENCIES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-policycoreutils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-setools \<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0host-gawk<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0host-gawk \<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0host-libxml2<br>
<br>
=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)<br>
=C2=A0 =C2=A0REFPOLICY_VERSION =3D $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CU=
STOM_REPO_VERSION))<br>
=C2=A0 @@ -30,6 +31,7 @@ endif<br>
=C2=A0 =C2=A0# Cannot use multiple threads to build the reference policy<br=
>
=C2=A0 =C2=A0REFPOLICY_MAKE =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHON=3D$(HOST_DIR)/usr/bin/python3 \<b=
r>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0XMLLINT=3D$(LIBXML2_HOST_BINARY) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST_TOOLCHAIN=3D$(HOST_DIR) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE1)<br><br></blockquote><div><br></=
div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><=
div class=3D"gmail_quote"><div>Confirmed, the patch *works*:</div></div></b=
lockquote><div><br></div>Creating policy.xml<br>echo &#39;&lt;?xml version=
=3D&quot;1.0&quot; encoding=3D&quot;ISO-8859-1&quot; standalone=3D&quot;no&=
quot;?&gt;&#39; &gt; doc/policy.xml<br>echo &#39;&lt;!DOCTYPE policy SYSTEM=
 &quot;policy.dtd&quot;&gt;&#39; &gt;&gt; doc/policy.xml<br>echo &#39;&lt;p=
olicy&gt;&#39; &gt;&gt; doc/policy.xml<br>for i in admin apps buildroot ker=
nel roles services system; do echo &quot;&lt;layer name=3D\&quot;$i\&quot;&=
gt;&quot; &gt;&gt; doc/policy.xml; cat doc/tmp/$i.xml &gt;&gt; doc/policy.x=
ml; echo &quot;&lt;/layer&gt;&quot; &gt;&gt; doc/policy.xml; done<br>cat do=
c/global_tunables.xml doc/global_booleans.xml &gt;&gt; doc/policy.xml<br>ec=
ho &#39;&lt;/policy&gt;&#39; &gt;&gt; doc/policy.xml<br>if test -x /output/=
br_admin/output_x86_qemu/host/bin/xmllint &amp;&amp; test -f doc/policy.dtd=
; then \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0/output/br_admin/output_x86_qemu/hos=
t/bin/xmllint --noout --path doc/ --dtdvalid doc/policy.dtd doc/policy.xml =
;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0else \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
&quot;doc/policy.xml XML validation not run. Please install the xmllint too=
l.&quot; ;\<br>fi<br>doc/policy.xml:8373: element module: validity error : =
Element module content does not follow the DTD, expecting (summary , desc? =
, required? , (interface | template)* , (bool | tunable)*), got ()<br>doc/p=
olicy.xml:8375: element module: validity error : Element module content doe=
s not follow the DTD, expecting (summary , desc? , required? , (interface |=
 template)* , (bool | tunable)*), got ()=C2=A0<br><br><blockquote style=3D"=
margin:0 0 0 40px;border:none;padding:0px">Thanks!</blockquote><div><br></d=
iv><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote =
style=3D"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</block=
quote></div></div></div>

--000000000000f2562305cca5f9f5--

--===============8223957216491967664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8223957216491967664==--
