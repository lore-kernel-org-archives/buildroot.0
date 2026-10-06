Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11CCA5FFF
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780A660624;
	Tue,  6 Oct 2026 19:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2ttYXjv25OG; Tue,  6 Oct 2026 19:20:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 805F3607FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314443;
	b=YkGBMHeUKHyipM0uqSZ/jzoFvD+zU9egucWMfQvP1hVB9WgEYLqMQIPNamRgFbDOWiXl
	 732YAPAe8c2hj/nhMkvKmt2VeM9uFUpRBiscQZqrKGg3fbM7TxW5g+7jsjFISpNTjzJNx
	 h3omDdQJ6K7YHulTPIviTNuzzJqN0H/OTKaBeL2p+iJTTsMk72Ux02LdsyT4FvuCOhJob
	 dveNQoZrP06vKcG0j+c3km9DPTuIsccDl4fLBK6kQk4CP2XAt8iyeNSsOzZMt4BlyvafR
	 /6umKLZbdB6e8LkDfHtuixm7UUm+DvS+xYmeim+aJn33YVo67CRS1HS5zN4BasQpYHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eVVns9nT5Y1au91/C/bilhMICAz8lAEZpxPxqO2Kf4I=;
	b=Tplm5Q4LCn3L6dYTp7lj3+gSbnK/qYlbB5rV4BBMbp6sbhJ5Cl/MAAbvEUm0qPrAIJjK
	 a0tQyy0rt8C/r0EMhw6bp8V0rd+Lb46czkXXO8rUSXJ4m2It4hlm+mKFzCX1kywkcYwKM
	 KmeK9xU5dIoFcpqip8f3/QJMEHf4u6ZZGaNtLiQzDHyr3z1GGzWBqC/LTIhOhLoEbCPYj
	 t3UMtQsVfQ0oqDPMzGyPg6k7dhpGFCsQFn1H0NfIVIEomGgdlH9OGzXrpkpGtKHbp7hDA
	 hGmutfTVmapeKOTDygtobqLNo7PdDS19e0CoYNj/96sMbFYEZYX9S9bR4zLKS+3NhGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314443;
	bh=eVVns9nT5Y1au91/C/bilhMICAz8lAEZpxPxqO2Kf4I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p+R9eDoHrs5B1SUjK6pE+pQl5DvYpqbnAgnWEJ70ZhGN3AARvJq9xLiGlJ8CKcRwa
	 +5/myNPAq1B0HZNUne0K6gdnq0wdY7PX3sSrjwCuFYo9c4HvnUPmYAGGrVu7bJHhE2
	 r8Q8+Rt6aQt5+yJJu5Plrpl6Z+xNBUvIQIAXdSm3bBpCLu1+mQ18MZqZWCFBMG8ogR
	 HHIBxhX0Ryc77Q0qKBCzkDRHgo7e97fIVZfVZ1tK31xcFNV+MGXLR2NfvP0Go0gTp1
	 7tO3BqtSh4TX8Hk9jqYm3rdXVNQCxIJ7B1CFOWPPGly4Q8oIun1qkvxy6Mtx0fCZJi
	 j0Al2acR5Zi4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805F3607FA;
	Tue,  6 Oct 2026 19:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCAFD317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDA4880EC2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho9huhsQ5B6I for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:19:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7AF280EA8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791314382;
 b=L577pwIU7v41qGbv06Gonz9ThBOu944W8XgChlOavlDvgTlWK+3onqaN0cPwsFTOG43S
 4ZnJCH/YL8SDmPiZFSdaovs6xpw5rXW+uYcB04adLLhIUwwC6o2YvBMWr11jnWsJvjwhj
 rnj7upbOSJVLqCZRCDExlUDAFeohd9es1/jH+IUUxGmFBwqxjL1Y/Wf3Yh2fvEP4ql2vM
 YNIwsN14L3kmYSs7uIF/QDIQfEO/jL1h6BEEcLCAydu2NrIIylIU4jxLznZr8+uuyg0w3
 QVcCv7VW4muibD/1QA+HlIlbfV+NpiSOfrnCbPXG+ZKu3mQgpoUvKq6Ayzq935GMIww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791314382;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=GAVnV+Bd1ml9vYEw2F3FgYGKz+Uv+tD/9B46tPzlANs=;
 b=g15XSDfX6fyd16VXILpCnDh2L5truBUZUnWL0fZ2daqDtU8GNoJnC5D9GeURUTX765k6
 tt/KMpycfAgR8M7G2Zo8OU6YX3y14+0YANGJm80EhiYFeSu8W/WF6UcMIuDy2RcqeGEFU
 QqKkglSfDOTmCxN09WaXhGBF+zGlQrQtJrr+q5fQ5akIuLscHCM9Yw2jZvIewbdZO9Ycd
 Y98WcHNRcCA66l6CzUFy8B6cjwjJmq6Hb9nEeym/v+CJEXg5IsiG339RiLbUzHBl0eYRY
 fZuFHlJDHYBf/It4gKPLOUUKIR3OipweB1AgEoyu6azNjfKcMWk0tvrvm0/S2YR0f5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PT9cSfhM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7AF280EA8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:19:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso8151905e9.1
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 12:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791314379; x=1791919179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GAVnV+Bd1ml9vYEw2F3FgYGKz+Uv+tD/9B46tPzlANs=;
 b=L+5C7jriuvb4OhCbkr3bskMEzFpM67M4fzenwMr8xycZpY/WzQ+Fpq1Lt3ulV0G750
 zxtlVYOKSsTp8NI1ocs9l74fVZXLH2HQtEdJDV8xGWflEAN8x+znBLDg8ucNWgwRm3C1
 i1SyShmexGxjfFP036G60/ipZ8Gi67e6f8AFGMXJ0ppP7S4cwHd0uRmflrzEDLBaMJwM
 ofLYnfEiJBWbM8rl53Vfc6Iz7tP0x/5R5pHT8ai2aFdxIwwWQgsGZw0qCqZQv8ytn5k2
 PtwlsmaU14o8ILTY+tqvQPnuRajtPTMGOmozesdh9Rgr7fv6tPOxBfAVy0MWSWMXCLm4
 URag==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkBIklMmAxLW6IyeVGUz7ZbRfj8i+YOG4e2GBMdfPiSV5dubVWAGL89P+/dTZnkqTWvXnGT2VQ4Io=@buildroot.org
X-Gm-Message-State: AFuF++kRjfZ/e2SNE2NWyr0my0S/lA8Hkisk0Jlvj2dLa2TegizdBpOP
 X4VddYWb8Fms7Ck4fG9OK6goAu8oTxi1g36WfaKf59n4kPHmLjhhKs57cjQCeUiKVZs=
X-Gm-Gg: AYBFou2p7q2PL3Gpahgnh1/cBJdAXO0M9K6kXflATaxWM7A0EK0E2sfQ97uw50ZNYnW
 nb/0/pZIGml4Wz2C6Qoil1HW+0cQ+Wjtkugv2MnmS80hRSmL9kVmiNzuw1DcM3hSVEgzVh3IdSd
 5A2ep8cPvqYO6irxqjjcb98lM5MqRd6z/wslpLHiMrxiV3J7wJTjCWjFbr7JahIdIx35theV6ho
 75Zm3PmS+d/4z6dmPApZR7ig9CzcMS9nMFBItsPKio3n38AEHGu5uWyiHiQpVIFhYKcQAoV4Cx7
 bOcITsSXv8R+IRz4mHIikRq9zOtrNoscDGbuMHhK9REhEZ0d+469zdMVFH3UCT2IE+u3VuyVjCg
 26j6lgmbhkksP8kSTnWbtmHlOGLyxQBfZvarPEsNuyb2acvnQpjm2CdwEwEpCuWIV5Bnbnz6KMP
 Mci7mU/+0vEAZ5n6P2+ZG3Re1/jMWgc5DEOKifztO1DYusdts3YNdbKiYDoPPWW96YtaG4nlZzB
 PLTwB3nMCPbSMs9y7s3Rhd1IT9MEY2zYmV2/v0i764xk9oixGGMY1B5
X-Received: by 2002:a05:600c:4705:b0:49c:fc6c:be08 with SMTP id
 5b1f17b1804b1-4a17b54ec4dmr38838795e9.31.1791314379375; 
 Tue, 06 Oct 2026 12:19:39 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-6134-ce7a-f873-1485.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:6134:ce7a:f873:1485])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c4927esm134166675e9.8.2026.10.06.12.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 12:19:38 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org>,
 Mahammed Sadik Shaik <s-sadik@ti.com>,
 Arnout Vandecappelle <arnout@mind.be>, thomas.petazzoni@bootlin.com,
 Bajjuri Praneeth <praneeth@ti.com>, Prudhvi <prudhvi@ti.com>
Date: Tue,  6 Oct 2026 21:19:38 +0200
Message-ID: <20261006191938.185109-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5j1la4v.fsf@dell.be.48ers.dk>
References: <87h5j1la4v.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH][RFC]utils/generate-spdx3: add script to
 generate SPDX 3.0.1 SBOM
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

Hello Peter,

In reply of:
> >>>>> "Mahammed" == Mahammed Sadik Shaik via buildroot <buildroot@buildroot.org> writes:
> 
>  > There is a growing need to generate software bill of materials (SBOM) from
>  > buildroot configurations. Right now there is CycloneDX which is optimized for
>  > application security and Vulnerabity. while SPDX is designed for legal
>  > complainces, copyrights, and deep license analysis.
>  > SPDX 3.0 is a ground-up redesign of the SPDX specification. All elements
>  > (packages, relationships, annotations, licenses) are first-class Elements
>  > with their own spdxId URI and creationInfo, serialized as a flat @graph
>  > array in JSON-LD format. This format allows the generated SBOM to be used
>  > with modern SPDX 3.0 visualization tools, such as https://tools.spdx.org/app/spdx3_viz/.
>  > This patch introduces a Python script that converts the JSON output of the
>  > show-info Makefile target to an SPDX 3.0.1 JSON-LD SBOM.
> 
> Are there no off-the-shelf cyclonedx to SPDX converters that could be
> used on the output of utils/generate-cyclonedx instead of us having to
> maintain 2 different scripts?

From my experience the conversion won't work very well [1]. Having two seperate
scripts is the best way to go I think.

[1] https://github.com/CycloneDX/cyclonedx-cli#spdx-format

> 
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
