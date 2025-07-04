Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012AEC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8822813C9;
	Fri,  4 Jul 2025 06:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb7yKeU_H5yz; Fri,  4 Jul 2025 06:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECD482098
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EECD482098;
	Fri,  4 Jul 2025 06:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2ECA1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F6B8203E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkpF_qy99tI8 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED67B81426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED67B81426
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED67B81426
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so3328435e9.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611684; x=1752216484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTxyPWJRrHkXCpLWbOX/wL7ry0mI8KJsr48gCN1aHyE=;
 b=TieJIjLJV2GurJWFdm/a8uRghsKLhjdpRsdSRe+/f1bc46+PjTI4RVV++3l5olWhfp
 Y3Zrg5wG0nvx9qDl944GqJUU0e6rRa8k/rnOosxLUh1VJ95OCeU71eE7WDbE9mixCFXC
 bfCVXrs7ailXamQ0XmZz2z8WLJ6eiL8PbBofhs1KzY5ZeL+KFtNfZ8fd5Dtgu6bi1n2w
 H/z1ekmc5kHEQq8gaFXfLXIf2CQwluvmc/Pp+9h7Sfvr/QSH6Po2UoaVhoOlp5tqolg7
 ZzMT1krX7MRDfCh51OhVOI+7Jsp+5rzVgAG/gsSgsRDcPb2nIPEWCYxRQQXm6Pu0OY03
 ddfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX59gpfqjgvLde5HptYHSUvzcytp43ciNjB+o9U4B9EMjihVXB6wA9xGI3M8ro6fou9pppOTRS7pYQ=@buildroot.org
X-Gm-Message-State: AOJu0YyYeF5BrwrGQTSWQJgcRjCBNeJjyJ8BdHFP5lBkDivsW7cMZdVM
 PD9t6WL8VbBGN7lfF7/SCP6e2scsg8j8RxsjHEh6lvOBXjTGqNtcqLKa3SlAtmAvgLU=
X-Gm-Gg: ASbGncurzwWZ2vIv5y9SlnlqjgZNTtEU1MDo0cmQ3goLywd007GkkSKlSVFtswj7mD+
 ad+spSayq1lCR1EUhvBJC8VCXbeG0MFbYoYFiasJDSfkKB8QBKzVK1oiRru0dEvOeYWgd1q4ldn
 erHMLn/ihdo+i+TvtREJ0ybrXD7x6ULGHHAH2otHkga0XJCbuxvM0tftwOveOJ3UamgVcF4n/dS
 2E05Irr8UhtsEqbXxRTG7MF90Y6eS81mhzvU+oEqVJcccneXi1e1jIZO578aTNg0aNSLFTYk4NR
 KbWE6yCEBiDaMNhM15CIBVIoU0b1oOi4dCcvBPcW/wazxH6vKNpDcYRTTrX2bKlDroVzEdgfji+
 ZsESafuOtjQ==
X-Google-Smtp-Source: AGHT+IHc107zMJzAoYy4dcV8zzdDyoHaPN+JeLd1yYkkeFC7nPiNji7pOffx4r8CQKGJspvhKZ0TfQ==
X-Received: by 2002:a05:600c:4755:b0:453:6ca:16a6 with SMTP id
 5b1f17b1804b1-454b3116236mr13950545e9.10.1751611684036; 
 Thu, 03 Jul 2025 23:48:04 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a642sm1623953f8f.80.2025.07.03.23.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:03 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:01 +0200
Message-ID: <20250704064802.4065416-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624090905.287792-1-raphael.melotte@mind.be>
References: <20250624090905.287792-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611684; x=1752216484; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTxyPWJRrHkXCpLWbOX/wL7ry0mI8KJsr48gCN1aHyE=;
 b=EF5vYVdmFng7fkx2lIiJgGTOXzANpzEONshVnh/aP6KU7fUJ8t5M89opP+2N8Ya1Q/
 vkbS77bhiiChJTCpR2vn72NXolKz3hv/VSL3AiF+/Ygub7Q0GeLh42sn7MVxGQ864YmS
 cU7VJBNOnC5t6LwHrV5JIJhwJPECcOkvYtnJ3dOCrpo/cHdfI5qOKKH++/jIM9RcI246
 Bs6wiAEBvTPFLtZNlFENBcwJgNFEWQfpygkgn6B4gb3aGqWMB/vUNboi3FCOBtdxq/vh
 jF5z+xYcuC3VQpfBo6pOi3iOtnPf5xqcjPQDLQ1biGhTZYvqejGPJCTM2ZJA9mxk8lF3
 DVmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EF5vYVdm
Subject: Re: [Buildroot] [PATCH 1/1] package/mupdf: update homepage URL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIGN1cnJlbnQgaG9tZXBhZ2UgVVJMIGxlYWRzIHRvIGFuIEhUVFAg
NDA0IGVycm9yLgo+IAo+IEZpeCBpdCBieSB1c2luZyB0aGUgaG9tZXBhZ2UgVVJMIGN1cnJlbnRs
eSBtZW50aW9uZWQgaW4gbXVwZGYncyBnaXQKPiByZXBvc2l0b3J5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkFwcGxpZWQg
dG8gMjAyNS4wNS54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvbXVwZGYvQ29uZmlnLmluIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9Db25maWcuaW4gYi9wYWNrYWdlL211cGRmL0Nv
bmZpZy5pbgo+IGluZGV4IDM0YzVlN2Q1MzguLjVjMGExMjdhOTAgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9tdXBkZi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL211cGRmL0NvbmZpZy5pbgo+IEBA
IC0xNCw3ICsxNCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NVVBERgo+ICAJaGVscAo+ICAJICBN
dVBERiBpcyBhIGxpZ2h0d2VpZ2h0IFBERiwgWFBTLCBhbmQgRS1ib29rIHZpZXdlci4KPiAgCj4g
LQkgIGh0dHBzOi8vd3d3Lm11cGRmLmNvbS9pbmRleC5odG1sCj4gKwkgIGh0dHBzOi8vd3d3Lm11
cGRmLmNvbS8KPiAgCj4gIGNvbW1lbnQgIm11cGRmIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywg
Z2NjID49IDQuOSIKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180Cj4gLS0g
Cj4gMi40OS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
