Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA75AC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F9466143C;
	Thu, 11 Jan 2024 04:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F9466143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmrrDBtrOVa4; Thu, 11 Jan 2024 04:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2EB613EF;
	Thu, 11 Jan 2024 04:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2EB613EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 060931BF8B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3601613D7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3601613D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezsT0n2xkP9b for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:55:56 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C641613B7
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C641613B7
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e7c6e3c63so5177285e87.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704948954; x=1705553754;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/0dpdjCCoWZ8IYWI+8cAg7dKCEu4+pSivzeD+I7X1k=;
 b=N3FZtfOTY4zXJOHBE9WnkRI9u5UcS+plD8MX1oeJ5XoHS8Gihq9FIUNrb2Ry0996Vy
 kip5F5Ki7ABkz/kFeKnsvD8WSR7bvJbfxDzr8mt5nfEo74ABUnjVzD46ZqLw41pA7qB8
 VKN1aokn/63hChpeNrgeV7p7GV/U5pdNE09DM5sUN3WaPiysHnt58hAo4dWziTaRGvVE
 ohqiQJdBG6HaCE/CSu5brV6rEXXU+ufuBAIgshsF/DDc77s2uUyEnnYRD+yBhCtFS+Jw
 P664FaBC8fCFbgUgpiXN+if4xHM7mDgy8InaClRGS0/fsIyMyWUyZuCBCh/Sq47Pu5tI
 CFmA==
X-Gm-Message-State: AOJu0Yyy/66//Jzd/8EHUab0DGynVPceOXdwgNS8TiLRXnaKOb8BWy+V
 ebdWmtyJuvfapSqCr+MdMCU=
X-Google-Smtp-Source: AGHT+IGUnuRfQy+aoeAl9hjw4VqCgeYUD995JQ3rcTsWWGRlOPwTK+v/CXXboRK8yUvmjklYQB1k7Q==
X-Received: by 2002:a05:6512:b03:b0:50e:9872:ae83 with SMTP id
 w3-20020a0565120b0300b0050e9872ae83mr125613lfu.12.1704948953402; 
 Wed, 10 Jan 2024 20:55:53 -0800 (PST)
Received: from gimli ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 br36-20020a056512402400b0050e64a74eedsm56101lfb.188.2024.01.10.20.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:55:52 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20240110220232.1269657-1-fontaine.fabrice@gmail.com>
References: <20240110220232.1269657-1-fontaine.fabrice@gmail.com>
Date: Thu, 11 Jan 2024 05:55:52 +0100
Message-ID: <86mstcbh9j.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704948954; x=1705553754; darn=buildroot.org;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=z/0dpdjCCoWZ8IYWI+8cAg7dKCEu4+pSivzeD+I7X1k=;
 b=AFfWUj4PnagAMcW1/u0wANa2B9RssVWIDdvle+yLGqdfg/9PKa+yoO0y+petG0G7NS
 n5dK1p+0JdLFsT6DkAlT3FncSLVigJSTn9IxeiYBmdGa4ilriQNQjKqR8ZF9CPRl+4yN
 zSnFbip3Sn8MKbm97psnBsqDkv1XDvzuF2NwfzvZ83oIdTGLEVbRXC2UphHGWCYMAiB/
 DPKxUH/ED6dxEa28MavooadoKI/1fQVh6MeI8xuj1ZiF2G0bpeeFYYneFW/EZaFbkqSs
 T7zMyrErUZksaQhYI+VuO5o3wAUsqdncNviIpDLnM918iaTUnHKTtLQocuyarWI8+3my
 KS7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AFfWUj4P
Subject: Re: [Buildroot] [PATCH 1/1] package/libuev: security bump to
 version 2.4.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 10, 2024 at 23:02, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> - Fix #27: possible buffer overrun in uev_run()
> - Update hash of LICENSE file (update in year with
>   https://github.com/troglobit/libuev/commit/0f5909615439d2a3d6a9b44f5a7570e071b90448)
>
> https://github.com/troglobit/libuev/blob/v2.4.1/ChangeLog.md
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
