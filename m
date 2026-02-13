Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDCBEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE5E584693;
	Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOoQ7SVH2hsI; Fri, 13 Feb 2026 19:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F48846C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011438;
	bh=6q12bM4FmEGV1ErZTgf94Joa+BSGiOMHfitRWH05qb4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EKvDCsGyJKQ8PhQJikJXTYDrV2ZY3uG3n9p/o6vkxJzloXCS5rZYxs1iCvM0x/M6F
	 diBcPBqY0wLmz6kKhuiGOJJeMlbvbQwzMuJjqejKdsRa/+ZrXNbsmuZHL/c7q6OOet
	 prOkzMYNemLEVyvMVPpdDc6a4i6Wm9lGarH5KUa8WKWdkIiHabODWKSV9jyA8taniy
	 zM86ErPXoVTHXgqcah7Q9J+NXQ7RM3+YlDc0JCJnv4B8LemH1tIbde5BMMjd9vFy3V
	 bkISPxUiq3wuhChOyltU67tPB8VwrxEHEJFBDv2PUtr+ZXc20Igh5YnV8rd/M/X7Z0
	 sW+JGq6TyoGRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F48846C2;
	Fri, 13 Feb 2026 19:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A44FB69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F9640A57
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBSMQvbiimfS for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70F9441E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F9441E1D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70F9441E1D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso32806365e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011405; x=1771616205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6zmobmWamIxNx0+bH8+8xuHLAgMOR4UNvb+OLFG2n6M=;
 b=gXW/8DB79S3H9O/w05A3QnP3vREXx2BhJVmHq6Bqh3DeI7L7bcjHqAIaG3A9uj+ETo
 8tU3Em6CEEq/9Z/TZfMzR4qiKQO6+mSMvMEpxPBxA63g3dJOvTXQ92ugVjAu1KloV3v7
 zBA6mjJY1lFdE6NoYRCslae80ZArkaJhkmHr4U0zQdHktlh1SfBlKFXb9dN68SCDvoF0
 +67zdKAdpLu3fQsTl8qPzO4twbECscxtfvzvrK4KT73/QTXM/t+qhh7HyKQy8wKwRUlS
 AixFjEeJdvMBCfvHFZFCfVEokh9L43eHSucnByP/xhBnOdlV/t4C+HloVrzhhSrsMaXe
 xtyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv9uQez7V65XgD7bUEMJYU1psihagDcgEEkYNPwPL+Cd+HemwiR4amCKiVfc29LQXP5NazPUEAZNU=@buildroot.org
X-Gm-Message-State: AOJu0YzymAZdPwt41zz2JyIrMfQ4VnQYozQiW57Erczr9yKcusVf7guI
 7KH5657KQZZ2QcbQfmZbAugRfXAbgY5D24E4Ll0iMs7R+hGN08kjfhHnwZ36ERuFlas=
X-Gm-Gg: AZuq6aInqMqcTDrCiA7AKEA7a6PjW9AXjrjkJ2/ID+f5vevnwmJ7p4Jeyr9fJzDEhcc
 lZjio7R1Q/JLugjDGn2TfzmWgThoJ5EcWweUFfQwOorXEi5ARqaeDmf5mhhVkXZsQ6w4E6yLWy7
 9QKcaMjvtprR6Wo+KzxLpZc1BQbNFNVqPwLBxH1LU2S4vLceh8BVIfrAXOhVCyoQYQvH1PyfccF
 Rd+bRABaXolOnJsnxttqW/aGa5McdZsLUuwVC2DzSk3q99tuUzmQiFztkD8fGHXfumxJf1iKZxY
 txv5mBe6Ybp9vnRJgmI404OGlU6xDYfoL5CFunfnyDf/u6Tf96Zj7E+PCrBB92uwFjPYOxKIzxD
 tPgATbNQBNZ3a0SjlaRZA80lmVeRf0IrYGnMxzqWWLtbFsjBbtO+aVoJjPt3xgxT8TTDC0qONq2
 GeK2nts44Gzp2T1K0=
X-Received: by 2002:a05:600c:19d3:b0:481:a662:b3f3 with SMTP id
 5b1f17b1804b1-48378d6bc48mr22139475e9.7.1771011405348; 
 Fri, 13 Feb 2026 11:36:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm325656485e9.6.2026.02.13.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:44 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:44 +0100
Message-ID: <20260213193644.38017-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206111321.559370-1-bernd@kuhls.net>
References: <20251206111321.559370-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011405; x=1771616205; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zmobmWamIxNx0+bH8+8xuHLAgMOR4UNvb+OLFG2n6M=;
 b=EoFkkzvL5p7NsJKGstgpfOdnNi6Uf/DsQqcSMDAeXBysg5tt2ajooQlcH3z/yJ6pVn
 SGujnkqbLjwXoq4RL/zzbFftST7QoO0buVTQ28+kI8Dkehx3k1SgwnID/ukZ/0n048DM
 tChodv1NjM22GBPdJCLEw9i65kBlLVCZp3UE8xpk/SFp5wJMT07fCyjqVc/+5F8AgP4a
 A3f/0Noos5RWx+bINefV72PkjXYRFqOEzzADZUeQslUPF+F2tX3j59AogEyfLaiqeK17
 fDBGlTglMwQgTXn0OeuZsWMsYO4t3HS5yRk/g0brLG5wMaMCMr4X8+aV+PYAna3q+2hk
 Cb8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EoFkkzvL
Subject: Re: [Buildroot] [PATCH 1/1] package/shapelib: fix build with
 gcc-15.x
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

In reply of:
> No autobuilder errors recorded yet.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  ...-failure-with-GCC-15-bool-is-keyword.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
> 
> diff --git a/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch b/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
> new file mode 100644
> index 0000000000..1fde0c7594
> --- /dev/null
> +++ b/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
> @@ -0,0 +1,39 @@
> +From bf455986557e88cce6a2a85448798e1dc05541f2 Mon Sep 17 00:00:00 2001
> +From: Bas Couwenberg <sebastic@debian.org>
> +Date: Tue, 23 Sep 2025 15:59:57 -0700
> +Subject: [PATCH] Fix build failure with GCC 15 (bool is keyword).
> +
> +https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords
> +
> +Upstream: https://github.com/OSGeo/shapelib/commit/bf455986557e88cce6a2a85448798e1dc05541f2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + dbfadd.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/dbfadd.c b/dbfadd.c
> +index b464432..e0a6ef5 100644
> +--- a/dbfadd.c
> ++++ b/dbfadd.c
> +@@ -45,7 +45,7 @@ int main(int argc, char **argv)
> +     const int iRecord = DBFGetRecordCount(hDBF);
> + 
> +     SHPDate date;
> +-    char bool;
> ++    char boolean;
> + 
> +     // Loop assigning the new field values.
> +     for (int i = 0; i < DBFGetFieldCount(hDBF); i++)
> +@@ -64,9 +64,9 @@ int main(int argc, char **argv)
> +         }
> +         else if (DBFGetFieldInfo(hDBF, i, NULL, NULL, NULL) == FTLogical)
> +         {
> +-            if (1 == sscanf(argv[i + 2], "%c", &bool))
> ++            if (1 == sscanf(argv[i + 2], "%c", &boolean))
> +             {
> +-                DBFWriteLogicalAttribute(hDBF, iRecord, i, bool);
> ++                DBFWriteLogicalAttribute(hDBF, iRecord, i, boolean);
> +             }
> +         }
> +         else
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
