Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3BCD3C92A
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D68F980B3E;
	Sun, 20 Oct 2024 20:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvuXszJObh9n; Sun, 20 Oct 2024 20:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D4F80B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D4F80B5E;
	Sun, 20 Oct 2024 20:40:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D19171F
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A93980B3E
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 20:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3On55OQrfNF for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 20:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com;
 envelope-from=judge.packham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 546FD80A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 546FD80A65
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 546FD80A65
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 20:40:24 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6e5e5c43497so7732317b3.3
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 13:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729456823; x=1730061623;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0A99CKrXGrVmT76yq4HJYQW/7BqsSOwxXq1M6B0X+9E=;
 b=vD4CQxCyy2AHtmmWGJv+LdXqvjaUVhRz5rd0OiK81xCozY9463OEOSdldLRbLGYaql
 Z8ANcWm4G63Gpxsa5O4Q7klPMwB6xrf7Vf4ObpkavHjQYo1I355MVFr4VlnjT253jB9h
 U3LIRAmGxt8i9O0O88eHszEq0vIZFlC781LTUOnKDVIK/rYyUXjvFiGXQQehsSqYFadC
 lwfhBDqNmnSq9dTOi7v0xNggY/EQAwflpOk+fFClFYEKG50SNRy8RAHIyxf0FMHd8g1H
 /NHcXM/cOtzVXPewbYo1GOVABNkg47JC8DUOixCobAUWwtYoagsjgq3f/l6YXvs7f26l
 K9dw==
X-Gm-Message-State: AOJu0YyxPqc3ZIhF04efpOyw8LwhiRwMWMwlt07mbQDSbA3MRtQsEIWE
 nJtJjwhxc9VzX0HhJVdgW85eNjGmc/lAzW7eSRUgumQjsuNLC+uCToGT5yF3aX+HrKZhVAZXES4
 g0Mb0q1dPvNsOQvbcJT+29mpyqMJOpD0QkrY=
X-Google-Smtp-Source: AGHT+IHKV9ZOoR90ufPN35828wYx5Y52x7qc9u3n80vVWFaKstTAHVesKWf5BQaySiFwrWdjniuwKxbVV8C0WxvVxzY=
X-Received: by 2002:a05:690c:48c1:b0:6e5:af24:92fa with SMTP id
 00721157ae682-6e5bfc7a906mr99314547b3.21.1729456822859; Sun, 20 Oct 2024
 13:40:22 -0700 (PDT)
MIME-Version: 1.0
From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 21 Oct 2024 09:40:11 +1300
Message-ID: <CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=LNKfmpu=sqAD1EMhFg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729456823; x=1730061623; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0A99CKrXGrVmT76yq4HJYQW/7BqsSOwxXq1M6B0X+9E=;
 b=bBa4sI+yeKnRPfX0vTlu+IfkFwOlLWFHIk2wRqc1oeQEQlYQLRukoUmXvTfifF6wgr
 y5iSrLgoq4DeBuifT2kEhIAuhXSDZL1eFdOlgiyzzVUhINAs+ttBfwg1pEJ/uTOcFv7w
 4ehwD+f0W+zXT2fsGBu+DqHiSp+lq2vSRkZxzlR/ruY3ouZ2FihJgCon9RkE/cvC+DZI
 l60efmMJoUbhv7WBUOpeN5vz3KKUqXf5Q4V3mv+F7oQDKzjxe7eMy/nuKMdk6BowaX33
 9mfQqsL9QZTpGd+nvXFCEbeNitNuoyTJ0WNNqw0AGi4fQvLxH10BhHp5vXDXXUo27NGC
 XWYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bBa4sI+y
Subject: [Buildroot] Linux and out of tree DTBs
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

Hi Buildroot,

I just found that as of Linux 6.12 we won't be able to copy
out-of-tree dts files into the kernel source and run `make foo.dtb`. I
know buildroot relies on this as does the build system we use at
$dayjob.

I proposed a change that would restore support for this but this has
been rejected because "This is not a use-case in upstream"[1].

So before I try to convince the upstream maintainer to change their
mind. Has anyone looked at an alternative for handling out of tree
dtbs?

Thanks,
Chris
--
[1] - https://lore.kernel.org/all/CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
