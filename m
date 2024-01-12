Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA53C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C85860B49;
	Fri, 12 Jan 2024 19:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C85860B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s27rEy5cYZSK; Fri, 12 Jan 2024 19:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23B060AC3;
	Fri, 12 Jan 2024 19:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A23B060AC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0B81BF489
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D473442E84
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D473442E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVPZ8siFvv4P for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 19:39:11 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96F4542D67
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 19:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F4542D67
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e613b6afbso20551235e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 11:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705088348; x=1705693148;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I2UUnIHYZ8x7Jw3kgd4hP/yM+bz++Gdyylf1fsp8unw=;
 b=q0GJJtv/HJ/LzNqoz8AQONTqaGNCdbcs0IdU5RQVA08gBN9qMoh5jmJKR2zUOhiXrQ
 zPdGmDDa63JEKqV25rAGCSdOb7CQwLNG2eWilJW2r1ieqC48UsnWc8et76CVablGW9lh
 /cDqljnONnSvrjMqDjsu0ZOZl7v8XmxoTBwEqUAgwRNy1V4e9k1CJNpLp2v2/FOxK5Ea
 Q/yP2RzIkIZ2Zj3lFp3t5j1JG+hL7VVjFMOBVe4vB8SAmQDdFOoJwzB9PHzcMPABkAqP
 UuAO7PrS4CgDNajz3fQ+LwdbDT++gEZ2rMSgB9jxSJ3MKpRh0uPFqQTFRqLAwTPFM3QG
 3Cag==
X-Gm-Message-State: AOJu0Yw/AROwQRGvllmgNvvHkp6DJHNINuS2/slS10DG4ta7NGeLashA
 RivzXUHCWUYzob93WdmR3/tQC20B6KFflw==
X-Google-Smtp-Source: AGHT+IG00gDuT4m3WG74b0VZUXAXsqdMqg/3jsjPeWh7YjFuP6DeQKnEwMPduUELMvrnC47ws3/RTQ==
X-Received: by 2002:a05:600c:4893:b0:40e:448a:91ff with SMTP id
 j19-20020a05600c489300b0040e448a91ffmr1026372wmp.168.1705088348393; 
 Fri, 12 Jan 2024 11:39:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fs14-20020a05600c3f8e00b0040e38b7cfdasm10564394wmb.4.2024.01.12.11.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 11:39:07 -0800 (PST)
Message-ID: <1f2e43ba-7a94-48a2-be01-2e8e419fc036@mind.be>
Date: Fri, 12 Jan 2024 20:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230901192719.102415-1-dalang@gmx.at>
 <20230901192719.102415-4-dalang@gmx.at>
In-Reply-To: <20230901192719.102415-4-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1705088348; x=1705693148; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I2UUnIHYZ8x7Jw3kgd4hP/yM+bz++Gdyylf1fsp8unw=;
 b=cpP2tKyXZmIV5OVKVKATwg63d5zZUpxIPHMOEZFbHHZL/Dwe8HqCgebnbPbhFBPh3E
 F8vRY8Pfn1OGlviY+ITlIrWb6MwSjgOnVoOYhm4Tuaquh+p+0dDA/wme4S4h4pG3uw3q
 FkZtnACON+WeRwkRNHWxdVXiZe4TMDW8Fc4PfP2cR9SQ9kQwGDYLboWu5RNZ/c90sr6C
 nGU/wEz975fv1J9B++WoAaV4ZqPt3yQSetS+P/emXwUBlEbZcgrSJm+38Ipcg5WNfh/I
 RUlvcZKrug0Li0ODJqVidRjWN06PA3+3s0TlI4OWqnTM5dMOYf5WEcb40V3ePHKQdsmG
 M8IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cpP2tKyX
Subject: Re: [Buildroot] [PATCH v4 4/6] support/scripts/cve.py: switch to
 NVD API v2
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Daniel,

  I'm finally getting around to this patch series... I have one little question 
(and a lot of little changes that I'm doing while applying).

On 01/09/2023 21:27, Daniel Lang wrote:
> +            for config in vul['cve'].get('configurations', ()):
> +                for node in config['nodes']:
> +                    for cpe_match in node['cpeMatch']:
> +                        if not cpe_match['vulnerable']:
> +                            continue
> +                        match_data = self.extract_cpe_match_data(cpe_match)
> +                        if not match_data:
> +                            continue
> +                        cpe_matches.append(match_data)
> +                        configurations.append([vul['cve']['id'], match_data[0]])
> +
> +        cursor = self.db_connection.cursor()
> +
> +        # Drop all CVEs that are rejected, status might have changed
> +        cursor.executemany('DELETE FROM cves WHERE id = ?', cve_ids_dropped)
> +
> +        # Delete configuration mapping for included CVEs, otherwise we can't detect
> +        # upstream dropping configurations.
> +        cursor.executemany('DELETE FROM configurations WHERE cve_id = ?', cve_ids_changed)
> +        cursor.executemany('INSERT OR REPLACE INTO cves VALUES (?, ?, ?, ?, ?)', cves)
> +        cursor.executemany('INSERT OR REPLACE INTO cpe_matches VALUES (?, ?, ?, ?, ?, ?)', cpe_matches)
> +        cursor.executemany('INSERT OR REPLACE INTO configurations VALUES (?, ?)', configurations)

  AFAIU, the configurations table is there to make an M-N relationship between 
CVEs and CPE_matches. However, I don't understand why this is needed or even 
possible - i.e., it necessarily has to be a 1-N relationship. Indeed, the code 
above always creates both a CPE_match line and a configuration line; the ID of 
the CPE_match line is UNIQUE, so the same match line cannot be reused for 
another CVE.

  So, I think this configurations table is entirely redundant, and instead the 
cpe_matches table should just contain a reference to the CVE ID.

  (Don't change and resend this patch, I've made a whole lot of changes myself 
and I can remove this configurations table too.)

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
