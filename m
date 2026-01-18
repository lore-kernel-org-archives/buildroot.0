Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B122C98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 395D64066D;
	Sun, 18 Jan 2026 22:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_dnCzM9ue3i; Sun, 18 Jan 2026 22:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9681A40662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768776594;
	bh=Rj4NjL436L++XlrVjQrqLLD6aVOOLlxVt4YAigJ18hY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ro0av0lH1jmdgaJ/qM07VPwQfK+51QFWexM8JSs+uV9gDcynIoaqqNwZTXtImFYOz
	 7TFRy8OohNo2k8Q66viVKMPN6s9gdJWoCILr2q2YuRtTa1ticMxukD7TwrU2F9piSh
	 VjE+1PmXUeQr/JkvHFVLLfHWRw8Nrl6JnB1vTYKLOcuxD2ZsbQJL8UyXaA903MTCUD
	 EffSuD7/B9aeweS6S+xzPL6D/e9C2txgsO7CSrEqMwAgKtWiUxEWYPdEqS85VtGHp8
	 GItLwxUfff5M30wOxjmOaB2wF0jaROVWTUHd637mq2bA7zDNNdzgMf8mBAbpb77/yy
	 ThOdnWrZyrh2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9681A40662;
	Sun, 18 Jan 2026 22:49:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5708A160
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45403401A4
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVWo_7C6yt2P for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4B5440055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B5440055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4B5440055
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:49:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F51BA4C466D
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 23:49:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhbad-000000001R1-0jWV
 for buildroot@buildroot.org; Sun, 18 Jan 2026 22:49:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 23:49:41 +0100
Message-ID: <20260118224947.3879017-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768776588;
 bh=KMdRtTl3A5CRPly2vYJ7OMd2e8I4uFlQN9rx6PBYivI=;
 h=From:To:Subject:Date:From;
 b=lrv0q3mrsDthWko0CDWVL6yrmujEYDdqLLGVvoN7cEZUJOPX0d/OcLbFmHoIx+P/8
 w0sbrnEplRO0kbA7xFLNl6J0Fbvlg3LxaBIo+Q9BOn2vXJY+DMCorY8KlNnQyJVx//
 eI9NYrLbXtS7FnoVXOLaZi9DEI3GJCgXrc0uurF3LRPzGc2FsAjKC3ZVFFnNehvTAE
 s5a1V7LmFeIp184Ut0QMZz7l2tooKE1hTgO+TeIbU2Q/Ohq/jQ6p7TCgV/Cc4LLp1r
 ct/qzUUgbJQfs7RhAk+Grix9HVZfV1+tiZcYFjkxKY1PWGO0j42bJFf/wS3vW8lpel
 ihj9dOsy7zyeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lrv0q3mr
Subject: [Buildroot] [PATCH 0/6] Update php
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

Hi,

this series contains the bump to the latest php bugfix release of the
8.4 series, some version bumps which include compatibility with php 8.5,
the removal of the unmaintainted php-zmq package and the bump of php to
version 8.5.2.

Regards, Bernd

Bernd Kuhls (6):
  package/php: bump version to 8.4.17
  package/php-amqp: bump version to 2.2.0
  package/php-imagick: bump version to 3.8.1
  package/php-xdebug: bump version to 3.5.0
  package/php-zmq: remove package
  package/php: bump version to 8.5.2

 .checkpackageignore                           |   3 -
 Config.in.legacy                              |   7 +
 package/Config.in                             |   1 -
 package/php-amqp/php-amqp.hash                |   2 +-
 package/php-amqp/php-amqp.mk                  |   2 +-
 package/php-imagick/php-imagick.hash          |   2 +-
 package/php-imagick/php-imagick.mk            |   2 +-
 package/php-xdebug/php-xdebug.hash            |   2 +-
 package/php-xdebug/php-xdebug.mk              |   2 +-
 .../0001-updates-for-php7.4-and-php8.0.patch  | 230 ------------------
 package/php-zmq/0002-fix-for-php-7.3.patch    |  43 ----
 .../php-zmq/0003-fix-for-php-8.0.0beta2.patch |  40 ---
 package/php-zmq/Config.in                     |  12 -
 package/php-zmq/php-zmq.hash                  |   3 -
 package/php-zmq/php-zmq.mk                    |  25 --
 ...1-acinclude.m4-don-t-unset-variables.patch |   6 +-
 .../0002-iconv-tweak-iconv-detection.patch    |  12 +-
 ...0003-configure-disable-the-phar-tool.patch |   4 +-
 .../0005-allow-opcache-cross-compiling.patch  |  42 ----
 package/php/Config.ext                        |   9 -
 package/php/php.hash                          |   2 +-
 package/php/php.mk                            |  13 +-
 22 files changed, 30 insertions(+), 434 deletions(-)
 delete mode 100644 package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch
 delete mode 100644 package/php-zmq/0002-fix-for-php-7.3.patch
 delete mode 100644 package/php-zmq/0003-fix-for-php-8.0.0beta2.patch
 delete mode 100644 package/php-zmq/Config.in
 delete mode 100644 package/php-zmq/php-zmq.hash
 delete mode 100644 package/php-zmq/php-zmq.mk
 delete mode 100644 package/php/0005-allow-opcache-cross-compiling.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
