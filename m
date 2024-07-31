Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7FC3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 17:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4293880EC5;
	Wed, 31 Jul 2024 17:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrwYU0DZkd6B; Wed, 31 Jul 2024 17:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA7980ED1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA7980ED1;
	Wed, 31 Jul 2024 17:01:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 743CD1BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 17:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B4C40959
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 17:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhmfYOu7B5cq for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 17:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E403409E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E403409E3
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E403409E3
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 17:01:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f015ea784so980267e87.1
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 10:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722445282; x=1723050082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FfuONWkPnY8Ouh7r5OGoN/CG6I5zQU6j3XViKMAHG4=;
 b=JB0c8wCGrEUKzeeRPg9NyoskERGd0EPkeNM+0LV5NE7SxOBLuNPPzdK6+aMFWF8dxO
 vt2clW0ElxUScIwkLwT3JRhDzWjISpeua+dXyUpwTUlwZq4bV4h3KK5vgKc45pENuokw
 eg8LSqKdUJhNNf8YmdDEaGvVEpHXoLrboGWvmZub3IbHytTXVRYcXP9AYF1+4VIOMzZk
 qCPkjYrP9iNB+7rSUSoVvuGyszOshJnXw0dSboafe/3Ogb2pZ0v6WDBlPRVztLLaNHyE
 bI9ezq8g3p88izwMJIyJutsu8p+0q/CtuCtUjHqGG/VOjZMA/SahbhYJBgvI0LiyzZoy
 COVA==
X-Gm-Message-State: AOJu0YwKqD8kuSZ4/e8jIOp0fxybEIKmJSYx44y4ZDazvQXDxfuBPOqi
 MPoYdmNmOwFggAWXYqDZIz+e2JrIWNWyLQBtYHU+g2YLnSTxz1wWem7SQHb7JEvKVQYi9lSvqaE
 lCFIsugrDoAOxHnq19TM8osUoC4G3Bg==
X-Google-Smtp-Source: AGHT+IFxTEbN1+TfstkQSw970QdbTGVlUkyT4V4gdYQC3uwmmSshoCBOn7aeGXpYSVvS9bt4VQ1VxIoo8PFoKw1Hmb8=
X-Received: by 2002:a05:6512:23aa:b0:52f:10b:666c with SMTP id
 2adb3069b0e04-52fd52fe7f2mr7162950e87.5.1722445281390; Wed, 31 Jul 2024
 10:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
 <20240731145504.365492-3-philip-dylan@gleonec.bzh>
In-Reply-To: <20240731145504.365492-3-philip-dylan@gleonec.bzh>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2024 14:01:10 -0300
Message-ID: <CAOMZO5B4DLidx1KXvyNUd7mic-WB+WQTQHn-_A7hXTprcLWVjA@mail.gmail.com>
To: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722445282; x=1723050082; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FfuONWkPnY8Ouh7r5OGoN/CG6I5zQU6j3XViKMAHG4=;
 b=dcN+LatWy9SD6Hd0ghMhOJ/t3p4A1HvE6EkC4hqCIOUZAHr2LYsbCbM6LNenzUuLV+
 LGn/rMiXvMv18GWzCgjp5ws75OH5+ewBhg2UKmHurL9rQX6E15gjbcJN2WpIw4buxFHG
 YGshqPiCPGLTKvtMvVNxVOb++mZHpzkb1GxW+I88QW+ucEA0l2XDTRTsH1j+TATEhZhp
 +69/HoP1rIbDmpkslvOPXq8cdhHlRl8GZ7m9QdXN9mwf2dId+GcD+ZmqAzyZdNWQp93v
 Q6ikLSQ4clCKVcM9oFsPDiaeORTxnT4x3iQ/CQvjSfYIPPB+DZIy5nR6ED5E4Qpby3r4
 Mfbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dcN+LatW
Subject: Re: [Buildroot] [PATCH 2/2] configs/mx6sx_udoo_neo_defconfig: add
 hashes
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMTE6NTXigK9BTSBQaGlsaXAtRHlsYW4gR2xlb25lYwo8
cGhpbGlwLWR5bGFuQGdsZW9uZWMuYnpoPiB3cm90ZToKCj4gKyMgTG9jYWxseSBjYWxjdWxhdGVk
Cj4gK3NoYTI1NiAgNWMzYTNjMDNjMDU1YjhkNjAxYTZkN2Y4MGQxNDY1YWRhNmI4M2ExMjI5OWY2
YWNlMjAyN2I0N2YwYmFmZjUzOCAgbGludXgtNi42LjQwLnRhci54egoKNi42LjQwPyBUaGUgcHJl
dmlvdXMgcGF0Y2ggdXBkYXRlcyB0byA2LjYuNDMgaW5zdGVhZC4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
