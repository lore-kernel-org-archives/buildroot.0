Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47D3CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DAD560644;
	Sun, 11 Oct 2026 13:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjSCYZRqGL5d; Sun, 11 Oct 2026 13:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A6BA860622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724136;
	b=H4YiDm4/st0dE4taUcA9tBg17payuiTJnw7zqBQTW3Bv929q8WuP8mczQiGfy7UeooG4
	 AbWIsxs+szFeN9bvD/aFar3Xa3LFqHmv1dnTzmY2BCqfVpdNnq38dIpeF5U3YQRhfpN+H
	 rHGh3ehmQDKGXTsD9bb7iwInAdNpm9506/WjWjw/l/JqkOs/7A76xSisg+H79cbrc5zyo
	 OlW5kBoIYcJSrYsUoVLql3bwjtlxGJPkrn0wxm1y6mTTfT0JjaYy3x7LivprN5eDvnrfj
	 szX8XeS0Jf+ialKOeeRNIObTd5wLbbLQyfm72wR/pEebPr3GjoqKrRqLjFO6vpRX2LQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724136;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=I/YqAEwCNqo45aA+Rxey8ZlzUxycmUBjf4zucsl2Ixg=;
	b=snH8qxzzwd1nRvKeeM0jXkMUGUV+LZlukPUVnUmY3rTI0aeW+9FWL3eAaliE0m0R7H8c
	 RAyygXPS3k3T8IQmavyN8aDHmMiqmwukWbnrhaxgAZYEVPrpd28dXRyEoRJhOMnnzIQ9A
	 r9AWUoxN6dPyYbLQWmZiN/Wa4CmzyZckPavvyqEmRIOBkX+HVydkWnwTrOEN8/OBv3xIX
	 CQLjKF4RecuAIOAQaSep6Kz2IXMZldIFyTt92GbAOyGisjdUiBvMrwDcBfwvXKBQnPFzL
	 QC0cZvmCucHZx2m2TaAL2Cho1dbdC8pDBLMT+k8eP2lJimKey90envjyCsRvu8IkSAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724136;
	bh=I/YqAEwCNqo45aA+Rxey8ZlzUxycmUBjf4zucsl2Ixg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DLHkkCoYsYb+QkOF3Pl9BzR041SkONK/VS1qA31PCtJaPd73yTpH6TeGJaOstmJF/
	 0mLt+/HTl9NBJ7rJrd2oK+KpurMe+X5c8H72i5p30c/SsFGScwkQ6MOFyj6J4ZNOSt
	 NaxVSTE08QGjtZ8fxFzHL9amTNqXqy+cW/js0X+f+oLfividC7dmEWKiacyc8/QE62
	 yLREmN/DEfnVgCTXtp28sgfcDHv+kwBWiLabM4E/AWxD2Z1ulzFVI4hBGNk+k8DCuR
	 3y575GKc3Z13N1XnT398c4GnfPN34C46FInBtF4/ynrEzUvUnTgXY0uzC0rHsAHu2a
	 WngUS3/hi86xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BA860622;
	Sun, 11 Oct 2026 13:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D697194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F54380DAE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPOCKKziYIaK for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A29880D9F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724134;
 b=LOFzAAlRuMmL65Dyo0Cs6ds2kGl0NFlBajoorHP3lCAeUY9w/qG1MXht9YNalln5uxzr
 LoDqgocAGhBXRwdu4tMJpW9Egkwx+q7G0NClc2IyWJeRXYfcD87lF1/quQw+THRB0lPBK
 PBQFd0bx7xebQY4GxrOz/p26CqwsaL+j3Um7wnsSHC6q2vAGU48yFtu1cq2jCmz+yyymM
 CYUPYrp2FuSsf5XasOOUOoNw3JY/EO0mJtdhoWipk3gOYA3/DNpEXEzhvPdWFlku+2w8O
 onmupD67H0X4p98t2Riet/fJGvzquHTNWXahIbTdADkih5VGTIlN+E7m52sOsxmWVoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724134;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=gfVL1p9aP8dUXEYQgqJhNF72sGywtMysLgHHWBogbQU=;
 b=FXhmoj0e87CS56vg3dP4leBdSE6AKxOr4kBi90TB+7vztGYgInmwDv0g8U8z92c73D6M
 6YmhedxG+0fyU1OGA0v5eK939rlgB7Y3LCM9NN4UX3g+e0Meat3vsHwznYk7b+TAVmbEZ
 CTrcguw43KmU/KcHzegCAwcxRUjUXXDQKlJikYIZ5o0iL2uePdP9HvlzfryuHvV2YM4UD
 RM5xk6ewqSur+NtJFYLe9fV3s9sr8B6t8wdm9PBbnOZj1/ehD3xsEkcvyvmWYFrImjKrd
 RpYhu7EhERnlYKYaQ90u6RiPmNJgPVUwYqUP9jasFJ6dachqhWo7ZPy4+2b+S1/ozdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M81eyy5T; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A29880D9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so6060065e9.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791724132; x=1792328932;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gfVL1p9aP8dUXEYQgqJhNF72sGywtMysLgHHWBogbQU=;
 b=iZJIL0cw1CL7B2xaGFo4DK3VMferD3T/jdqWCteuMGDfdAxm+2/PxMrYzu4eWnXji5
 kEC4ncZO7Kf/QgujOVFULG3sZoEd2einXJA/ahcYrx0q+enxLungW889KVnFBxqq2kS0
 LM+A64aXa5Dz+GruR1/COeqsjQxvhJ5+JMGUsIGdlIL382ou8tRuMpguOegJ3xyIkcsD
 EPFzqAfoKoS8BIIXtr5E7Gow4KJYEz09LTZMpNj+abCJIFbeQoXO1K3fa5fLcYipikCn
 +diIfPNRHSg8vdlpgxYkK8hFbWuh4uJUJ3mKnhdWs2duuz3HwtLS5jsDsjKfXfcVtVsk
 DjVw==
X-Gm-Message-State: AFq9FYKsZ02KXRgXGch5BdOceuGElhYlRAqbpQWqheADgEjrtFAM1Bge
 k44FJGBzEbJMncGI280MnLepPtaRYJ/kh1CR8dH1ljoV8IHZyRSIytF6aYmtunrHDDg=
X-Gm-Gg: AYBFou2DxBQRtJYbio9b6uehnlQquDn36y1w2zZ4AsQoR07Xi89x0Ik12KKSgOXupAZ
 tklsxyRqnZitKiGTEJnM+pJh3/Y5OHjvX2TM6EmcSvZsVCrtSKta/qvuaft5nk+1SL1qh1Dw4hQ
 M0G9mPpF5AAV87lb1pygP66H4VyoS8JXR9z0sgrnI4ZUKOiUkqocuFaCmnJuAq90D6somRrh5ER
 BTCCeSlXKbP6MxqT9jJAXi9RGilLGLnwpJeKL4lQlbI5dATtof9tqfpQRLodpJs7pDSi1KqGLXk
 UBjhFlUZ7X7uvfcjc8nPZ/KPvCXjYJFTYihjzMqBjRHqLZlbRqBIowyzZdmjEqNhdicd67wbc1l
 eEncI5/uyLOgnJQnXR1BNeQmIOmSufSwaxPc06pFY04gmgYE0AmSnfRiR+FggPwfqKWLzixyhbO
 oQlZoXlH9t93b4zQs0gQVSKL/7FubPJ9iGrho2Nv+AjRuH3JbjforUjkmVGZXrZkseP/ZgsvQkz
 IaW0l4T4wMTNqKae7GaqNTGj/33YkZBoQb9RCmxwZE4XH9FUDXmMiFFemWKjogK276HXA4FtBOx
 XPW2SCbBOXTOtjR/QqczwUWz29WgM/+0+Q==
X-Received: by 2002:a05:600c:8208:b0:4a0:1b14:d00c with SMTP id
 5b1f17b1804b1-4a18e446f55mr124841915e9.3.1791724131810; 
 Sun, 11 Oct 2026 06:08:51 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c1e33d2sm286925625e9.0.2026.10.11.06.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 06:08:51 -0700 (PDT)
Message-ID: <42b767af-4d68-40db-80cc-d18a0480c259@mind.be>
Date: Sun, 11 Oct 2026 15:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, git@jdknight.me, thomas.petazzoni@bootlin.com,
 arnout@rnout.be, thomas.perale@mind.be, ju.o@free.fr
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <87wlrocrqk.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87wlrocrqk.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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



On 11/10/26 15:05, Peter Korsgaard wrote:
>>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:
>   > Update all defconfigs that are using a custom Linux version based on a
>   > longterm supported Linux version so they use the newly introduced symbols.
>
>   > We already see from this diff that using that feature updates quite a bunch
>   > of disparate kernel versions accross the tree.
>
> s/accross/across/
>
>   > This change was automated with the following Python script:
>
> Thanks for including the script!
>
> Please check that the defconfigs are still minimal, E.G. for
> visionfive2_defconfig the BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
> line gets dropped my make savedefconfig.
>
Oh you are right !
I had performed that in a first pass, identified an issue that I fixed 
in the python script, and then used that fix immediately without 
re-processing the defconfigs.

Will send a v2 of this patch.

Regards,
Titouan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
