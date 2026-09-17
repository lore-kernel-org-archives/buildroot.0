Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAABC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E797408B7;
	Thu, 17 Sep 2026 19:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Uha8DMXJsmx; Thu, 17 Sep 2026 19:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3DC6A4081C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789673401;
	b=c2S5WdXW2SeZ2n0uImjdnoo5B44r+eUpPkZsRff/bTNDYSIbyMISGNeIZCRVEeS24TL+
	 DZ/nzKDk4FthVoqfg8awjAJTGgm0tyoJkmSG9Jr7h71qhrzrnKYV5L5AaM8MpO4D+Gcx0
	 6e7YzJSTZaAinxEnmxU2HannXU/wZMuBDoYPCz3r21UPuUA4oxfiAUl5KgWX255l81e3/
	 0N6/tsg+rCUfTqP3IkMVMmY+XOlh/FDfzfQjqQbkRQQCPeemyVLzBVPMMyEBGnlLjnnmT
	 JfBGU8QZ6j4N88e8V4ighLsVRn/CTLWOSMAL3+jCdu1sy6G2BbW8ZbvXV+1MEhHjRqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789673401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zcxdgcpwh6DAvUE4/OUG3absE/6N99tay65cSo9O9qk=;
	b=iruOYeP5hFxEkW+yzFJTm901Luz8JEf1EUzVY2NewLcmOA5Vj/xsFa6icMeX+OoQo9pB
	 6fRdDFdEds4GIYbjAED2cp1t3ySdHVJ6gTgTi9VWGevW4aDIuzeiLBbGnCAywySc+QnsD
	 olIAnF1O8F8fxBFEsh2ZGmWN0Rh6KprOeJBsbMTtvQ6U5n6XmC0JVNXjoOYWBdV67GXUX
	 /RNeda6TmV+Yib/Ofu3/et5xQikKxcpopuXSvviA4i4dC1NmHgDs88G/Tv01QvyM9xe9l
	 dq/qDwgC+MA0qeRnEGb+ag/0n7hh7Oi1hcNkEbfzODP+REruaXeRA9oGMwI8VB6z1cw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789673401;
	bh=zcxdgcpwh6DAvUE4/OUG3absE/6N99tay65cSo9O9qk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bWvRp9H1eJrVQ8BOxh2cl8p9mozFhHAJUoKFy6lgTJ176PjGVunXHqTFON8SUb/tq
	 z3IfbO6QO9Lb+GRI81XRQUUtBrhtxjrJmM0MuxZLyqeNQJ7Vsrtvo5XYLR8Z8pWEYU
	 dLUVDmTP6zy/FDR3uip/NuUPi/puoIihb1SAf/20NNLMI0hW+G/3tCHCE0ov0kTWin
	 /0fcFJ/i29Z6wFOroay9su7z5Jr1x3Ifaed886i3HK3Pfbsc58L2MRFI65fMrr5JBF
	 t69Q2ylj9fGZ8IevcU2vP7sBxmExqeHfnqtKapzeLO5d4xdLKjrBOnT1DEvHDavYC7
	 VTSqStPNZ4myw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC6A4081C;
	Thu, 17 Sep 2026 19:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F1D0352
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14EB96067C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuIY_a6bQ-hc for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 19:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1F6F1605C9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=74.125.225.76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789673399;
 b=LL4cZxbRw+CIVbIR3S7vIkomYuGFNRZ3fcg0lvuJbyIZzM5MIWY8/p6x3MSq3j5dfgBF
 6Rxv3+j/5QFmpWh5rQMlam8H+PdwMB1B4xsF01xEc8/nCp5ZAQnXXtwX0zxTf3kCIELEe
 kmvjbMO4HCTodCm1BlyjIgsisOc6kihOTc+iKyAZUiWBUYO/LSWYb+Wzww8+scsU9VWv3
 uHkkP4RptERLJLyGuy6VYRHZA+2+XXIHJRWkkQ5u/IeZoB7FsENABfdgiLBjZb5Svc4QI
 j/XOpTdY7jEa1+8f5BOBDYrG4/VCj6XY0u8mNL7l1Hpg7Ne5MIkMIN8Bw9qVE68DB1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789673399;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=pBEwS8KYaZIZu3ct9b8RPgmdggsOdNi+VMhIqQvZmGA=;
 b=Z0BI1/v/5gJEtQfTewrc1NcjEipQlDy6iRcCQqxNP36J8JMFiL/V/5DCZGrxvZOCI2lj
 RKgAzMvO3nQzhkym2IVfxRshy1YFTLDrVssHaOh5vguj4T8rFFm+Rwcf8COVYe8SQl1tc
 XJK+aIZunW5Al4xCifgyVWuSXyg2ORZvjyyK+tz9QDa5aMewajWaUAuws1ufnO3MG1duj
 DgcxWwlp4/x9OmkTKljCW6IHisGGuFOZb1SB50KA05vlcw8Pg3tbwkZ+qHO1AvTZ7Cycx
 L6s61x3xiROdICAlBhI0nU0CfAdzlNKnAkTHRB9zUeBuTFGgJO3edHFv6JTjm6GmGRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 arc=none smtp.remote-ip=74.125.225.76
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.225.76;
 helo=mail-wr2-f12.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F6F1605C9
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:29:57 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843f22dcb8so890290f8f.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789673396; x=1790278196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pBEwS8KYaZIZu3ct9b8RPgmdggsOdNi+VMhIqQvZmGA=;
 b=TEwmefn3KtKDynes5lyff80JxK0q23MAu1I+tmW8XBTSSigH8cdz/djwZ9eyCtecZu
 CuuPhGSO+mev5rfqzn71YJPQmhxabYDJzI3PqLd8OYsSoo6M+wgj5neQjNpeJ4BBjKHi
 rpVfoc27Gj6kUoRT2c4CL+ss3woCd75i38foJj7UOaOk3eKihKx+5L5kyN0USXohPcV6
 xCwknBIIhRR/dxzDO7nGYpz56vir5BajgZ0vDNmOjAEQbgFc5KEq3tVtWvshJNBScNgJ
 0s6LN0vkZh4WOGf/b8THiR8A7+GsR8htJL2AgjO8MNP7QrEa7F7UXm/KVathRhVSi/wu
 j4AA==
X-Gm-Message-State: AFuF++lI3x2SRXa1sCvDKZyrp8Cd9be/L3YGURuGLcpf7FNZpErRkaps
 Eb5y8nuUK7slvsFdRjn3lBQR0cPrqm8wiMKuvMngYst7fxPQjkOCYYEKED0Lug==
X-Gm-Gg: AYBFou3e4DlwQ9IdSnlQLmHNbEGSug7H19vxuY30V4FQ9mh+1NZPnpnocPehyjAZ/74
 51CbMPxkmjOBYs0kFavu6skRsvcQJIsDvStEcu1wjDsuhq1TCGLTPHGjw04t7sZxFYWftMNIx8v
 lQN7eePQgCok6SCZvHZ2E5psoPpxdEj3L41z+cE1RrcQjnMBf+F5Sw58G7mwYt4FmNxhkz5d+We
 qE2IFo3CUGJzDYjoVVJY1os7uKW/v5K7z0euAzhBy6enrD+P6dynTXVrQBaNMsl304SbIZVmiIG
 U2tJh9ASpiHNMurva2ZMc3WMjojxLiM3H8GkIVdmpcm1WNuliTwh7B7elxiNXhfq1kf7U2fUZ9z
 zw537wmE7MKIfsiXinTAa4EQsArnloD+nvFyC9RNZ7Erwy1gNhSRvMBhLCI32OPq01HW7Y1EtpE
 b+lhOhSb8dJ0uqFs9QSQu9NfzC9qeBVpSvHGsIQvofF2wc136PL7YILIEEnNupZ5Y2Anekbor2d
 apwLgEQFbr2KiFY1XfHW9J0ORYAbWmc+r1cVopktUuCyPZJgiF3yv31nojKywU7rs+2988IbhSX
 z7dtiaV6OQhQOp0OXIkBw6TeVrHqR0op
X-Received: by 2002:a05:600c:6298:b0:49d:16df:8521 with SMTP id
 5b1f17b1804b1-49eb73143bcmr95961065e9.4.1789673395735; 
 Thu, 17 Sep 2026 12:29:55 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:7e12:1f7c:582c:d90b])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-49fbd24774esm157345715e9.10.2026.09.17.12.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 12:29:54 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 17 Sep 2026 21:29:51 +0200
Message-ID: <20260917192951.948194-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libsrtp: bump to 2.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cisco/libsrtp/releases/tag/v2.8.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 232c1063872..89a5820f496 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  54facb1727a557c2a76b91194dcb2d0a453aaf8e2d0cbbf1e3c2848c323e28ad  libsrtp-2.7.0.tar.gz
+sha256  d123dcff5c56d4f1a9006f2b311ea99a85016cbf3bb24b1007885d422237db85  libsrtp-2.8.0.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index ba58b900d46..076270cbf92 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.7.0
+LIBSRTP_VERSION = 2.8.0
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
