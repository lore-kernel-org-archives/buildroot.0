Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6A3EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B03613C4;
	Fri, 13 Feb 2026 19:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivfE6e2CI8AR; Fri, 13 Feb 2026 19:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363DC616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011566;
	bh=rRU9NToLkMIyzl0d9IpX6repgWlqbQFt1/W9QuH7210=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ayCFi2xyEcVY+r70yIZ9udjTAUeI5izNkl8wnoEpbe6c2ouo9dx7QI0ZJNLqZlAHl
	 cYwVmjxakuzm0c2cedF1GP4z8O5BhyhSOzIYzuO6uiqH07cD+GgbvR3rdqOPGVFcFU
	 mavV7FAb6PiGlcd7nQ9PrzMi/nV1TtXUb3lflm0RkAJokF7kJ1LCp8LphMgWeuNuag
	 cdtVJVuJZNIWtaMfuyX0YcV6OfZlQn5SmdSfsQ8fzKl6cVBv+dTIO4xhOA1Febj7sp
	 5LaAQS2XIHbMVeg3Qj28c0RCLtqhMxeKoNJSkWSKL1tIdICUlQBh7tGfPGDohsXSrr
	 0BnOxkGNdCzGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363DC616DA;
	Fri, 13 Feb 2026 19:39:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02828EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6A0861612
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0qcyXtCd-zI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBB2461395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB2461395
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBB2461395
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-482f2599980so14465795e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011485; x=1771616285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x7qUzhGp4Tkwng6U8wMhRTD2ISzyFNDWK2lbYtdyMMQ=;
 b=U8wSX3q06aNmqAyEkuroYglZDWCM/mBHFlWeEajF2t8B2qH+eQDJEyzX1O8e42gYtw
 pzRFMplcmGzXNp/yOYnx0TXLDJEnUGnqvFhGoDbWFiaWpjJ/lLmYrhajJ+AOFZlDj0MC
 wbNrzPfBqK3oTTHj7E2UWJfe0VgUIWnmpXs6xEVl1JRIuOGjZm4b3jdGzU4asndfBUFX
 UxxgD4Vdm/LTYHfKpqLarXq28/KasEVdqkYS4DSci2NIj4yMHGWPSAucdsD8EvkKWC0+
 dMwXdKoFVqaYuPNH9lLhfEIT9vC5FgVsSEvxlu/6EHurTCpK/F6EwHnN4OejPXRJLFDm
 BgDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCZLUU9xYk6WZqXWakz9xPNanzDwTMtOeMRVkDJR3u34pbzCx38JizNxSDBnANCD14BgRUKGh1Q0Q=@buildroot.org
X-Gm-Message-State: AOJu0YyS5W+mj9uXINOPp6RCtPAWqvt1WM86mNMMsrYmzqpW3MWi+2+p
 7k75JhtzDtbrX2dUTqgptInupoH+cSyEXIy4jn9BMAY70N4VVW+qjAbpN/Kzg8DBZts=
X-Gm-Gg: AZuq6aKR6ZqkPvhbnbKoMNC0PTg/fLnT3xZ7ga4s/S4ZEKl/5IbyS6my8lh7BCvRqzx
 B64nIWkQGMOntBex5XqdPaRbtE3V6msb/CWqzzDfL9FOYVnD+rX/d/VT6z02CjYgumBUrKe/iSt
 HIQ0EntJFKmn4W3DB0uAP/R2OsOH/TGzpU1IVmCxGrvWUDqV9lMaRU0qA6/BpjsBJjMlDEF5u4i
 0z9v93X87VltOOTbpwx9eyl1O3h3TbRoy/vU7pgV81hFVs2zOQBylrkUs4PanXj+57bp/qzgZd1
 DWoyI92OsnmABUN4atliLWZoQIep4mILtmo0Yq0qg5r3Ve8dfWC3Uj+hWb+KhOzw8X9+UMjVIYj
 icN65bNqgzAeMmbvIVgvdtsLedZLS6M1qdi91vfa1KY5yM3FFZ25uu1KEMYPapiRzUNcp8n+3Hl
 8FPqqb6/uHUJzqtxc=
X-Received: by 2002:a05:6000:4305:b0:437:6dfe:1b89 with SMTP id
 ffacd0b85a97d-4379794331cmr5941392f8f.61.1771011484882; 
 Fri, 13 Feb 2026 11:38:04 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm7705995f8f.24.2026.02.13.11.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:04 -0800 (PST)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:03 +0100
Message-ID: <20260213193803.41588-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aYDg9IRuE64VYwWa@waldemar-brodkorb.de>
References: <aYDg9IRuE64VYwWa@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011485; x=1771616285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7qUzhGp4Tkwng6U8wMhRTD2ISzyFNDWK2lbYtdyMMQ=;
 b=Oy9adX3tNdHaldJiYuUPVC/IkxDrpUn4LTxNYgLezVqrQRFYzm4I+4oyNBKal8AXyX
 cpJYrAOfvF7ibRS2KVNl0FiHIzjCQiK397rvj87mhaa8qWTByVZeWSgY8M4MGS3qeCdR
 4ULe6xRV0+m3lNt4Ql9B7T2m17MrEqBPCJkBsKVrs8X4xKkWV2JegaFv9XflTTMLpCj0
 7G5UCcQQOAz35IcxzvjanA8hQxqAsiYZV+d3Kq8oGNKNkr8UWqaJrISddb+WrF+JjKP2
 k3wjtV9z4YKYMypJXO/diUC+v7VYoPqtK/pIKFrm1bDjJsKqkE1ilgSa8ass4rUAlk/c
 iFjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Oy9adX3t
Subject: Re: [Buildroot] [PATCH] package/asterisk: add workaround to fix
 build issues
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
> Sometimes asterisk buildsystem decides to remove our own
> build menuselect stuff for the host. And then fails to
> run the cross-compiled binary.
> 
> Add a patch to avoid removal of the menuselect stuff.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/5f7/5f76f032ee596e928089b064b01f08adacade47a/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...0005-Makefile-don-t-clean-menuselect.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
> 
> diff --git a/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
> new file mode 100644
> index 0000000000..79c3174853
> --- /dev/null
> +++ b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
> @@ -0,0 +1,26 @@
> +From 844c1cddf38fd91e15a93eef96c67a5834fc9a78 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Sat, 10 Jan 2026 12:25:30 +0100
> +Subject: [PATCH] Makefile: don't clean menuselect
> +
> +Upstream: not applicable
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index b57f77477f..80035a09e7 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -436,7 +436,6 @@ _clean:
> + 	rm -f doxygen.log
> + 	rm -rf latex
> + 	rm -f rest-api-templates/*.pyc
> +-	@$(MAKE) -C menuselect clean
> + 	cp -f .cleancount .lastclean
> + 
> + dist-clean: distclean
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
