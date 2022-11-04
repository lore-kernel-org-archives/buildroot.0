Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5CC433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 17:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D71821BE;
	Fri,  4 Nov 2022 17:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D71821BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-PABzju6uwH; Fri,  4 Nov 2022 17:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0B6821B8;
	Fri,  4 Nov 2022 17:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0B6821B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED7211BF385
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 17:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C920D403BF
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 17:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C920D403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zz9OAC0LCPJj for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 17:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC85540198
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC85540198
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 17:42:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id v17so8675064edc.8
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 10:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9e3g2NsEc5dopDNXBy66yO1YIfX2e5yhkxYTR0ewAOk=;
 b=YslEjfFWiwHgDdfNN+8SAL0LLFvLFVOClU7it2YCGUZWWFpFfUMK0j9y6L0QSzjAZF
 gemi60gBiBdFejbAb2hfwGugJTSXHXkuyp6sY9C9CkBirKHaMmU0tcpU5Qsmbi3Hvdbd
 8FeJtURT+pd7BCthlbXfopmkIsVfnz7v0zaJIxPrSkFGu7gV2vZQphCjWZCNczfg5Y9u
 t3Z8liKHn9QU84/tn7qkqQjqY3yG73A7+QCFtjj9Mhd1rg4jLvH0LX6ssWVs7nuwQjKX
 vMun/dclm1pYV2irF1b0YHHegS2HPJ9PVpnK/WZtBBSwvShm0r9hEfyop72y8zmX8Mqx
 /8Ew==
X-Gm-Message-State: ACrzQf2Xq3JxTnaykjYTraAnJD9qNKtzVeLCUwqwqHMi+Q5MSDzGBIJh
 dzpDhNRVXg1+YBc/3Xh75jEaopKDD6cMz0PW
X-Google-Smtp-Source: AMsMyM6JXsAhs/9czIP7E/kHx8XbFl96Nmlx0x9hF0fUxmQ/iDPoNE7N2sqoky/EDcE72W8WMSqGxg==
X-Received: by 2002:a05:6402:40cc:b0:462:555e:5f73 with SMTP id
 z12-20020a05640240cc00b00462555e5f73mr38257857edb.259.1667583752570; 
 Fri, 04 Nov 2022 10:42:32 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 j10-20020aa7c0ca000000b00459ad800bbcsm36575edp.33.2022.11.04.10.42.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:42:32 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id y14so15133898ejd.9
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 10:42:31 -0700 (PDT)
X-Received: by 2002:a17:906:4fcb:b0:791:9a26:376f with SMTP id
 i11-20020a1709064fcb00b007919a26376fmr35158707ejw.431.1667583751429; Fri, 04
 Nov 2022 10:42:31 -0700 (PDT)
MIME-Version: 1.0
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Fri, 4 Nov 2022 11:42:20 -0600
X-Gmail-Original-Message-ID: <CADXxVSJSHC44o49ax3jPv4P0H34+A5O71EWucGsQt_E_9PcNOw@mail.gmail.com>
Message-ID: <CADXxVSJSHC44o49ax3jPv4P0H34+A5O71EWucGsQt_E_9PcNOw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Hash check for a file inside a git repo?
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

Hi All,
Is it possible to use the hash check on a file that is contained in a
git repo?  I have a tarball (along with the hash) provided from a 3rd
party that I put in a git repo on the local network. I was thinking of
using buildroot's hash check to automate the check for me.  It looks
like it works fine on the complete git repo download, but I wanted to
only check that one file.

It looked like it was possible here:
https://github.com/buildroot/buildroot/blob/master/docs/manual/adding-packages-directory.txt#L512

# md5 from: http://www.foosoftware.org/download/libfoo-1.2.3.tar.bz2.md5,
sha256 locally computed:
md5  2d608f3c318c6b7557d551a5a09314f03452f1a1  libfoo-data.bin
sha256  01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b
 libfoo-data.bin

I assumed libfoo-data.bin lives in libfoo-1.2.3.tar.bz2?

Looks like I could work-around and use the _LICENSE_FILES but that
only gets checked on the make legal-info?

Bryce
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
