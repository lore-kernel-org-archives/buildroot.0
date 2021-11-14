Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D7BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 22:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36A06112F
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 22:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D36A06112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF5480B38;
	Sun, 14 Nov 2021 22:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DEXWZ_Z69-A; Sun, 14 Nov 2021 22:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1CA780B2B;
	Sun, 14 Nov 2021 22:58:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 205C71BF909
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 22:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0298D60585
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 22:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJGpQts3IDGM for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 22:58:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB7E5600B9
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 22:58:36 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id t13so30958757uad.9
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=v4ltFyvxavdwgz1UIrHmGkEYpSAz/Brv3kyjPj884sI=;
 b=hivI905HrF7qz2HWSJs2ShLGKNI8ZMOeLN+nSt+opYhsypu+DxwlTzhlq1PK+etnJc
 To455ir0ZVT08qWQKRtmAp50prhZ+pwMxHDKweQBb974yl0saFkTrfC1UOM8XSTuqRAJ
 fBMbTYoe9M0Ru1uRmbNmy/Us+61hVYhPs1wD94H2NH7ZLlTdjjAb/gryNlz0FPsytEDO
 VnzKgWrvq3llD36xHaRDTqlf7UM9YcyGCKQHkJEEi9TEqTJDlDUBElY3uu1dM+5bSaEZ
 IYZW35xoTqsK7AJFqLsuAzIYlCyJgSy0itgSIznMA5sQnOYIVVBMC6kSZC1WNGqJb+nA
 1CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=v4ltFyvxavdwgz1UIrHmGkEYpSAz/Brv3kyjPj884sI=;
 b=z1BFD+2tE9OZIGVSayVeGchtvLUbBDj7ClXNN2ufLD/wc356zU9hplQ6P7W5c5Dy+a
 9wKEtX2xsXQrIr7eiqDthtmIk2TTI/2sBMnR1ZChee7pBrEPTumkKZ4n9hTe0sV4ctI5
 XFombYeDit1an5HHRqv8fp8Ihch2whUm9BA9vc3NIFd26jhjLvyxeLrudwO8/QuhewSx
 nsN0reOQz1o+lpcjynKJdh8EjkrXLsfGSoKtwdGouGicGwkakXJvSyonEm0U4CWp9A/1
 7PzNoo1vsZDfPQ1DKAGOb65KDNs9cKP4DGov57Sz/I+r1IjXRGWUpvHMJOLAECapsXNE
 7sUA==
X-Gm-Message-State: AOAM532lcythr/FvHY94+zUsmnUnSu+na9l8f0R8FryFfPuM5rDwByWW
 dUlKxW+vGozGe1DVrexGICY=
X-Google-Smtp-Source: ABdhPJxmBaZJSFMvdg0Q6L7Kykr4IpPZaCgZSjaKo8Cs7gWYdeXsz6jr/3oPEeKeBXT1hwFDryMNpQ==
X-Received: by 2002:a05:6102:3ece:: with SMTP id
 n14mr36723009vsv.55.1636930715625; 
 Sun, 14 Nov 2021 14:58:35 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id d13sm9517719uaf.6.2021.11.14.14.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 14:58:35 -0800 (PST)
Date: Sun, 14 Nov 2021 19:58:33 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <61919499f2915_76574a14-36b@xultri.mail>
References: <20211110175218.1927678-1-fontaine.fabrice@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_6191949835cb6_76574a14-454";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH 1/1] utils/checkpackagelib/lib_mk.py: check
 DEPENDENCIES
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_6191949835cb6_76574a14-454
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Nov 10, 2021 at 02:52 PM, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> from: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> date: Wed, Nov 10 06:52 PM +01:00 2021
> to: buildroot@buildroot.org
> cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
> subject: [PATCH 1/1] utils/checkpackagelib/lib_mk.py: check DEPENDENCIES
> 
> Check that {FOO}_DEPENDENCIES are never overriden in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----==_mimepart_6191949835cb6_76574a14-454
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_6191949835cb6_76574a14-454--
