Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D28ACCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 11:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032B8611AF;
	Tue, 14 Oct 2025 11:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxRANSKHczhI; Tue, 14 Oct 2025 11:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD3C611B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD3C611B2;
	Tue, 14 Oct 2025 11:12:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BE73294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E48C416C8
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFFTXg3tK3oN for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 11:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AF5C40BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AF5C40BFE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AF5C40BFE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:12:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso30812185e9.1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 04:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760440350; x=1761045150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4lpvG5N4uHFaA+RWW9bAKRSkaZXKvonZ7i3PEk4P1js=;
 b=UMXEHmRiHqDpMkFi5K+UBIOWZOe2PfwFctzVi9xx5DPopSRWFtRWQkPwvb+ea2Dray
 fp8Sy4XAliswidjaTWcEpNaXx9jp1w0pV2ZSLKb+9eCKVWiGfg53W6mUMh5u14bOfbEy
 nahfcHFADoLVn/EEhUTNf0wU93mJX4G+nx3KAHpsDpO2NuPlDq27+9yX5bEzg+0+3U7y
 vfAjbSWR++D62OkzjzcMorjswaV7UnF6dyc87OlsyoPeu/Bx/J9XahVW0jq6lTPNdYZv
 2HlGzbOdp9JMh/ZaQ0HkmXrCYcHBBkiQ0GYEBMmij7N6V1IPvYZndvbnqnWmvZC0v1YB
 qnoA==
X-Gm-Message-State: AOJu0Yy1mwuCguM5mVD+uN2dEVj/Or+O9yb2ocBMTmWRtH9vCGmB8nxP
 YtYZQv6NMDmFJXu3idSCuHz9xIxX3zmlWi/cDjtMFOMe24fLMtp3Gt8d2kYqIjjNYvXnrXoacrH
 oa34A
X-Gm-Gg: ASbGncvfVfZ0UH8LfkUjkV6kRVEh0Qw0bvpjrSj+MExi4oa+X/N/mtWyyi/w0PrBjv0
 OIj3moEWabGwLFb9leimovkIhSne8JceiqK5Uv4ao9JyBYwHNWyx2FUDvsvW35zKX0TierXJt/u
 EgTnqCBgxx0tnqEnVyu1ANy+OB6VHQCWK4tH5MwlN3xMDgCeoW/BZVpuMAGKXFlS7QQ8++B15zZ
 GuvQdWroaL9kcvTR2+DaAg851ECHHht6fsQAemHAZdyeYZvoZh1wLYjM8LISy66wVzH+jtvgZpw
 wycZY0daZqlpwnQk5zbwUWdz9jRPAHq+JtOxK2r0UV5IFymt8Yr38qPzCTks9ojcD79kN2QY7yo
 i5dPORvQlb9cIv5uljt+GJ1NVItcc1rV5jI3BGOm87Un2qxFNouzLbOC+kh1XmmPf5riSe9XMRo
 yfQXuQ/2fTk4QKzeH/CR7C3O4wBVKzJzOq2ddRTioROfnJ7Q==
X-Google-Smtp-Source: AGHT+IHlI/bCmk5kD2wwr42jf6guiT97G+JyqP4vlbLDkkEvjtmBmiSze4uKtvZwsa4fkoRjtv1doQ==
X-Received: by 2002:a5d:6f04:0:b0:426:da92:d3a9 with SMTP id
 ffacd0b85a97d-426da92d584mr8319728f8f.46.1760440350234; 
 Tue, 14 Oct 2025 04:12:30 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce582a9csm23185756f8f.12.2025.10.14.04.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:12:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue, 14 Oct 2025 13:12:27 +0200
Message-ID: <20251014111227.73245-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760440350; x=1761045150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4lpvG5N4uHFaA+RWW9bAKRSkaZXKvonZ7i3PEk4P1js=;
 b=bsE18dITdWhGPDStX0aP8doV3vMvl0lKC7ygChBAKNwIIJafNM7srSqR8NULW+M5uQ
 55DnktH1wLFtQCofFlENjPuSulimr5rFboZi6A8pHq6PdVcwox268b8jyvv2wxpgA8WS
 o1aOa2humIq6E43QLYOlqmyrCw/KDJracpZnMfkyp3Bc81kTtBrXD3hfI/Km9iWujdVe
 wYzS7bZ2a0vOsZfRvcua5EU4Sjax9+snqIzM2Ea/StJwqrzrY8IexqVTXojOkaWZ1opG
 aHuIPFSyTxkkFglAD58Cak5LPF//sl5uePiVpscZ+C9i433WwLH4K8Q0B4LNYZZUHSMx
 RzFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bsE18dIT
Subject: [Buildroot] [PATCH for 2025.08.x] package/redis: security bump to
 v8.0.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://github.com/redis/redis/blob/8.0.4/00-RELEASENOTES

This fixes the following vulnerabilities (in the Lua scripting engine):
- CVE-2025-46817:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to cause an integer overflow and
    potentially lead to remote code execution The problem exists in all
    versions of Redis with Lua scripting. This issue is fixed in version
    8.2.2.
    https://www.cve.org/CVERecord?id=CVE-2025-46817

- CVE-2025-46818:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to manipulate different LUA objects and
    potentially run their own code in the context of another user. The
    problem exists in all versions of Redis with LUA scripting. This issue
    is fixed in version 8.2.2. A workaround to mitigate the problem
    without patching the redis-server executable is to prevent users from
    executing LUA scripts. This can be done using ACL to block a script by
    restricting both the EVAL and FUNCTION command families.
    https://www.cve.org/CVERecord?id=CVE-2025-46818

- CVE-2025-46819:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted LUA script to read out-of-bound data or crash the
    server and subsequent denial of service. The problem exists in all
    versions of Redis with Lua scripting. This issue is fixed in version
    8.2.2. To workaround this issue without patching the redis-server
    executable is to prevent users from executing Lua scripts. This can be
    done using ACL to block a script by restricting both the EVAL and
    FUNCTION command families.
    https://www.cve.org/CVERecord?id=CVE-2025-46819

- CVE-2025-49844:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to manipulate the garbage collector,
    trigger a use-after-free and potentially lead to remote code
    execution. The problem exists in all versions of Redis with Lua
    scripting. This issue is fixed in version 8.2.2. To workaround this
    issue without patching the redis-server executable is to prevent users
    from executing Lua scripts. This can be done using ACL to restrict
    EVAL and EVALSHA commands.
    https://www.cve.org/CVERecord?id=CVE-2025-49844

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index c66223f2da..e9a495d633 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
+sha256  7e185265d455ea8deb6bb7e071352ea691ca4d7b5105fc172fa524af59917b89  redis-8.0.4.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 5ffb2a929f..b954190546 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.3
+REDIS_VERSION = 8.0.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
