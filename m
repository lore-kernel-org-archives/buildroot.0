Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4052BEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBDF681EE3;
	Sun, 25 Jun 2023 19:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBDF681EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxNISuiC_lyY; Sun, 25 Jun 2023 19:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A6781CA0;
	Sun, 25 Jun 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A6781CA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEDA31BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9828940159
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9828940159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4542G77sSdH for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43932400C8
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43932400C8
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:44:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-988a076a7d3so394256466b.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687722282; x=1690314282;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i3KBMXQe/tAWtBHRnrsAex2fXabSslOtWkZLXSQguvA=;
 b=G7Yp6EoWsnYprndp9rU/A2mbVtfmqFptl9qnzECxiy6Rf713zI7btRwd14tG61jgeH
 URfRAYgFMXz0rIP3KwImD+n9+BkYxAsNvye9vUfJeEMLDedB3SH39TFGuZd1e/IKO7+H
 Z2ovZsRaQ0YHY2GAfLx2O2v+CgHYlyCrXnfrZokiGy3RFCRpDIv7zeT6pkWl8e/tTSGs
 FVJOGEm6o5egzc2y20M1Ic23uWINOY2Spvi3cd7KLm+TgpENb19BvJn6QyMw7c99hnuB
 BKq1lm+QThWvE+VFOp0rNAf46btinKY2YUMOA6plo77bS0uxTT27xoq6+zNMlgqONLLr
 2AFg==
X-Gm-Message-State: AC+VfDxg85VvoHHdizBib2cYd8uYCuHj/8ylDGSuKLP+cxjEKFO42NMf
 KqvAe7Gw8Tlf+XeRD7Ee8ASh0OyFzrWxwWqSVKc=
X-Google-Smtp-Source: ACHHUZ61VTz/LapRgxFnF8kQJrvTXZXH4AF+wApFcEmK1eqLuGS2+fJOReOhM/sGWbEP49HgDcVQiA==
X-Received: by 2002:a17:907:b15:b0:98d:596d:b224 with SMTP id
 h21-20020a1709070b1500b0098d596db224mr7938050ejl.70.1687722282270; 
 Sun, 25 Jun 2023 12:44:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a170906231a00b0098dd751b965sm2334046eja.182.2023.06.25.12.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:44:41 -0700 (PDT)
Message-ID: <f7f12da7-0f17-63b5-0ebe-182baadecb6e@mind.be>
Date: Sun, 25 Jun 2023 21:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230622051703.2543-1-bernd@kuhls.net>
In-Reply-To: <20230622051703.2543-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687722282; x=1690314282;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i3KBMXQe/tAWtBHRnrsAex2fXabSslOtWkZLXSQguvA=;
 b=YH56gcl77jTuvw2qvDk+aP9Q05S5IKmMIWnvTZQGU6c1U4zo+zHJTZnsVbpd+64v5C
 3wD+jrcb11w5LmDeVemZyJhjXLF5zJPV6bB1ZZmplVp6kw2qzvVCpfaUQEfZ8jU/LtU9
 kBLudvJ8r4JeCfbn90yiDjUQrdx7GDp+SQ2LuC0RNM/ZiTrS5y1Qqi/oxef2UncvqtRG
 kcIuGMHeQ1Rm11G9cTRk5/OwYIAPOfOMJ3zL42NXcPK8nQrT5Cx1kDEir7kIth5thb6c
 P073dPHcIoqpxM16iA7rY0Q/f355emrz/VzF0dARKftsuhpcWznj3iK81R3CY6xX0w3+
 6lLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YH56gcl7
Subject: Re: [Buildroot] [PATCH v2 1/2] package/raptor: security bump
 version to 2.0.16
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2023 07:17, Bernd Kuhls wrote:
> This version included the patches removed by this commit, no new CVEs
> were fixed.
> 
> Release notes: https://librdf.org/raptor/RELEASE.html#rel2_0_16
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: Removed patches from .checkpackageignore
> 
>   .checkpackageignore                           |  2 -
>   ...pace-declarations-correctly-for-XML-.patch | 47 -------------------
>   ...are-namespace-declarations-correctly.patch | 33 -------------
>   package/raptor/raptor.hash                    |  4 +-
>   package/raptor/raptor.mk                      |  8 +---
>   5 files changed, 3 insertions(+), 91 deletions(-)
>   delete mode 100644 package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
>   delete mode 100644 package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 36ab2845d7..07408893ce 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1341,8 +1341,6 @@ package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch Upstrea
>   package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch Upstream
>   package/ranger/0001-colorscheme-check-for-compiled-python-files.patch Upstream
>   package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch Upstream
> -package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch Upstream
> -package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch Upstream
>   package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch Upstream
>   package/rdesktop/0001-8bit-colors.patch Sob Upstream
>   package/read-edid/0001-Fix-install-file-list.patch Upstream
> diff --git a/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch b/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
> deleted file mode 100644
> index 406e265cf3..0000000000
> --- a/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 590681e546cd9aa18d57dc2ea1858cb734a3863f Mon Sep 17 00:00:00 2001
> -From: Dave Beckett <dave@dajobe.org>
> -Date: Sun, 16 Apr 2017 23:15:12 +0100
> -Subject: [PATCH] Calcualte max nspace declarations correctly for XML writer
> -
> -(raptor_xml_writer_start_element_common): Calculate max including for
> -each attribute a potential name and value.
> -
> -Fixes Issues #0000617 http://bugs.librdf.org/mantis/view.php?id=617
> -and #0000618 http://bugs.librdf.org/mantis/view.php?id=618
> -
> -[Peter: fixes CVE-2017-18926, upstream:
> - https://github.com/dajobe/raptor/commit/590681e546cd9aa18d57dc2ea1858cb734a3863f]
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - src/raptor_xml_writer.c | 7 ++++---
> - 1 file changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
> -index 693b9468..0d3a36a5 100644
> ---- a/src/raptor_xml_writer.c
> -+++ b/src/raptor_xml_writer.c
> -@@ -181,9 +181,10 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
> -   size_t nspace_declarations_count = 0;
> -   unsigned int i;
> -
> --  /* max is 1 per element and 1 for each attribute + size of declared */
> -   if(nstack) {
> --    int nspace_max_count = element->attribute_count+1;
> -+    int nspace_max_count = element->attribute_count * 2; /* attr and value */
> -+    if(element->name->nspace)
> -+      nspace_max_count++;
> -     if(element->declared_nspaces)
> -       nspace_max_count += raptor_sequence_size(element->declared_nspaces);
> -     if(element->xml_language)
> -@@ -237,7 +238,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
> -         }
> -       }
> -
> --      /* Add the attribute + value */
> -+      /* Add the attribute's value */
> -       nspace_declarations[nspace_declarations_count].declaration=
> -         raptor_qname_format_as_xml(element->attributes[i],
> -                                    &nspace_declarations[nspace_declarations_count].length);
> ---
> -2.20.1
> -
> diff --git a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
> deleted file mode 100644
> index a48a583cb1..0000000000
> --- a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 4f5dbbffcc1c6cf0398bd03450453289a0979dea Mon Sep 17 00:00:00 2001
> -From: Dave Beckett <dave@dajobe.org>
> -Date: Sat, 18 Sep 2021 17:40:00 -0700
> -Subject: [PATCH] XML Writer : compare namespace declarations correctly
> -
> -Apply patch from
> -0001-CVE-2020-25713-raptor2-malformed-input-file-can-lead.patch.1
> -that fixes Issue#0000650 https://bugs.librdf.org/mantis/view.php?id=650
> -which overwrote heap during XML writing in parse type literal
> -content.  This was detected with clang asan.
> -
> -Thanks to Michael Stahl / mst2 for the fix.
> -
> -[Retrieved from:
> -https://github.com/dajobe/raptor/commit/4f5dbbffcc1c6cf0398bd03450453289a0979dea]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/raptor_xml_writer.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
> -index 56993dc3..4426d38c 100644
> ---- a/src/raptor_xml_writer.c
> -+++ b/src/raptor_xml_writer.c
> -@@ -227,7 +227,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
> -
> -           /* check it wasn't an earlier declaration too */
> -           for(j = 0; j < nspace_declarations_count; j++)
> --            if(nspace_declarations[j].nspace == element->attributes[j]->nspace) {
> -+            if(nspace_declarations[j].nspace == element->attributes[i]->nspace) {
> -               declare_me = 0;
> -               break;
> -             }
> diff --git a/package/raptor/raptor.hash b/package/raptor/raptor.hash
> index 2a54bf270d..05e9c53902 100644
> --- a/package/raptor/raptor.hash
> +++ b/package/raptor/raptor.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed  raptor2-2.0.15.tar.gz
> -sha256  6b926a47abfb87451c436fbd4a868defec963d0232c70b806ac02d4a2a6e1968  LICENSE.txt
> +sha256  089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680  raptor2-2.0.16.tar.gz
> +sha256  0f0c719a05c9f7a0be2051ab83c1470837f595ed23e34989f46fd8eb45cfc251  LICENSE.txt
> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> index 69ac121300..ec7643ce3d 100644
> --- a/package/raptor/raptor.mk
> +++ b/package/raptor/raptor.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RAPTOR_VERSION = 2.0.15
> +RAPTOR_VERSION = 2.0.16
>   RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
>   RAPTOR_SITE = http://download.librdf.org/source
>   RAPTOR_DEPENDENCIES = libxml2 libxslt
> @@ -17,12 +17,6 @@ RAPTOR_INSTALL_STAGING = YES
>   # Flag is added to make sure the patch is applied for the configure.ac of raptor.
>   RAPTOR_AUTORECONF = YES
>   
> -# 0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
> -RAPTOR_IGNORE_CVES += CVE-2017-18926
> -
> -# 0003-XML-Writer-compare-namespace-declarations-correctly.patch
> -RAPTOR_IGNORE_CVES += CVE-2020-25713
> -
>   RAPTOR_CONF_OPTS =\
>   	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
>   	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
