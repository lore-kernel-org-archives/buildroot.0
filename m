Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D57C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A3160C0F;
	Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l60WzG_mEWnR; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1CF3B60BC1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595951;
	b=fzViGNtRMMuoYJgh1ECJV8K6DLoWhnO6uvHhKjazXtdnEYcSMrHe4qCoaiuLjvNs1Ndq
	 CHH0TyiYJLyvd5CWsSR5OVQLkF5oY33syJsTIIOj06PevGcQ17FEgvGEqekD106oPMlLC
	 VlJv6MiE1rnz7p4+/NFiegXE5MTTnAXK1kViuCpavWXRDjwoec1BAHHCEqHO0Ha3oFdPm
	 4oLY9/Yt1LmUwAyhhp/XNYVY1BkAqBnUfaWyIln8bPUEU+hMt1uEIcTH7UulceLQXWC0T
	 5GUg5tOmaOK7GD25Hba47NaSzqERGR6n8Ws5JorcGIfiO0gpTfSR2SE54hdZvneOviQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9lBwQSUKGCTnAfoemptBcguIuebNkAzw2evNvj0lp1s=;
	b=N6MggcbEE8uUWwQxzTsHe1S+ZTa+nXzDT1r8BRKJ8mns0L/NS1gxqUIp1FErBT2YNAIW
	 oCh/mNkzYAJApw8XJTqDfy9yq8Yi71ctKoEhLkUWpImZcjtBCn2RAlbzdbtEe/foUQypN
	 H3VkRTIAC8VpLAjX8d9vEHUos2a54RjIJtDKdj4i8pX6m726Y9YltjyftRDsRSorDF8WN
	 cxrXf3u18KBgeegfxOfRyuAxvBbE7eNHsWM+E/zD9h20ZE+hAsZbHPHKbHP/1ZrJupJx6
	 SnkL/HnhR6aL6BHEnKJ5i1cOWxcI277FZLnvauboCmRZETxGM6TzL8M6s05GHnj9exA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595951;
	bh=9lBwQSUKGCTnAfoemptBcguIuebNkAzw2evNvj0lp1s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miZYm9uZ/IrOr/PU9LoY6wvTFpSKLKm/ZzOX2NJv/7DnfBK1GTifjsJijNm2nGE5F
	 auMrIjfmWXrLLMUapFJzPdP7pGCi34t5bROWXvi3UqofX8QjrNzGfNl3OwgOYSjKdM
	 VeEPvwbECq6K/AzNkoupULVMnSzLKQHWuD42O1KXdDkCwKqL2+SGvbXykBWVcjFCE7
	 pai7UpEmUhrfnKqRoS+uAzLkrEqTvPO8hYndXxcL8JFl6HzEBCu01gaOrodqlNztNv
	 3QTfSOy2Qi8O4YMwtuLSaw2+rkYGVvUKrwrTYDBNS8jvn1JYDUqxTdr0zHhzTXDbxa
	 wMtd2oWDJ3ndg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF3B60BC1;
	Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 418F69CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D1881175
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFtZDmeNFqTj for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 33C368112F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595948;
 b=bHFioXLk8q+k1AdYV6gk1ryPJikvdZ2mearfXicZYo94XwINHMr0L1CMbEbSK1HzWqQa
 YfbitSIfkjZ/uQysiN2KNy4pkh39aIFBWYdkec+qtBwPFD4b4gL58gnmsvmnus6BTa3rS
 PQN0BnEp40oayq3PEFm+YXfGBlBte8ugl6iy3Q38u8//J2NQVhQ3FrRNduGy2vjNDzxB8
 fXb/C6Bb0h98YX5BaNHgB9WjRNvCUcQdsiEgl3hP5k4oCZ5jQIRuSaN14zaYGNI7w6M05
 5y58mDfgGlsaT4IIPmKdn1M4DhKwJJq+2N6TSWw7kJIjgfQkeRUXYfTY6KmtmtP+Vzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595948;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=eUH9Gtrg3QcgXwGSZxZ+8hS6n5BGFRFxJMs+4eiXbiA=;
 b=WzwkusaUkbSdampBCsxpVL46i6O2/vikJEpfaw243pAbGBpAD6q2KnQ1hMWZIjjXHW3B
 J1276jIXZqMXnX2iY3O+nI1+M3OQdXEXbky28Gas76DHqHLCXyFnnTeMZkXi2GQ0B+dZ2
 NJ9h+i9YeRHOVMr/42SGjBQGP6zSICcT3DJf0n5asPOEDlMSq1zBpkI4cSoENigXgT9/T
 xfoHUaz6zK2zg/hy9jn8OUYy/WhBUWMR8HD/XuHu7FTBWtCHuAKoj3Ap+8h0hZcKCrXEP
 iT6ba+wU1IH6bqgQ/PoJx/9njxwQbNf0GRAbclMYLv760GK2MgwZbmkF1uxKUZnpW4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZifFHdtW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZifFHdtW
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33C368112F
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b965570d7so21041615e9.0
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595945; x=1789200745; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eUH9Gtrg3QcgXwGSZxZ+8hS6n5BGFRFxJMs+4eiXbiA=;
 b=ZifFHdtWPCHGxGIrPzEK4M9QsvTBq9wE/7MGsjxUqGJlTmzwX7/pNpaaiPjrXxro94
 eP8/kxsVFF4kwoj7yxeCJREkZvpMxpk4l2XOwYVs4XYqtUTmyw+s6XLIWMco4Pz5pNrP
 2hJNYh25mGkOgI0RzsF0YPs9C4ZuEyKWug+gewnt5waY2eHTbjhbvXouQQASrYpRXRyw
 RWp9/0WQe17m02rfpCzXfVWQmaGBU0haf0zcXGWNR7ufnpSwSAxWVv3zk5avAbVnkyyo
 KkEIo36WqoXbCM8b7wRdo+ORldN/fks62Nf6SNyigN3OOpD4ob4V4BTY4/lF3aesDA/C
 4ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595945; x=1789200745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eUH9Gtrg3QcgXwGSZxZ+8hS6n5BGFRFxJMs+4eiXbiA=;
 b=NJwl+dZ6Nc7yw2WcFf0OdI0Z5YZY4lrCQBpjbOT7Bj6bofVFDbs72+tHzEjg4KYf22
 f3VVFF8H62Ul+SBBGnCLQalqkLiaKvKotS/4pOmVzxkU7zVsHBijSMuNe+y5KDXSA2dD
 aTxX22iAkvXMHjNqzuIujlFDE67BBe1nZkDv2+xjJKV8/ffCbpARjZ1u4bT9e3u2OKed
 ZBhI80/k00aFWwv4XjNmEKbjxBwg7g9346+TQgK/hN5+k4PPvLtSh2dV8rbFBF/6iq1d
 mnqo9tP8VZOBxOsBcnDqGbyBvBjYI9nEcsC3mF0inJr4q9JbIDc7hqmB9jmjf2+Mn4VU
 AYhA==
X-Gm-Message-State: AFuF++lMDOlxTYMvKY7saLNlyLmZK3ZTn101j1bqMZvmUK6+oLV69/oc
 ZUPM38NfZRlwFlZDP4v+8ARhlEEUppJpQxFA5l1Oj+2QQewIHtttpJgkiEZnIg==
X-Gm-Gg: AYBFou2tKrMO3T07iMgBKp5dHIQbLk3x/iCnIwY1svsqMri5KcyDYFX5cejg7r4l2wi
 /E1VqcciHrgg7xUug/K8Aenh5GP7Y/L5/8D6L7AkjBc8o8WkUJKMDokWZXxcK6sK5RDFoAtCJvw
 3Z8QmmChlNsgTFHE3HGkr6To6TxR6O24L2DsLFW0w7/UGR8/7ZKsgGfhx9+uQSjg9o8wQ3auyk3
 bou76gLWM09iLNQzJcGt4L62+G7LcWIRy3N7dSrIQa9DR30Kon1Zk/o1owQXQaV3xd8CL5VLKAP
 HG/YXXZKGh7SM5IYJN4lJ0jbdT3POpnaui0cjRrzp6Hsv+8CqypWeF/9hNi1eu2DPhAKFdx6HFU
 Cqq3gBilEui/gDQIsjnlIiS3xj0OUXECcm/8xmVtohb9qzMJuVbGlSxFbxBZ7rD6l3YAPItjuYr
 /6csm2BfGctgkqFoFvlTeWevglVACwhnVlzyVe9goVQmf+Z0Eyvvkr7gf4LuIoHzrUnKdhFplvx
 Yq3Bj6IJb9zZMWUhnM=
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id
 5b1f17b1804b1-49cfc6e8ed8mr61754605e9.33.1788595945352; 
 Sat, 05 Sep 2026 01:12:25 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:25 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:10 +0200
Message-ID: <20260904185921.587878-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/12] package/lua-compat53: bump to version
 0.15.1
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-compat53/lua-compat53.hash | 4 ++--
 package/lua-compat53/lua-compat53.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index cd2c35d62..284a8f6ad 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  987e286e63e568c2a7d50b6a66ea9d4189254be49ebd6477ed8945e23e195c44  compat53-0.14.3-1.src.rock
-sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.14.3/LICENSE
+sha256  c9e34ea62ac89a6b7ab62333a990b47b1dd37e02f00b0309e6a31511fd5b8806  compat53-0.15.1-1.src.rock
+sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.15.1/LICENSE
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 048a52279..b4b4a9e0a 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.14.3
+LUA_COMPAT53_VERSION_UPSTREAM = 0.15.1
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
