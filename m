Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9565C04FFE
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6565340544;
	Sun,  5 May 2024 13:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pwELE2FnK7n; Sun,  5 May 2024 13:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5050D40643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5050D40643;
	Sun,  5 May 2024 13:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBA21BF31E
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 888BB60771
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5W7QinDZSsm for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50B83605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50B83605E8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B83605E8
 for <buildroot@buildroot.org>; Sun,  5 May 2024 13:17:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21BF7240005;
 Sun,  5 May 2024 13:17:05 +0000 (UTC)
Date: Sun, 5 May 2024 15:17:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240505151704.624b571b@windsurf>
In-Reply-To: <20240412164017.3574-1-fontaine.fabrice@gmail.com>
References: <20240412164017.3574-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714915025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlykNCSlHlPVDegPr2imKv+XGWGuV32bdRqRvkKH3qw=;
 b=gspdyCo8wlvg+eOJp8Ce2dwxye9Ufw4Wr2FcRmGn1Bqn00yh+NhF4V55WBhOu0SLExVrym
 Z6buyROw4/aaD6jpuoLduRDGPdkm6+Wfh6IHQtpu1WssnqaUxsE8pKMNATlKRbBsIDLkYL
 IyhM88XA5g6jDV6+cLpQ9994A0WENfiri8Dh7ys7lBsckh5mAECE2IZbqkZNZXRr+8W7PI
 z8b4t48F98k5bvcb8iq1UJpZbFyXqd47sKK1wF91+rQV8EAGA4jMFIPX0sY0IC1hfzASi/
 tdcHLuaUswuMIjkwlGjFtStD6PC8rcxdMImi3JMdCdekcMiy6zWuku8RxTkjTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gspdyCo8
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: do not hardcode -fpie
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 18:40:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set LDLIBS to -ldl to remove -fpie and fix the following build failure
> raised since bump to version 4.3 in commit
> 99e9ff08d0705279532ca0cf3de22ea54660cbdc and
> https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=55a1150c7438afcb7756fccd49713ede20a58e4a:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/12.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: mdmon.o: non-pic relocation against symbol
> 
> Fixes: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
>  - http://autobuild.buildroot.org/results/827b714deeaf091b368d59791e4306b85a8f7f26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mdadm/mdadm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, even though I must admit the proposed fix is not
ideal. Indeed, it overrides LDLIBS from the package Makefile, which
means that if we update mdadm and they change their Makefile with a
different LDLIBS value, it will no longer work. Some other options
would have been:

- An upstreamable patch that allows to explicitly disable using PIE

- An upstreamable patch that detects if PIE works before using it, a
  bit like what they're doing with other gcc flag detection:

  FALLTHROUGH := $(shell gcc -Q --help=warnings 2>&1 | grep "implicit-fallthrough" | wc -l)

But well, what you did is good enough, so I've applied as-is. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
