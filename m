Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9C8D59F4B
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 16:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0798116F;
	Wed,  6 Nov 2024 16:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kePGErx57UeP; Wed,  6 Nov 2024 16:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E7A5811B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E7A5811B1;
	Wed,  6 Nov 2024 16:03:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA3D3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CCE88116F
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5Gb1fL5Yy48 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 16:03:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B98658120B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B98658120B
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B98658120B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 16:03:17 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8iV0t1ExDwy3r8iV0t04ku; Wed, 06 Nov 2024 17:03:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed,  6 Nov 2024 17:03:11 +0100
Message-Id: <20241106160313.453637-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA4dYBYyd7YKXD6cvo9oXnJi7R84+n5m2+kgp4IpW8Vmp+1WHLd3xFv14K7ZSpv1NwV8VZpQ4tSZkOFeclTQFXaiAFj/xTo2me1eepuMncSW9Ervewk2
 iW2SbuGooHheJlqiLqeAUHJLUrRWhRsvDYRyEpCiPqfXIATVtgCBBZy9xAV+P1B0WZHW42ytqizqqz0+eAMVwkZv/s5iU6d9nA5LNC9wKX9Nk6ZS3X5279OE
 25QEUj9ptu2lc5PfiMBf0StBGJtHXKGmlE6Jydumr371QEekgWxWAd481TgLadKqXWM4AHfgndqfSHk0XwKsMA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730908995; bh=wBut9usV8/gchy1uL83gLWO20A7ACx9XgU4HAynkH8k=;
 h=From:To:Subject:Date:MIME-Version;
 b=Z4yvM4+koWCPkD8J+WbOWxPKahtIcNNZJil9jOcF/6Ey6TBHJIY7UU2sZbQOCCAq4
 CHRP0SXtT0n1rALIzRBe3kcp53VrLj1i9M6RyzcZXFtiBEPSXLjNhXzq4Jzcr+w+dP
 aUD+FCQRxPNBp4ZCD6gX0tbPfOzTYnEgs/yogON8nLELZ8MAff63Tmx1n7yXCGbLvC
 cNIjSFV/cgupecjPIqQueYRj1JRGXn+R5iWshJMqqB5x7YJycaNZh2Ch5vI4kdj7Ol
 0y4HcqwTPZwEGt5RN93PmJETBnzpgR5N0W3lyGvP+/jKnQYnbOJrTOhIMA4NfbDq6g
 eY7joYPwf/uNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Z4yvM4+k
Subject: [Buildroot] [PATCH 0/2] Update NSPR and NSS
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

Note that libnspr 4.36 is needed with libnss version 3.106+

Giulio Benetti (2):
  package/libnspr: bump to version 4.36
  package/libnss: bump version to 3.106

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
