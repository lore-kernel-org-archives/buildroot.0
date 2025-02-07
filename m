Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78B0C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 12:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 899BD80F59;
	Fri,  7 Feb 2025 12:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tX4XzCaY-6n; Fri,  7 Feb 2025 12:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF7E83F87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF7E83F87;
	Fri,  7 Feb 2025 12:03:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB9DBCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 12:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D2F781FEB
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 12:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FeKo1BlSFw2 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 12:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.42;
 helo=mail-wm1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC67F80F59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC67F80F59
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC67F80F59
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 12:03:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso13033595e9.2
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 04:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738929805; x=1739534605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W86A0RzDyrSgkAl898d9e7bWgfBIX4sm5d9sYj9OHaY=;
 b=ZZLEvHGzdfR/wcXC3GanWN4hawSob031Ih0Ped4toyk3rGSnDqZVKKPA3wElT1cyna
 N5tX/GBnW55Jg6LYWDMdJQIep7TdGZdlOZH4HOgxMmjhdKALK+rr24FJ5CeNp6PDjyrJ
 Jot6i4fRpMtQMWYLrMsn8D8YzB/vSGDLs095oGcBvsDGXUHuD54QROKCuXDjB2ZT8aHn
 h5uidEzhEkh5/CUIT8wIMJCrEy7TmLBO1g2sVlCMv1bxZGYXjBihk0RDU6QmoaiFjg/U
 HCWye/6a6F0lTxHhDSgas3EqdLz7utSwT6jUZs5SKs5nQ4r2raVRSvrM7MKKysnjYzpQ
 XihQ==
X-Gm-Message-State: AOJu0Yx//FRUzwYv9TTsTPAE8ahKL4x6BSZG4+ERTDOyNLA8UzSXTcqc
 bZztIy6f6Bb5sXnJz/4X0/9uJJ7GyFdO/BdILbILLTMTsgOmjQmsObA3pcgMFMc=
X-Gm-Gg: ASbGncuaW+V4QQV7NeBc0BW/BSjWUQ8lMspEQ+NDMXhQDv1tclfLaZ9RR1KZrAIJ3TO
 5pv1fL8DbYxC+ptcwwpW3GlFww5AvJGeqzrzDONSOVvg+4SWVVZM1bNy1fuhRDNNKzBddelOTq0
 oTH5XKEBS6SgXO/0n2WGApjf4BrHBujKhsjBdhlTqEJUas9mdH1mZl0ZyV2go1MXLl60RVdDWGQ
 R9pQjZuzxXOQIZy8ieirBVINLt4ghEzmo5O2BigMNejlZlLLiMj6D4PgEZfk7YLzWJ5mmBX7JbE
 oQr0UMnlJ5+T0qDw9+K4XZrEDqlvhFUSnozOK7QPzN14NA==
X-Google-Smtp-Source: AGHT+IGH69VjuPswL2kqrNJFyZVVIgmXTePQdLuFSzrcCF5YHskEhiUL7PfGj2jjOGZ9j4QiiwVguQ==
X-Received: by 2002:a05:600c:1e83:b0:432:d797:404a with SMTP id
 5b1f17b1804b1-439249a4028mr21839935e9.22.1738929804319; 
 Fri, 07 Feb 2025 04:03:24 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:c6ae:4084:c50f:f7ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd35e88sm4237734f8f.26.2025.02.07.04.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 04:03:23 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: eagle.alexander923@gmail.com
Cc: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 13:03:00 +0100
Message-ID: <20250207120300.112124-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206070910.1423800-1-eagle.alexander923@gmail.com>
References: <20250206070910.1423800-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/sdl2: Add wayland support
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

Hi Alexander,


This patch duplicates https://patchwork.ozlabs.org/project/buildroot/patch/20240830175229.2619362-1-thomas@devoogdt.com/,
can you verify that one? 

Just reply to that patch with:
Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>


Kr,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
