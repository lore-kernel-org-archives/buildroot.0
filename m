Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02393CAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 11:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B602641BB2;
	Sat, 13 Sep 2025 11:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOSA6I0ATAAY; Sat, 13 Sep 2025 11:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B5841987
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B5841987;
	Sat, 13 Sep 2025 11:57:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B5212D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 589EC41983
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMupWAjlN2G3 for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 11:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B5FC4197D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B5FC4197D
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B5FC4197D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:57:06 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62ed3e929d1so3726692a12.3
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 04:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757764624; x=1758369424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2UKkz/7bNnR2D5g0/ZupqZ9+ptrusajaFohNl8Mlrw=;
 b=hFFswg10SyY56fkx4jCBQ7N3vNKobhkX6TEoZn1AM0kv4cO6DvjxtgOn4VXfn+qfuh
 LzJDTLWFhA7y1nWBqOM1J2SRipEDe5sE0RvyXE1Dr0qqEiMPsqi+IXlBK7kuuKx3H/tE
 l5OliQj/TdBijjpe/EGhrhRInnVFgMRcIfx6m4ho170Dd6y0Ux/Mx6Ihwuou9Z9xTOsu
 hl/68Zwu4eaux/2tqDevWyeDPneS6nbG1DespluJvlX0CRWENkIaE2DCTtOFlFxHy1aj
 1kZ5XQEGGuKOg4ZP+PiGrw6NiYCmitvSW+1W/uVxb9wN21Cxaj0PT5uFXtQ8xkRla6CC
 Ib+Q==
X-Gm-Message-State: AOJu0YzIl+cS5ZDILYOSXNnGUVdp+2Tv4+3qYf27ExWqyqfiezwOpCJr
 D01DgH+tDi2nIYbtzxEf+QzM/XLO0kkRWgxA9ugmv7hheAKy4lIJC1qWWoCb
X-Gm-Gg: ASbGncvyd5SuLuIZf43vG4FuxKsraiP9aw5FN76fuWQnyDDXC4APXErMzCgPPiB51bj
 DVevM5Q3L/yjBHivk97JC077ih1KOv/RLxwfzSSZ7/Tk4NZVue5H1B1qUbo1vEuOPiXFjdK+z98
 JLz+iHJe+IWL8pUoUOsuxP/zA/DAQmkjjt8ExIZAiIHUgM+gdneWk9Xa2p3z7UhDH2PjxMDeC5k
 XArLdFO61wnshenV/J8lyDtF6L4J68qu+PC9mzE2vDcKnqyvf33DJPm1/wjhXcpKdiI3dets2YI
 xOf0LY+/N/2k8/mgkD8sz42KLlkRDm1qSohs36QYCQJTIKtm0g4JjUIDf4iNUuqC2QvHW0qrxQk
 w6GZGjwzi0Uwb2Vrybw/hcH6EebHsl3FZulX20cmp5D33gANW
X-Google-Smtp-Source: AGHT+IHZEiwPbpGY8ynOHsPt+iFRvWUEJU+//cdbeUzREwR7xdnIJbmRcDzqyCmqIBfyduiTC8IwKw==
X-Received: by 2002:a05:6402:455b:b0:629:949c:a667 with SMTP id
 4fb4d7f45d1cf-62ed8523453mr5004113a12.31.1757764623705; 
 Sat, 13 Sep 2025 04:57:03 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec340e5acsm5056668a12.45.2025.09.13.04.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 04:57:03 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 13:56:48 +0200
Message-ID: <20250913115700.6479-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <464bde47-d2bc-4573-9264-5ab54f61d6da@rnout.be>
References: <464bde47-d2bc-4573-9264-5ab54f61d6da@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757764624; x=1758369424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2UKkz/7bNnR2D5g0/ZupqZ9+ptrusajaFohNl8Mlrw=;
 b=gv9MdoSfvXUCpWjzB2RJv/DIGp2ihJjoG/RA8ScyzaUjR8N125g/6Xy10pSnxt3HF5
 LmI6Z3v+pJ+g0k9scDByJ+Oon2LNUbeSR5m9WoIeObGTJdwBXsZNr7xtY44YWH/0WMy5
 rYQoSfhqPZcRuYfuC+bDHkwludXEiuaWzVUE8OgwNTw8phYYSyRB7n5kkPvmq8O9gCqo
 vTZAqk17Eggy+iEC74S42btCqyKIE8MVLu5vz+eTc5jfe+HElcAm7Au01htHtJ4DVDkb
 m7uKs7QzAo5tzmdl9PIyBDW51qLALCy6TKgaKCa8LiwyMQ4/tKQc7HLEBdohPDDgWQ1g
 zKgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gv9MdoSf
Subject: [Buildroot] [v2,1/1] package/nnn: new package
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

Hello Arnout,

I just noticed your changes in the patch. Thank you very much.

Regards, 
Alexander
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
