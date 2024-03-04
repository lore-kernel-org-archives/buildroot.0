Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C799C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E70F40BC3;
	Mon,  4 Mar 2024 11:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vn3MrJ9ARr8J; Mon,  4 Mar 2024 11:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 585FF40BBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 585FF40BBB;
	Mon,  4 Mar 2024 11:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10B3B1BF39F
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F18448204F
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szKYytJlKC0n for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F14882026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F14882026
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F14882026
 for <buildroot@busybox.net>; Mon,  4 Mar 2024 11:06:06 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412e88369a0so1113675e9.0
 for <buildroot@busybox.net>; Mon, 04 Mar 2024 03:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709550365; x=1710155165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuvDqtK6uuXld1fIrrQ6Qr6bsMY2N+P8VbioygsFDok=;
 b=IR4btaMA1dHgfqZyvq3FOA6k+B4i3VbqK4FhYiyKwgLUvPrg6qioCVYacEAmJpwKE2
 n1/ZvPU+ioRcjM9qNGsY4ustMB4fKy5zOyQxPOrAsIVJuZFnQFC9Z6r2J8vHxm7x6M1K
 hXDDmfv4lWcd/olQ308dpUIbnMG6WEGhIGob+EMlO3sIfbt/Z5Uq58AhUZZPHOqtXD0e
 IenOQgBCv27DUrFEFaOVXLsumbkZM7p1CfR8r3Jx8r6QEbh5pgBMZXKt04fWppgu2L5i
 L9RRxvUDBuNgBPl7p6iK0riHh8sde+iMBEh6QM6195QpvJ75+ggSOCa4TaThY1iI6TmG
 5Ysg==
X-Gm-Message-State: AOJu0YwVXF4b46Oj4pSX4o/deuWT+kYtHWitLbMfY0lBc6/sAkDUxj6r
 IcZjfvQ1cGkkeA6RAfSWazEpR8GI6xfKPY5BJQ6/j4CYc7k/QwGaakHLGigz7hc=
X-Google-Smtp-Source: AGHT+IFmWgjZTGI3bs3COAKHIW5kJUs/MNhAW0eVnsIaKTQRHF9oR3m9apy+DqVKJHkLfjDr7Q787Q==
X-Received: by 2002:a05:600c:548e:b0:412:e4f6:75ae with SMTP id
 iv14-20020a05600c548e00b00412e4f675aemr971470wmb.32.1709550364879; 
 Mon, 04 Mar 2024 03:06:04 -0800 (PST)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b00412b431eb0csm14228877wmo.14.2024.03.04.03.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 03:06:04 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: mf@go-sys.de
Date: Mon,  4 Mar 2024 12:06:03 +0100
Message-Id: <20240304110603.113120-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304075230.22399-1-mf@go-sys.de>
References: <20240304075230.22399-1-mf@go-sys.de>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,


This supersedes my bump patch 
https://patchwork.ozlabs.org/project/buildroot/patch/20240301121757.52642-2-thomas@devoogdt.com/
which I will drop since it doesn't contain the LICENSE.txt hash fix.


Thx,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
