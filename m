Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A87EC982CC
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FDF560633;
	Wed, 16 Sep 2026 19:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwJVinKLw52y; Wed, 16 Sep 2026 19:29:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6D91960657
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789586951;
	b=ThBn6MvbYHFU9j5l/huEorIN0HyiQhc+ClTvLzf4ZuzepIbwnyJ0ZlJfOnafcQORqn4c
	 o9/vt+L92FXs7yrIPMkTCDhMNiHgCuciBpkFoOCttJn0PYdMk++rjbDI+VujFwxqvbYyA
	 020B3G83PNPdGYq0Kq9d9MxfdIsgd2Z7yVBUZrpilZRSeCbn00R/7TLY1jlZa2VCcVesi
	 hhwF88aqFOJQK1PkcfRNQCGiAQonG0hiZc5c7oLe+o886hY0fYL7MTu8ano3HNNWpfurK
	 Ds/rKbb3Af5FMb0wXL5RA3D3kDXZJZ7wR9hfNp0xfCDg+BHh/lVDPDFjD308MXcqEFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789586951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MHfdE7HjsE9akou7pD2CzVD6wTmyRVL+pjsZ3kRTZ2E=;
	b=ooby2+RX579ZvzYW9ZIj7YfPavPDjgq2Mrv7rbl6L8E/EO3e9JHGHgzykx1G+u2B9otP
	 CX9zgy+26Ajee4Cwqwx08Dl+SwtVqr6bE+Q4cfHXedDn6sdv5pn92tp5Ia9twlS9XSvyd
	 bpSPhsgsrrVmRV1zY6BXtnCdneukAGLvDX5G/GhBwrfVQbS0i0Toca3BCtAGsD3QsHknD
	 MYsOmgHM7sjoQ4RilNcSxQS0Y+NERECzN6O5xIh9IcJx2XKVAJLY6C3TsfNu9kHorOHuH
	 789fv9qrns9+XevMO2tmcM3ezomkyzgPnZdpp/u8aFlv4KqpXsHKvGmpzPOATOCF8RQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecrEEwoN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789586951;
	bh=MHfdE7HjsE9akou7pD2CzVD6wTmyRVL+pjsZ3kRTZ2E=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=osMolDsJ6Pjv32Ixh72Q6IPMNeN4KfoJKlY7BpZksQeUaPYeAAC3CuPcujuzWtqRy
	 bv6ZM1G/Ef4TNm5cZ6+A3yDBCyTHV3dwk7a6vZp6J78ALSFGLGPVT9d3Rq/SO2KY6I
	 JGtO6VxqXQnlrkdMCJpZB3IVdzx9k2acys3NA5fqHBAwThcPsH17oQE4U3JQbBNEuI
	 l194uqW/If2NvbMq3RxEoORkGUzarljesrNBtH842Jn5P4QvVTqLfTq2/u5Xg3K98y
	 f1nMFIKpdWUAtMDgduguTFWEJAD4OfFH/wbOOcXc5fvRKy9icYWDh5J24Ch3ph+i0M
	 2lWjVRVquWTwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D91960657;
	Wed, 16 Sep 2026 19:29:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23EFE422
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15EDD60633
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLE8fuMeSWgK for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:29:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2AC306061B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789586949;
 b=JxrGwhfesOuBANt14brAkLa2iRVnd3D+UxKJwJRWpXd6pP7NVbeSoy0Q4ra0rStVIJ44
 jeaAiRBEiJZisWyIuR/p+dBUdmyusbGrtWRH8C+KwOsLUr0WIlVfbCH6yGVqXDo2zegPE
 O/BcUt/m9dqUZsLQiDI/6IXTIUPY5QQTS33hY8Gv3ysf4E1DaPfV9dfE4fvnt5h9Ktf9P
 NiYX91103wMi25bzei6ndbcmnFnv8NVQ+u6tAI6R5JoSy6pacSrjZcSFHQvYjdWwR7XHG
 gJyKcZOG90ocGoflceYuOT64y26plKUwy6lDABstex502FLo13aXjnVhfYoN9MkKWcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789586949;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Disposition;
 bh=WvDvypVENjkU+MVgeOuatoX6qvsGUH0zkDJXrZ4UAfY=;
 b=hnbNIQARFR3p6jLsO35Ld2srlKtGylZPnGfDex/P+KUL/CLZe1LxfSIg+eze+iVvQhy4
 2A/f9kF6aVx3weYqqr2BmUG4kypQii3SkXVR3n03Dox/1ujJnhzRUhBIjHePMkolYJVGt
 LkQ5l1DU/WBXO5t1CLYfsLPOTZvXol2qxmTBsw7gUsWHc/Nm+hkxHh/djIBWiZRMksAYQ
 alxEEDqP/opuok9fX6EOOFPOruRmV56A9n2hQMOkibXrBUW1Uy63ytiSPzZu7mTTvzBYp
 mzSsobqT7GsfODnwumRQzDjD7FUa4BPTPhDhBlZnTbzi9eH4u6/L0sVultBpkBpO/8w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ecrEEwoN; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=merino.jav@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ecrEEwoN
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AC306061B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:29:08 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so732155e9.0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789586946; x=1790191746; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:to
 :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WvDvypVENjkU+MVgeOuatoX6qvsGUH0zkDJXrZ4UAfY=;
 b=ecrEEwoNMYjqqD6ISbANbQPq559jXzOB6ajwYbT+ZgEHfdG1gmwtU/myKntCoTE8RP
 v/ELp4X08xs2+98Vf6Rblm7QoG6R9ILHoKYfHbnU/SWMpkGVQFgEQPqAnJbY2/pkAxAr
 WG7AnF7jwaw2leoOVbVkKOumSxJBRUj5aYxMCj29YSV89XVBI2hk7B1b3l0FhiGhUo0F
 Kg3UHVQMP4W/5Tj7XIpBjSOPwqmxfFplXKlWLtTlF5c/Jn9ZiV5io3W1spmqhmhKdQn3
 EvUwRyAHurpYprhdcnP/OUFdTkUTeFwED8wOVhQ9ClKOeC7YLexo0hxYrAarA74T5b8V
 WSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789586946; x=1790191746;
 h=content-disposition:content-type:mime-version:message-id:subject:to
 :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WvDvypVENjkU+MVgeOuatoX6qvsGUH0zkDJXrZ4UAfY=;
 b=QgMOkvJcUAtCIETOs9vPQ4tFWwYwuCwiwwPQuSN8h14aL003I5tYIjdk/4Rq0CgInO
 eUWC4QBourRUYJ+ru5s9ISZlKdkVA3Zh5rGyJnE6pNZyTHkqBu3iIVwl/WSbUVKbyPGC
 1g8kGTIciQNXzfIrDaISvsYFoEcnofWcIJnEsh2FtGfrleG6WUINt5mXh7xACrxXgrsA
 9+NRpk5pd6+VgTBa11Vr0LCZjzp8P+qG9UOFWb0JiAWRUqHWTqfW+Z/L9VwECFWIikLz
 D3q5F7q5r39pFkZukpbJCgu66zOUW2HFR8rHkYkK9epR7P6xbzSDCwRL3ocnxE7ztXps
 imbw==
X-Gm-Message-State: AFuF++n7p0PNOB+Yq/3U17typeLM4yGfv6n0gssW3/qxy9CDp+4WsB+U
 3hwMz3KHY6FTdnC5ARYomZDeyqJyToQb7oEde3kZNaqrSNWLmwcr91y6FfjLt30=
X-Gm-Gg: AYBFou3dbK9jL5RI13kQEok2UteT9WU8/YCqe9Dnf2jrk8zRL4BRvpTmn9kubin3wOr
 zBeEKdEuIZQHni3KnlIGAKwBqD3xxVDtwyVcB75mFL8rX8p5tFtb85vl8+k/7YCb+ml9v09lK5k
 5hcvmeCH6V1tW4A1E4ygfl+pFrvLJnyNptZny6Er/iqDf6ZTL2SNm/aBvO3R9Dr86TQLG7k0Fi0
 F4KbKF0Lsqt9kYkQPWLC3Qe3YI9i6r9o2D6DcfY1aqyjmO8yprROJ+/caSIOtBxCZvTJ3n2hZn/
 V+UhffkkVb5vgKIKqs1Zf/K+KR3Sn7ymBDdtd0/kWG2flbomAgGrCAp7hltDhGNerI8bwGnCBa8
 SE/E8DSmmQ8B3C7/QmNrUMc9ADDKjP4bpG3JE3jzecLkWIhR/uvcbETrB7vQ1m6vkRQe2fFupEV
 A8eVMWXEP5ha4uPhNOCFiXbuqmD1263M0mgL6XYvuo34pbMyGiMZEfhw564vGIh0S0I1B1Zvacy
 Q2H/MaotrmosyoPQAY8N9k9+Je6m8ZyEoX2s/I84wUdVigi
X-Received: by 2002:a05:600c:1986:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-49ea528e2f5mr49990695e9.0.1789586945849; 
 Wed, 16 Sep 2026 12:29:05 -0700 (PDT)
Received: from einstein (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net.
 [82.1.211.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf413dcsm9474191f8f.31.2026.09.16.12.29.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 12:29:05 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:29:04 +0100
From: Javi Merino <merino.jav@gmail.com>
To: buildroot@buildroot.org
Message-ID: <aqrtmYhvhag_najL@einstein>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [infra] Missing tarball on sources.buildroot.net:
 gcc-14.2.0.tar.xz
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

Hi,

It appears that the tarball for gcc 14.2.0 (gcc-14.2.0.tar.xz) is missing from sources.buildroot.net.

Could someone please trigger a sync or upload the archive to sources.buildroot.net when you get a chance?

Thanks!
Javi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
