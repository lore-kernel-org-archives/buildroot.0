Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93887109C032
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 15:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B748181E26;
	Wed, 25 Mar 2026 15:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlZ7vrPtZ8Vi; Wed, 25 Mar 2026 15:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6D081DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774452594;
	bh=i+DZA78DqsroUIcsdfJhGqhHTsDkIwjwJNJ6L4Az9+g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lOit3NHCibQPTndWUNq9TafOEdGeWV1sN0nssvwQad849hnz5YPw7hAHzDy1m9YIu
	 a+dpB3lmQEvFfnFC9H26mTm4yJbbrKEW8EqXIA0T6udujVynknFczHlbJQBUfuk3UA
	 cG3U80FvOKC3cV1mDx05TFAQCfNtCY0EQJ/5k0LU/Oox73dd2HfxjYJL23aQ1HQo8Q
	 lDEnqheypQeCuQUm5Ctjutb7wCifuNZauZVU1PyQGxePtDQBeaWtRO5QXRHPc/9xND
	 vxh1qyLc332CRVjX9NvM5nhGsiET+OIaMB0EvoUAgqoNEQlBZhcKltZENofMkgckSq
	 lFGQNhwe1/dCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6D081DE3;
	Wed, 25 Mar 2026 15:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B2A353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFDB840C78
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLawy-IUmeI2 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 15:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27F9740C74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F9740C74
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27F9740C74
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 15:29:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-486ff201041so46695355e9.1
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 08:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774452589; x=1775057389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4/9+3nA8ooU1t6O2iYCeLBeIEaBhqgZfyujjNdS8yMw=;
 b=LGKlowk0Jurt9Imyg2FtPwxrdtfTLgIGDRn+RUnirm/4OxcBorkdI5Fb7nKliEeODW
 /JLcCIL0poBe5lCrph0GoFhv4PJE5JXmtbSloeUr3WfP7x2oAQtuh4DlSA+wGi6OHfan
 XknSuHqFLu9HJB9qctgFVQ6w9dJLORMxrWErno2V3Y5zxphaDezbAI1taSDM7bdV1XjF
 UocKt6AQxOMVrvtP6Wpka8Kdo2PnNDyPaj125Fwgmb48DvyIVFACewWoaiv+wCXuozwF
 EOwKaVjueZrfv9ATxa15XNVuzis3fPmMjENDwIsgZ3ngvg022WgrmePpkHYXa8p33dqq
 HINA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoJFx3VzxaDkkTE7N8CvYtdXpWxHH98qYrgFr8QWpYMyu5O9+HGdN2Qbw1GCsyPBNjIygzAXBXnQM=@buildroot.org
X-Gm-Message-State: AOJu0YzJQ1PDS4v3zwGwesIgw1pdUHZNRURZc3PR6vTmZ2jq0145qK4P
 sH8qIKAK/jG7HPYELlQI+2tZ5E+slUqXZ+sVLQYXyRzhnpH+5DaZEl6cQeoPh9ttxP9z4Gc9tsz
 LGj3O7BY=
X-Gm-Gg: ATEYQzwXy7hyWrUaiu2Vghe/fN0Q0AA1qCvKSD3WvcfMZUlYiNm9jrY4vwG8V6osJ0B
 0non52lf5HY5ywLPC2i+jfWE0MpsEzCPBx1yAeuTsJ9YZacJvjLH5fKMInXGE+8rUF41qnPF1l0
 T/kAnz7jcea4jrV6KhrblG8ghY4Y2byeOofQlSZoD8ChpkW3MEjfKq9eGJWvoIXO4eTbhMOWPSr
 VqFWkkb2IxM7E0dgL3vPSnPru78u+QASHk70VPqJV+heemgEqDYiM6wzt640vjPunNPREnIi3yz
 8YEp0UC08suObh+4eHAnYFK9gMCKGO3iHpTmQWqTzm4bcYv4ESwe2ZlilZyHrGRIXQtg5E7+v8f
 3m9mYH23qvh+k4IOUmqz445Hl6hUz7e8mQrgZ1fZFxnfkFJheFqKBz0f89BeAv9yuPT/piE2Tj6
 rS0cq2SGRKn7ya4zmw
X-Received: by 2002:a05:600c:4e12:b0:486:fe83:8621 with SMTP id
 5b1f17b1804b1-48716056832mr58444105e9.23.1774452589434; 
 Wed, 25 Mar 2026 08:29:49 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48717390c4csm21702815e9.31.2026.03.25.08.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 08:29:49 -0700 (PDT)
To: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 16:29:48 +0100
Message-ID: <20260325152948.394613-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dpzpiofmvjr7qshzhveo3ebyu5igb2rv3u25ti56huo4axz3m3@mqub7vltk6uv>
References: <dpzpiofmvjr7qshzhveo3ebyu5igb2rv3u25ti56huo4axz3m3@mqub7vltk6uv>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774452589; x=1775057389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/9+3nA8ooU1t6O2iYCeLBeIEaBhqgZfyujjNdS8yMw=;
 b=Eu1rhmHIiz31hlY72YMJRhJSjriedCvcqsEP0E5yTOMRzE2eld4dw3ReStoositHBS
 ob9LIJitKzD4E2ni4y/AbnyjO7XwNVnKgOR7k+ogYhGD+3s2IVzaShyBmboRxTEPRk/Q
 /vWGkg3FEELP1sHBnsG+yoi5mHyytYCDTLY5wBmzgAt4NBXNZ9po6b8IVFvvsg3GaWjL
 jmIX/QFwPsORASGjL1el4Fi+dfGM35hvBD0Isave9ILBf/c6mGwlka8bQb6hTTpNGO2E
 aPSlMgRPXJuUY06gybScyc12+UcNckQUr4l8yeXHYEUnbfVy3KrsFI4LB24uRwbpdMDl
 ApCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Eu1rhmHI
Subject: Re: [Buildroot] [PATCH] package/libcurl: Use certificate bundle
 conditionally
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

Hi Ignacy,

In reply of:
> Configure with --with-ca-bundle option only if package ca-certificates
> is selected, otherwise curl will fail connecting with HTTPS, since the
> specified /etc/ssl/certs/ca-certificates.crt file does not exist.
> 

You can specify in your commit message that "ca-bundle" option has been
introduced in the following commit:
"5a63ee3c09 package/libcurl: also specify the CA bundle location"

It makes it easier to track the origin of this option.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
