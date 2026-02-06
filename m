Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF39EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80A96125D;
	Fri,  6 Feb 2026 08:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxJ-VMJ4QANf; Fri,  6 Feb 2026 08:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB45F61221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365534;
	bh=Ox1KD42Fxwm4M21EG9Yrrq0vAVNEr5palKAVV5qtQkk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UpPWKPpu0qH8xWP0uK+UGeygKhj4OhQyzLqeGbbtfRZlfn7j9DArDO+LlBPBbFo8p
	 vVwan0bOpPrQfWPVEFLx1wpw9lpD9iStmSDyldgUlz8fG0XrwAMO/RwkSsREXNd/i9
	 R8SywNnpesDZFjJVPXj9PhNwrcvaiehCBRNzWrb+8LklCDT1s0KWKXcHQjPqmrjqvK
	 4YLJZdp86mVTjZPXwK0hNK8MnjSxPoHfD8VwK7xU0+OTb2XWEq115H8iHSu3xgwKq1
	 uVwfN4sDVsPk5U/gO4IyLYnUJeXPAhPSBLYNS3Ze8dRke6BBsIAWdHR8liLnhVep4t
	 cqTpMS0q7idIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB45F61221;
	Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29B81173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B1A5408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9YJwxeuRrbd for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E71454018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71454018D
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E71454018D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43624d7256bso1003491f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365520; x=1770970320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=obFLRfc/mOmg7B9G2n3Q+xmUTPhuLE/Oeu9ttgXoPsE=;
 b=gTGSdHnq7Z3I20qSWhvnQwTIwG0+jHK1F8R0DM8aczxtI08uk/ot33JTw3kKMPrtVO
 rveGo+6B1bt8j/zJWff6oobu6j1NBytZ+326Fbjn1hxJ0vln8g/2Q/qYVVrTkGPqLJfF
 GJ7wi6mDWo7xjqiWt/2JRB3qS0hRAByEGzwcMeEkoDdzk+DT6EpB6kPmZp8vH2zaJ6GA
 7O8Zkz16jEyBC0Hafht38DEXgTvtwVnBCgchM2zM2iQ8epYqWdgEBFiU4KXAFUgPwOwj
 AwM9vZ6LxKZAch1IICkt+a397M2McJacZIH8bdbEI8sOxEz7kJl2XjKjtxkrFkPqcxrl
 FaFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs1N0P0Hf+7v5t019CfZDHqk7PVGWQlaY6tL4T71Q+5jRAMvdJo1aenZdDWKiS+nM/GT4I7GRuTRI=@buildroot.org
X-Gm-Message-State: AOJu0Yw6c+pB+Nu8UrcBey0xN3i+mgPiwyBfUaMzGqcX10ho0mvGsCuN
 VQD8CdKwzBKACRcIoMHQOYxNuJnV1kHce4kKISDyMXr2ZPEKAumaaAK5MCho5s/9VuY=
X-Gm-Gg: AZuq6aIqR97oYdNQo7nw48yA3i8q51ZM7De4VSYiwMg03BTpZ5WwHpvcgMiHRQsz4bP
 aeWh4EmY6oY6x5ToEyhFjwKKm0IBu5N9oZujQUwoDPlLqJnUOH9nY3VqwAsjWDUXrTA+hbiPJKz
 7ASu+6uTwDS8TcKKlE7UnOsMqY3pujnrEBDEPY0FBFz2OQBb8WewA8Z9ufyV/vggUk4KXf3bgsA
 wPJcSt55pKuHwclIwgmCYL4vQEXCpTYBrIu1lIESHsBGdsk+OvqaWzYMWKIbVAgVn4vgEUPS3Eu
 4i85RFzN0Vee/BPc9BkCpCn57uu/D3gxKCYqq6ezNjM3iU6ldmu/SS4HvX2Xl4bEY3WHKtZFSIz
 LhsI8xRMqJGLF3sYbT2MR8uaPwo3pJD++K8XCVbp11YpT3z64+YMfiYG4HjufuZW92jQBAzyMbt
 UyUFE=
X-Received: by 2002:a05:6000:184d:b0:435:a370:2d71 with SMTP id
 ffacd0b85a97d-43629388a20mr3231662f8f.33.1770365519925; 
 Fri, 06 Feb 2026 00:11:59 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362972fc26sm3913393f8f.22.2026.02.06.00.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:59 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:59 +0100
Message-ID: <20260206081159.32685-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124154145.1085049-1-dario.binacchi@amarulasolutions.com>
References: <20260124154145.1085049-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365520; x=1770970320; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=obFLRfc/mOmg7B9G2n3Q+xmUTPhuLE/Oeu9ttgXoPsE=;
 b=CqUk8BAgQ0k8DYgdLcgsNTPCirqYXMTE7VCMKz33g8uPr5bbXMnNHemYW194F86IpO
 TVhD+V1wCv0ShJoGhXE/TAu7RtJunnH7cOXz4vCG3i8aKnJEz6EzhKrP7qUQrbUwIfTy
 wFT+/LnyCOgHgXv7LHO9VtYMSacyIKYsdEv5X3gZK6JCBi08rTOHZ1Qb7txkpWJgwINe
 0SZrIE8v22E+xpaotXxmCeZUMhOy/w/kgLgqw0YsHR7ydqsivNElYYd7og1A3P1Yj8z4
 yxy+E5l9ZU3lWBtpflT5KnHgTuDN0aVr/vmdK8ONTNUSs1IJpJcv/kCyPq1/X/PyZ2cK
 eB/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CqUk8BAg
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2-pro: exit
 post-build.sh on error
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
> index bf8861f6a914..9306df3f3ffd 100755
> --- a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
> +++ b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname $0)"
>  PARTUUID="$($HOST_DIR/bin/uuidgen)"
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
