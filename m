Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CBCD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF77241010;
	Fri,  5 Jun 2026 12:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkT-IPoL5SaP; Fri,  5 Jun 2026 12:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC1441014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663745;
	bh=rlC58YTbsM9c9YTtxG2RCaPyvE22He0wTDbyCLPyPH4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mAcP4ZUPejly3n6n6KWv0wF7IGDOJYvp7g1VegvYrVanf8ooUuHfl5BCP48+jCYCE
	 02MOo34O20MesADu/UkcxmpEFkTFx0pTQYSyOxxV3vlUMPtm/Gjq/LDxq/DiBbt1xv
	 GoJ1JsgIwINrD6Q5AhEj43pcxwoivSfmsBzNX54nFtzr4A5PN5hEdvM4U0Xq+FD69N
	 FGp5G/Ll0DT49VXzSv6KjcFkBGfE96jTPl21K4LI1KsLW7uwxiEn7ywisVz23kxrtq
	 Q88rkLGxEeAYiw9QzdC4UHIgUnFKlAZevwVvrLWnaNX1Sw1dOpZF+sQJEFSeuASR5R
	 vGr8vI03jdGPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC1441014;
	Fri,  5 Jun 2026 12:49:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D26388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C0B81FD2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJna30kR2rWj for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AD3381FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD3381FC2
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AD3381FC2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so1235859f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663741; x=1781268541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4w0tpcQwTPRverr9zZT3NYt+QmGhTq9gQWa/vorXcZI=;
 b=b8oxUrvxdET5UTbYv3W6+3r6UzpsoExv5xInTjWNSZglZvnP/bMG1fDbfndvB6Vg3S
 6nxcMtVPGKkZpzqnj7PLEFGZs02yRh5oHZXmVWOeQcBpZhHaGFA6AulSRBP+43JsfZLW
 120rPIbjfgUhZjXnWhMGmVSVUCCdZDG8k/4YRbRU7BDmnQbKlRUr2CSAdGa3hWHDHIBj
 ltRH+48pmK0tE6uOnzCF8LNLtGR4Ya0GHg5CJ6vPHtCc7VNbHOVmEBlc4g0cx15z8HP1
 gyKo2ftFsNWvUFBVefw7jktrigNYSOD7Ke3xB2CTRLivW78fjw1/9qVeVSf3jbzTNdOl
 1mZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9IAuWgPk8i+FsheiXQzZStXNCpzO8EeXLIVEsRb1p+tR+pWvk3nHB5WrQTt7uF9R1PwL16ke3VXO0=@buildroot.org
X-Gm-Message-State: AOJu0YwYiRQReCZbHckNXcl/9UkFOXUp+aRXU0OhOOZeIH72xejNfJJU
 zFRvhlX7bC2kw6SZym4teUBCbLECmfB4EbiS/WA0V8Iap47L75n37McqIjc+2tkhuOmsgDcl2d+
 Y50oQ
X-Gm-Gg: Acq92OHUTXEXwr85V6VnBIQQ2OWICZuVl/RK428KjM+DWqS6GTKQchr7YjtGWVMXrlQ
 qabrLOUv7w6PocvbWgTpUfsdowpw9Zk6xq2aYhF4GJOweb7CMlAF/uie7Lad6WnQLnivWpXDAhi
 EFMhHyIR8MhsTG9AYjOUeEiKYH+JdILMjzfzLpUSTsIE+XPbZ2S6hpecQ3WGimFN2u134rBsKj1
 PUZCbVHsmKZ/DQ5PwoukRprCl6kNdugHcsaP5Ku5UBlAGHKiycneu1dpqzT/sJW2QhAMXUbxh1Q
 XJuSQ56nKKmM7P7zI+lPJnb5o84oQ2XlZKy7JLH9WphnNtL6WjQlv6TuhAIzbsaKyxRpxbDcKF2
 MRxrDNs+zNsgAeaztRaZtidkGHulIvuvTHOpfE5519WUZTCibInzbGivzhU0ZYLPCvxyVsqXis0
 R6YiQwZQz3ETl3LAAokD5o+nEcQt7Gh5l1w+rj
X-Received: by 2002:a05:600c:1907:b0:490:b99c:9337 with SMTP id
 5b1f17b1804b1-490c25a0800mr54353865e9.10.1780663741321; 
 Fri, 05 Jun 2026 05:49:01 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f34413csm25073197f8f.21.2026.06.05.05.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:01 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:00 +0200
Message-ID: <20260605124900.270181-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ahj_eBXQ0dJThOrD@waldemar-brodkorb.de>
References: <ahj_eBXQ0dJThOrD@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663741; x=1781268541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4w0tpcQwTPRverr9zZT3NYt+QmGhTq9gQWa/vorXcZI=;
 b=S7Q1um6O731qmQXuE16aCRREhAv14GO0axpyz3hXPthqHL4GvwMFst9L9YcJCJPIzY
 n0r/K9b/gP8V+BDFv0+NAybrdREmY09vxfHdLH1E0Z0eNdEI7rqY/FTlPv+592AGPIiA
 xqiYvr5WpemdJx2pEkejq8FAUKq/jsqzRDZ3TjZWVUNHdJM4WQzW9X4e+/i3XJRHZkwp
 Wd6O8ag77IYqKTN8/cIQl2WMNr6Rv5IVciKIhXmy/KZBVheXyllPoQb4YuDg7BZsRn6T
 8B7UyAC1WNzFPl9K/18Jtg8UzTHBMM5j00CSdPESiyi50ZRLRx6FkaquHdX3cxUoPUw8
 F/qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S7Q1um6O
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to 22.9.0
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

In reply of:
> See here for a changelog:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22-current.html
> 
> Pjsip was updated to 2.16.
> 
> Fixes some security issues in pjsip:
> 
> Author: Mike Bradeen Date: 2026-03-23
> Address the following pjproject security vulnerabilities
> 
> GHSA-j29p-pvh2-pvqp - Buffer overflow in ICE with long username
> GHSA-8fj4-fv9f-hjpc - Heap use-after-free in PJSIP presense subscription termination header
> GHSA-g88q-c2hm-q7p7 - ICE session use-after-free race conditions
> GHSA-x5pq-qrp4-fmrj - Out-of-bounds read in SIP multipart parsing
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x. Thanks

> ---
> 
> I want to stay with the LTS version for asterisk.
> Bernd sent an update to latest version.
> 
> ---
>  package/asterisk/asterisk.hash | 4 ++--
>  package/asterisk/asterisk.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 3a8274b458..8d620a0ee3 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,8 +1,8 @@
>  # Locally computed
> -sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asterisk-22.8.2.tar.gz
> +sha256  dd664a9600874d0b0c0e63a8fda2e08efc9f5fdc95781022fbf39ed9b15196f6  asterisk-22.9.0.tar.gz
>  
>  # Locally computed
> -sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
> +sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
>  sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
>  
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index e2fdb189fa..b15a83f6f8 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 22.8.2
> +ASTERISK_VERSION = 22.9.0
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> @@ -12,13 +12,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
>  # compilation with the external pjsip produces a non-working asterisk, which
>  # segfaults. The reason behind this is unclear.
>  # https://github.com/asterisk/asterisk/issues/671
> -ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
> +ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.16/
>  ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
>  ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
>  ASTERISK_EXTRA_DOWNLOADS = \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
>  	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
> -	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2 \
> +	$(ASTERISK_PJSIP_URL)/pjproject-2.16.tar.bz2 \
>  	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
>  
>  ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
