Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84879C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37ADC417B1;
	Mon,  5 Feb 2024 10:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37ADC417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtFDVBc4gwPx; Mon,  5 Feb 2024 10:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 413DF4159D;
	Mon,  5 Feb 2024 10:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 413DF4159D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C34E1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E7208254D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E7208254D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6Cl2KqlU1xC for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:16:55 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E25EF82566
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25EF82566
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b35323341so937617f8f.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128212; x=1707733012;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OLyZACNv7UZUQ1gf2KyAKRIFWXixMLVxNe0sWOw0RsI=;
 b=C0OYQsNOv/z5lYICfDFKblc3rSEahA96qNAKfrK2T919VgUbju8rKFnWpa40zDUtee
 STBHgAsNGRqpA5HAlLwTZPPEArEHALehGTRguDAkfqVgCbMHqZ3EvR9cU4G6ZtOtqre1
 wnMyETsAIt1wR2hDwvTOw0VFhaj2O9d6s5Bd273uviTfc0ogoxxTtc1/SsrLz4VsS9Pb
 ftYIgAms/nl53X1Q/g9gFCm4xCTlK8BxvY0nEB9AyWevq8aft2/OVRvKV7UltOKL1d+s
 rn71eN/P6F2xdK9E38cfjLmU8KXqAz4zxMPY8J0h53hU515Qbzp3cH6To14GhiGHTVtK
 TjWw==
X-Gm-Message-State: AOJu0YxQanoutPOzIEqucCa0w0POJuxGmQBZfCvn0SXbrLzyLkRSkXqW
 Zwx2dYUsbrU2Oh/LLejuRALeF2FM6PImLm7vTy/Rnq/OLHYLowoKJcCJjjA1YjVEcVloQ0K5yWz
 h
X-Google-Smtp-Source: AGHT+IFgaiDc5E0jk71yr4evk+7t/hJPIQvnJPpyjTxVIHn+3USy23pr7jbHGYI5npdvaRSJ1P3W7Q==
X-Received: by 2002:a5d:4d81:0:b0:33a:e73b:b0d0 with SMTP id
 b1-20020a5d4d81000000b0033ae73bb0d0mr6107390wru.32.1707128211982; 
 Mon, 05 Feb 2024 02:16:51 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr.
 [90.12.67.126]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d400a000000b0033b17880eacsm7665427wrp.56.2024.02.05.02.16.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:16:51 -0800 (PST)
Message-ID: <aa84e2dc-fcbd-471b-b4e4-cdec493b2881@smile.fr>
Date: Mon, 5 Feb 2024 11:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707128212; x=1707733012;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLyZACNv7UZUQ1gf2KyAKRIFWXixMLVxNe0sWOw0RsI=;
 b=vZX2BMfooBoTCOPIlDtIcrAXbd1xJSalvXHDaEKZp0NxnY7AxrV17L8ErYzBTbHXDx
 D2xV/ScXbOwUNh6iL0EqGcwPnggYN2tPojAxzYEE6C2uKICf7TI6+Htuwh3lyg+395v/
 ImsqahvFNp2B3TCPD1HuKc2hTrHDrVqZroATG74+USk/KAc5+5z/3b/lLZOusc58nNPV
 oR9lxg40obxKlaYpy1uixUfW2bIsZmUFyfWqAkJryDCt7Qo07ZOtFn6oCgFhgFzzCLLZ
 +NL0hMROrtENjGiM0EjqDxN61gMIQEvJfUdn12qmspiMvXQ/Meal0e67or7CW/ThCbah
 9orA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vZX2BMfo
Subject: Re: [Buildroot] [PATCH v2] package/environment-setup: add variable
 KERNEL_DIR alongside KERNELDIR
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
Content-Type: multipart/mixed; boundary="===============5008839201960635925=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5008839201960635925==
Content-Type: multipart/alternative;
 boundary="------------25WAgw3l0K84igoToMIDryZV"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------25WAgw3l0K84igoToMIDryZV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 31/01/2024 19:18, Nayab Sayed via buildroot wrote:
> Update host environment setup helper script to incorporate the variable
> KENREL_DIR alongside the existing KERNELDIR. This adjustment ensures
> consistency, as some projects utilize KERNELDIR while others use KERNEL_DIR.
>
> Signed-off-by: Nayab Sayed<nayabbasha.sayed@microchip.com>
> ---
> Changes in v2:
> - Keep both KERNEL_DIR and KERNELDIR.
> - Update commit message
> - Link to v1:https://lore.kernel.org/r/20240124-kernel_dir-v1-1-4125408cf65d@microchip.com
> ---
>   package/environment-setup/environment-setup    | 3 ++-
>   package/environment-setup/environment-setup.mk | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
> index 84a9843c24..0bae813e1a 100644
> --- a/package/environment-setup/environment-setup
> +++ b/package/environment-setup/environment-setup
> @@ -10,7 +10,8 @@ cat <<'EOF'
>   Some tips:
>   * PATH now contains the SDK utilities
>   * Standard autotools variables (CC, LD, CFLAGS) are exported
> -* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are exported
> +* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR or KERNEL_DIR)
> +  are exported
>   * To configure do "./configure $CONFIGURE_FLAGS" or use
>     the "configure" alias
>   * To build CMake-based projects, use the "cmake" alias
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> index 29ec5a9a95..4a71f18f3a 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -35,6 +35,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
>   
>   	$(if $(BR2_LINUX_KERNEL),\
>   		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
> +			>> $(ENVIRONMENT_SETUP_FILE)
> +		printf "export \"KERNEL_DIR=$(LINUX_BUILDDIR)\"\n" \
>   			>> $(ENVIRONMENT_SETUP_FILE),)
>   endef
>   
>
> ---
> base-commit: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
> change-id: 20240124-kernel_dir-41a48fd97b75
>
> Best regards,

Looks good to me.


Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr> 
<mailto:antoine.coutant@smile.fr>


Regards,

Antoine Coutant.

--------------25WAgw3l0K84igoToMIDryZV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31/01/2024 19:18, Nayab Sayed via
      buildroot wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240131-kernel_dir-v2-1-555eeeee1722@microchip.com">
      <pre class="moz-quote-pre" wrap="">Update host environment setup helper script to incorporate the variable
KENREL_DIR alongside the existing KERNELDIR. This adjustment ensures
consistency, as some projects utilize KERNELDIR while others use KERNEL_DIR.

Signed-off-by: Nayab Sayed <a class="moz-txt-link-rfc2396E" href="mailto:nayabbasha.sayed@microchip.com">&lt;nayabbasha.sayed@microchip.com&gt;</a>
---
Changes in v2:
- Keep both KERNEL_DIR and KERNELDIR.
- Update commit message
- Link to v1: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/20240124-kernel_dir-v1-1-4125408cf65d@microchip.com">https://lore.kernel.org/r/20240124-kernel_dir-v1-1-4125408cf65d@microchip.com</a>
---
 package/environment-setup/environment-setup    | 3 ++-
 package/environment-setup/environment-setup.mk | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index 84a9843c24..0bae813e1a 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -10,7 +10,8 @@ cat &lt;&lt;'EOF'
 Some tips:
 * PATH now contains the SDK utilities
 * Standard autotools variables (CC, LD, CFLAGS) are exported
-* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR) are exported
+* Kernel compilation variables (ARCH, CROSS_COMPILE, KERNELDIR or KERNEL_DIR)
+  are exported
 * To configure do "./configure $CONFIGURE_FLAGS" or use
   the "configure" alias
 * To build CMake-based projects, use the "cmake" alias
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 29ec5a9a95..4a71f18f3a 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -35,6 +35,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 
 	$(if $(BR2_LINUX_KERNEL),\
 		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
+			&gt;&gt; $(ENVIRONMENT_SETUP_FILE)
+		printf "export \"KERNEL_DIR=$(LINUX_BUILDDIR)\"\n" \
 			&gt;&gt; $(ENVIRONMENT_SETUP_FILE),)
 endef
 

---
base-commit: 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2
change-id: 20240124-kernel_dir-41a48fd97b75

Best regards,
</pre>
    </blockquote>
    <p>Looks good to me.</p>
    <p><span><span><br>
        </span></span></p>
    <p><span><span>Reviewed</span></span>-<span><span>by</span></span>:
      <span>Antoine</span> <span>Coutant</span> <a
        href="mailto:antoine.coutant@smile.fr" target="_blank">&lt;<span>antoine</span>.<span>coutant</span>@smile.fr&gt;</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p><span>Antoine</span> <span>Coutant</span>.</p>
    <p></p>
  </body>
</html>

--------------25WAgw3l0K84igoToMIDryZV--

--===============5008839201960635925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5008839201960635925==--
