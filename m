Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC0FC61DBE
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 07:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D5161224;
	Sat, 21 Feb 2026 07:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDgZXHCSIKey; Sat, 21 Feb 2026 07:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA54611F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771658844;
	bh=DVAvsOKB8jKRDlfivDY+OEBGE9DwDdKpk1dBFiNOJ9s=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=s+RNCSxHte5i0rlmFyvKZMIiNkUtDquQMZlsZIFRNA9A7UzcDiyfrgIJHPvx4UQU5
	 avCT4TlT+HYt9URsE9vFU/h05+IIff6z+y9L0E2z3LsQEgoxuUajOaj15ip5XG0usr
	 L3cRsNH3FNzaIHEq49lZSJTIj4PJCmdnU3kNl1xLDmEhKcY4Qbxz1Vh1vnlguFqQXi
	 ZMNZZxIuldb8mS0ZnZ6IWRUJQ8ic2h2kkegJiZ61++oH17i7x6nIUCMnyOKmyc3oq4
	 rt0hKeBaCMgGAk6n0Achjbog8CQXKzzbPNF7NzA0GRGyWaWviV3Yz4sU9NhLgEVFla
	 efKdgAFCvh8cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA54611F9;
	Sat, 21 Feb 2026 07:27:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E76CB206
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 07:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83AF611F9
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 07:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RALHNti9OP8u for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 07:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E657E611D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E657E611D5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E657E611D5
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 07:27:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so24752235e9.2
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 23:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771658841; x=1772263641;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1+jYLkkKEq6nsuNwH54Q12RO/OoWivRbmuJ/r3BObPI=;
 b=U+qMLk6fcQMmA01mDJ6lEKrgixIjr3flOcxyarFJnr1TghSQZkwGEfPVaKrB6U2bQC
 2FBGhNMeTiwg9c5fznTT6Ny3bfrGts7cp04I2yWu4763l9BCwIIq1g01Ygrk7nm9Wsga
 2lv7xm25F/gcdjPAmlLnOA1UwGMu9ojzD/4WKT7FAMaJQgUJ4OYAtI1+zGYj4yN3qJ7/
 gXcJBzKT+SRf9SDz2e6UMA3x0HOPjCRANip++JwyrKPg86oLCKSmDfwMzg/lcf36Zmmp
 sS0QLEULSOHGgJI3TudTnAXvqAfP5nxAJqLyM6v1eUWFrLC/H9Cs+lHFinvAeXeRLIgV
 eblQ==
X-Gm-Message-State: AOJu0YzDkHa01U3JpUuS/BzCNxpkbYpJVHDgE4kO5j+sLb0U801vliyA
 fYGFHT/nR3hu0MY+aEZ0dTwybahjrq1viq1RpS8R01ZMtAzyixgY9OjOma2UKQ==
X-Gm-Gg: AZuq6aK9tUqPPjO4EWyv1zluitoLaV4Q/++VacQd0wroABwZybOug+7muunofaAZafY
 Kt5WvvBaBwL3zBUyXnCoJkbe9GRk8tKyuFfsEoJEhgcoqCTw0BETD685CzFN/lUcYCklYlMROWF
 Fx7CidOjst4w3rV/Vxv/vB7ReZmm8I1qBYrNH+UOGJ+wyp5JDFAi6J2AGwwPDdjtAWBCCxtXJ3u
 VQkE0zxrcDLTt8cIFL5DULFkC+S/h0QMUG8jpRJia9oOW+55Eu3HITnVpQPMfoxE7AJnSB3W9CA
 uaTeUOYJXUdtKN1LLVibMax4AXa15gpRNpZlO94ja5g6P13vTea5NG/sIAofywx+mo457dMgOxN
 127QkV0C3RO0nsGQAEqHwXuStfik+Xw673Da6sgHk7ttE7/DmUp0VhqIe8Xs0fpyxlBfKXME6TE
 vn9NsujSLg02vy9vA3aloIxhWStaKQXBY37jp5T8s8A2PQHptRTX6AAt4bd9E05xzX2pcCOnY=
X-Received: by 2002:a05:600c:3f14:b0:483:6fe1:c057 with SMTP id
 5b1f17b1804b1-483a95e1f15mr32061855e9.21.1771658840671; 
 Fri, 20 Feb 2026 23:27:20 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31f9475sm105527635e9.14.2026.02.20.23.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 23:27:19 -0800 (PST)
Date: Sat, 21 Feb 2026 08:27:16 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20260221072716.GA405421@pevik>
References: <20260220133622.2271059-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260220133622.2271059-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771658841; x=1772263641; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+jYLkkKEq6nsuNwH54Q12RO/OoWivRbmuJ/r3BObPI=;
 b=O08wFT66aRiqEjkLxzSFyY8OFrmbfZnXKksAeA+AVaQYvIoS/EVKSNjWqBZkAD9OgX
 p4mjbe+m0Ju7zkqUlzkbV3Aza2dm5CKtXG3R29bnMLu+x7OZRKpMmqhu092he/9YVZxy
 lykumXIOk0DWvsWKv4GY/Wb1SD6yHW0mHABMKuYGhoUaSiM+KN2q2JCYivOCoLuV6+u8
 AjjiU9R1z1JzkmBAzyNuf+SNzeQj+LmfRxH5PUujhPB5Hx7cRu2u9ydh+uf7r88rue04
 HIqFiob63wvi7XUZJztsMBnVnZn4NYbpxqvgKcqnKAgRw9Gyqrqz+7P6KupzVfMquUdd
 WFFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O08wFT66
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.5
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

LGTM.

> * blkmapd not built by default (--enable-blkmapd to re-enable)
I suppose we don't need blkmapd, do we?

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
