Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2612DC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 14:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F0A810B3;
	Tue, 11 Aug 2026 14:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCtnu2EuweaD; Tue, 11 Aug 2026 14:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FDB810AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786457258;
	bh=IKqczoUe3/0zPnpnPV+FK6uTp35D2Gj5EIBSMXt6RZc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N/4Ra/7tDhoIsUMXEADX8wL41ozBUrso3wf7Kb6MTxymmB3hliVxOSUTwTdfHyX0e
	 7HpZgzUx8n/c9vtNAi9sWNNAI71w7wrNdBEDYXZAtc7iYatKlsRHtmlVQdjSvM7DpG
	 azsc5y6IYvjVTDpv+vEG6NwMjXOLRYRZe3uX1z4DNIlNCN18hheEF3AlHW8kA2vng8
	 ngArVzOQbiGaDfux/4DuRe+8rThhIWPyKGgLZf7mHMFPpQgQzzobwe1x+iVxescf5j
	 Bpb6pbXTzvvZVMb6NFx/b0ZXkUNDq5QBtehWixAVPzd+ypr1iKsMeBVq4YVjTJuBxM
	 ZB2ac+8UP+zCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FDB810AA;
	Tue, 11 Aug 2026 14:07:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA4828A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 340584077B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJE0QGxxCvLO for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 14:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 359DD4075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 359DD4075D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 359DD4075D
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:07:35 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso442183f8f.0
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 07:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786457254; x=1787062054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ELfPT5u+q2N+6F518qjynbE51SDK+SQX9urpdZd24xM=;
 b=cQpSUu+GCRra33MsbRUKPk52JFLesJ/g+6YWee2dwKGclWuZE2ge1Sa/IsTMGz33Q6
 r4obC2NWjyXldl02DEl3bEboY7uPc7hLoBjDnQzlEe14/WrG34xAV+dJiEdu6EYSp0HN
 emj1Y9mhgWXIBkiqfJ3+HoEZ0NXqy42JmO/Qelv+j7Snau9N61Ta4vlDG0Tvo/L4K5Rh
 8G+u8kV/RttboJRJM7NtsQOdCHSB/3JpypiPopZnph1yDe60utBUYMojr94fpWukA4VS
 KdfbbsyX0ayZRnAcNi0nQTQeAYCicJqNFF26AoK9KXqEy7hhaD1aHNwIQNO4mgsarq0X
 VvIQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqvBORw4zleHtdwWl8LtprzghjTQaGCrVK5OAhhzbRSBZIMkMQILciBLYY6lAxlW/1fIkJRVgYACdU=@buildroot.org
X-Gm-Message-State: AOJu0YyJJl+2Vv8mCeXIXBXQ4jWftQXWcAYXJpd6vrwgY3kU8dL1Lrf6
 dsGS728X5G6HtsJt392VZacHaFYZhdnWKaMT4AkeXc4dj6iKgHPhCFBXVclVYkUmLcc=
X-Gm-Gg: AR+sD13E0/ACqqF2elucRkFCjUPcz19z4bJfPlqtNHspLWHSNWAoUIRHeziQZXtcFwy
 3meuNJdwlIBsdGlism/OOn8XQaCbGlov31WRBoj2puIMJcoSbgnZvGEjTQ3JW/MmSmfeTCTwyOR
 1a2IxJnaH3eWfGDZBwpqhB33YTx8+xLJV/+pMjohnelFhJ/j8L9blZr0RXZczvDXNVDxO02qf7Q
 kHFRIKLy5a4m12UhL1g4uVdpZH9iGJ/XBWM2owV23zbR+VXMJdtOrGtYWs3nrdrBRJm/oT+UWQD
 pzOCSTwHcc50wSw4f3gWRFz+J0c0yeKhNw61oKvnqm6K4N0Z0//GLOSdGbG+HxFuZW06kLGN5Ya
 y+3BPJDobnNVRDDUO+MXO4XgrBHj67yLKGK2SlnMRozX3w3E81T/Hgl++teeB+r02DylkLQL1ht
 L0wRPs/7D/k6rmbNdj3WnekODRh6BXmT/Vy9cXyW5M8mI2kLyZM6QNbg==
X-Received: by 2002:a05:6000:250a:b0:47f:7e8f:d62d with SMTP id
 ffacd0b85a97d-4814fd4df49mr1046209f8f.10.1786457253910; 
 Tue, 11 Aug 2026 07:07:33 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a14ed5esm4466168f8f.0.2026.08.11.07.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 07:07:33 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 11 Aug 2026 16:07:32 +0200
Message-ID: <20260811140732.180751-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b001de8-e54b-4542-93b0-ce5288dfe54f@cherry.de>
References: <9b001de8-e54b-4542-93b0-ce5288dfe54f@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786457254; x=1787062054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ELfPT5u+q2N+6F518qjynbE51SDK+SQX9urpdZd24xM=;
 b=NVcmplgpq03CUa0YO2RX7XHyBMKmRkIc8HE+VrJfO1b0CMNossDDM9zO1kpTc9vsm9
 Y7QKzzbDy/KnC7cfLKh73IXehanzMdo5M8ALxRQJm/U/jQ8adWcetlFaFKFX+Y7bMak3
 uOWhAlZyZmWAIuCWdZOSE2dgkUyNJSkLbwvro5bOJWruomQgM7ygjQ8mRV9iOlTcxGGo
 a15O//zy/0IlhCXsAD/bwqpyBY2yc6IcuQPlhE3lLxunnhracbWtZxRtubStNZzn8Yu+
 RXPiIFDbwkFOwCzN2gR9Ni7aSlrCBePj3Pw3hx+5bAsPjKzRex+AHHgdyfyQIJsCyoSx
 rPtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NVcmplgp
Subject: Re: [Buildroot] [PATCH v3] docs/website: link LTS tooling
 documentation and staging branch
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
> Hi Thomas,
> 
> On 8/11/26 3:43 PM, Thomas Perale wrote:
> > Users asked where the notes are available and if the information are
> > publicly available.
> > > Those changes clearly explain the location and convention of the staging
> > branches and also link to more documentation on how to read the
> > annotations.
> > > Also update the timing of the different steps to be less specific.
> > 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin

Thanks for all the reviews !

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
