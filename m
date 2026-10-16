Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76ACCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0212840A76;
	Fri, 16 Oct 2026 15:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F07WywA5tu27; Fri, 16 Oct 2026 15:04:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E391D40B0A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163067;
	b=jaEbFE+Wb0Rh4sqye2+Ocbr1aZ26feElPr0SQeCLAXv+touxg1oEE302tRRpekS92o7I
	 Jjj71QKfNIIl/dGmz2ib4LUk0WDEBVLbEurtOVCgv3gKGzoYYuQwABll0Fz+8BlRXSacQ
	 /ckQOVO2ZJqvHdq+haplP7a4cBQcpmoJPH5rrofpVq2M3McfnQkAUYJ4bpBDpGlnI6SPN
	 UxeYTQ/GBBWLzud/k0b0EFciM0nU+/SmEBnf7+r2jiFFKi3fwV14lszyjx6WT0iX3FvWa
	 u2iBtzInWmgqWNiYM/ssiuinWNriIgK/SZnZ1xzkPrNdqA/oZWf/tXspalBX/R10I7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nFBimahE+NV4SQHVfXKdYfGmKHdMURwUwIMcaNzEM8Y=;
	b=SUkBIwNEgFlBqRhZCznRF2JwTiuLV7XeW88w04jGvGIpHORF9wirw8H+HuM8EwFQP3lA
	 p4HIPuO+3E8eSEqmQaygRF8cRxwUbsp+0q2tfHt2xpL/kxL3bmCxDGpn8MD+bZeV883J9
	 0yC39udn0iWE7tWY18kssKCraI1bhmsekf+1u4UjAihSYFP6p01vqjLFwFFJRxRA+Srl5
	 l1pgIw+8TUoKU7gWJMj5pg/CZSioImbnRQSCEjqWAgQOzsb0qlRsnIWimRy0l/5Ml9Vq1
	 5bLtadR0urBBW72N3LgjyCEDvhZqWzbXFlRxnSh0bq8KlcQgXPuLKSgJWAOnRLNijmg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163067;
	bh=nFBimahE+NV4SQHVfXKdYfGmKHdMURwUwIMcaNzEM8Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GdX5426nOVOfYU+Nf4aHCVr5NmPAys5om+K4+W7EAXqjjAoIAFdW0PhVqO7WpsQ9Z
	 R9jpVSY8sqV4bbxO7IYaUV22YHfuRrDJBvrMjCaoisTeofbqIp5bhat/ggY0nwi3RW
	 VlZbxD5kjXNj/gG9n1FJuhg/jectqoI7Lu9aCTF3tfZ3VAZT43mLN+OVQq2b1Idwi3
	 ZAxw4Tf2TFxx3MR/3KvrMrDZIdBshzdHBxXJNKGmzKuTbt1+Ww11yilPeAneEkSGWu
	 EaTs2nAnTPxdSCLSlPrnUz3ViVaQFXmr9N0v6FshVSeAxl1rTm/e+dz86STkP1W+Sg
	 zSx3VrTA4zBmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E391D40B0A;
	Fri, 16 Oct 2026 15:04:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2928D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FAA34016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KaKqQ3MzpTm for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D57C440042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163063;
 b=ADy4plUNvWpjCtGZX2P0UMaxkoebYZORhZbfIn5Yr1AZpqLtGuama4sLBf++rJk0TyHa
 dSPqVht4+7T87d5A53tCkq2c9Zs2NbJCdpDW/4BVmFBB8FVwc4kcpW1rirgLV/R6qMxHH
 NEJFuC5LT+a+7CLt86Mv5DNZRH/ffzEFYAE5neEQoFfh+EGoJu+0XC/aIcYgRJlB0NotU
 Lp9fi/0E/WpUSl4+y78TI0+2Ct2vFqtQdfs7yu6siU4K7x/9esGlon01oKOwSuo5jl8sd
 eDvdZ0h9QPcJoLZiHYiTzUHv3h/tfjiCQiCAJ8UVRkiquDXeJyC25Rmme7w3KUEWdEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163063;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vp03lMaDLhoSErCIFGwRLqbngbxKkKUxJSdDfBXVF6A=;
 b=e9XRWpA6gTUgCHDeZDXmGtzRk9IjKMes/TRr27r8Y/qtHaUjM3JCnMPNAxkG/2uNTtyx
 euW99SCPQJpmhzHMxit93RmiKmOGWimTPBx+WuguLBvPrjZ3wb0+JcbYSKs0hl27ufHP2
 fczv4p4Jwb75QWKpzAuWWXg16VSWa4LGdlASQR7gF20oH2svQVVQ6o/rX3uZv+w7bZ5lU
 3rw2/UW1TV2D1piezWTkXF1CMxGjN9mcAv+cvL/huJJvl3ZW7HPAppgQBeiePVSPjgEug
 kz9ktviyVcKcedq1zByd37KtQ9PBuk3ZM0QQLbMh8ZuGiSYoAyiGu1KNRo5KK9IKJlA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=B3c542JS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D57C440042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa29e06bso5857286a12.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163060; x=1792767860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vp03lMaDLhoSErCIFGwRLqbngbxKkKUxJSdDfBXVF6A=;
 b=Dw5RcPYMBnxk5iSa9RRmm0Y+e+2GYJ1h0sj9vuyijkNRv0xOz0CukWNypEotYSpPcB
 DsT7Kk3IlDhU9UFWE4oZW0wmKINaQdPKc4QVT+fbdH+ZXty1iJDX49oif95bA971q749
 5EgAByrpZVZIQPA9etsrehQ0kwk55vQ3lsJz/qlKaIlARuyIvobF8Mj08dMcRM+OYm0a
 fI0Q//7f7VfTN5Qj+w4MNAu3i90+yEesQymwz6ioOLY7SYfeejO1hwRl5hw0ZDuj0lQL
 KygAqYxqfSu7Ha/iQU326yYLQQ2YU1EuItU5TjpmcrqmnlYgBbd2+a7bs/338l4QrfC4
 sUCA==
X-Gm-Message-State: AFq9FYJu3r0xr3FakgLs4bw1VvTU0KIL6/7VV1CR/J2i3etrA0PodSBC
 IDd+TjOaBi7oTQzaFOJ8zU3X05NccOXywFjFIzjSXBqynjHrAvrM6cXAyEtgEeeECGmYn+4Odtr
 OzsZ2OeI=
X-Gm-Gg: AYBFou1LXp+XVoBJWPTevonnWtSskRqYO66YccnjRGdsoDjseb+ynZgpEWlphP9zAPc
 wjnXbdl5daFFeainmaWfO5g8oofOsqgYst8SIB6zDH1p5FLsrcp8U+SeMe3WCK5R4dsTgJRxSDI
 8xyFOkf1/8ZROwD1qjIuqX3sF5TK0HCqycQ6YvKkpOZNs+kjcxu9nEAc8f3vIeys5G3NsjuVjsH
 4WAxVytRqs94v1C0U5bkKa4jBMrAVaT2RuQ4eDJNBOEMNi+thj1AZ59pxNRogArs1IZ4a1HWiEU
 UMABjliXuLIVtFnomzen5W/eOjtSHTn7BbUx5Hz+/TpSSs7CwWGtp8YPTx0wWO/K7cVMtAZoQiN
 UxRl5a9DcGrzNVfPSng7zdxWVcZ/yfESI80KayNMKOUvnEMsQfWyJpp8F9uQc780WLXA+W/HG8F
 qZt0A1YXt4OWZVVfpOoq4Z2o+3F6OTuFBlJswGiVcnqfv9GggjQEdKczsoKVjjJhTQveql2sTFP
 2O+Ol4F2lu9EIo1fxl4KfdotB1ajwyAvR4sfdcgsg==
X-Received: by 2002:a05:6402:4486:b0:6ac:689e:ad5f with SMTP id
 4fb4d7f45d1cf-6b17c269624mr17755517a12.23.1792163060456; 
 Fri, 16 Oct 2026 08:04:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4c5932sm5879510f8f.18.2026.10.16.08.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:19 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:17 +0200
Message-ID: <20261016150419.68169-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002075640.2350126-2-buildroot@heine.tech>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/4] support/testing: sqlitecpp: new
 runtime test
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> build and run an SQLiteCpp example to check database writes and queries.
> 
> Assisted-by: GitHub Copilot:GPT-6 Sol
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> 
> V2: use correct path(s) in DEVELOPERS
> 
> ---
>  DEVELOPERS                                    |  2 ++
>  .../package/br2-external/sqlitecpp/Config.in  |  1 +
>  .../br2-external/sqlitecpp/external.desc      |  1 +
>  .../br2-external/sqlitecpp/external.mk        |  1 +
>  .../package/sqlitecpp-test/Config.in          |  5 ++++
>  .../package/sqlitecpp-test/sqlitecpp-test.cpp | 27 +++++++++++++++++++
>  .../package/sqlitecpp-test/sqlitecpp-test.mk  | 19 +++++++++++++
>  .../testing/tests/package/test_sqlitecpp.py   | 25 +++++++++++++++++
>  8 files changed, 81 insertions(+)
>  create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/Config.in
>  create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/external.desc
>  create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/external.mk
>  create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
>  create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
>  create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
>  create mode 100644 support/testing/tests/package/test_sqlitecpp.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d62bfaafb3..db5fe9b5e0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2464,6 +2464,8 @@ F:	package/protobuf/
>  F:	package/sdbus-cpp/
>  F:	package/spdlog/
>  F:	package/sqlitecpp/
> +F:	support/testing/tests/package/br2-external/sqlitecpp/
> +F:	support/testing/tests/package/test_sqlitecpp.py
>  
>  N:	Michael Trimarchi <michael@amarulasolutions.com>
>  F:	board/bsh/
> diff --git a/support/testing/tests/package/br2-external/sqlitecpp/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
> new file mode 100644
> index 0000000000..586f1dfa5a
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
> @@ -0,0 +1 @@
> +source "$BR2_EXTERNAL_SQLITECPP_PATH/package/sqlitecpp-test/Config.in"
> \ No newline at end of file
> diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.desc b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
> new file mode 100644
> index 0000000000..003e033127
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
> @@ -0,0 +1 @@
> +name: SQLITECPP
> \ No newline at end of file
> diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.mk b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
> new file mode 100644
> index 0000000000..b5db18b281
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
> @@ -0,0 +1 @@
> +include $(sort $(wildcard $(BR2_EXTERNAL_SQLITECPP_PATH)/package/*/*.mk))
> \ No newline at end of file
> diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
> new file mode 100644
> index 0000000000..d83b99bad8
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_SQLITECPP_TEST
> +	bool "sqlitecpp-test"
> +	depends on BR2_PACKAGE_SQLITECPP
> +	help
> +	  Test program for the SQLiteCpp library.
> \ No newline at end of file
> diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
> new file mode 100644
> index 0000000000..d888a9a392
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
> @@ -0,0 +1,27 @@
> +#include <SQLiteCpp/SQLiteCpp.h>
> +
> +#include <iostream>
> +#include <string>
> +
> +int main()
> +{
> +    SQLite::Database db(":memory:", SQLite::OPEN_READWRITE | SQLite::OPEN_CREATE);
> +    db.exec("CREATE TABLE fruits (name TEXT, color TEXT)");
> +
> +    SQLite::Statement insert(db, "INSERT INTO fruits VALUES (?, ?)");
> +    insert.bind(1, "Banana");
> +    insert.bind(2, "Yellow");
> +    insert.exec();
> +
> +    SQLite::Statement query(db, "SELECT name, color FROM fruits");
> +    if (!query.executeStep()) {
> +        return 1;
> +    }
> +    const std::string name = query.getColumn(0).getString();
> +    const std::string color = query.getColumn(1).getString();
> +    if (name != "Banana" || color != "Yellow" || query.executeStep()) {
> +        return 1;
> +    }
> +    std::cout << name << ": " << color << std::endl;
> +    return 0;
> +}
> \ No newline at end of file
> diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
> new file mode 100644
> index 0000000000..da557ad874
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# sqlitecpp-test
> +#
> +################################################################################
> +
> +SQLITECPP_TEST_DEPENDENCIES = sqlitecpp
> +
> +define SQLITECPP_TEST_BUILD_CMDS
> +	$(TARGET_CXX) $(TARGET_CXXFLAGS) -o $(@D)/sqlitecpp-test \
> +		$(SQLITECPP_TEST_PKGDIR)/sqlitecpp-test.cpp \
> +		$(TARGET_LDFLAGS) -lSQLiteCpp -lsqlite3
> +endef
> +
> +define SQLITECPP_TEST_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/sqlitecpp-test $(TARGET_DIR)/usr/bin/sqlitecpp-test
> +endef
> +
> +$(eval $(generic-package))
> \ No newline at end of file
> diff --git a/support/testing/tests/package/test_sqlitecpp.py b/support/testing/tests/package/test_sqlitecpp.py
> new file mode 100644
> index 0000000000..59844d4628
> --- /dev/null
> +++ b/support/testing/tests/package/test_sqlitecpp.py
> @@ -0,0 +1,25 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestSQLiteCpp(infra.basetest.BRTest):
> +    br2_external = [infra.filepath("tests/package/br2-external/sqlitecpp")]
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_SQLITECPP=y
> +        BR2_PACKAGE_SQLITECPP_TEST=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        output, exit_code = self.emulator.run("/usr/bin/sqlitecpp-test")
> +        self.assertEqual(exit_code, 0, output)
> +        self.assertIn("Banana: Yellow", output)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
