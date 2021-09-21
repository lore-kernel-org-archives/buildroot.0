Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DA3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:08:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC9061166
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FC9061166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4705A4022B;
	Tue, 21 Sep 2021 13:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2Ngb2RteJLb; Tue, 21 Sep 2021 13:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DB3403D3;
	Tue, 21 Sep 2021 13:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651A51BF30E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD4440563
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b5EBdliu-QX6 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:08:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 313654017D
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:08:12 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id DBFAD22384;
 Tue, 21 Sep 2021 08:08:10 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1632229690; bh=z+v/QrukXaQlRKGdT5qtO4cwnl44FvL29bfxnDgr/yE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Xl3fWTze5N4raIve6itkkuDsp9CnsJ3lTyju7GtG6QGEwLy7KlRDsDjDMWw6g6y7V
 32Pziq0jbo2CzmShPeL4BHn+Wf9vj50X2F3p5w7Y9nhZ5m5Ht6W+bBEp3huQI9EYFp
 jfNkoWe+Ghb4LAJ8ZWHeQFgCCUTWjf68lv0jyHEo=
To: Peter Seiderer <ps.report@gmx.net>
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
 <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
 <20210920234122.3cd8ed56@gmx.net>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <2913d23f-db1a-ce12-8f5b-ffa33911c35d@xes-inc.com>
Date: Tue, 21 Sep 2021 08:08:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920234122.3cd8ed56@gmx.net>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4147417859019968516=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This is a multi-part message in MIME format.
--===============4147417859019968516==
Content-Type: multipart/alternative;
 boundary="------------C83215CDBF63E073090F214C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C83215CDBF63E073090F214C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Peter, all,

On 9/20/21 4:41 PM, Peter Seiderer wrote:
> Hello Vincent,
>
> On Mon, 20 Sep 2021 16:19:57 -0500, Vincent Fazio <vfazio@xes-inc.com> wrote:
>
>> Peter,
>>
>> On 9/20/21 4:13 PM, Peter Seiderer wrote:
>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> ---
>>>    package/rpi-firmware/rpi-firmware.hash | 2 +-
>>>    package/rpi-firmware/rpi-firmware.mk   | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
>>> index 7127b2d824..d6243cb54c 100644
>>> --- a/package/rpi-firmware/rpi-firmware.hash
>>> +++ b/package/rpi-firmware/rpi-firmware.hash
>>> @@ -1,3 +1,3 @@
>>>    # Locally computed
>>> -sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
>>> +sha256  60be376238b08b928f98a25ecf90172067c17ad1db543d813409ee6c54b13b07  rpi-firmware-9f9708199f8809ecf16119d0716375bee7b7d8d4.tar.gz
>>>    sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
>>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
>>> index 181650fa08..6a2bf05248 100644
>>> --- a/package/rpi-firmware/rpi-firmware.mk
>>> +++ b/package/rpi-firmware/rpi-firmware.mk
>>> @@ -4,7 +4,7 @@
>>>    #
>>>    ################################################################################
>>>
>>> -RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
>>> +RPI_FIRMWARE_VERSION = 9f9708199f8809ecf16119d0716375bee7b7d8d4
>> There is a regression introduced with
>> https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1
>> See here: https://github.com/raspberrypi/firmware/issues/1619
>>
> Thanks for the info, only did a quick read of the PR 1619, the problem
> seems U-boot specific (not the buildroot default case) and there is
> already a suggested U-boot fix (submitted by you)?

Yes, sorry I was not very clear in my email yesterday (I was sending it 
on my way out the door).

Yes, u-boot is affected, though I think edk2 may also be affected. The 
u-boot patch has not yet been reviewed and may not make it for 2021.10

I just wanted to give a heads up that bumping this package could have 
consequences for some configurations.

> Regards,
> Peter
>
>
>>>    RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>>>    RPI_FIRMWARE_LICENSE = BSD-3-Clause
>>>    RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom

-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
http://www.xes-inc.com


--------------C83215CDBF63E073090F214C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="-1"><font face="monospace">Peter, all,</font></font><br>
    </p>
    <div class="moz-cite-prefix">On 9/20/21 4:41 PM, Peter Seiderer
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210920234122.3cd8ed56@gmx.net">
      <pre class="moz-quote-pre" wrap="">Hello Vincent,

On Mon, 20 Sep 2021 16:19:57 -0500, Vincent Fazio <a class="moz-txt-link-rfc2396E" href="mailto:vfazio@xes-inc.com">&lt;vfazio@xes-inc.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Peter,

On 9/20/21 4:13 PM, Peter Seiderer wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Signed-off-by: Peter Seiderer <a class="moz-txt-link-rfc2396E" href="mailto:ps.report@gmx.net">&lt;ps.report@gmx.net&gt;</a>
---
  package/rpi-firmware/rpi-firmware.hash | 2 +-
  package/rpi-firmware/rpi-firmware.mk   | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7127b2d824..d6243cb54c 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
  # Locally computed
-sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
+sha256  60be376238b08b928f98a25ecf90172067c17ad1db543d813409ee6c54b13b07  rpi-firmware-9f9708199f8809ecf16119d0716375bee7b7d8d4.tar.gz
  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 181650fa08..6a2bf05248 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
  #
  ################################################################################

-RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
+RPI_FIRMWARE_VERSION = 9f9708199f8809ecf16119d0716375bee7b7d8d4
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
There is a regression introduced with
<a class="moz-txt-link-freetext" href="https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1">https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1</a>
See here: <a class="moz-txt-link-freetext" href="https://github.com/raspberrypi/firmware/issues/1619">https://github.com/raspberrypi/firmware/issues/1619</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for the info, only did a quick read of the PR 1619, the problem
seems U-boot specific (not the buildroot default case) and there is
already a suggested U-boot fix (submitted by you)?
</pre>
    </blockquote>
    <p>Yes, sorry I was not very clear in my email yesterday (I was
      sending it on my way out the door).</p>
    <p>Yes, u-boot is affected, though I think edk2 may also be
      affected. The u-boot patch has not yet been reviewed and may not
      make it for 2021.10</p>
    <p>I just wanted to give a heads up that bumping this package could
      have consequences for some configurations. <br>
    </p>
    <blockquote type="cite" cite="mid:20210920234122.3cd8ed56@gmx.net">
      <pre class="moz-quote-pre" wrap="">
Regards,
Peter


</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
  RPI_FIRMWARE_LICENSE = BSD-3-Clause
  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
<a class="moz-txt-link-freetext" href="http://www.xes-inc.com">http://www.xes-inc.com</a></pre>
  </body>
</html>

--------------C83215CDBF63E073090F214C--

--===============4147417859019968516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4147417859019968516==--
