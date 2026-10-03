Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22424CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4BD40D0E;
	Sat,  3 Oct 2026 22:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lU41_f6o1mE9; Sat,  3 Oct 2026 22:45:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F3B9B40D62
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067518;
	b=bFhVP+LAIQVuWE6ht86ph7LR4cUCwRHoTSiDe+hYbtnMyTQlCJdFnTrmyUNqplpMXPSe
	 3ZXtDq+ejcLLmDoeNF6tyzfPw1aqyH3muwuUmQhLc8VWwRSIaEZMXlkQqO98QD4thx/MI
	 6H4MIpRCjIzQr8Y5pZRzFEpc0oLOFLW/PpbBkYt8wnc1c0vyfQ4JyqhZDDWsk8v2JqM/Q
	 2khjunMmHL9NUBAo7wiFJf7YAN+jFQY6cJUSZsiaS7ohBNkNv5JzASYU7lnE+yYm9OdrG
	 s+o4MrCDL5I7+b2sPBLHOFbiFGrU59RdzrKY1oZF/xo6LABs7Ez0F9lx75dNtwlMEJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067518;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KyEpkpXrTS+BfUw1apaRFJ1wFB6uNH5WmP7Qw2IIkFg=;
	b=NgjFrtpPCXPXaSNpn23cVwyvmSXnZ8MCwUenXxaTIQMxUOZ7GNwHtDWv+VHx3W5AwsTE
	 PF72qdl/BnREHAofC3/30GbpHgWSwpiJIor2EItKfutqwVY3s7zmV2DPsTPBxD6BnmLGa
	 D/4TuimAbammCW2PYFSfeK5IxPnN4q6N/3qqyG970D6Aq45+6LrYgFyrUKz7W/OKDVB0Q
	 L7AKQjGlIxjiNTzQNfq+dkLeuaE5P1w5rgtnkZlCNoQUukpZ3UsBbTjuHXHj+07K2vdhW
	 vkJr+EMXULgOU5KCjymguhoR8ewQ/5BvygTNa5i/zpfsS1d9SfyVUWZ+3g8yXNzVdwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XUUk7zy3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067518;
	bh=KyEpkpXrTS+BfUw1apaRFJ1wFB6uNH5WmP7Qw2IIkFg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fjkJ6mbBsiH2Zx/JUkHHeSuG6xCDEv6VU41Ruzu30ggOYkhNqxwNN4mtLiXITkXeN
	 R+hJT5JNz0uLqaG5j8VfhnG2BR+lH5+LUSk4kpWDUx/Re/prV9WbQyVJs+Ey3PLw6N
	 /goSXP4VKdqe/g6yKCW2ZLsK/KJqYr0D92+mcTsK2XEc0SR5ppOYP9PSd7XSFso7Tc
	 plWd5ExjB6aGsveyOWkKOY4SkVjYQE1etrFeEw298yOaI10pC9DiqY7yXJfdWWRJTp
	 aONYDYuA9jtWaUi0JM3QYpFoRvHK1Mztpsn7F3FlAajxvkQjNmpHyLVZPjVOZJPwCG
	 kXifR5hLIMcLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B9B40D62;
	Sat,  3 Oct 2026 22:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70BB2263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6289F40C9E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcOh1GD3sesE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D22D340D62
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067513;
 b=DHMK0n7qjaOVTdRYc6UsN65LMRVQk7sOieLW+J84fQo0pTcMuzsXOQhQHn6gzKiJ/EZW
 KYO7C+aHqxiq2GGqvsQJaoa3dLgZhwYfp+UOpZQ7jZGqCa4+JTY+eDUXRsDT24104Fqnq
 JH2DC/PQQne46Bw/XLETWlzImPLIgp1quTZiYbv92Nfl396sjEJ3ybiNNu68aq16qFE6D
 YYfGkcrWaSUHiX0ACKGqUq9ddqa2HaCotBufvUkWzcogfTGHjHloF2wa/PKXamK+b3vjV
 msq8ezHcV48RdzAhK0gK3J73x0ttclQGaUk/o3MHT/xtuu7q1Za1NeHFN/+6ml2WOrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067513;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=c07U0ngAFH2wIWqVbrlbFJhQ8m0xie7XVsckDyPVC+A=;
 b=kmmy6Yzy0zSQuskROwZK+FuedauyCb2Qu2cRewQkreeFw7vzVzfbeVBZ/A5eOpLf0Leo
 HS9gcdtjj2lRN21rWo33quPN/UBKEQwQn4Vqw+m1NunRofId6KPrtjfzGMEydn4XmJbUG
 feIbN2DiD5hzHAQadEira9Gn7mkWgi587pAzoXH8rvL3wIyqitwxX1QE/mgHnQCV/OyFu
 E1pFnsCQ4wS1ETzs3JefY3bj2pXSihEFncWUZlwydbUT+H9nhcgR0a1+EEX9hBXfU9t6r
 jk1AJB2Bh1Nn1PfYkTPadmqkYQmuRqE/wGN+/HmUO/VrwxBbRP+BIGf/L+N+z27V8vQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XUUk7zy3; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XUUk7zy3
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D22D340D62
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:12 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-81be5042c56so718358a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067511; x=1791672311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c07U0ngAFH2wIWqVbrlbFJhQ8m0xie7XVsckDyPVC+A=;
 b=XUUk7zy3tllKRwLHwYN5FLxH0pVxlnQZnuZ0GyRhBk7bU/r+X56I9HcqO383K6P0E8
 ZY8tJaKzwIZerZlBGY3asRsaffxmReiEDn2yLvvtkOcaUl35ccMr+rcfBxHE8uo1Iu+n
 Au4j+kqEEdiQ+mw2sgc1+nADcrCiq6sIJiteBmzr24HcVCeF5c9ckkb9igBL932N+C8X
 nD4lHSjYP5xuLc4LTQ7GRThLRdvQdxY/5QgGknMDv9xiHUrGLo7WwtbU27rIeVo3ekKq
 dQIDhNgX+HdzxpCdBFu3zKwZXhNu4p3XoRmjeOUE7OkXb/2tlrtoPRd03P3jpn2ZZm6e
 uNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067511; x=1791672311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c07U0ngAFH2wIWqVbrlbFJhQ8m0xie7XVsckDyPVC+A=;
 b=ZmXHoRTvUQDHCdiuF8e+i64xNKlcu5OOF+0BSyjNrCnxN52iXrVRQkFi2PrJazDqsp
 p1rqPAAJs9iHU0O/EAxQ1IMQqOABnZupKTYsGpiwS3A35ILHTjqa+szIpir4wqsXV7Ht
 gtMdEucrHfP3tvUGRVvjgZxz8XaRM/TIo/Wn4qAmw/oTme3xHkTXhhwO2hSMy9pNGO8i
 xMpFBXFSuAsExMHfAGjxZlPxuAaX4klWRchStOEASMy65fzjNfCh6P6Vugq9c4y9MCgF
 NAfE6KUJrfEKJe6t4FmcTQn9an9kr1cL95nahv2l+l7N3jhkZ+SpWta4hd7MzElE1tbv
 HI/A==
X-Gm-Message-State: AFuF++nYEeUP03OvqexVNLOnJUYhzkVVi7PcKcclQxi5Y7anlAWmLZhA
 EEL23bEWuv5cmAhQhX5tuBN1s4F/lxlY3MJvcDkxG0z+RjCxreH65g5xlOygCA==
X-Gm-Gg: AYBFou2M1yomi0nx72DkAGSxRqqGYwUaiMeSJVnPQwoQUYDYqUiXj+G6KxhFc2at4D8
 giD0fMrL4STobkPNYHxYxPRrxuXbpDgIAZpqB9oZGdo/bjTKk/7qQ+rAaIckpfW7khljcdAZ4CX
 Z7Suudj4nrX6danS67y88ELAaytN41dkJQwYUsssfD1XVQGWZc672AhB5WDlIrye5zb2WJ2UfOR
 GJTpOPVRphrUIyDkR6/ijw9Q0P4SnM7I0rHWU6o48QP7kJTj9itDjoJICTS9sTKMmpEGrk0LNK4
 9HVhs6If1adO7cjLaqgG+LhmG9TfD3wnSW/EacZmqejAeeYk5OJqaevLpyKZpdwD+0gT0X+AFno
 BeIQ6FCX/5V/wG831VB9x8lRl8ID3m2icXnG0BS+4Hp4Qp6Pv8E6iTSO2L/53tAhgCnAndZ3bVv
 3uTF46CWpS7qJopPYGF6e2LS95FaIuimMYMdAbVXvdNMp4ve/vrXyizcxwEZuTMAhFAzg1DgyXh
 H1vW3hzh5yrC+9zVxYw2XO+WMUi9Pdu39GJEG/cgyCvNvd2RNO9DOud6FZKFhHL8/mQL0Lihc1U
 KehMsnNw7F9+sd6qBOvABLG9JYm/VbgRKahE4IjxvKYKthJKc3SRGqeQdKupfB3fT8PkALxJXj4
 LE1RsZfpn0ovMuuAcQNZjiCLQI98ml56U6hX2fgJE8g==
X-Received: by 2002:a05:6830:25d4:b0:81b:c62c:b63 with SMTP id
 46e09a7af769-82285766111mr7577613a34.18.1791067511222; 
 Sat, 03 Oct 2026 15:45:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:45:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  3 Oct 2026 16:44:36 -0600
Message-ID: <20261003224447.744966-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snmpclitools: bump to version 0.7.2
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

Switch to the poetry-core build backend.

Use the standalone license file, including the updated notices:
https://github.com/lextudio/snmpclitools/commit/d95f1008c52cf5c3cfaa705b383cdcc44c284066

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/snmpclitools/snmpclitools.hash | 6 +++---
 package/snmpclitools/snmpclitools.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/snmpclitools/snmpclitools.hash b/package/snmpclitools/snmpclitools.hash
index 575bfbced8..a9d3ed6879 100644
--- a/package/snmpclitools/snmpclitools.hash
+++ b/package/snmpclitools/snmpclitools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/snmpclitools/json
-md5  132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
-sha256  820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
+md5  5284f7f6015696d0312172601832783c  snmpclitools-0.7.2.tar.gz
+sha256  c54977a588bfc4beba83ec77f6294957128de27bb3b86c05f488cbd3d0977b15  snmpclitools-0.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256  ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
+sha256  9ba24bb6f0cd2087d8be50ea116456bb8b171613891c92800e5cac931c6649e5  LICENSE.rst
diff --git a/package/snmpclitools/snmpclitools.mk b/package/snmpclitools/snmpclitools.mk
index a4a90e5bf1..9552dec46a 100644
--- a/package/snmpclitools/snmpclitools.mk
+++ b/package/snmpclitools/snmpclitools.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SNMPCLITOOLS_VERSION = 0.6.4
-SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/03/2a/8488828e92a82c5416e33fba6089283162937b0f73e5b15205fb6ec3bbea
-SNMPCLITOOLS_SETUP_TYPE = setuptools
+SNMPCLITOOLS_VERSION = 0.7.2
+SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/b7/64/947b1cad405ba175c03385a4936b930b1fda7ce65e9da5bef5d64a5439fb
+SNMPCLITOOLS_SETUP_TYPE = poetry
 SNMPCLITOOLS_LICENSE = BSD-2-Clause
-SNMPCLITOOLS_LICENSE_FILES = PKG-INFO
+SNMPCLITOOLS_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
