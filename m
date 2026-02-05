Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113AAECD992
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 17:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93DF7840DE;
	Thu,  5 Feb 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn631FkcAggN; Thu,  5 Feb 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9966E84248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770313601;
	bh=yrJhR/RnYStEO4aKCCAIJDfyaqaNs0UGaWeyOVJkxkg=;
	h=Date:Cc:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pf07nmYxlXlUY5WPfnBfP+sBvAuV0lj5P+GA/RhgFKl8MSa0mD0EPHKZvrXNT39xz
	 37LUY9JIPH+8qLFcwKULiqSJIVJhFe6i3rzeku8bAwVUvpzkjt0Ll4IwbBGKWr2Vm/
	 iw6j7yzNZTxnLeshC3GtGmTq0JRECBucWZUspUfmgOSdWkr2YgjnzHz/UARSw12f9c
	 lwIx6hGsANxFQT9kiKkIwSpX+v4b4x8nu/dRDebAnBZmPv6v4wfz3IHfeOdxrc5j0T
	 aRFYOvNfVvaOymtk73QxWdDED8JRymZgjH0Ko9QIx8qIGaFspR7li9tgR77jhKmclj
	 W+KCepGtciwww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9966E84248;
	Thu,  5 Feb 2026 17:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3114173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 17:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A06AB40464
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 17:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0VgB2S5TMQ8 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 17:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D59C402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D59C402E7
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D59C402E7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 17:46:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b885e8c679bso200326566b.1
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 09:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770313597; x=1770918397;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rLEa0ni03UKyFdr1DO6YiNStoDF+XuHQK+pCZGmf9Go=;
 b=Ax0WA99Wv1+Z0Ujh70HdlQ3f7SubE4YybwIcP+HQa6ilfvpsF4Ii6Ap1seekEyV4JS
 +pUg/ukPniD2mFWazZbVM/VNavkSGOCx3ucBefB4mUezX2bJwoLy14JN2r0zqBPzLEot
 46cLMlSHE/WDEAM+XyUyoUtGH3tpw4+godgGzwoN3IV1X+3Gj84GebmnTfndyAECS7IZ
 wONl2VXHA8iTyYeXD9J1Uhkxr9XQKwNIy64KcJSHtCLwjCuyWBqc6MLxCGs9xwNLvD+3
 6j7lHGaT64rw3XZIT4Vlq9p1w16fQ7WPUHJvivGVHfolT2+H4ddVPfWJG0ogWfz4iGp7
 LZFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY74gllhqEFPZyVdE7PTf49hLqNPN6MZYbFeHkcpkBiJ0sxx3foTOXXvTHKQSZHc3FWtvY2Lwoqpc=@buildroot.org
X-Gm-Message-State: AOJu0YwdBSncY9yGQCyeVeExb7Ll5yd3Jwv5ZY6BtoKN2WeOx5yZvHFq
 Bp7O6yKmF5rc/WWox/WE+GhfjbafFQwRs5oTyAJkTmZlJRU1gu/V/fFK
X-Gm-Gg: AZuq6aI4B7Q4KbQdIixZ4YVclWeq4JxqDNDoIb3TOoFK5JONVtAQi2NLy1KrNEa4FFs
 JYlvAZUgEJkCvpgz/vf38T0FziuzxPLhbM+s7f5WSjdMC1ls/mEj8dlNlPPI/ww4KcjEu5tM2/3
 tcZrmyvljpa/euu7mqPd2UYhhnxBmKIEUQsaPGiSlaqTVnRQWBOFFVe+Ui5dDdLBpjMKx+zOC3n
 DpUhQVyTzsFWLEBMP1RpKmB0wPFeWDWn89kn8ItP/1tECrnwcqZ8MwTwF9V3Qje2RdozWFIXJX/
 LKayqagAFVlKbw6Sg+EXsirrxyIlp5mpGYrcKY5ijfUmIIbnshd4NR/3C+dbe04GUtO3hS6H5mz
 BtHiHKeIioJrLpYpA2lvu3eYgI9BJ/eRTErdLyQi27VFCEPn3puVywJuwO2h5LWZM0u5v+xWVA3
 qenxZe5dRT1ZbB9w==
X-Received: by 2002:a17:907:9304:b0:b73:2b08:ac70 with SMTP id
 a640c23a62f3a-b8e9f340690mr520310866b.49.1770313597022; 
 Thu, 05 Feb 2026 09:46:37 -0800 (PST)
Received: from localhost ([2a02:a311:4383:f700:e3c5:29dd:2134:1c1c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6594a228c95sm2414760a12.27.2026.02.05.09.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 09:46:36 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 05 Feb 2026 18:46:36 +0100
Message-Id: <DG77SMO8XOZI.3OHJW2PJIIF0S@gmail.com>
Cc: "Christian Stewart" <christian@aperture.us>
From: "Franciszek Stachura" <fbstachura@gmail.com>
To: "Buildroot Notifications" <buildroot.notifications@gmail.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <69817788.050a0220.35a51f.d1cf@mx.google.com>
In-Reply-To: <69817788.050a0220.35a51f.d1cf@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770313597; x=1770918397; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLEa0ni03UKyFdr1DO6YiNStoDF+XuHQK+pCZGmf9Go=;
 b=Z0Nca0Ob1owJswmn3RspEtV8wVu+jMwb9Po/ik5T5S8R0MhaG4RpkGABubSdP+EmtJ
 7E3FG0oupK1Xos2377py9qdeMhK0NzeEcdpHQ5rEu8EGcx4LAyf6Bx1styeLcFo7U9d8
 +ohy59+Wwqr2sFw+lJ1OOJqb993iooOA/Zd+NUtX7CU7gTUYU8GBvM10wzqgUdemyQVy
 gjPzBIXY07M/Koyu3Hvhh0r064QdGokIDl24ExY0JXt+HuLIYhteAHQPEPZAM2DO1FEu
 VHTCg8oy812vRWmf5SkoLxkiYsemgqEVTwnSXlVPshMzmcA6yKKy3VhK7A456iTjJpAJ
 Xy+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z0Nca0Ob
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-02-02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue Feb 3, 2026 at 5:20 AM CET, Buildroot Notifications wrote:
>    x86_64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/09404508c78b93ba163ed1f729e92bd651054d4a | ORPH

Hello,

package builds after:
* removing -g3 from CGO_CFLAGS and CGO_CXXFLAGS or
* adding "-linkmode=external" to -ldflags in go build or
* setting CGO_ENABLED to 0.

The docker image for this project [1] is built with CGO_ENABLED=0, maybe
the same could be done in Buildroot? That said, the autobuild issue only
happens if debug symbols (-g3 in particular) are enabled.

It looks like a bug in the compiler, so I have opened an issue in go [2].
Someone is already working on it.

[1] https://github.com/distribution/distribution/blob/main/Dockerfile#L12
[2] https://github.com/golang/go/issues/77436

Regards,
Franciszek Stachura
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
