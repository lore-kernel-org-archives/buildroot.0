Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F46C3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 09:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 758F180D63;
	Tue,  6 May 2025 09:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F8oSjGDeNQk; Tue,  6 May 2025 09:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B216480D6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B216480D6A;
	Tue,  6 May 2025 09:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF1E220F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C092B80D6A
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE2TOvkmflBV for <buildroot@buildroot.org>;
 Tue,  6 May 2025 09:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=me@brighamcampbell.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28D5E80D63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D5E80D63
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D5E80D63
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:07:40 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-864a22fcdf2so153133739f.0
 for <buildroot@buildroot.org>; Tue, 06 May 2025 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746522459; x=1747127259;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RNwn/IuaY3I4lTTQGQKIWCjB6Hwv33nxmpulpS2inHM=;
 b=hprBjwjJ9OAqKRN3SvA59Hbn5U3ubNg/d99sSvDzTntx+a/Wgq6/HQLJQSF58o5zLt
 st69AIl7XQl5ZsgrYeJ7doazt7y2EC0llH9G5Zc2oY0ecF8n6wGwSas2PS3vTcstKs+w
 wnz9B0gaiSwNRI4yKyHJzB4TVooKj/c9Hb2X7eMGhsVJmpb2/1RsRzxzBXEaZLfhkDTS
 RtlvxyZIjBAHywc3a9GVTp1YkM2lJ+5dq9hH+aChjE7WBd/npHe0I8mfw8YTEhErvtku
 pNg2YQ5Y+wKrwEmSvbE2D/3TPQYrlUQ9lIeK9jXbZcqSHZfO6zZ1nHei6LPBB5o0ESXU
 BttQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZYohziW8MRii7g8hyHcsaEmiZ5mVXcrUuY5DWaKkygDDRxS8yBOebOimJ2/MjaWeqRy4Do0NMr/A=@buildroot.org
X-Gm-Message-State: AOJu0YynMWGsH5tFeWmdXnzYDCJQnKkR7UXRu9FlTn/t86IW5SSLqZAO
 k9wW3f2HSnCreekJJDmVR/g9Ho9WpsUNMAxX+zqHuDdG4nT2XkeIUk4WGH9o8Bo=
X-Gm-Gg: ASbGnctwmhU2h8WDbdQFs5vBYOiD5n/Sgg6LSHMt78OgIWYsSAI5BCfb06bfPZJdRvb
 qXFklkN15fItdsYfiQdPHXfv+wZ7S/aCzIsxoh4OjDeIiGl5JQ9Kc+6N7dqFNldc3i3jDdqRkWf
 bAmUullq/X0NcWPjWoki0gUqrCiKxan38DBubrizPY+HxEYxuvoVLnYtl+xfrQCVwvyop5XIeEX
 PYW3Y6c+HrGrMuGrfiINz6vFmQd5kITiGoZoQDu6t1AjgtlZRy3gWvL/YA20sIwFzZMkFVrIoT8
 IdfLgw+Cee4drpSVcR185Dx79VUzwKxRXjsBMg==
X-Google-Smtp-Source: AGHT+IH2Etaxg/65Pwi442z3xdA7AnD9iSjZ212Y2xzcxq4w/cE/AMB8Oiic3jwoKAMQ+U/+OGvGbw==
X-Received: by 2002:a5e:9709:0:b0:85e:16e9:5e8d with SMTP id
 ca18e2360f4ac-86732d2dddemr260065039f.7.1746522459034; 
 Tue, 06 May 2025 02:07:39 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88a916042sm2141562173.40.2025.05.06.02.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 02:07:37 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 06 May 2025 03:07:37 -0600
Message-Id: <D9OYJGBFLUT8.35SXNUQLMD2TR@brighamcampbell.com>
Cc: "buildroot" <buildroot-bounces@buildroot.org>
To: "Julien Olivain" <ju.o@free.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250505190840.1316502-1-ju.o@free.fr>
In-Reply-To: <20250505190840.1316502-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1746522459; x=1747127259; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RNwn/IuaY3I4lTTQGQKIWCjB6Hwv33nxmpulpS2inHM=;
 b=C/YMy1oxf4IBpVH4vYogySEA3ZWXUUJmvP6DR1/UMp180SY0VjOTNR06OMxSPVqV0z
 bMJQYA1cgEGLHjTW/mT+fmIx6jXreuk/5I9YHfV8+LdWxFH7MTymQh3XW750K5ZGbXmy
 gHQgvYSTL4/p3Qwbtqup+2/AHuUyQ4XYVbM6diEyuZoEiACar0dI7w/6UQOHRpJTIMVw
 uoRNnoM/C3m6Q7gXcQJrWAPaVCE6k7s3V29spu2zWOBdFVxRcNIW2MpVXxq6j+wQpOWc
 eD9l6viFLnTg8dF+5HDXeOtvt9P0Fcb3TTfbmpP+4uF1tBw2XbJJQRJ5ZhPYmBaPw2Si
 AJJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=brighamcampbell.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gmp: add patch to fix build
 with gcc-15
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
From: Brigham Campbell via buildroot <buildroot@buildroot.org>
Reply-To: Brigham Campbell <me@brighamcampbell.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch allowed me to successfully cross-compile an x86_64 root
filesystem on an Arch Linux host with gcc 15.1.1, which is otherwise
impossible for me due to the same error that Julien reports.

Thanks,
Brigham

Tested-by: Brigham Campbell <me@brighamcampbell.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
