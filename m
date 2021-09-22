Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,HTML_OBFUSCATE_10_20,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3BFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 00:17:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B96161166
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 00:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B96161166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DED240696;
	Wed, 22 Sep 2021 00:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id loCugmHXkCPy; Wed, 22 Sep 2021 00:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A6340694;
	Wed, 22 Sep 2021 00:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A029F1BF44C
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 00:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C4B382EAD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 00:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uROnkfb_Pwsp for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 00:17:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E12B82CDE
 for <buildroot@busybox.net>; Wed, 22 Sep 2021 00:17:08 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id t1so815927pgv.3
 for <buildroot@busybox.net>; Tue, 21 Sep 2021 17:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=JndYN5zOZFgI9sIQHXMBjvGAGl5Lm6MdmtaS9Y/eFK4=;
 b=i0X4X+5VClAp/00f39us5aTtI7bV3SDe/DLuXcwUFbI/Rc7fH+TsMzpQbxrCaqeZrD
 Ao9C+w+n8lAKBtezByAdlsqe/j8LbzrC0LTJlMtWB6ZU+ibniU4p+13s4sgwJuUwFtmM
 t1hb20TLXYU6PNsQQ8pzTUZPUgzk9zH1+bBZC+XI8aB5Mzu1SvZWQduNErlK5wMEZflB
 ZMC7l1J9TGnKVlAvqLnJXfG8UUyEWYzep3DWDo8IDiAFGNL6ERrXwAE74YNgVAiYg2xF
 Wg1jU8wvelqgZ5Ml+QCXdxKY/DHNSsRnD3WOlyqe2t3q5d2EGJlSu04nIuh+9pJLpFoj
 CYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JndYN5zOZFgI9sIQHXMBjvGAGl5Lm6MdmtaS9Y/eFK4=;
 b=DPVXnnsF2AUwkSPYrMzSLW4FnevRfcte12/trfXpGZfAIgglBKK0yiLgdunee+rARq
 qzYpY9EK8ZwHEivp63L+5EwQP94zkJIc/Wnzb9JSneXviI2kgvh3PrTDKwILyHLEKG/Y
 gMtg8XUM9mUhREsrea/ULMUMueL9b1eq6YauKn2v1tVdwM1ECUg+pW+w7hKzB+tAfYjT
 FyLPc3GwmeqTeDBIHFhQ9r5BfFf7QX6ZW9D9bO5udnolD2Kx1wLpo80DdcLZ47QZHNJ8
 nJN1PUwTMmAKBMXkfFPykb416TQWVkgOImDTzEDfJ+69JUp8sd8KqeKuctd+lSAPwLTE
 TlHA==
X-Gm-Message-State: AOAM532MQa2ZtPd6Qhir6pXPtpM1pgAYUdO+brSfNptm98BQY9jxL7kf
 RQPxdIJeddXfNCJ02DpRqQ4wq6DRS27e6ol8OaiweZizitc=
X-Google-Smtp-Source: ABdhPJxaq5tZBMxpjTCQhOmnMFa/2XzktnfYbqf6d4E7qjhTR4EsqpkpXxI3IW3e72UdVWsQbw0A8Ncx1cxL+wZYQQU=
X-Received: by 2002:aa7:9832:0:b0:44b:232a:a15d with SMTP id
 q18-20020aa79832000000b0044b232aa15dmr332261pfl.51.1632269826879; Tue, 21 Sep
 2021 17:17:06 -0700 (PDT)
MIME-Version: 1.0
From: Jeremy Fleischman <jeremyfleischman@gmail.com>
Date: Tue, 21 Sep 2021 17:16:55 -0700
Message-ID: <CAHpv4cOfQv_PoRU0YN3NANLjcK9tooxUM-zFcQm-t2Xc0zP5xQ@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Recommended way to auto-reconnect wifi?
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
Content-Type: multipart/mixed; boundary="===============3776183688290281420=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============3776183688290281420==
Content-Type: multipart/alternative; boundary="0000000000003575cf05cc8a6f18"

--0000000000003575cf05cc8a6f18
Content-Type: text/plain; charset="UTF-8"

I've been happily using buildroot for a growing number of Raspberry PIs at
home. However, I've noticed that whenever our wifi cuts out, they do not
reconnect when it comes back.

I've got them configured using BusyBox init + mdev + ifupdown +
wpa_supplicant. I've skimmed through /etc/inittab, and I think I understand
how everything is wired together:

  - /etc/init.d/S10mdev: mdev starts up, and asynchronously starts
discovering devices.
  - /etc/init.d/S40network: This runs /sbin/ifup -a. I think this runs
while mdev is still discovering devices, which is fine, because there's a
wait-delay configured in /etc/network/interfaces:

# cat /etc/network/interfaces
auto lo
iface lo inet loopback

auto wlan0
iface wlan0 inet dhcp
    hostname thermometer
    pre-up wpa_supplicant -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf -B
    post-down killall -q wpa_supplicant
    *wait-delay 15*

iface default inet dhcp

As far as I can tell, this all only ever happens at startup, and there
isn't any mechanism that would attempt to reconnect to a wifi network after
a disconnect. I've done some googling, and here's what I've learned:

  - I'm pretty sure that wpa_supplicant is not supposed to handle this.
  - It looks like some people write scripts to handle this for themselves.
See this SO answer <https://raspberrypi.stackexchange.com/a/5121> and
this dweeber/WiFi_Check
repo <https://github.com/dweeber/WiFi_Check>.

Am I correct that this is something I should fix by adding some sort of
background/cron process to do something like the WiFi_Check script above?
Or is this something buildroot does have baked in support for, and I just
haven't found it yet?

Thanks,
Jeremy

--0000000000003575cf05cc8a6f18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve been happily using buildroot for a growing number=
 of Raspberry PIs at home. However, I&#39;ve noticed that whenever our=C2=
=A0<span class=3D"gmail-il">wifi</span>=C2=A0cuts out, they do not=C2=A0<sp=
an class=3D"gmail-il">reconnect</span>=C2=A0when it comes back.<br><br>I&#3=
9;ve got them configured using BusyBox init + mdev + ifupdown + wpa_supplic=
ant. I&#39;ve skimmed through /etc/inittab, and I think I understand how ev=
erything is wired together:<br><br>=C2=A0 - /etc/init.d/S10mdev: mdev start=
s up, and asynchronously starts discovering devices.<br>=C2=A0 - /etc/init.=
d/S40network: This runs /sbin/ifup -a. I think this runs while mdev is stil=
l discovering devices, which is fine, because there&#39;s a wait-delay conf=
igured in /etc/network/interfaces:<br><br><font face=3D"monospace"># cat /e=
tc/network/interfaces<br><span class=3D"gmail-il">auto</span>=C2=A0lo<br>if=
ace lo inet loopback<br><br><span class=3D"gmail-il">auto</span>=C2=A0wlan0=
<br>iface wlan0 inet dhcp<br>=C2=A0 =C2=A0 hostname thermometer<br>=C2=A0 =
=C2=A0 pre-up wpa_supplicant -D nl80211 -i wlan0 -c /etc/wpa_supplicant.con=
f -B<br>=C2=A0 =C2=A0 post-down killall -q wpa_supplicant<br>=C2=A0 =C2=A0 =
<b>wait-delay 15</b><br><br>iface default inet dhcp</font><br><br>As far as=
 I can tell, this all only ever happens at startup, and there isn&#39;t any=
 mechanism that would attempt to=C2=A0<span class=3D"gmail-il">reconnect</s=
pan>=C2=A0to a=C2=A0<span class=3D"gmail-il">wifi</span>=C2=A0network after=
 a disconnect. I&#39;ve done some googling, and here&#39;s what I&#39;ve le=
arned:<br><br>=C2=A0 - I&#39;m pretty sure that wpa_supplicant is not suppo=
sed to handle this.<br>=C2=A0 - It looks like some people write scripts to =
handle this for themselves. See this <a href=3D"https://raspberrypi.stackex=
change.com/a/5121">SO answer</a> and this <a href=3D"https://github.com/dwe=
eber/WiFi_Check">dweeber/WiFi_Check repo</a>.<br><br>Am I correct that this=
 is something I should fix by adding some sort of background/cron process t=
o do something like the WiFi_Check script above? Or is this something build=
root does have baked in support for, and I just haven&#39;t found it yet?<b=
r><br>Thanks,<br>Jeremy</div>

--0000000000003575cf05cc8a6f18--

--===============3776183688290281420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3776183688290281420==--
