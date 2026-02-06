Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B843EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B121D611F6;
	Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmmnPx0-wkXA; Fri,  6 Feb 2026 08:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C5F611EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365519;
	bh=myASdurK6Qdfw7UUauaPsIottYuJVr1BokTQfM7S32k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BL6p4AlBCAO+6Fd4dBkpYT7nFIgXcerB5nhzd6q2+hQzjzMBBlgd76ZQDChyb9Ec0
	 KuJigfalovx+Sl+srHKSHacNvMSvjikN40jzoBp38+K7DC7lCDfPsuNJf9uORS1OlM
	 t669GGmeagF2hcUdtt0H8zkK9pyuxS8FmDOls8Vean2eyfUo3Oh++x0DqROuAhmewz
	 vXh99/cOOdgQqNFkeLjOb/Yc26Ac+i/ZTBTbyFQ6YKVrPMgYV5J/GqLrmCRBJAF2l1
	 Wpj8BCbiiWjp/0e1KAiLJXKtYQhIQq8P1ahl0kuO/+ML3nOOVUAJzeoHYa9jRSrKac
	 un2Yv3DZ3JnDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C5F611EB;
	Fri,  6 Feb 2026 08:11:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43065173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32AF5611D7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id To8lWgYl3rae for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B09B661175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B09B661175
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B09B661175
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so15309735e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365512; x=1770970312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0oOVAYfwp4jR523V0Blv8vYQbGUravFBzC3bRo2uaQI=;
 b=DTHeW0gNGFBMLBuYXqdykbdA6lp0kYHe4n4L3iL0iv0gRHjJG9bt+YUYLrXCvK097B
 a57M+eMjv/IpKE68OdESAuhLwLxwlFQR/H5jXMJHvF4S6cXJAybhbhVaahJt3J35NOn4
 LIjaF8vB330se2LT822Xlq+V1FATzJVevZYRLoIlsfVjnUJrkLKK5pmgGWVlZjSVjKx8
 1ohbxb9oiSKkXAuU0nY/2Lax0cALGX62/JTEK0FiVXsY2Dls6uBJ90LPu5TVmj9pGvMb
 VlGrZ9a0o+B2ydkcNcNjulF24lCxzqg4AUQoHczdzSxaC1MXD6eKzJYxxb8dga5WAt5v
 X76w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNSqFO2ThVi/bCB3Z++f+s9bzzOJj3crcbzaQkc67gt9p+zYhjtFYTZjXDG5s5DdLaqpvEcJz6hPs=@buildroot.org
X-Gm-Message-State: AOJu0YwQbJO/FsyriqG4RRYTK3K2x1AXL8hHxgxgHAsxqOy/RWRSaHzx
 6LaN0aGb5PZE9YvzjZfc9eX4Z+2O2JU9fQ7iXZ0xdscz6LqiTTivWMODziPKGDdjNMLfE4lMuVh
 KqDez
X-Gm-Gg: AZuq6aI9e1Lrm7ttKPj08ttSSeZL5ni5uArHp78zpdb6xw2saWgXAMbCW6v1CiYkAV8
 VypnxRIESZvnP9AwSRHaW3pu8UUr0g1VVrTTA9Id0B3WbeTUzmaiNbGdhf7GVPHNTNaDmN0Lsgk
 dlepv6T/TzCVCWbRLNjBYFzfqJPw+j9y5PZgMKe0ODsUesodyDvfyKy5K5VF1n4Ifm2SRcLJKcd
 zGwgMiXkg0dezN3rY4zD8ouarjMpGqqPHIWN8MLQsmox7uGm7W7i5vlqJk/Hl0zKXfp+W/JyItC
 dt7sCjj2lgTwTwJB7Y6wrqbXTRVffCi9uzM1bOb0AYMbHZdQIxcCVhcRHcojLarB6GyDmANb7ub
 YqQlLjqbMUCTEX6u++KGJHACdIhO1mNgv499l7jL0JkfmatuCRSsoCzNI0H3QzVZbTTIA1l3izQ
 jhxVo=
X-Received: by 2002:a05:600c:4f07:b0:482:eec4:772 with SMTP id
 5b1f17b1804b1-4832021da15mr24981505e9.32.1770365511700; 
 Fri, 06 Feb 2026 00:11:51 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832039d238sm23289045e9.0.2026.02.06.00.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:51 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:50 +0100
Message-ID: <20260206081151.32189-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118152251.248976-1-ju.o@free.fr>
References: <20260118152251.248976-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365512; x=1770970312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0oOVAYfwp4jR523V0Blv8vYQbGUravFBzC3bRo2uaQI=;
 b=QOkYy5epa4FEWUPZUIEt6fxV49ISndGKBrdL+mgRczj6f0PVy4QopCJOs4I3lHjx07
 ZRnslFziyjywNfxMNBD3f1AZI9DvV/c6CWurzg7hea/7owt0+vUEP6KZUM7RctohjqC8
 FIkkX0eXr0EB3BJdOvVEZ7uwv2y5m1DzMaXNDDm35HNbeEpvN6AmSKOjX9Y7EQLWYiEO
 j91h5b2CgMeuEa6FAHY27/vPj5xfhk5EdqZQseL4RoN8p91lwzxiJVoD+TMy8lCRvtVc
 U1BcMJXxA+yaeqgzKC2+it/7M0uc6AEJsqbJAlHwuG9xZwsNbzmRToogeXq7BTSdy3ol
 IV1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QOkYy5ep
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_python.py:
 disable interpreter colors
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
> Python 3.14 (not yet in Buildroot) introduced colors, enabled by
> default, when the output is a terminal. This behavior can make the
> pexpect pattern matching more difficult in some cases. See:
> https://docs.python.org/3.14/using/cmdline.html#controlling-color
> 
> This commit globally disables the Python interpreter colors in the base
> runtime Python test, by setting the NO_COLOR=1 environment variable.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> For example, the python varlink runtime test fails when updating
> Python to 3.14 for that reason.
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_python_varlink.py#L30
> 
> This patch might be useful, before updating to Python 3.14,
> proposed in:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=486958
> ---
>  support/testing/tests/package/test_python.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
> index c9ecf9acda..e815376d21 100644
> --- a/support/testing/tests/package/test_python.py
> +++ b/support/testing/tests/package/test_python.py
> @@ -17,6 +17,9 @@ class TestPythonBase(infra.basetest.BRTest):
>                             kernel="builtin",
>                             options=["-initrd", cpio_file])
>          self.emulator.login()
> +        # Disable Python colors for all Python tests, to make pexpect
> +        # pattern matching easier.
> +        self.assertRunOk("export NO_COLOR=1")
>  
>      def version_test(self, version, timeout=-1):
>          cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
