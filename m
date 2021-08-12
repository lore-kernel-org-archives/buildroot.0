Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FACC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 15:23:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E542F6108C
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 15:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E542F6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9434E400E1;
	Thu, 12 Aug 2021 15:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVQChUKsPc9P; Thu, 12 Aug 2021 15:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DB324017A;
	Thu, 12 Aug 2021 15:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB6321BF313
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 15:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A84BD83143
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 15:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sg3d65AQHbUg for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 15:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 939F283118
 for <buildroot@busybox.net>; Thu, 12 Aug 2021 15:23:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r7so8937288wrs.0
 for <buildroot@busybox.net>; Thu, 12 Aug 2021 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=p+5qJEQuFGSifaID0ohXPadmgnEeB1bE33mDK3U00pg=;
 b=ErtADTX+tpkxRmMymgKqaVjTdXydviPDIo1Z4GBp1DwKIjWESJtON6DWMaBdjdqH7n
 YU356MTeEUxkxZXjLhsz70TDyHtizF5fypztHWsICoQzXfQi9ateQiQThNadaI9/I6Ae
 VQtcyISYcY/6e1k0QRekoc9ise0bkfrO5pOvuym5NJ0Q9bdEMU65W+uXLRx45Hnyifxt
 wYeNu9HNyZbFLxHx7gOabBYj69Pbj+REabJg059/Ga3iml5zN7Me1+yYDGrDSl+oKw2g
 FpmjCHvQi6lHlU0+MdnyWdgGkcXa2xpic/zWQRqiH02I10C9/+GkRxcZjO7VIYl5Ttr4
 914g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=p+5qJEQuFGSifaID0ohXPadmgnEeB1bE33mDK3U00pg=;
 b=Ma4LqWjrsLMEiHt3+GuHzMsNMMNcw1to4prkJX5vGIifoEDc7ddvUIX663mqJbAvIe
 GvBdbOcad1clLE5Zys2b7Dj1awOLP7cEGNkjf46LuiEiCMZrKmiIbuxFSkV8ELqMypNg
 fO5s54ZQYC3gsHuGPXThJo6hE20+Y1j8RtcwP+hFf/lE5cnifWAHZ0z+BgRiR+HLXJba
 Az7n7HJpRjab43QSc1ZbJ6XsLGuujnw8PY96Q6otf251e/e1//FCLNQA7pwN2vqFJ1O7
 ol87Zs2rHw6QBry0Q/sg9LzLAByBeDXBYzKf9SNcaqn7GWT0QNRbwbdlHpk8NFQCchM+
 mmTg==
X-Gm-Message-State: AOAM531LS/KGk3Jjw4fnCiN+2qWCLhGTWQR28DzJBMnG5qX/6HFRIE+r
 Efb+J6wM284NvgpLBFoBo6tm2HFPgYdC4POSnbfZXzFDU3pFLg==
X-Google-Smtp-Source: ABdhPJzATSsLR4z1ahGUD2vg6NlfDOeupQevhHtyqoOTFx8WymkfggGSEYFQCeg4jBd0uDAb8wYbb9qZZKnzSQBofKU=
X-Received: by 2002:a5d:4a50:: with SMTP id v16mr4620932wrs.77.1628781784657; 
 Thu, 12 Aug 2021 08:23:04 -0700 (PDT)
MIME-Version: 1.0
From: Pragash Jeyaratnam <pragash.jeyaratnam@gmail.com>
Date: Thu, 12 Aug 2021 11:22:53 -0400
Message-ID: <CALYA+YsoegQmZDZN48WLCmdcY2k3Opyxn6EDUedmkspTuqDbew@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Installing pyyaml with Buildroot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2885360603287523207=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2885360603287523207==
Content-Type: multipart/alternative; boundary="000000000000b0f0de05c95e4fa0"

--000000000000b0f0de05c95e4fa0
Content-Type: text/plain; charset="UTF-8"

Hi,

I am running into the following error when trying to install pyyaml with
buildroot 2021.05 configuration.

x86_64-buildroot-linux-gnu-gcc.br_real: error: yaml/_yaml.c: No such file
or directory
Error compiling module, falling back to pure Python
pjeyaratnam@proteus:~/branches/sonic3/build/dist$ make yaml-cpp-build
mkdir -p
/home/pjeyaratnam/branches/sonic3/build/dist/per-package/yaml-cpp/host
mkdir -p /home/pjeyaratnam/branches/sonic3/build/dist/per-package

Mysetup is
Python3 enabled
LIBYAML enabled. 0.2.5
pyyaml: 5.4.1

Would it be possible for anyone to point in the right direction on
installing pyyaml on this setup ?

Regards,
Pragash

--000000000000b0f0de05c95e4fa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>I am running into the followi=
ng error when trying to install pyyaml with buildroot 2021.05 configuration=
.</div><div><br></div><div>x86_64-buildroot-linux-gnu-gcc.br_real: error: y=
aml/_yaml.c: No such file or directory<br>Error compiling module, falling b=
ack to pure Python<br>pjeyaratnam@proteus:~/branches/sonic3/build/dist$ mak=
e yaml-cpp-build<br>mkdir -p /home/pjeyaratnam/branches/sonic3/build/dist/p=
er-package/yaml-cpp/host<br>mkdir -p /home/pjeyaratnam/branches/sonic3/buil=
d/dist/per-package<br></div><div><br></div><div>Mysetup is</div><div>Python=
3 enabled</div><div>LIBYAML enabled. 0.2.5</div><div>pyyaml: 5.4.1</div><di=
v><br></div><div>Would it be possible for anyone to point in the right dire=
ction on installing pyyaml on this setup ?</div><div><br></div><div>Regards=
,</div><div>Pragash</div><div><br></div></div>

--000000000000b0f0de05c95e4fa0--

--===============2885360603287523207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2885360603287523207==--
