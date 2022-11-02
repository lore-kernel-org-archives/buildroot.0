Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3643C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 13:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B474161F;
	Wed,  2 Nov 2022 13:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B474161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xp9iUUI52sGP; Wed,  2 Nov 2022 13:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE5541619;
	Wed,  2 Nov 2022 13:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE5541619
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 943C71BF20D
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B71C41619
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 13:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B71C41619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gW7LB7OUti1 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 13:05:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7880841610
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7880841610
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 13:05:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bs21so24465538wrb.4
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 06:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TdUnMM4NRXsqZbrmTAVjRL2VhJtpHCsF5pHz07Am8Jo=;
 b=Jh4/GeAZQz7RbCjANGWfDEjvh+y1aXzAlInLo9UsFJSSPUgJelAbu0uf4e5P4wgnZ5
 ySVeW3oICtpx9grxJEqH6YKq2bqPA2g1YcbyCj6uQms/FKmKAosEAX0yDf3x7I+rI6c4
 pUmvteVk1s5cm9Gizef0LizFK34zWiJIW9aV7op8YnLTPKM8okfu6GLmE6Bdt5A4A9/z
 mcCmUGzzVqyhLVg5jbVR6HdUmLHjOvxpJoUC2z9ySWuV4XLU7QvOJKj0vjqebM5i3dyG
 J2YLXMkONtShaKE2lSq+H9BTtD3W6RVuO2XXgMhKVdJ//speK85xHogfDhoKMaD59+cX
 BbhQ==
X-Gm-Message-State: ACrzQf2V+enodsAp2yIgAteUf17skAPjeyVD3SYiAFqnejPJAAfBB+ud
 ngrRj9w4ANOX34UsGzC0eBU0TAY5dy3C1g==
X-Google-Smtp-Source: AMsMyM7XMfhieaKX+PcPtdwHokkN4RyYlr84yDiXLsA7Oy5RPUAUjImqAUTgRrinOEom1ka1opNCBg==
X-Received: by 2002:adf:e10f:0:b0:22a:43e8:969f with SMTP id
 t15-20020adfe10f000000b0022a43e8969fmr15878674wrz.292.1667394329579; 
 Wed, 02 Nov 2022 06:05:29 -0700 (PDT)
Received: from [10.5.3.187]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b003cf71b1f66csm2741347wms.0.2022.11.02.06.05.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:05:29 -0700 (PDT)
Message-ID: <3f3d266c-2f21-197c-29b7-fff3e230e97a@smile.fr>
Date: Wed, 2 Nov 2022 14:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdUnMM4NRXsqZbrmTAVjRL2VhJtpHCsF5pHz07Am8Jo=;
 b=lhOSCANElmOje6y2KzVSoBGltDdJDuUJu/UNHMGHMyGCvunebX1aSLJXFJK0bNJofA
 Em08dv7sqAAGW5U6sQf9fShn7wvHPID0jMgcm0HCUkfcC1uvU+C3oT1i6FL+hPuQPcd8
 HwT0Q5fBdcjRnETlHIOH1N6uvQk5XXeUAErt3Ldf0FvrTdXfOdH+r3QbQasqtNDH2muj
 HuchymvgSVZmGZw9RuRAbO4IU+arbzqQ6JoMhw0OahE7XjKjjbqd2sNrxKuW3TxrQVhH
 wZ7LMvBHPZBN8bmFpbii+weUI913Ka4puezeDCQHChPr57jiaoCWZ3bT6+mIo4kjnLA7
 b2yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=lhOSCANE
Subject: [Buildroot] outdated libiberty and prelink-cross support
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

Hello

I was looking at host-binutils-2.38 issue in the autobuilder [1].
The issue appear only when host-libiberty is built before host-binutils
(Binutils 2.38 only).

It seems that libiberty package is still based on binutils 2.32 release and
seems to be updated.

host-libiberty is currently used by host-gdb and host-prelink-cross packages.

About the prelink-cross package, it come from the Yocto project [2] but the
support seems halted. Also the Glibc project will remove prelink support for the
upcoming 2.37 release [3].

The annoying part is "Prelink-cross emulates a runtime linker for a given
sysroot. This is necessary to allow gobject-introspection to build its typelib
files during cross-compiling." [4]

host-prelink-cross is currently used by dracut and gobject-introspection packages.

Contributions are welcome!

[1] http://autobuild.buildroot.org/?reason=host-binutils-2.38
[2] https://git.yoctoproject.org/prelink-cross
[3] https://lists.gnu.org/archive/html/info-gnu/2022-08/msg00000.html
[4]
https://gitlab.com/buildroot.org/buildroot/-/commit/8af40358e3885440248aa783490096bdd1b7a90c

Best regards,
Romain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
