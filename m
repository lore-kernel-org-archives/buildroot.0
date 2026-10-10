Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA841CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6F9660670;
	Sat, 10 Oct 2026 12:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aO8qQdgz6LkK; Sat, 10 Oct 2026 12:36:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DAD0260697
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635770;
	b=ZjxEQOF6tNF9bxCERg+FQMdzLDDY/eSCKd5DmBvtO+zeUMf4zVDBPpeDV9bnJiHok19B
	 1MeaOQg2DeZZNBg/ixyIDe66NzHHZOJM2NbWfg5Ee9x1eTepTBb7HWYPv35JPzb55rBqK
	 lZtOTad1YAbubqs+zNhQxVWcMOc43F+/sEB+eYzyBtbR7tQHM8LK/hvDWgd4bSKEMYwkg
	 sXRE4nM/8s07SygjYBFGXeBadq5Tr1eJ54v9qEWq0Z6vIuTg6VQBAOoAwLDDTlEZZU2xG
	 kP9AB6EGTadOvgmRwxuWoHIrN9CKzz0K4zcWUYQchckIaHG52KYNgKFb4oMT+YaeydQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=9FGIclimFvxUjds2y1fldDjBWGx5tek/hGEMeKVpZQ4=;
	b=XJBBXvE/hehwxbWXVq9wr6wnEJzWP0c3REEVvV659NwbvEAJlA7IH570EizfEU0d6yW1
	 64yi70JqY08TyR089WqwNYUsgdhYSydOsBvfKFdsmv0IJkyBUfmOSnrTF3pxhF1uhtR7U
	 MS/Boyk7prWKgTWFWa3Wb085CK3DKrdKZ0WWt/O1+xEbv5p+As756JZMEKbCkEby1GhkO
	 wbPLdYqe7Sr1HSyXBFxKuOhlddBKsWlyB8tH6l4QjibkK5Pk2ipHlVno1jdGXCTjmnIsy
	 HxVddCnYDUu8IGTPdmviG0k8DgTYi3dkQZH77ZFyC92jITxJV5jsC0/yWaCFAmdODvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635770;
	bh=9FGIclimFvxUjds2y1fldDjBWGx5tek/hGEMeKVpZQ4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bI6fkEaWr68N3APzqgViw7iEk//FPx43i4udIssoQvSxw51jsrM3fS6cB9lz8lhlz
	 AkXSnfkysWMTp1cecbwgepu+PfY8ZpFGiL2AFK1XZIg2KpvY+btQH1jkVwG7ztHlMC
	 D/uA60aO5Y35j9IpSNDxb7mxrEYnmV+1b+MCVbDcuClvdcu/Od3ucajJFK3f2dLCat
	 mJCWTpUkkevS7M8gFXPtjwY/B97VBYHEwHncKmajlCmBXh6K6TwG4Zh4VKiKFpGir5
	 K+a1ZM+Cvzjicf8xuoqi5MwV6uLGu+iC5Hx4UzlIcP6xdfZIhGQN5Wd/oNuQxRgpGQ
	 rcS3x8iQPkdlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD0260697;
	Sat, 10 Oct 2026 12:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84FF61A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD578113D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2CCLi8EmHTh for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:36:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8321E81127
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635767;
 b=d70HTXC69HwyKiszGXEfpyRS5RwRqwjj0JtGvHKB9RCvGyzLo+TaY1gbiM1sGTo1ZvHb
 FMrhgE/YvmdEeUuMZaQwouzM0EicQpaRc5wICSAwJOuv5UCHCBnu2aNc8iYP6knQMv3WC
 40QeHUhX0amDqgfMXFp9O489la95EP7dq81tgJ6GxVujphk7shlxDck/kJDDuAwiqCCQw
 UkZsGu+ezNhGNNJgGdsWTiYuCTIwzZufHT8/rZkR/TaQx3LtmisWf2xdJbnK9sDTmY/KI
 W2Ep600sFxQ8W9AmD/M0cmQ8mZvfIGnWlbxSHprmcBP0h2BkS8CH4EwuHudPExqroTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635767;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=b73/6eXWvzZl+GXZ3scwOA7nGizHy/ikBsU5Al1qYQY=;
 b=Z4K1HGPy1XmP1sfVA1fctpIkOfL/V+Sa9ZGIsszpMz+JCX/rd8iSAjNW0ELSM2y0TVSQ
 QyW01eXTz+L/fGPmSUuDPj66VTb7FFcb0bSbuguB2+sMO9c22+BIfIDjPpFIII5s+ixtr
 VV2Zgvzhzwl+a8UuF83ACuVjuk/FhOT7+PwOsakN27k65JiUc43Lrwj4kOrNZbjom5VC6
 Fl+4V4AUZdi+UUR8h9R/qgWpa4PwQMY/3wnsZnNPP+AI536mVmfon3inVpsvNgTS0n/13
 SjAPcdUI7oY1TsAv7xhCA9kGUuskRPwxeT30rZor+4UNvMwc0SEd0pESeHnLiFkPn7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Zfm660jp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8321E81127
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:36:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so5050755e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791635763; x=1792240563;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b73/6eXWvzZl+GXZ3scwOA7nGizHy/ikBsU5Al1qYQY=;
 b=g3h310OHSqc/MsRd+UVQ3dESaO5PFwFlGClysftFy5hn4muPhLv2ORWhhvH5xbz8QC
 qLGhzYNQo/gDHibouP2wvXKSonosA2/VNFFb54JFLKbWmNokPMjgTVftLpvK9ePQqkzo
 bTBF50TsTqCzlwnN3s9lJqA2tDIp6meCMG+dV2nXpXblHzYk6xiAiMHhGRxROTeYKSNp
 YDy1GDpZq9Vz9sQDt4VK9K1/qP5ye0cwPNFPzugtgFSgD7zlWI0k4e6m7fWgcMxhVEzE
 IJut0+6Bvgz2GFD3iBNNs1muS+TJJishywNsYmjkCdexOIq5iZWYXlYe85tutVjAxbzb
 pN3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXHCU1XnYcZrhzKJQDUeso1OsE06OlyE8oO5Qb+8QlLugMXSR8WjSEASpwbUzmRrU3Y+DhtMTz0sI=@buildroot.org
X-Gm-Message-State: AFq9FYJ5mlgaj5QrYbwksm8z9xyYARqzXBZheHvXtckgKKt0S9VGPOwZ
 Ffq4hdv9zarKoa9uXRiCW5kVP4g/lW2Otw1HDyhyvctCpQZn0Z/AEL0b8jXp0C86bi524DYzZtB
 c/9HQ4hk=
X-Gm-Gg: AYBFou0MliWwcc4I1Eqg9RbUM5/bPO0HvQ8ICVj/h2ZT9jqzTPQUyvBqR1t5a1PdW+H
 NQ9hOTatXMLmbBbPpUEPOG0vTEnwcFM1C/krUXbpdbveZC6n6KzsGnM5XSmEirBbCEXbt3mvbGW
 Y6mUFYQakIeaEltQVAErQqgBjnvnxl53JvRYen5wBvB9IyVCsMa37d5uci7/9wsUvWUMStRPZHD
 L7vpd6FMIZyQLy3MCW4+KLd0CBAtHtysngy8G37MZZ/DXN70v+U4RngzqMrTreW/vewn2qHxx1f
 MBxmdyxGww9I8ikwcsyQi4iu1HfJR8zmm/rdQMRXfc0EwoyqRnzoA+jiZPg3TvU8cycwJWPJyF6
 J6QDdezUO+QSGTtvjwLq0drW2sUdQE+I6isg40jOeyQpHYlaCH3T5Hc7Rh5vb/AFJ3wz6465Lnr
 wG3+Mo4odb1LYVb1AeQ7/QiopkmbzYzIOWXAjefVwICpgQSl8ZpE+Zr5LjjY4ChYbFb2bhg+91f
 hLCfqEjYyaV3x9JMowhQ1YPwktrepTGa1HYyyMYBnixk2JGXyxMX5MbRBawlDmv30W53ka3gEbl
 7GNrm/9ys9fhRrfIX8bmTwZglQvmqU5ge74DVNEHVobF
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id
 5b1f17b1804b1-4a1985b87f5mr3344185e9.4.1791635763003; 
 Sat, 10 Oct 2026 05:36:03 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6beaesm78987525e9.0.2026.10.10.05.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 05:36:02 -0700 (PDT)
Message-ID: <2a5d8681-56da-4e53-8e57-8574f4c5c808@mind.be>
Date: Sat, 10 Oct 2026 14:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260918091142.62239-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260918091142.62239-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH 1/3] utils/checkpackagelib: remove unused
 variable
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 18/09/26 11:11, Thomas Perale wrote:
> The `self.pending_patch` is set but unused.
>
> Fixes: b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   utils/checkpackagelib/lib_mk.py | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index eb5fbf474c..065733d464 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -130,7 +130,6 @@ class MissingCVEPatch(_CheckFunction):
>       def check_patch_files(self):
>           for patch_lineno, patch_name, patch_text in self.pending_patches:
>               patch_file = self.package_dir / patch_name
> -            self.pending_patch = None
>   
>               if not patch_file.is_file():
>                   return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
