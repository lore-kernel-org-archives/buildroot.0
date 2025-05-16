Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDBCC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A488612C1;
	Fri, 16 May 2025 14:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGYNXSLaICfc; Fri, 16 May 2025 14:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB01612D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB01612D8;
	Fri, 16 May 2025 14:57:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F221AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DFFA81462
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwX4a9E68J9C for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1411F8144C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1411F8144C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1411F8144C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:57:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso19784175e9.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747407452; x=1748012252;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9p+bAunQ5CYlW8zxQCHMaHLSXf8wk4ONcxh5reaHxY0=;
 b=C/K/h4I2Q8qeViOWVMhUdaf5s4PDmhJAn8rst8zAzhbi85TbevHQqLCsaJ+kzow7aj
 3lTW/NW+o0QcIpPxtFDtQoHmyV8EVFj5cQsn+MGFjzZ/ld07Oc7sC01TGQuDvqXAPOzG
 D1mcB5cvSphXkhLV3AZ3i4mRDND4lcKeEVSCgcH6bk/mEh1FLw5TVEpFsS93T04d99aG
 sHAVTFmkIdo/OulwPpZlYK8sKgMvCK+CqVm15pPY+kf4GoOy/hU4AMgJJdsF+hHQK/kd
 PmFFCmtAOhp1K1PJ+l1OfsWHWCp3DSrb/t4e3cPFDVumOfccbOBhrbIzq/8mAtT/i+gX
 oJ5A==
X-Gm-Message-State: AOJu0Yz30nTVFiazjsh/jOGEBDDudYrmP09LmRSYjEVl2TWDWy8cOfdO
 LicHDoiX52ymRrWAOsvwujAy6SWFTODTjH7GH9UCXuMtl0LC2u4C/hrF0Mbxi6D9048=
X-Gm-Gg: ASbGncu9EZn9HTVSllqiq8qaSDventMWTvwNy0e/bf9okFcnDpeQ16DtNUz2snn+O4D
 ZvcOTSu7k8tvcjgwChZAmuuqbsth+iRrz6X5d17oOWu/LPiE1XZeXJrlhzMCxGIZr/F8x4wb2DS
 RAPw177aF0s9PPr21XhmTrlpq3KPyus/gmzeuHcaFexIHFf2f6/4VAFylaVKBW7yAioD0/w/qYT
 t1nTByKePz274f8Oerv/JqSIDe1eUdBWVwk0cCfziRB0tTPNreLdGiorKRy+ViTmfxBnRQtxNOg
 rrDafjqgQ1NFHN+xKz7tXeAHk31xeS0pHKrsHVLK0hciuP/BcEkLY1PuryWe/tfq5yjKYpUwlcK
 trk5VMtnpOdQnYHL/tpZB+PUaolm58Ey79Z8igHfdRw==
X-Google-Smtp-Source: AGHT+IF0lSiEzPK8nNBGf86Bp4GOUyQf61durdGHzMXWZbZcRZ7zCc83VfLPuR5LDN6WR9XkDyOISg==
X-Received: by 2002:a05:600c:8185:b0:442:dcdc:41c8 with SMTP id
 5b1f17b1804b1-442feffc24emr27137705e9.19.1747407452139; 
 Fri, 16 May 2025 07:57:32 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951854sm106319525e9.24.2025.05.16.07.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 07:57:31 -0700 (PDT)
Message-ID: <c7c6a85c-d7c0-429a-9c4f-f759b97b67ee@smile.fr>
Date: Fri, 16 May 2025 16:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Cc: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
 <20250516133236.16e5aa23@windsurf>
 <4f3b7a04-418b-4563-b556-60c5d6f2c34b@gmx.de>
 <20250516165051.3f20224d@windsurf>
Content-Language: en-US
In-Reply-To: <20250516165051.3f20224d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747407452; x=1748012252; darn=buildroot.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9p+bAunQ5CYlW8zxQCHMaHLSXf8wk4ONcxh5reaHxY0=;
 b=MhAzI4ByINCQq16Os4W3Fb6dtW/GbzkM70e7ZPU2R2n9pJeo+TlaJb+T2ySruHLUkZ
 PFd+L2f2hnizv59bPtyT2vYGE+qzS03hAh0OjuNgQU/8jBtPy7jKAbgI4vV3+xxEmkL8
 Q3w4jpZI1FIdP4cGFsh4CC6qgY4jQ3EweBf6I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=MhAzI4By
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: multipart/mixed; boundary="===============5028888145748727561=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5028888145748727561==
Content-Type: multipart/alternative;
 boundary="------------cLQzbVhz2dQGgUShzWDyN0Jn"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------cLQzbVhz2dQGgUShzWDyN0Jn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas, Hi Fiona, Hi All,

Sorry, I said that I would send a v2 including Fiona's patch, but I 
haven't had time since.

I've been working on an upgrade for llvm-project to version 20.1.3 that 
I will share very soon.

Sorry Fiona :-(, I hope we can fix it.

Best regards,

El Mehdi YOUNES
Le 16/05/2025 à 16:50, Thomas Petazzoni a écrit :
> On Fri, 16 May 2025 15:40:00 +0200
> Fiona Klute<fiona.klute@gmx.de> wrote:
>
>> it seems my patch to replace deprecated the .cargo/config [1] that was
>> discussed in that thread [2] has been missed. Is there any chance to
>> still squeeze it in? The problem is that if applied separately it'll
>> need a separate version bump for the generated cargo archives, but I'm
>> not sure if that's avoidable now (as the changes have been pushed
>> already). :-(
> Dang, I missed that! Let's see what we can do about this, I'll discuss
> with the other maintainers.
>
> Thomas
--------------cLQzbVhz2dQGgUShzWDyN0Jn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div dir="auto" class="pA4Vnf ">
      <div><span class="rnc2Gd">Hi Thomas, Hi Fiona, Hi All,</span>
        <div class="gWqWw rnc2Gd"><br>
        </div>
        <span class="rnc2Gd">Sorry, I said that I would send a v2
          including Fiona's patch, but I haven't had time since.</span>
        <div class="gWqWw rnc2Gd"><br>
        </div>
        <span class="rnc2Gd">I've been working on an upgrade for
          llvm-project to version 20.1.3 that I will share very soon.</span>
        <div class="gWqWw rnc2Gd"><br>
        </div>
        <span class="rnc2Gd">Sorry Fiona :-(, I hope we can fix it.</span>
        <div class="gWqWw rnc2Gd"><br>
        </div>
        <span class="rnc2Gd">Best regards,</span>
        <div class="gWqWw rnc2Gd"><br>
        </div>
        <span class="rnc2Gd">El Mehdi YOUNES</span></div>
    </div>
    <div class="moz-cite-prefix">Le 16/05/2025 à 16:50, Thomas Petazzoni
      a écrit :<br>
    </div>
    <blockquote type="cite" cite="mid:20250516165051.3f20224d@windsurf">
      <pre wrap="" class="moz-quote-pre">On Fri, 16 May 2025 15:40:00 +0200
Fiona Klute <a class="moz-txt-link-rfc2396E" href="mailto:fiona.klute@gmx.de">&lt;fiona.klute@gmx.de&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">it seems my patch to replace deprecated the .cargo/config [1] that was 
discussed in that thread [2] has been missed. Is there any chance to 
still squeeze it in? The problem is that if applied separately it'll 
need a separate version bump for the generated cargo archives, but I'm 
not sure if that's avoidable now (as the changes have been pushed 
already). :-(
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Dang, I missed that! Let's see what we can do about this, I'll discuss
with the other maintainers.

Thomas
</pre>
    </blockquote>
  </body>
</html>

--------------cLQzbVhz2dQGgUShzWDyN0Jn--

--===============5028888145748727561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5028888145748727561==--
