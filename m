Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ACDC79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 13:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB5F580AF3;
	Tue,  8 Sep 2026 13:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLDre_bsDgt1; Tue,  8 Sep 2026 13:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4BA3E80AC8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788873638;
	b=GW8mWX7IMpOUFWs8KW8OUGncUOiFlLWVarn2NYUMjK6V4VXh7NZ69geZChmydHYMI7H1
	 jSspN4XCaLVA4pn3Or83mIp9ieUatgkYn2Pj5UIwdSOI/tyGLTSFAXmwrWnCS4SDXoVZH
	 FDM39Sv9Pd56j3wiLNVZjBsvV++s9736BQMToJrI7FKGKDvNR3LRKvB1A2lz5q0sKlKtS
	 vPvUFE/AgCXvkCWFapQ92zSa4JPjtvlx3I5XHrxARfva16lf8K8LSE/RG56Lch2r3thd/
	 IMzZrl3xEuTervOzP3mIUY7Uq5PwZhKmy7o6943fjYp54Y2kqFTYoHpU4/N2DnfRMYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788873638;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=z2gVspuydCPtK8/2zicCYMOUmxkJF+uclXBV/FJIl1s=;
	b=fnbqZZCM4xYYaZJdfnWErHvIFPXuQ8wUBWTPW+/V1NbVGu9NJT0USwYWr5HyrnRbqFQX
	 ZUdImm4T3O9wE11mZvqYDTCpLlaeBJhl+LbZQvvgV2PdMhCnnVkHsNRwCy0skDwBjSsI1
	 2GG0O4QVoZ/IDLC8nBS1MU+Vzf08DKfRhcKU/TAg5Vdyj9xj999n6bErA/VmJ+jwNhS2W
	 2WG62unpU3skeR1r0V7jXt4gOeRKV2BYEk4Wd8R7F/XUb1lntJayeWX9s2Dmh5NVJ29YZ
	 1Dl5ydq8BoTP9n+h0jsm7pqklTkdhTbZGC/Rd7wm5BoZ7tF5U1Wdd5c0esO1ZphpDgA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788873638;
	bh=z2gVspuydCPtK8/2zicCYMOUmxkJF+uclXBV/FJIl1s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pAN1MrQLw8zMq5kSq3oD0GIETno6YeKWeNofdoWF7TmmPPeYJu/1OvYzY+7h12Iqq
	 Xn0PCn1FZl9Rat7zFdjLYNY/AE4vgllrgVhGs7tW3D3gTvslBb4VKXJyHyrG3dmMuY
	 I8md5ukLuTXNqCcCdSpKA+H92QifYN8m9lMRE7tcnt2vBrVXsvKQpVME4Cr+IlAdjZ
	 9RGhsax1ApIFxZt9+V/8T94/bHS7dBXmAxCoV3KWD3aYeshfaHhP87cbMzwMwdIMkY
	 cRkSQI0fV4ibISfzNGu+d3UTgD+MLOFp7i33rD4NECMyGN8qd0azx8F2ZjColc54Yu
	 ++07xRPgAPizA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA3E80AC8;
	Tue,  8 Sep 2026 13:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09288372
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 13:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00AA606F5
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 13:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkRJX4z_FxHS for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 13:20:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 875F7606C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788873635;
 b=TvlBdgKoUAZbOCki54W0fs8XyQus5hUnACw98eDAfaa4H5MGJDzVM1Tx5iSQcp7g8W2U
 XMRxv02HV10uoGGzMkCKXgLK0LUlmSwf4PXKLJnm6V/2LzmWS94zGJnUi8DVbyJAjvLyJ
 YEOLRKs2MTPVcjoIYJj+HgwEKPfwit7oTBYT4Vu4D25wSUtoTF4COCrIDrdI0/SaJA1yg
 YDL2OA/AZ7/oq1+IMwYK2mcbPzM/VHFLMa4DA4y8Uh5h4GTCDDMkNg2NNxt5K/MdJlsco
 lUGoiUKax7gu4zcEHIiI0VeDZfgA0VZKPRRUok6wW1l9QTA25YzMnWAFYqkvPAYRCwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788873635;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=beB0tOi4TybiSMP4w2cy2vPPakoFIBpJYV9/0SX7VNM=;
 b=AOdTJsJfevt5iNTOXializjS0Uabl3i9voh4GsxUDyOKJWKsdl4wfgAusIXtg30yT+qc
 dUr7bLPgq0uhZnmabgIWF1cGM7jm32RSdrD5TSzaIoPhgUTLy7LYNUshu+0vszx1J1R2c
 T69Ltft0x7O+hbTsQbNAnr4GQJnYbMCGTSwcKifz7DFOMrFzzRB36l1H0IIlsaEDG8Nad
 Z0Q6UZKopYuzj1qU78+V2DKM4hwyAdM//vyfOHjAdmBFWlgmz6MAth7W/xlThwFhsDJ7b
 TJ6yEAxBrvh1WNle+1U0mxLcipS89AO/AfrrJCiVnaJb8nyj0mqVvx3PfMsvZP2EhtQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Zhn+il3b; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 875F7606C4
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 13:20:34 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a173ad7cf4so7288976a12.3
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 06:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788873632; x=1789478432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=beB0tOi4TybiSMP4w2cy2vPPakoFIBpJYV9/0SX7VNM=;
 b=JdWQapGStA/FMD+fl1zvlKnJRAOcvjqwt3IfUcB3ATJsMe9Z84HsGuA4p2hK3qSEwy
 Ep2dToP0MBOsB8L1Lnh8w1rVr7k41eMdzlvRLF3q3RRfpiBjVTF8uCn0N87cI76ttITN
 hHGVDBDUI4nQuXk+nJT4hM7CL3UUfjb2sjqpY9OdOyiRjSF/2vWrUTJFlm9ByWc2eTQN
 IfD52rwdAjyVUQBcxOvcuVavDxVB0LYpJwEJhEp6g8UqYkzo58arAQeqP4kwpT1kQDG+
 X1ZLbTDikZXBLtlJxvt+lnsYkAXKlScO30uEuQm6wBjpW1oCwa4Dkcla5b1YhKnRZiwI
 fq6g==
X-Gm-Message-State: AFuF++lKmmajSDWK23Ftna1Gs1LMZukjhc6qM23yEIELcbLcfzvnX++F
 jA8LSMf7mulyXUuoFDZhYu6aGaGVDsDUnFWFgIVh9E8XOi884qso+DqRvFwR9g==
X-Gm-Gg: AYBFou3xSfLESYLVjphvit/Ch0URleXi2/B1jC7euzHqNntsnSkioqynHNd2/pyBHF4
 2z7nwaizpQUcM8J0bf3b+fZkYESq7iC/1y96RcqCL+cycRghpPmif9Eo2Hkjp73CjjgLo6QAwA7
 T8/bZc10CZDsR+9JtEx7TWJ1pOsx2q1PAXoyt25UotY7Pn01DBaa+c9ch87rMMI1wt+XKbgl44X
 Gp5lcQNtm5tLi6xVQf2fWaampECLTDV1ppZv/XEqkPbcRo7UtJoZ0t7OIEI+3jkt9jjsTPNAOy5
 MIEvrv9I2XCjHWntNULO7Rtiwp4e44MtSVy9nukUHib3VJBuy/W4Nxu5bEZHGihu1RBZFS+KJWx
 Gw18uJpZ3uvZWvWpr3MXVd30KY36cKXHDdOv4Q5+Iuwb9caj+zLuRI1Dc8XJf0qG9J5+ETyoIT7
 RwlM6ugFma0C+V8on4xWzFWTa3XUrykT+/E6S1IbaojpFyZFUsxR5+sJ8Jc6I06N+kEFffxpvSV
 8FU+TTOiK8S+wIv8vXVmUnei8iQnCrPXDXL
X-Received: by 2002:a17:906:f596:b0:c25:2cbe:edeb with SMTP id
 a640c23a62f3a-c260cb46a4emr1164949166b.21.1788873632137; 
 Tue, 08 Sep 2026 06:20:32 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c28e4579395sm364249166b.48.2026.09.08.06.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 06:20:31 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 15:20:30 +0200
Message-Id: <20260908132030.3792569-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/e2tools: fix build with uClibc on mips64
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

put_file() passes &statbuf.st_size to store_data(), which takes an
'off_t *'. On mips64 those types do not match: uClibc-ng declares
'struct stat::st_size' as '__off_t' (long int) for the N32/N64 ABI,
while '_FILE_OFFSET_BITS=64' makes 'off_t' an alias of '__off64_t'
(long long int). Both are 64 bit wide, but they are distinct types, so
gcc 14 and later reject the call:

src/write.c: In function 'put_file':
src/write.c:237:45: error: passing argument 4 of 'store_data' from incompatible pointer type [-Wincompatible-pointer-types]
  237 |       (retval = store_data(fs, fd, newfile, &statbuf.st_size)))
      |                                             ^~~~~~~~~~~~~~~~
      |                                             |
      |                                             __off_t * {aka long int *}

Add a patch using a local 'off_t' variable instead, copying the size
reported by store_data() back into statbuf.

Fixes:
https://autobuild.buildroot.org/results/49754464e5daf87f69de8a79d7e6d607c00c78e2/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 ...ss-struct-stat-st_size-to-store_data.patch | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch

diff --git a/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch b/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch
new file mode 100644
index 0000000000..86dd01192c
--- /dev/null
+++ b/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch
@@ -0,0 +1,74 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 8 Sep 2026 12:00:00 +0200
+Subject: [PATCH] write: do not pass &statbuf.st_size to store_data()
+
+store_data() takes an 'off_t *', but put_file() hands it the address of
+'statbuf.st_size', whose type is whatever the C library declares in
+'struct stat'. Those two types are not required to match: on mips64
+uClibc-ng declares 'struct stat::st_size' as '__off_t' (long int), while
+'_FILE_OFFSET_BITS=64' makes 'off_t' an alias of '__off64_t' (long long
+int). Both are 64 bit wide, but they are distinct types, so gcc 14 and
+later reject the call:
+
+src/write.c: In function 'put_file':
+src/write.c:237:45: error: passing argument 4 of 'store_data' from incompatible pointer type [-Wincompatible-pointer-types]
+  237 |       (retval = store_data(fs, fd, newfile, &statbuf.st_size)))
+      |                                             ^~~~~~~~~~~~~~~~
+      |                                             |
+      |                                             __off_t * {aka long int *}
+src/write.c:49:63: note: expected 'off_t *' {aka 'long long int *'} but argument is of type '__off_t *' {aka 'long int *'}
+   49 | store_data(ext2_filsys fs, int fd, ext2_ino_t newfile, off_t *file_size);
+      |                                                        ~~~~~~~^~~~~~~~~
+
+Use a local 'off_t' variable instead and copy the size store_data()
+reports back into statbuf, which is what the code below (the stdin case,
+where the size is only known after the copy) relies on.
+
+Upstream: https://github.com/e2tools/e2tools/pull/40
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Assisted-by: Claude:claude-opus-5
+---
+ src/write.c | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/write.c b/src/write.c
+index 1111111..2222222 100644
+--- a/src/write.c
++++ b/src/write.c
+@@ -114,6 +114,7 @@ put_file(ext2_filsys fs, ext2_ino_t cwd, char *infile, char *outfile,
+   long  retval;
+   struct ext2_inode inode;
+   mode_t cur_umask;
++  off_t file_size;
+ 
+   if (fs == NULL || outfile == NULL)
+     {
+@@ -233,15 +234,19 @@ put_file(ext2_filsys fs, ext2_ino_t cwd, char *infile, char *outfile,
+       return (retval);
+     }
+ 
+-  if (LINUX_S_ISREG(inode.i_mode) &&
+-      (retval = store_data(fs, fd, newfile, &statbuf.st_size)))
++  if (LINUX_S_ISREG(inode.i_mode))
+     {
+-      close(fd);
++      file_size = statbuf.st_size;
++      if ((retval = store_data(fs, fd, newfile, &file_size)))
++        {
++          close(fd);
+ #ifndef DEBUG
+-      rm_file(fs, cwd, outfile, newfile);
++          rm_file(fs, cwd, outfile, newfile);
+ 
+ #endif
+-      return(retval);
++          return(retval);
++        }
++      statbuf.st_size = file_size;
+     }
+ 
+   close(fd);
+-- 
+2.51.0
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
