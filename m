Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F45FC77B73
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 14:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E513583563;
	Wed, 31 May 2023 14:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E513583563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lSV3OQKK7cS; Wed, 31 May 2023 14:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12458834B9;
	Wed, 31 May 2023 14:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12458834B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDE371BF5A6
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 14:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5155834B9
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 14:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5155834B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNZgppZzmFAH for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 14:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A6AF833CD
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A6AF833CD
 for <buildroot@buildroot.org>; Wed, 31 May 2023 14:09:23 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af2958db45so61869231fa.1
 for <buildroot@buildroot.org>; Wed, 31 May 2023 07:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685542161; x=1688134161;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7YrAgL3pCqGmMVvZBmtjCtss6Mv+wsDUnpfAP1/nX1c=;
 b=GcmpIz+RR2xhl/dTAgDSExBW9UMID4GcDC54l5WIF6zYRiA2VUBGTYGiKwQRRtrnB3
 NH84Q+FQIWBW7uaoCbnc5Gu1JbJBFyzPzH0dsb+HdY0QZ5zLW5+Mt5haaUVGJrfIywEr
 C5UyVJPys0xGKHcndkgpELHYji9fBeAoqFZhTUxckwrHz4DHX9tv8+r/kQNNTiEblryl
 5iWz5u8OEK3GvIW6pHvOTmFTwu/GKawNQG/j1PoWgoW4JqyhGETGLm8seNlxEv5tFuZR
 wCcW5jnA88N0XcLudyXezC1LGoq63p8eaGuOLYSMLLGfsEX5tuGVqG/ZcxDGALLmqek9
 ifBQ==
X-Gm-Message-State: AC+VfDzb3c9koxT77mYfUSBRvZoUgCe+nb2MJbEzV/JbBh4q+OIMqqp4
 TswbH084kBiDxeUe1pC/OsMMe2eTzXrfff/RU4fpdtiDvY0=
X-Google-Smtp-Source: ACHHUZ6BO9l/IPFbqy0UMpUemr+mXiuhvkqFiZYdKXRwmw1x6M1JLnjrHl42p//i4XXyuwdzRZCBXvFzHi0ZCfkNE6o=
X-Received: by 2002:a2e:8018:0:b0:2af:3147:86d8 with SMTP id
 j24-20020a2e8018000000b002af314786d8mr2709980ljg.15.1685542160640; Wed, 31
 May 2023 07:09:20 -0700 (PDT)
MIME-Version: 1.0
From: Andy Bergh <allmyaddmin@gmail.com>
Date: Wed, 31 May 2023 16:08:54 +0200
Message-ID: <CAAmck7W3kdHCG00vBC_Umv48z4C5yMRVi--+WNGSkeREaTPMjg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685542161; x=1688134161;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7YrAgL3pCqGmMVvZBmtjCtss6Mv+wsDUnpfAP1/nX1c=;
 b=HTBZKUKtgLUl8YVBzk5Rjkk9x/uMZ7icjG+5hIOzHd3dD+DySo0PEe9DcxnhmQ3ZGb
 aN2cPijLJG/tR53NZIksIRKOce7GllDmzMZ6SjR/3CpWnFgKLwzZXzBtpyWl8gbIEbPP
 RDpwx2lnjRlh/VfoQOTd6jmexEcbtAyonxnwtwNMqEJ9n802Zq1WVn386Q5c4MiHIgCj
 L3e8mQ7WL6A+Hl8iX0GQNjkE9LpxetNl+YkbsGiM2L4MegHCsowd00JE4POpbBu/CLU8
 fnaZ9CZ5UdQ8Tc7BfcvorXBwFZahqMsrQCOb58vnh6kMJUgOcKDGJIFaBPF8tVMJDVFi
 Inug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HTBZKUKt
Subject: [Buildroot] cpufreq: cpufreq_online: CPU0: Running at unlisted freq
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
Content-Type: multipart/mixed; boundary="===============6416395421825555413=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6416395421825555413==
Content-Type: multipart/alternative; boundary="000000000000bd301205fcfdddc4"

--000000000000bd301205fcfdddc4
Content-Type: text/plain; charset="UTF-8"

Hi,

I was not able to access the mailing list to search for this topic, I hope
I am not repeating the question.

I am running a custom OS for the Beaglebone Black and am using the serial
port to talk to an external LCD screen via UART1.
This works most of the time at startup, but about 15% after powering on the
board the LCD does not work. It looks like the BAUD
rate on my OS is slightly off.

After having a look at the console startup log I noticed that only on a
failure do the following messages appear:
...
Calibrating delay loop... *915.86* BogoMIPS (lpj=4579328) *// On a
normal/working startup the output is: 996.14 BogoMIPS (lpj=4980736)*
...
[4.214981] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 923076
KHz
[4.450726] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency
changed to: 1000000 KHz
...
I have searched extensively on the internet but could not resolve the issue.
Based on what I read I also double checked the blob/*.dts files and
everything seems in order. I used this link
<https://software-dl.ti.com/processor-sdk-linux/esd/docs/06_03_00_106/AM335X/linux/Foundational_Components/Kernel/Kernel_Drivers/Power_Management.html#power-management>
to verify my setup.

Would anyone be able to point me in the right direction regarding this
issue? How can I resolve this "*Running at unlisted freq*" warning?
Any information would be much appreciated. I am at a loss here.

Thank you and regards
Andy

--000000000000bd301205fcfdddc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I was not able to access=
 the mailing list to search for this topic, I hope I am not repeating the q=
uestion.</div><div><br></div><div>I am running a custom OS for the Beaglebo=
ne Black and am using the serial port to talk to an external LCD screen via=
 UART1.</div><div>This works most of=C2=A0the time at startup, but about 15=
% after powering on the board the LCD does not work. It looks like the BAUD=
</div><div>rate on my OS is slightly off.</div><div><br></div><div>After ha=
ving a look at the console startup log I noticed that only on a failure do =
the following messages appear:<br></div><div>...<br></div><div>Calibrating =
delay loop... <b>915.86</b> BogoMIPS (lpj=3D4579328) <i>// On a normal/work=
ing startup the output is: <b>996.14</b> BogoMIPS (lpj=3D4980736)</i></div>=
<div>...<br></div><div>[4.214981] cpufreq: cpufreq_online: CPU0: Running at=
 unlisted freq: 923076 KHz<br>[4.450726] cpufreq: cpufreq_online: CPU0: Unl=
isted initial frequency changed to: 1000000 KHz</div><div>...</div><div>I h=
ave searched extensively on the internet but could not resolve the issue.</=
div><div>Based on what I read I also double checked the blob/*.dts files an=
d everything seems in order. I used <a href=3D"https://software-dl.ti.com/p=
rocessor-sdk-linux/esd/docs/06_03_00_106/AM335X/linux/Foundational_Componen=
ts/Kernel/Kernel_Drivers/Power_Management.html#power-management">this link<=
/a> to verify my setup.</div><div><br></div><div>Would anyone be able to po=
int me in the right direction regarding this issue? How can I resolve this =
&quot;<b><i>Running at unlisted freq</i></b>&quot; warning?<br></div><div>A=
ny information would be much appreciated. I am at a loss here.</div><div><b=
r></div><div>Thank you and regards</div><div>Andy<br></div><div><br></div><=
div><br></div></div>

--000000000000bd301205fcfdddc4--

--===============6416395421825555413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6416395421825555413==--
