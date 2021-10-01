Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13851C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C3461A8D
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91C3461A8D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45250406FD;
	Fri,  1 Oct 2021 11:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K88KjzikymSD; Fri,  1 Oct 2021 11:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C013406E5;
	Fri,  1 Oct 2021 11:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8022E1BF5A7
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B4E4040B
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRqtzsv3sDzQ for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 11:46:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6729540218
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 11:46:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w29so15034108wra.8
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=p2eXD1fgcFKO3qXpwNzT06uamabhPyfp7+hooV6kE/E=;
 b=FA407z4/kuNd/eDFRxllJGEYiOZYmH57cmKiUshegxsYKhhfC/xN1RA7VZHwMj3tna
 rssDTtKyuF/tatAMvHhjOEqoydCki47ARffbGAxOhA4K3gsQoIrrnnxOQzVuCsq6ZjEb
 WblAMnYsHC9p2XJxit6o06Bh5tTVYl9GdsNGGayALDDsK+VBZxKL/hvZxsp7bkBEhGDg
 h0ehV38Mdcgm1akf7qjBNGNs8DEs9PcPR0222eZxtDQ1+N/iq2pEH7MdUYOXYpLfQtS7
 KI+cGDmlL13A3UF8s1rP/mjsAPJaL4SYL7CXPgPfSU2Xyb1c96LsLKZM1pJiSnLluDLb
 Iw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=p2eXD1fgcFKO3qXpwNzT06uamabhPyfp7+hooV6kE/E=;
 b=HyJ64VUnLt5G3mgyX7ZiBiVlI+HShQ2iLFfMWvAXku519u9lUstA6U9uj0iWn6z5OU
 VcwcjYB+7jC7o5QqxLer8A0kB3M5Ufq+obuobFEXkFU7V8W+5oWHMlY0zBtCAvAqyIQi
 eJalpE+/wpOmf9kUkmAWU7hQGGWnyMCN5tHse+NS1fBKAEIUuhkJoTU3NPMD3ZI3HSeU
 Iu0hYhsmAajyhJhxJtBhcr9wSyzhzKIQFr/HL953RYf4+JzSm1gurs8y423h77ogY8vL
 O3V1qUtu808Tdjl3URLXrWD4t9OaoB/nc2copDmceUlkSScFIEvM1dqKP4WbohUl9ww6
 LGlA==
X-Gm-Message-State: AOAM532xbulIC+e8MnzK67MdyIJD8IJIuoX0PAphNITKWNzO7oONi1nh
 5EKbn8SQnd7+upvUmIeGTeXHVm8bSqhr9prKY6QHa8j2ETnyaw==
X-Google-Smtp-Source: ABdhPJxerpswOq62B1KEAaehzCUSbNzemJL914xGpF/NsI5wauv0HRdbAsrhDK09HGIgxjYZxOMY/r84fJCAA2+OmZE=
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr12100545wrx.247.1633088785192; 
 Fri, 01 Oct 2021 04:46:25 -0700 (PDT)
MIME-Version: 1.0
From: Jianhui zhao <zhaojh329@gmail.com>
Date: Fri, 1 Oct 2021 19:46:14 +0800
Message-ID: <CAGN0SiFZ33xbEXY8ngT4EwuDxhWQt9fDtucn4AxRF_szQiPtng@mail.gmail.com>
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
