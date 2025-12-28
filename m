Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB9EE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6057E60905;
	Sun, 28 Dec 2025 18:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5HrdIU53H-r; Sun, 28 Dec 2025 18:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D6E608EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948207;
	bh=7LvV1fNnuQc2wJc4wMpf6Tyvp5D9mdDuvX12DkDHQpY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h19XlZAY83xgWT/1ZZ+xqRyoIGWdROa5kODgCgbRb1P8vkTicf/2sa0tDuLr95t0E
	 atKzPCHvcqzHFrvZULKn6NCQDEM/nccVUsYkQnNlph43Oe5kK6yTXeUqo3J2mvH6C0
	 FEGw5/h19kQXmlCwgLeKup4mOM+uxfZ1wZG9dZ8QS9f8aRQqmpfXO4jlWurEpQ6nfa
	 eK1VKM09tQFcCJ8QV0Cu5iVjvLs1+/xeBLUtfz6YGzBv+VoIlcsf8rGrmo5YHaCviv
	 ltX6wuwHncX4O6GHwx2NK6SJqeF+h7z4X9aoFHkOHCdSISfB5YTPg+HzTO9qY9X2MG
	 9sTtD4bLi83MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D6E608EE;
	Sun, 28 Dec 2025 18:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8701E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5237380C30
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMF5tKXULKED for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F77580BF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F77580BF7
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F77580BF7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so85367635e9.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948200; x=1767553000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fWGNJnWjv2TAfYoa136xjDMwqivEupgK5PovhEQTVOI=;
 b=MGLU2Hbdkez/WTu7r29apFcE0ZOMmr3VRVZ1/hB8gUsmNLjuFBlTOZxaREgTvhQoV8
 W8LC03eL8nPpoeo0WWTd5R+YB+la/AQ7O4zQYY4+1RDE4i7ZuTXfhqIoJ3VDA3ISJJ9Z
 hLQFons3hgFvPPFblSSOcqyCaeinVDeqKzCeqNvAwLHk5nfhHHk4H69sO3cpQNNu9QPC
 LsgJU2Hna5l9jNZpDCFREq+eEiK52vpO4Xgw4vWrNGnmcQ/ke5lC9vHEkuwpe3aVbpg3
 IG8kDTKZ8bl5kdoTfnRfHLoMG1IbF/T9MCdFJq9PWlFwq2+IPEclabk5dtVVsCdWZt6X
 LFWw==
X-Gm-Message-State: AOJu0YxBag0jHXLUnzQMJxAxCfKB0Qpt2b1IHLPAPz3aJv+9hzZ2ZBOA
 O/UuvXKStCHLBxrUoYMqH5G53fQznyn+niM8lT6lkCDhS/aN6mVvF7wZ6XZ0ZF8YPluRw+FIZqV
 8VH6HnDk=
X-Gm-Gg: AY/fxX7TT/OhVeyibvXQIXQUHsFkjbIMyyG1gkO7pM9+Zu0LGierZTaIIkjPU6PpOq1
 kbhIai4SZRx7WIV/8CDakgt0zaPN0TdWpWTnXqkZBxvVxz8/FTiu7S1iA4gzWOpOlSR/zf4kwYO
 pP/TtI5snBGPJ0yU82iSkTNIgyIOPxSwzEm6KDm6UgxYy02II4BWjxjCq7mffC+XzVfr2jSl3EB
 WHWhdY6qd67e9IEqEmHnRPA1TL751K6XKHvj2Qn1EomqgT+mBOLj7VWSUWS9i8leRhf772AeYia
 VVlli+Nt58kPQgDzR+59YgWX6i9+PQ45kVwFzpvTFvR1WXWb2ZA9fWC1Ge05rS6JYJEtxeZ6Oor
 Gmnv2r0eKlhwKY6AyWPCXq0a6BdntzHF9YfLA0fwmQvDDYLZ5Pd6Wst8YPj7z9LWZhhTpcsejI/
 FcLY7vGYlzeHWA/ZENSFeLu3RLeQ6cbN4hha85hhwCN5BqmI2T0+pFAPfVG2NidD559OeWM97v
X-Google-Smtp-Source: AGHT+IGNzzZnHqe0KP9pD4yQVQlJpBlcHTRV4aO2Wd4b58jLP7losfVG15jWG2YbN+ilRtreJZvnhg==
X-Received: by 2002:a05:600c:4e01:b0:477:9574:d641 with SMTP id
 5b1f17b1804b1-47d1957f712mr339805755e9.22.1766948199745; 
 Sun, 28 Dec 2025 10:56:39 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:39 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:27 +0100
Message-ID: <20251228185637.58072-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948200; x=1767553000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fWGNJnWjv2TAfYoa136xjDMwqivEupgK5PovhEQTVOI=;
 b=W3yQWrX7flJl0+9uHpG3syTiKRQmKESbkyE5aPPiexLcRMx7fOJlizKBlzgsodcAs0
 RYMAM2w3Y++UOz3KVVeFYhUL7M0DlCR8imQ5NHpZlEC0JqAql7o+eq0H3IDFKOjbNk2Y
 Cd8Tk/t+Vg8UF70BCb7d04dSM/BGi83HR/7lLB9lLMmflCgTnKVjEqw1ZezaGY3tFWiA
 uia5cb7ikz23tbWRTleuQm6Sa3/zDslpPhLQ3ipvW6oQIJWbBMavLmXjOmR8RW0Fzz+7
 BjSsAtEBIbA1KfGQ9fe90S7rvf8SzpXvAkCmZqK02z7HlzPbCPIhVyGPa+O/gLRvGMal
 eZjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=W3yQWrX7
Subject: [Buildroot] [PATCH 02/10] package/yasm: add CVE trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...1-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
index 976c2f7a13..b563fda71c 100644
--- a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
+++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
@@ -10,8 +10,8 @@ For more info see:
   - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
   - https://github.com/yasm/yasm/pull/244
 
+CVE: CVE-2021-33454
 Upstream: https://github.com/yasm/yasm/pull/244
-
 Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
 ---
  libyasm/expr.c | 2 +-
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
