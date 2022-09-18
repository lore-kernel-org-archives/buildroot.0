Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA5ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E47CD4149D;
	Sun, 18 Sep 2022 16:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E47CD4149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QufYaHBmPQXu; Sun, 18 Sep 2022 16:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9272409E3;
	Sun, 18 Sep 2022 16:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9272409E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC8F31BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C800060A83
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C800060A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2K3_-cjPF9q for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:38:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04CB7606EC
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04CB7606EC
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:38:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z2so2026663edi.1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TjYxfQdD9G3Hf4mwyhoH7Kb/os5RvFyLECxP+mabAMs=;
 b=M/+8viCkcFMlNr1qr7HENDHnQvLAl0/reH23Db1WbSpn1fe8/nnMVTgaitT/1KR6tQ
 asUJ9kOhxm+sFjofCVttuf9nc7Sw1iD82citARKonJl9oiEmoVeNZUEjelY5pFRr7Psb
 SC+qpwjQGPAjhB1yMF8pDflydzmRJngDMuBHAeExkThW5vB6nxRVRr6nYw6e95aQx+EM
 2/RSB3ZSetaCf/y3UV0T+oy8IcAozFXs/AAfPlKqDL1God6f50FRR+mgLhgmiOI2R1z0
 ODzX7wlLdBJtBbg+dsSbHObRXIYQhEwPKiW966QuF70UTovbI066jniVBTnRLsa1+7z3
 LxYQ==
X-Gm-Message-State: ACrzQf3CfbvWfXHgugmtNodV6ahqv3gJycdv5ca+cRrsx00YwHyMKVqo
 j1Nk+VcytJ70UOBsV3D9pAJZjA==
X-Google-Smtp-Source: AMsMyM7bO4TB5Gz/GT+6R9PZQeXT3XtZYPr97wtnRthfLJltTGbJ9Vtw3PRkJeJ5PN4M956t4bwr3g==
X-Received: by 2002:a05:6402:1a4d:b0:44e:221d:d1dd with SMTP id
 bf13-20020a0564021a4d00b0044e221dd1ddmr12280627edb.267.1663519111056; 
 Sun, 18 Sep 2022 09:38:31 -0700 (PDT)
Received: from [192.168.43.18] ([109.139.7.201])
 by smtp.gmail.com with ESMTPSA id
 nb36-20020a1709071ca400b007813968e154sm1298550ejc.86.2022.09.18.09.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 09:38:30 -0700 (PDT)
Message-ID: <3bd07c48-cf89-c59f-3e32-f5e79836be58@mind.be>
Date: Sun, 18 Sep 2022 18:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220215124619.563502-1-nolange79@gmail.com>
 <20220215124619.563502-2-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220215124619.563502-2-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=TjYxfQdD9G3Hf4mwyhoH7Kb/os5RvFyLECxP+mabAMs=;
 b=UlDF56WGQZLOsMA96qSROb+TBd55G56OOwQDw6DbJmnR/zA43cXFIrhDLAFEv30/h3
 toMtyYBuanIIAGShPBnw/xAMXbNjE7cCXLG0JXqdFrHL667eufhsaBK9n5G1cVMC2vIF
 eu0012Ro/9Nc/zrAT3Ce1a62X6TGNvqFnTS72fsf3CitFRKsK/dlnWG20zaC/gTGjrQI
 HtOTk/TnpFSda9JP93Qm7LaFT4BGuYrgXUg6wY8VLesLVlnQxGErDMZATohUn+bTyAzu
 xa9rNcfr0MhFOn/NjZN/7F5l9KaN6kUYrkLp7MbxW0p5j/2CoJKat/z9sBj2t4uJSvps
 Z43g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UlDF56WG
Subject: Re: [Buildroot] [PATCH 2/2] toolchain: prevent infinite loop in
 copy_toolchain_lib_root
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2022 13:46, Norbert Lange wrote:
> This can happen when there are broken symlinks.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   toolchain/helpers.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index aaf2aecd80..7623d68123 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -20,6 +20,7 @@ copy_toolchain_lib_root = \
>   			if test -h $${LIBPATH} ; then \
>   				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
>   				LIBPATH="`readlink -f $${LIBPATH}`"; \
> +				[ -n "$${LIBPATH}" ] || break; \

  I again don't understand how this can happen. LIBPATH exists and is a symlink 
(tested a few lines above), so readlink will always return the contents of that 
symlink. I don't think that can ever be empty, but with the -f (full path) 
option it can definitely not be empty: readlink doesn't care about broken 
symlinks, and even if it has too many .. components it will just print something 
based on /.

  Can you give an example of such a broken symlink where this can happen?

  Regards,
  Arnout


>   			elif test -f $${LIBPATH}; then \
>   				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
>   				break ; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
