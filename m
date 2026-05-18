Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A630BCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 07:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB5185672;
	Mon, 18 May 2026 07:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnu0pWg_XeQf; Mon, 18 May 2026 07:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6DA385AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779089375;
	bh=93FfPKUW08CfhTDM9NN73BTvrBnylOt4zPvss/NBJMw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=T0txzSI8f90bMlgjK2DBF+trq74pRF+eJzq6No72I9RP2TD4TmhJQmuum/ixTQwF6
	 7lAD/oukLmDkvA+pTxfyhGl+Mwxx6AMBmJhV0fq5Pc4dwMfjG8gcu/vYah1+E3Eb/7
	 C5AAfGCKE1Kl0qbuCafM9bWxBCrRWIDvReV4l3PjReW2/6sMKP2lfHLV+S4hhjLsQz
	 QaDruzo7CmSyjhe6eb0zokn3OtXh1z6EfijjTLc4HNsviA0+J+e+84RJ+tVg32roca
	 MaGY6E9VqorrNkipGZ6x12lufYwbfbaev5TUdVCKituJnpxppOpMWeODsS2F3XxsQT
	 G+zof/t6DoTVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DA385AA9;
	Mon, 18 May 2026 07:29:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F8E265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D5142B5D
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLXHtBIbVJ9f for <buildroot@buildroot.org>;
 Mon, 18 May 2026 07:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B94741B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B94741B89
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B94741B89
 for <buildroot@buildroot.org>; Mon, 18 May 2026 07:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB220B979259; Mon, 18 May 2026 09:29:29 +0200 (CEST)
Message-ID: <a82cb31d-fa76-44d3-a868-e45e48d007c4@rnout.be>
Date: Mon, 18 May 2026 09:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260517213626.3730308-1-romain.naour@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517213626.3730308-1-romain.naour@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779089370; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IfXNVvzthDx9/LvkbLSEwhQ4IHvFA/xHuyUzK8olvv4=;
 b=exfuJAMtsbL+MsrM6fu2KG0xkE86mZIHLTq0ZDhJLKXaHYwt1jdeI6ZsXHCTW7HgJ3MuDK
 hh3Glf53phaWbGVpSW/eqevB2ZZOlaO0pLHHr/2r/qW3AeI+n9EmUOpf6uWY9t621C+7OB
 okNwv/CEkj4TiJWMN+cs0jpiYJBZGRQz4yPYoulxrOf8eYiWdSBWZ0qTRRs7f05Rdb8K1g
 sS7uEOKOM+m01TuNlAIjpM1Xo5+/IV4xakaLaTqQSRPa9ZQU+WZ0gdapp0Y8NxEFs6hjfC
 krDlNj+okK83AXCg0h2xnNG3P65GIpI9CIDw7wwYrgHvsSTInLMwDz5OP3pWew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=exfuJAMt
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: add gitlab-runner.json
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Romain,

  First remark: I don't think splitting in 3 commits is very useful, it actually 
makes it harder to see the whole picture.

On 17/05/2026 23:36, Romain Naour via buildroot wrote:
> GitLab offers the following machine types for hosted runners on Linux
> x86-64 [1]:
> 
> Runner Tag						vCPUs	Memory	Storage
> saas-linux-small-amd64 (default)			2	8 GB	30 GB
> saas-linux-medium-amd64				4	16 GB	50 GB
> saas-linux-large-amd64 (Premium and Ultimate only)	8	32 GB	100 GB
> saas-linux-xlarge-amd64 (Premium and Ultimate only)	16	64 GB	200 GB
> saas-linux-2xlarge-amd64 (Premium and Ultimate only)	32	128 GB	200 GB
> 
> Thanks to GitLab OSS program, Buildroot benefit a free Gold

  Ultimate, actually.

> subscription and can use Gitlab shared runners tagged with
> saas-linux-{large, xlarge, 2xlarge}-amd64.
> 
> In order to use one of thoses tags in Buildroot Gitlab-CI jobs, we have
> to classify all tests by ressource requirement.

  s/ressource/resource/

> 
> Most of our tests are fast (checkpackage, test_external_bootlin...), so
> saas-linux-small-amd64 runner tag is enough. Note that untagged jobs
> run on the small Linux x86-64 runner [3].

  AFAIU, if it has _any_ tag, it will never run on a shared runner. And we 
always add the buildroot-runner tag.

  Maybe that's what you meant, but it's not so clear from this paragraph.


> Shared Gitlab-CI runners time out after 3 hours but some of our tests
> requires more time to finish. Some tests may also requires more storage
> due to download sources and generated files, so such test must use a
> runner that provide more storage.
> 
> Introduce a "Tier list" that will be used to select the Runner Tag.
> 
>    Tier1 S (default)
>    Tier2 M
>    Tier3 L
>    Tier4 XL
>    Tier5 2XL

  Nitpick: generally Tier1 means "the best".

  Actually I don't think it makes much sense to use Tier terminology, why not 
just stick to small/medium/...?

> Gitlab runners owned by the Buildroot project can still run any
> job using "buildroot-runner" tag. We expect such runners able to
> run any jobs without any limitation.
> 
> If a test can't be executed by any shared Gitlab-CI runner, we have to
> use a runner owned by the Buildroot project. In this case we have to
> use a specific tag "buildroot-runner-only".

  Is there anything where 2XL won't work?

> [1] https://docs.gitlab.com/ci/runners/hosted_runners/linux/#machine-types-available-for-linux---x86-64
> [2] https://gitlab.com/buildroot.org/gitlab-oss
> [3] https://docs.gitlab.com/ci/runners/hosted_runners/#gitlabcom-hosted-runner-workflow
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   support/testing/gitlab-runner.json | 765 +++++++++++++++++++++++++++++
>   1 file changed, 765 insertions(+)
>   create mode 100644 support/testing/gitlab-runner.json
> 
> diff --git a/support/testing/gitlab-runner.json b/support/testing/gitlab-runner.json
> new file mode 100644
> index 0000000000..c163b4b1fa
> --- /dev/null
> +++ b/support/testing/gitlab-runner.json

  Instead of a separate file, wouldn't it be easier to put the information 
directly in the test file itself? I think the path to the source file can be 
easily subst-ed from the test name, and from there we can parse a comment.

> @@ -0,0 +1,765 @@
> +{
> +    "tests": {
> +        "tests.boot.test_atf.TestATFAllwinner.test_run": { "runner": "Tier1" },
> +        "tests.boot.test_atf.TestATFAllwinner.test_run": { "runner": "Tier1" },

  Can't we drop everything which is Tier1 from the list and just default to it?

  If not, we'll need a check-package check that every test is mentioned in 
gitlab-runner.json.

  How did you decide on Tier1/2/...? Can that be documented?


[snip]

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
