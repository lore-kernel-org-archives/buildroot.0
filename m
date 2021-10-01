Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1F1C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 07:20:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF76F619F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 07:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF76F619F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A49840402;
	Fri,  1 Oct 2021 07:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0vCRtC4k66E; Fri,  1 Oct 2021 07:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5912040398;
	Fri,  1 Oct 2021 07:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 566381BF47E
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 07:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4538340499
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 07:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzetTd7hI-bQ for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 07:20:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EC4C40497
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 07:20:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id s24so6478330wmh.4
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=p2eXD1fgcFKO3qXpwNzT06uamabhPyfp7+hooV6kE/E=;
 b=fzYJzq9/6rZ+0aBJzeysLN+gKuWC1QWgeXtkW4i76VRgu0hESEbLd/hxTZrLTx+3d7
 DuFKMLxfPSb4ifNyvrT2TJBtdDR7XW9DZKG66xkK/EvX7nmtT44DQFPvrGwy6IOlIlfE
 EbXOALXnK46bms8eZ7X4KM1nzzLpPeXBZ6DRePkzFRoUCaIGEQVxQb5y2B4ki/a+FuYc
 nBkgKvxnH3231sb586PfIgO/XpCaFBAuA2OJakRVtf+J1u47ZPK3l2iD+LD4mCbRxtmm
 0gJdEuJoNlonxHTvtbAxmrZdSzegdVaab2ednYwORHnSKF3tdEyKVPCVc1U0JbYl0II8
 araQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=p2eXD1fgcFKO3qXpwNzT06uamabhPyfp7+hooV6kE/E=;
 b=qESPSlCqnEknc+yr89wLSbyI10bJGXwyjellVYE0dgLWqrsvH5I9iMKwytSuEXXJo1
 cgVNBgoW/gs91TUcueUxt+Hvu5eyPkodEbcNUPo1msxzpx8zQGZvWjk0qMY++72evyLr
 j5kTYgJ3wqg30giTEJzR/gj0Mqa5L6ZrOOwfIU/N5BZYegVwmUgT/MENu6mhk7Iq8LZZ
 +UO7GfkiVq1UOlCvo0rREoKSt7mMTWG2F6hKeTzMdNc3piAQRiIsSU7rm9YFqEPvwyhn
 h2wlvzUE2/BNOgAeBA/cZb4nWk0vvOAiSxWU+lRKZfS/KkD0mqzshlxAZ8CmIUIiRKKk
 OKAA==
X-Gm-Message-State: AOAM531IzLW71RkgmJjWQx/4IhplBk7aZQOwfQQny5VM6SWtkC/jfbQF
 vKSTUHV2wz+R24z4ERTp3hJjim4VrP+d2yEMvpQwbk+hL0kqyA==
X-Google-Smtp-Source: ABdhPJw/iP1tEcoPlbgFlNaMTVtvkCkm4yUccJ+XQr3sHSrTtUU9POCDxlSErrBcXDU6lceDco2LjeiDyOia/hkSr5w=
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr1597949wmi.10.1633072842598; 
 Fri, 01 Oct 2021 00:20:42 -0700 (PDT)
MIME-Version: 1.0
From: Jianhui zhao <zhaojh329@gmail.com>
Date: Fri, 1 Oct 2021 15:20:26 +0800
Message-ID: <CAGN0SiFsNW+JZ=bgy4t7Ef63w3YkGr6MEkpa4tzFJuV9JMGhiw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] [PATCH 1/1] package/rtty: bump version to 8.0.0
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

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/rtty/rtty.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index b2e9db2436..1b46aff47c 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802
 rtty-7.4.0.tar.gz
+sha256  b9c555005b76c1ad0f5af891964375bbdf50ee22b9a9f53ddd48d2cdb4e53b49
 rtty-8.0.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55
 LICENSE
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
