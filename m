Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63AFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4037F6109F
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 20:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4037F6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0398360703;
	Mon, 27 Sep 2021 20:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMlfXfxmSOFc; Mon, 27 Sep 2021 20:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E29606F3;
	Mon, 27 Sep 2021 20:31:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 090A61BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9BB4404B5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahiSGWEuXeHf for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 20:31:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63DD2404B4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 20:31:19 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id k17so16968502pff.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9vt+7KRPLWP5DrjzB7Tvv560tin682sbL0qeU6rDLs=;
 b=ND2NgkG+crdExIH1MWSmcS94NQxC8rWtYhRi8hBu9rtzXUCyRm+LbkiOdTPHdZKaEe
 gMFA8pZveYxnfYj410Y6d8vcx08UbILZrvvW/uksACpIqtI3gGtXWG8UJkeC9UF8t2pk
 KpCqcCGQzjko3ljj/GqMNYKb42gpZWBlIRF5HXmJ7WFXk1rYA8cnxAVf/l8pF2DffhLe
 rehf9tQpp29fwxUz0hg8471bjMuEwRu7boT456F0dUToXySHOxfeHDO6NEbuMp6x2H4q
 CLgqNHpsBjlBo+00pvRAULOmZnCbVZZus3//IJMi8rjSvomxcYIWzrS0B6mg2Sg0K1Dr
 TOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9vt+7KRPLWP5DrjzB7Tvv560tin682sbL0qeU6rDLs=;
 b=iN9YP81GUfiQscvylxYzCygJqASGP06I9cdikmfARdTXEBD2fsdwRmJcXMEBNKt8vh
 0R0DdJK09k3xGmlJK1W211jERxVhD3t9WNIMQAftDqbk+PrMj+Js40Z+5ZlrTgp9gzYL
 21cIgpzcuv/Lsn9vefYaKKZ7UBnsJMO8vypeb4PDYi8GMl0gOGDfAyE5noR+EpXzMR1X
 QeOGTFrnFtGzVxoRgB/pE46zu/U27Aqcs+vKqE4ViOoKgxzGTJ7u0Obkv9VNc0MVMI8D
 5MVXEvfvrhGtfSyPKtI1Ju8L+AILmsGpls/1nB87MXtyEnTqwTHjDgHPqP+z+kR1UKIz
 MKQg==
X-Gm-Message-State: AOAM530AdRTnVLu+AdeftMYg8ep1Q60pMI/Hafp5DXkEwzfsRQJbn6jG
 spR76GAWHaA2Oq+I8lXG3jkyYNY+qZI=
X-Google-Smtp-Source: ABdhPJynlq+hqNxPYK9WnqxKtNXEWVBq7lzppASgYHha6F+Z7zQMJHDXeIYv6sbZ05VDGK7SQqE4zw==
X-Received: by 2002:a63:551:: with SMTP id 78mr1319658pgf.324.1632774678373;
 Mon, 27 Sep 2021 13:31:18 -0700 (PDT)
Received: from localhost.localdomain.com ([12.231.12.194])
 by smtp.gmail.com with ESMTPSA id lj7sm277472pjb.18.2021.09.27.13.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:31:17 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 13:30:48 -0700
Message-Id: <20210927203050.64177-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/RFC 0/2] package/nodejs: bump version to 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Here's another hefty package that needs to be updated in order to get closer to
the goal of removing Python2 from Buildroot.

A huge thanks to Yann for the help with the qemu wrapper patch!

Adam Duskett (2):
  package/python3: Add bzip2 option to host
  package/nodejs: bump version to 14.17.6

 .../0001-add-qemu-wrapper-support.patch       | 76 +++++++++++++++++++
 ...eck-if-uclibc-has-backtrace-support.patch} |  0
 package/nodejs/Config.in                      | 15 +++-
 package/nodejs/nodejs.hash                    |  6 +-
 package/nodejs/nodejs.mk                      | 76 +++++++++++--------
 package/nodejs/v8-qemu-wrapper.in             | 11 +++
 package/python3/Config.in.host                |  6 ++
 package/python3/python3.mk                    |  6 ++
 8 files changed, 156 insertions(+), 40 deletions(-)
 create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 rename package/nodejs/{0001-check-if-uclibc-has-backtrace-support.patch => 0002-check-if-uclibc-has-backtrace-support.patch} (100%)
 create mode 100644 package/nodejs/v8-qemu-wrapper.in

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
