Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F1CC87FC9
	for <buildroot@archiver.kernel.org>; Sat,  2 Aug 2025 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7333684825;
	Sat,  2 Aug 2025 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83uZ-qX1etku; Sat,  2 Aug 2025 20:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A2F84879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A2F84879;
	Sat,  2 Aug 2025 20:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4AFF13D
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 20:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A218F60B71
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KpM9OgjpehF for <buildroot@buildroot.org>;
 Sat,  2 Aug 2025 20:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DFE9608E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DFE9608E9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DFE9608E9
 for <buildroot@buildroot.org>; Sat,  2 Aug 2025 20:03:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so21595455e9.1
 for <buildroot@buildroot.org>; Sat, 02 Aug 2025 13:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754165003; x=1754769803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkEeqxorEsogAH8K9yz6TFBV6Gjs1q6Dt+b8dZ5biGY=;
 b=ni7ApF64xQv/3cnRTNjf4hHq6/GUSynfHLj7KbLMMEVQN8JpnQqpOi8Otlt2cqU3Z9
 2griD4F4Mwx0riB6wTzOQKOFu4AeHzoNC3PwOXVedu7xiKiHUsdGRsnfazDUcc3DJSVY
 NA+fqQGDQo86fbzLkw5t2JBZLgbPkLWS2nNbTTSU5vYxpaCy5l0GbMigFonSsyFWqF6t
 9nl7cl/NM9as/WjQIX8iKlbcDsCFH81imxmEoKrr7lJxAob95djsxocDXYy8XCR2ft0t
 8Dum9mScStykCdP0iOLTDpBKGL2nqW8HD0GYWK17m6HRWJdDi2DrbwVfX298+hhda4Cw
 oYbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbaVI5vK3WwrWL9LPEPskNpXpqm3P0XMCzQLL/4fp4+GAOwyPyYgBQbQ9plU2PZwox4IiHFVTBVVM=@buildroot.org
X-Gm-Message-State: AOJu0YxWgvgYL2R/eh/bOZoPPiiCmLZHTnw0fcF5VYLl58Gje10AUXT5
 rWIiW8rbMKjcZpPdMGm92zfU/IeyNrfbEhqKsLOMzT7Ip2ku6MJ/oHTW/c78ycmCdRY=
X-Gm-Gg: ASbGnctk/ZN1+uC1Row6yplqsB3ij8Gnmqr3csGzJOTfnlVAUPmmHqTfottjCLk5LG8
 IO/tvs98Tk4wfn/Af7kydqzTxhwOweMD/QjpMSlWLwKON0ZMF0KVKlJVHgQ/XQRlVb8Voi1/QDh
 5qDZ9qhyaue7m7G+Ks3+hK7wN3utuPZBxDguWGQzb8Z0m+MhymM6YiMBUVn5QDBmOhjo7cautRr
 XsaXzKtg3j1HgGLX/FjhZafWmwUj3zTlmKHWmpSdKSOealgkmgSbFRvCpkJyLKN655FzqRkDFuJ
 En0PevOC7fhbXR/xhXAkXx5EKheUKa/EpFTUMVsWNvSaPG09aYUr+kjfukWfH8N2B+Y5accLdnr
 0UIodlhKqkxTJ6PjQZdYYBenY
X-Google-Smtp-Source: AGHT+IGMVF9b+WU9AVRFUyzfE4eU/OydChtJIbu1KAO61lKxhucU1kjQCJ6V/+Z7VesvD+MOUk25IA==
X-Received: by 2002:a05:600c:1554:b0:456:1904:27f3 with SMTP id
 5b1f17b1804b1-458b6b317f9mr33222845e9.18.1754165002706; 
 Sat, 02 Aug 2025 13:03:22 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4533e6sm10425042f8f.35.2025.08.02.13.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 13:03:22 -0700 (PDT)
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Wade Berrier <wberrier@gmail.com>, Florian Weimer <fweimer@redhat.com>
Date: Sat,  2 Aug 2025 22:03:21 +0200
Message-ID: <20250802200321.2186661-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
References: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754165003; x=1754769803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkEeqxorEsogAH8K9yz6TFBV6Gjs1q6Dt+b8dZ5biGY=;
 b=Ih0tOuiMI9aoeBdAUgM7eTdaKy8RWGyXI/VoXrs+P7MmZFqX9X4fNPjBjHfozbU2QO
 eC58RDrkU4Li35YNfQ6C6U9yX8wu0sQccSzw6KhBMTbL7KUI5+bR2wU3bn2P/PPqtb8E
 lmD06YnoTYS2HGlMJvL2t1jgimTzdlnxUuh/MBq1WCFcgP5kstpZJbsEfkFY2qILICMH
 v65ufNRxoa/RwZMyBnW5nAVqeIS3SMmbbEcG8NIx4RAvkkge7lZJhE6YQBcjE6KLif77
 SGb6SJoDZaRoCcMZ+VZ34/pRXqAOeMXnjhFGJQHojiYlAFZ2E7Oz1CmI4ep0Ij2GAHDY
 XFDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ih0tOuiM
Subject: Re: [Buildroot] [PATCH] package/ngrep: fix implicit function
 declaration
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

> This patch can be backported to 2025.02.x as this issue is reproducible
> on the current version of the LTS.

Hi,

Thanks for including this note Thomas, appreciate it.

Regards,
Thomas Perale
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
