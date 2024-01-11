Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE4FC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E776143E;
	Thu, 11 Jan 2024 04:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25E776143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YF0aexVJDEw; Thu, 11 Jan 2024 04:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A309B613D7;
	Thu, 11 Jan 2024 04:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A309B613D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6BB1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1773840A2F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1773840A2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLYGm0SAACFD for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:56:26 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD29B40236
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD29B40236
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so5534223e87.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704948983; x=1705553783;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kGoaJqBiFRQyek3Y2+h4JlGajtbuCqfaVxAvdgeqOew=;
 b=NkGp06v9k3/55aDSYqiMjUb5Da6iPbN0QZkD44IZsCQcHvrkEJMXQRhWrasdlgophX
 fRKDpOYXAoC9ySI8esW80jvuZ8HQ57d904xWzKi7+4N9mCXpalbyldwYJbybT6/T9zvN
 Ket0zdxq7QxUYFhR0tohQS7G1RTmRbRnNM9RmcXqrIuZfEUX13VBbbJGcK2T+Au1Qj64
 nD3aoAxx5SD1JU5Wf42eKxEMdogTtcDTOgiUZPgngUVHpncGJkZlOCEU1ydaHMo6HT4Z
 c3bUDBAzMo132akHWGqVusYmag4IzDPksSFYp36UuK6LUX1yG3HSP4SQXlPooTEQybtC
 w/Bw==
X-Gm-Message-State: AOJu0YwHQhK9Td1T9MYtnTvueNdTAERiz6jBMFeZbnBBBRk6xxlwqgrR
 MqeAD2/jqNB+Zr/7xWGt7o3w8UnicLrgrQ==
X-Google-Smtp-Source: AGHT+IEnZ2IuYNII2VNOeKu/71BSHiyOWe9fLZkEFgeGoOWBansIVW9eZNOAPXyBnYqVsXcBv5LzAw==
X-Received: by 2002:a05:6512:4c9:b0:50e:1d6a:48d4 with SMTP id
 w9-20020a05651204c900b0050e1d6a48d4mr133973lfq.122.1704948983147; 
 Wed, 10 Jan 2024 20:56:23 -0800 (PST)
Received: from gimli ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 bp37-20020a05651215a500b0050ed756b593sm57938lfb.130.2024.01.10.20.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:56:22 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20240110220232.1269657-1-fontaine.fabrice@gmail.com>
References: <20240110220232.1269657-1-fontaine.fabrice@gmail.com>
Date: Thu, 11 Jan 2024 05:56:22 +0100
Message-ID: <86le8wbh8p.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704948983; x=1705553783; darn=buildroot.org;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=kGoaJqBiFRQyek3Y2+h4JlGajtbuCqfaVxAvdgeqOew=;
 b=BNtBS9e9z2KGkF6FKA4wjd34jYC0NEuV7zONU5doET1fqJNfJIlEZLZ1JAbWAP/eHl
 mFN836RVHH/pE3NzTas282FSXxtZNTeLdx/GvXwmueDWTbJnHoP8mOp+HvZ5DjlnlRtC
 CYsXtvzpOGCX1BRaaymG9SoLd2MH0eDiNbeyGw4Yswz1pjxcyZfS9zHP/qNRKPSoxG2z
 VBvi/IP/7ldvuW4jFd1SmCy0urROz/efSV8T7VRG7OZHH0QlttfsK/OW2NWTriCg3+xj
 qxFvnorVKyUC0NQwL3bVKmZtHDhQJmF0ovonaa5CoU9SO7rS4eN8rrrja0Tdci3YSIE8
 XlbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BNtBS9e9
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

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
