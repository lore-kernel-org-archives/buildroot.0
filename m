Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B98C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A045184813;
	Fri, 22 Jul 2022 08:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A045184813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owjzvt6kTZFF; Fri, 22 Jul 2022 08:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B189284811;
	Fri, 22 Jul 2022 08:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B189284811
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C82B41BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A239360EEC
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A239360EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qs85DKZZ9NsS for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:09:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E1060803
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36E1060803
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:09:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22F8E240010;
 Fri, 22 Jul 2022 08:09:21 +0000 (UTC)
Date: Fri, 22 Jul 2022 10:09:20 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20220722100920.00132969@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658477361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sIogsjrIwBkxCrpnhYL0qzfAbT6mRkhr3Y4gsMzguUg=;
 b=MFiwCfNbEpq4SQcptYSwCi41UZUADm0dSXKVZ1ik0eiAPxmm7eR1gpOF7zAMQZNEKKVQPH
 ypEe39nGevpQNxuACYbfMQynBzbcU4H8H3xGh8XQMy57DpidBtfEDs+HcgoyStDq7y9pNd
 EdFfLhn/GH6TZylb31Fx0XMSLQIuXIdpLIcCFUJrS8JiS6cjfrA1oOA1PDpcasNUaKAVdf
 LkAsuapCmzvMtMJ8Zk6ivitdI7EUwUVkT49B74l+kgwfNsMIhT6cBGabrwFSpOIxfDNhRR
 vNN4aW3G49x8qWOnQQo8nT0+SacxkKhZMLhRZ0oWpzRrbs/M2MuhRDV2SlPZDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MFiwCfNb
Subject: [Buildroot] uclibc-ng build failures on Xtensa
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Max,

We are seeing build failures of uclibc-ng on Xtensa:

  http://autobuild.buildroot.net/?reason=uclibc%&arch=xtensa

A relevant one is:

  http://autobuild.buildroot.net/results/38e/38e9d9a76f1877e7952ad5c20a405382642fd227/build-end.log

Which goes like this:


/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): compiled for a big endian system and target is little endian
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file ldso/ldso/ld-uClibc_so.a(ldso.oS)
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(dl-tlsdesc.oS): compiled for a big endian system and target is little endian
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file ldso/ldso/ld-uClibc_so.a(dl-tlsdesc.oS)
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(resolve.oS): compiled for a big endian system and target is little endian
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file ldso/ldso/ld-uClibc_so.a(resolve.oS)
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: little endian output does not match Xtensa configuration

This happens on configurations that have:

BR2_XTENSA_CUSTOM=y

Indeed, in Buildroot we support two Xtensa variants:

config BR2_XTENSA_CUSTOM
        bool "Custom Xtensa processor configuration"
        select BR2_ARCH_HAS_MMU_OPTIONAL

config BR2_xtensa_fsf
        bool "fsf - Default configuration"
        select BR2_ARCH_HAS_MMU_MANDATORY

So far, all builds were done using BR2_xtensa_fsf but with the full
randomization, we've started doing builds with BR2_XTENSA_CUSTOM.
However, for BR2_XTENSA_CUSTOM, the endianess is configurable:

choice
        prompt "Target Architecture Endianness"
        default BR2_XTENSA_LITTLE_ENDIAN
        depends on BR2_XTENSA_CUSTOM

config BR2_XTENSA_LITTLE_ENDIAN
        bool "Little endian"

config BR2_XTENSA_BIG_ENDIAN
        bool "Big endian"

endchoice

And the default is BR2_XTENSA_LITTLE_ENDIAN, while normally for
BR2_xtensa_fsf, the endianness is BIG.

Which configurations are supported? Is there something to fix here, or
we just need to disallow the usage of little endian?

Thanks a lot for your input,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
