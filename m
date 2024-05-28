Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C98BC25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 11:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B01D240542;
	Tue, 28 May 2024 11:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zR8AGAAl7bqX; Tue, 28 May 2024 11:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E9340544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E9340544;
	Tue, 28 May 2024 11:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45F041D26CF
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 11:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC3D60679
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 11:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsRJOQkCkaCX for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 11:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=stephan.lukits@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD8F360678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8F360678
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD8F360678
 for <buildroot@buildroot.org>; Tue, 28 May 2024 11:17:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a634e03339dso52824966b.3
 for <buildroot@buildroot.org>; Tue, 28 May 2024 04:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716895041; x=1717499841;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHdYvw1jOlT2CRLn+buW7SCMFVdp1smxfTX4hvgeg4c=;
 b=nIvxsG0Dbyjqvav9cd+mgc4niwJnxNcRxRB+KbptnAZPmS+NifDp6BCUWNXQBkmkD/
 RLTMtvh18x4NeQtgBYyvyM464R4BMsl88A5RtDYQycQeB6eBqhmiS3zDRfeDPiXVIrxN
 rkvNYQ4H913Tk67ZVz/mry+UiilDbQI4VRKazWSc6pv3ATYhJgZ0fK8po1DxxSDXIhq6
 6E9hm3FbIAh4llDORgFHry82G+q6IFLVl9uL6Pw6vFlZkfy+CsRC6vuf1JmJTLdy9/Xy
 pDqvnSsGsqH1n7U8TmXuH533oHrgQk8MRKLlkrKUx4mvKLYwlSUn7FiaFxZbwr3e7sxm
 odnQ==
X-Gm-Message-State: AOJu0YzKxRT5z6EwUY7Jdt8z4qNB6hIRHvomitftcUrCbnWXmqwCnGTd
 ozuhn8//FNFfidKjy4VL5Q3gIphdCYY/oNX9OOflq65cysa/9NCFyJS07A==
X-Google-Smtp-Source: AGHT+IGvxqwFFEFoTbr63XIyoMgvXEfxTz7beK6Y4x9+UZ7H/WIPPU1jbsQNajYcU91wUhUixM9h5Q==
X-Received: by 2002:a17:906:898:b0:a63:4f63:e56b with SMTP id
 a640c23a62f3a-a634f63e5a8mr69740766b.73.1716895040776; 
 Tue, 28 May 2024 04:17:20 -0700 (PDT)
Received: from smtpclient.apple
 (p200300d6f70bf800542cb689839e9ec9.dip0.t-ipconnect.de.
 [2003:d6:f70b:f800:542c:b689:839e:9ec9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c81795esm604897566b.6.2024.05.28.04.17.20
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2024 04:17:20 -0700 (PDT)
From: Stephan Lukits <stephan.lukits@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Message-Id: <DDA24EB9-F4B2-4BA9-8A2D-C28C9BAE8F8E@gmail.com>
Date: Tue, 28 May 2024 13:17:07 +0200
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3774.600.62)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716895041; x=1717499841; darn=buildroot.org;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FHdYvw1jOlT2CRLn+buW7SCMFVdp1smxfTX4hvgeg4c=;
 b=KYMzAfZwreq2kT98YYQHN4nNzUN3ro1zW6B+VjIU5q3mpxOX1/weQjwmYNPcRgzKMT
 LO2Wn6A/MOFAzqlsLyvhtmcW86Q/ZLb2ov9VOzl+O7UVhZU2hM7kW6AxZ84HMVBkwAk9
 UGPRycYIkuI+NR1IkFOKO+2+wxd4HnFZeDwopoB35rvUjBgpMZAEDVRf6PRBGFHGbu1y
 03Xhj2QPtJhseApguyg+PK2bCRD1OPlCR2vtmuVSJaZIl557WHlIIDViT+UcOn4B6YLV
 m8Vh1JxWoX7IX4O8jd4x27X0jF2eXLX+WdSm8v48Z631KJa3TNgUtm0SDt3VSWpLpBqd
 wcGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KYMzAfZw
Subject: [Buildroot] configure: error: kernel headers required on Linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Good afternoon, in an alpine docker container executing

$ make raspberrypi3_64_defconfig
$ make

fails with the message

> configure: error: kernel headers required on Linux
> make: *** [package/pkg-generic.mk:273: /buildroot/output/build/host-util-linux-> 2.39.2/.stamp_configured] Error 1

I wonder how I could fix this, thx, Stephan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
