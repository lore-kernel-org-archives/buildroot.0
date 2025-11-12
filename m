Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7789CD484C
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 21:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9856F40BA6;
	Wed, 12 Nov 2025 21:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26EkKMaZ-3wX; Wed, 12 Nov 2025 21:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCD3F40BAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD3F40BAB;
	Wed, 12 Nov 2025 21:48:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EB63158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3411E8232C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1Rk_ergk8gR for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 21:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EE3E82E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE3E82E22
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EE3E82E22
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:48:54 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so16334166b.0
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 13:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762984133; x=1763588933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HykWrjCCkJm3FzxEhLbk9Ot0XzX15dWQoyfI1jBuagU=;
 b=XyYfR5O74//IoLUGWFosg9S0HtFg9/dhxN4aOCp2MtlvpMiSS4tQhbeIS7SJeVN4BK
 xizBj7Yls970KBSWEj95XXv+StNxeafsXDoEeOCs/iT0UTxOaNypPgGoEghz+v8JHl/q
 SZbiyqcF70cOkvzQQm6iIeWE4hK9iZqYL4T2jlb9693QQRq/ZlJWBpYjFADGtkEhsB1N
 K5+zwsv4EdSwfFqR9gi04Hi2CV/3Qm4iy2Xf+uo+Ce3BVD2AasWDhpUErAsoETOUmIsG
 twtwq1+YHjpWWspBC5C3T2X4NrRBANw1U1PZFjEd9Z/e9UazLohe9yw4XSLdBppBu+gX
 guFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZHHXQlNfG0/RyhjXazFiW45+niIiIJuY1A0GSwIyrZf3mNwpLdBzrYgqcC0F7AAQ4kyNTms9viS4=@buildroot.org
X-Gm-Message-State: AOJu0YwFGuo6Hmz17IG/V4x/aNw53ymmgNVqxGACkAoeAcizLJKPwWsr
 gvSJE/TdsREnG8JPV5uA8FeFjPX5D7pzxeieryTxzDh5i8lUK1XKpPSmNqPODPTefJeQifd0xSQ
 9rbMmniI=
X-Gm-Gg: ASbGncv+j8gCTIVsDPUbAaS6z8WlpGyCZ4H8MGgyUlCr2uLpq0Ddx1Rlq9wgYTHq92N
 ucwdivwD83m7MqwIzvQRcSi8k7nNftLl1uCahuDsZhu0R61j8VAJSt//97fTNMaYnoOy/LmbQHk
 0EUXdYMgIvqIyu5Imbjp1yVVvGBKdok9mwlqF7asT+nlIksKflAnSnE4oSIA31q3gBdnn5MbPWb
 Gs1IPmgJjP272Vfz0Fb6zt0ypwpGI1yHVTkQmgC2zFkmYKUgKEweq4CiudkGKCXPTE6gYat2ZcT
 HCCUxdy15VJ1/DWQX20EcHrspXBxKUCMcX6qOmnLglp+AV1F5zMDwtI8mFD/d0II96YUEO7pKsU
 8yb7wXnIXNgSL3KdjVWx4bef3htrdUWATWp5QlJK2PYH8AAEcDq8UOJvcfXeH2DaImQCp10G4w7
 12nhamOP0LSNO5OWvoTmqrdUZfxlkUYtVN/Kr3
X-Google-Smtp-Source: AGHT+IGUKt/AfLqxYz3QBTCeJiQzuuiPsBqj+DyuYIZXIsv3bdRkJ/D0ma7r23YN4dIKGXFZ1u19tA==
X-Received: by 2002:a17:907:7f17:b0:b70:b3e8:a353 with SMTP id
 a640c23a62f3a-b7331ac5960mr451969166b.50.1762984132363; 
 Wed, 12 Nov 2025 13:48:52 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fedb91bsm6801066b.70.2025.11.12.13.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 13:48:52 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Date: Wed, 12 Nov 2025 22:48:51 +0100
Message-ID: <20251112214851.166122-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87ecq3q6hp.fsf@dell.be.48ers.dk>
References: <87ecq3q6hp.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762984133; x=1763588933; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HykWrjCCkJm3FzxEhLbk9Ot0XzX15dWQoyfI1jBuagU=;
 b=FhUXR6dC5Sa1vupgYcXvzrTGe6uDvOrMlGwAEMT1vMYMZvV5p62ZIOBCcHTsJ1m3dv
 uFRLm56OjwuLCJLVdPLTvjaOzm4jW7zW2m4e9QKPiu4OF/56dwGEAqN661/D2ukukXVI
 jZ2xukEsWQHN12VaAMt9Fa2TwG1ddzA7xntLlp0Iw4LcCS3EMPGmPgp+yemzACrW75CS
 tpw4OQ3A6cN6G9gp4na3f7Zl5vZfS2O4JIxnkL0iUR7QTKQnQ8d4NvJYEeVuVNkTY3uk
 rgCOlIsJLA75n8++V8/zLN1tggJL6N0F2t1Xhv2oJ6DHhsOxw7MeLxSltanvbc5P7iCJ
 Pe+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FhUXR6dC
Subject: Re: [Buildroot] [PATCH] package/tpm2-tss: security bump to v3.2.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

In reply of:
> >>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:
> 
>  > For more information about the release, see:
>  >  - https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.3
> 
>  > Fixes the following vulnerability:
> 
>  > - CVE-2024-29040
> 
>  > The JSON Quote Info returned by Fapi_Quote has to be deserialized by
>  > Fapi_VerifyQuote to the TPM Structure `TPMS_ATTEST`. For the field
>  > `TPM2_GENERATED magic` of this structure any number can be used in the
>  > JSON structure. The verifier can receive a state which does not
>  > represent the actual, possibly malicious state of the device under test.
>  > The malicious device might get access to data it shouldn't, or can use
>  > services it shouldn't be able to.
> 
>  > For more information, see:
>  >   - https://nvd.nist.gov/vuln/detail/cve-2024-29040
>  >   - https://github.com/tpm2-software/tpm2-tss/security/advisories/GHSA-837m-jw3m-h9p6
> 
>  > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>  > ---
>  >  package/tpm2-tss/tpm2-tss.hash | 2 +-
>  >  package/tpm2-tss/tpm2-tss.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
>  > index c9fa4e6ae0..d8730ba0e1 100644
>  > --- a/package/tpm2-tss/tpm2-tss.hash
>  > +++ b/package/tpm2-tss/tpm2-tss.hash
>  > @@ -1,3 +1,3 @@
>  >  # Locally computed:
>  > -sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
>  > +sha256  6279a9a1983ea6ffe41925067b7f0de3a6ed95020a30e7c97d80fa2754259534  tpm2-tss-3.2.3.tar.gz
>  >  sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
>  > diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
>  > index 81a1a0e59b..095b57baea 100644
>  > --- a/package/tpm2-tss/tpm2-tss.mk
>  > +++ b/package/tpm2-tss/tpm2-tss.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>  
>  > -TPM2_TSS_VERSION = 3.2.2
>  > +TPM2_TSS_VERSION = 3.2.3
> 
> I guess your tree is not uptodate, master is using 4.1.3 since:
> 
> commit 04533b70e6dd908dcaaa275b47de55fed0b9908d
> Author: Abelino Romo <abelino.romo@gmail.com>
> Date:   Wed Nov 5 12:32:08 2025 +0100
> 
>     package/tpm2-tss: security bump version to 4.1.3
> 

This was meant for 2025.02.x and noticed the mistake as I sent the patch. I
immediately sent a second patch with the correct header. Patchwork entry is
marked as superseeded.

> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
