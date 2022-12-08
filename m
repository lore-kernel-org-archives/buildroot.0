Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06BDC3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 08:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 399E340644;
	Thu,  8 Dec 2022 08:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399E340644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RgGNZ-wosol; Thu,  8 Dec 2022 08:28:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC7D40339;
	Thu,  8 Dec 2022 08:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC7D40339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 968A41BF331
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 08:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7078E4087C
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 08:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7078E4087C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_E1lxu3kukF for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 08:28:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7478740448
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7478740448
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 08:28:43 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id m4so860259pls.4
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 00:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CiY77uNawi/mAIO1SzpFPGCFe85n518XgODgB1UoFMk=;
 b=iWstL+3Y6YsZ6AEUk8qcxoKOge9A4gNhkbtFg7EBIQW2/vmsmhd9VE0ubhBXrGzCzT
 Ze1rYjoBHH1x4giIYQvtdFrGty5ftoDPyeZbztxZhgpfHk07GCR57iyiYBaW304Vw9zA
 vuqWrJseHM07uN4gaDs1S101A12yJc7iUqmYjPnU2GYwimRpykRMfW7P+7/ARhJRUD36
 csMVuVggZIlw1G/BDImPt+eVGnIR31aomU/b65tdI1UhOldngoaIBRKVmcaCmOKDxsrq
 VgN+/Ttb7myV2P/EK5UcpuvoxP48bJVg9WxRKLqNUpMOZwYLHMZnWdRLEDeKeow/0DQJ
 eokQ==
X-Gm-Message-State: ANoB5pkhcPdV41qC5H2JDXP5MM3vxWm/t+fbDvNAlP86m1jRnAQxOKp5
 UjlfyCfBADA3js4WKmWUj+5kTgtaEpByYb7a/J6PEiE8jfs=
X-Google-Smtp-Source: AA0mqf40HGwkEb2Yely0UjzxlKUvE0JDrVFhXG2yAWijdc9CDwpdP+4dYbau96N+ZOFzdL1CmQ/5XtX/fbmDIa/u/po=
X-Received: by 2002:a17:903:153:b0:189:98a0:5f05 with SMTP id
 r19-20020a170903015300b0018998a05f05mr44939885plc.32.1670488122756; Thu, 08
 Dec 2022 00:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20221208072843.6806-1-heiko.thiery@gmail.com>
 <20221208072843.6806-2-heiko.thiery@gmail.com>
 <CAA3JqEeY1-E-gdw6oYMTDQ1o2pyT9YusGuA6rLUgt8EieZaWvQ@mail.gmail.com>
In-Reply-To: <CAA3JqEeY1-E-gdw6oYMTDQ1o2pyT9YusGuA6rLUgt8EieZaWvQ@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 8 Dec 2022 09:28:28 +0100
Message-ID: <CAEyMn7bs0eH3r3kpSdJT5E1U0zQ_OFKi7E_a-MAX2qaBXBeEcw@mail.gmail.com>
To: Aleksander Morgado <aleksander@aleksander.es>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CiY77uNawi/mAIO1SzpFPGCFe85n518XgODgB1UoFMk=;
 b=Oi6Nlx3KN5jlOFNrw0AR/I2vW3vnUsAXRzRUUNsQXmd9sOrC94tFpcMCsQfoqLYqRf
 lnekangKzFNjPVgZHhjy86e3/x3PNXKVJXvVT28j7k+cReByk4LCPfevlVNWEb5ICWKJ
 vvRSWDFrDP5M4M1O9JYdg8VBJwm3U39FzKfcU/WrIWKq+Ku1tRl25fu5U6C+yWKUxbs9
 vY2mZOX2qfp+8vTPQqavp8w6OwBpwFaSayGYpmpe/R9D3/+ERNOo63ve/v1wcilXPBS6
 JpsJXS3c6tz/ibrgPah2YmY3bupzQiP2Yqv29jQ4bl74WZb3ojU8g00Tv3lr2sOD+AmI
 yg9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Oi6Nlx3K
Subject: Re: [Buildroot] [PATCH 2/3] package/libqmi: bump version to 1.33.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Aleksander,

Am Do., 8. Dez. 2022 um 08:37 Uhr schrieb Aleksander Morgado
<aleksander@aleksander.es>:
>
> Hey,
>
> On Thu, Dec 8, 2022, 08:29 Heiko Thiery <heiko.thiery@gmail.com> wrote:
>>
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ---
>>  package/libqmi/libqmi.hash | 2 +-
>>  package/libqmi/libqmi.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
>> index dee2a94d93..79fcf08a12 100644
>> --- a/package/libqmi/libqmi.hash
>> +++ b/package/libqmi/libqmi.hash
>> @@ -1,4 +1,4 @@
>>  # Locally computed:
>>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
>> -sha256  b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5a5e  libqmi-1.30.8.tar.gz
>> +sha256  0a9c0209a0d62706c05f8e585812956924d7930a25032e1ee93352c59317a00b  libqmi-1.33.2.tar.gz
>> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
>> index 6b7f45729e..ee1e424a99 100644
>> --- a/package/libqmi/libqmi.mk
>> +++ b/package/libqmi/libqmi.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -LIBQMI_VERSION = 1.30.8
>> +LIBQMI_VERSION = 1.33.2
>>  LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
>>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>>  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
>> --
>> 2.20.1
>
>
>
> Please note, 1.33 is not a stable branch. The stable branch that works along with MM 1.20 is libqmi 1.32.

I will switch to the stable version 1.32.x.

-- 
Heiko


>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
