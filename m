Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA65DD2E9D4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 10:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66BD260787;
	Mon, 11 Nov 2024 10:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJXn74oUASDd; Mon, 11 Nov 2024 10:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6555D60783
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6555D60783;
	Mon, 11 Nov 2024 10:32:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D733D8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B83780D35
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhMovUEmPLcF for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 10:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13FEA80D2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13FEA80D2A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13FEA80D2A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4B241BF203
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:31:54 +0000 (UTC)
Message-ID: <daeb3acf-5374-4079-8ce9-9a0a866aad53@korsgaard.com>
Date: Mon, 11 Nov 2024 11:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
 <20241009-check-package-requirements-v2-2-df3e7b79788b@collins.com>
 <20241026134109.2a7cfda5@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241026134109.2a7cfda5@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/3] utils/check-package: add inline
 script requirements
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/26/24 13:41, Thomas Petazzoni via buildroot wrote:
> On Wed, 09 Oct 2024 14:14:57 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
> 
>> The check-package tool requires some PyPi package to be installed before
>> it can run. This is typically done by manually installing them into the
>> user's global Python environment or setting up a virtual environment,
>> then manually installing each dependency.
>>
>> Python recently defined a format for managing script dependencies as
>> inline metadata[1]. This can be used with the `uv` tool to run a Python
>> script and automatically install the minimum required version of Python
>> and PyPi dependencies.
>>
>> With this change, it's now possible to run check-package with
>>
>>    uv run -s ./utils/check-package
>>
>> Note that, because check-package does not have the '.py' file extension
>> we must specify the `-s` or `--script` argument. That argument was added
>> very recently in release 0.4.19[2].
>>
>> I set the minimum python to 3.9 as that is the oldest version still
>> supported[3]. I verified 3.9 works by running
>>
>>    uv run -p 3.9 -s ./utils/check-package `git ls-tree -r --name-only HEAD` --ignore-list=.checkpackageignore
>>
>> [1] https://packaging.python.org/en/latest/specifications/inline-script-metadata/#script-type
>> [2] https://github.com/astral-sh/uv/releases/tag/0.4.19
>> [3] https://devguide.python.org/versions/
>>
>> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>> ---
>> Changes in v2:
>> - fix utils/check-package to use Python v3.9 [Arnout]
>> ---
>>   utils/check-package | 7 +++++++
>>   1 file changed, 7 insertions(+)
> 
> In fact, I had applied an earlier version, but I fixed the 3.8 -> 3.9
> issue.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
