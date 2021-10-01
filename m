Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDA2C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 06:21:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B19761A58
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 06:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B19761A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2837E40599;
	Fri,  1 Oct 2021 06:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teGLpWNyp4xC; Fri,  1 Oct 2021 06:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD9F40578;
	Fri,  1 Oct 2021 06:20:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 389DD1BF578
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 06:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F0C400D5
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 06:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3GP2153j5Gt for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 06:20:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DE5640017
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 06:20:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17so13659703wrv.9
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wONpNZrc8Gr7ZT6N4rcC7+sUtqIbJ7t4U86xrtU20jw=;
 b=4DlgWwYVInsNt78R75q5pacggeT+ELfRC1NSSBUu47BTruFpKzCH15k+7GYzdoWRHY
 NlTu71eZsp9sLTSQuibm1xku+OgqOwTX14oWRMMoHkN1iuWINBnN4kJ9c9WTOfdhl8Mm
 Htgs+ZEVhjJC+2dJBQxrP8SSlmpIRH7jxahTeAbsX9CtfTPFWWR9vM5fy6mGoIATyxC1
 ZnsiNVPCigacLynAfSgcDqM4EPCki7q15e3at3faw8OAXF+gUIq4UzNrwVElnSeA0mQb
 gSjc6HVeoJF4Z/gOb9RQE9SPvEM9pJd0bFwcVttN1ua6PiulZ6K3fXncRnam6YGchu7l
 Z89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wONpNZrc8Gr7ZT6N4rcC7+sUtqIbJ7t4U86xrtU20jw=;
 b=AA+O2r5tMWy0mJz9kR3r2hhqAoJCAZnCekXOThOq9fFSKN3dskaAuDTLU4SEZ9Qbmi
 n1RfMf+SMRSkogTJlUhaYUKsrr212pCM68b55ofELYADAztcb+/4kjNrbGQoDfKhbQR8
 1EZYuxvwrhQyuedInhruLlLjvIWr6PYnTAXeHySBzXRLXJPQcXPMG3NcCwu4llPO9HK2
 1gzm4m7HxuR2rcSSeviePBgAP/oAkARK7okM/T7dgE3q6d/sFNJdgGtz1thTyU4fTu6L
 rsOkZwywjh6TJ1xyaTBNV3/ekPFFXjqG4GdquU3Si2kQl05EmSkIh4LhO3vS18pfvxYo
 /LzQ==
X-Gm-Message-State: AOAM533335zwD1CEBQKl9y8qY1syEAzrq7PSOogzGAJbpvo7doeDXrlo
 FtwEfpA28meSriG9nH/1puziEGfN507oD/KK
X-Google-Smtp-Source: ABdhPJwZZX1i70wEwesreRF4M9ED1QkYDzcYdASfK10yO5K73CLsO2xyXgUHAqYUymjwdo86dVJXgg==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr10161881wrw.336.1633069253606; 
 Thu, 30 Sep 2021 23:20:53 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.ssrc.fi ([109.204.204.138])
 by smtp.googlemail.com with ESMTPSA id m21sm5418558wmq.37.2021.09.30.23.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 23:20:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 09:20:52 +0300
Message-Id: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/audit: Fix type output on log folder
 creation
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGVzdGluZyBidWlsZHJvb3QgMjAyMS4wNSBJIG9ic2VydmVkIHRoYXQgYWZ0ZXIgZmlyc3QKYm9v
dCBJIHdhcyBoYXZpbmcgdGhlIGZvbGxvd2luZyBmb2xkZXJzOgoKL2NvbnRleHQ6Ci9zeXN0ZW1f
dTpvYmplY3RfcjphdWRpdGRfbG9nX3QKClRoZSByb290IG9mIHRoaXMgcHJvYmxlbSB0dXJuZWQg
dG8gYmUgYSBkaWZmZXJlbmNlIGluIHRoZQpvdXRwdXQgb2YgJChzZWxhYmVsX2xvb2t1cCAtYiBm
aWxlIC1rIC92YXIvbG9nL2F1ZGl0KSBjYWxsZWQKYnkgUzAyYXVkaXRkIHRoYXQgZnJvbSB0aGlz
IHZlcmlzb24gb24gbG9va3MgbGlrZToKCiQgc2VsYWJlbF9sb29rdXAgLWIgZmlsZSAtayAvdmFy
L2xvZy9hdWRpdApEZWZhdWx0IGNvbnRleHQ6IHN5c3RlbV91Om9iamVjdF9yOmF1ZGl0ZF9sb2df
dAoKVGhpcyBwYXRjaCB3aWxsIGN1dCBpdCB0byByZXRyaWV2ZSB0aGUgdHlwZSBwaWVjZSBvbmx5
LgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtp
ZS5jb20+Ci0tLQogcGFja2FnZS9hdWRpdC9TMDJhdWRpdGQgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2F1
ZGl0L1MwMmF1ZGl0ZCBiL3BhY2thZ2UvYXVkaXQvUzAyYXVkaXRkCmluZGV4IDBlZWY4ODFjZWUu
LmRkM2RjMjJkNmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXVkaXQvUzAyYXVkaXRkCisrKyBiL3Bh
Y2thZ2UvYXVkaXQvUzAyYXVkaXRkCkBAIC0yMCw3ICsyMCw3IEBAIHN0YXJ0KCl7CiAJIyB0aGUg
ZGlyZWN0b3J5IHdpdGggU0VMaW51eCBwZXJtaXNzaW9ucyBpZiBwb3NzaWJsZQogCWNvbW1hbmQg
LXYgc2VsYWJlbF9sb29rdXAgPi9kZXYvbnVsbCAyPiYxCiAJaWYgWyAkPyA9IDAgXTsgdGhlbgot
CQlta2RpciAtcCAvdmFyL2xvZy9hdWRpdCAtWiBgc2VsYWJlbF9sb29rdXAgLWIgZmlsZSAtayAv
dmFyL2xvZy9hdWRpdGAKKwkJbWtkaXIgLXAgL3Zhci9sb2cvYXVkaXQgLVogYHNlbGFiZWxfbG9v
a3VwIC1iIGZpbGUgLWsgL3Zhci9sb2cvYXVkaXQgfCBjdXQgLWQgJyAnIC1mIDNgCiAJZWxzZQog
CQlta2RpciAtcCAvdmFyL2xvZy9hdWRpdAogCWZpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
