Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDEAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 17:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3811A41880;
	Tue, 19 Apr 2022 17:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlT8aalxVbw5; Tue, 19 Apr 2022 17:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55EA41873;
	Tue, 19 Apr 2022 17:37:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79E061BF293
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 17:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 673E741873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 17:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJyBE5wCE5Bp for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 17:37:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 082954160B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 17:37:34 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4KjWG53HsYz9sTP;
 Tue, 19 Apr 2022 19:37:17 +0200 (CEST)
Message-ID: <22e0669c-6221-0ae8-e8ce-b884cd1726c6@othermo.de>
Date: Tue, 19 Apr 2022 19:37:16 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>
References: <20220419111714.1647112-1-marcus.hoffmann@othermo.de>
 <20220419111714.1647112-2-marcus.hoffmann@othermo.de>
 <87tuapqaqw.fsf@tarshish>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <87tuapqaqw.fsf@tarshish>
Subject: Re: [Buildroot] [PATCH 2/2] package/xz: backport CVE-2022-1271
 security fix
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On 19.04.22 18:47, Baruch Siach via buildroot wrote:
> Hi Marcus,
> 
> On Tue, Apr 19 2022, Marcus Hoffmann wrote:
>> Fixes the following security issue:
>>
>> CVE-2022-1271/ZDI-22-619/ZDI-CAN-16587: arbitrary-file-write vulnerability
>>
>> Malicious filenames can make xzgrep to write to arbitrary files
>> or (with a GNU sed extension) lead to arbitrary code execution.
>>
>> xzgrep from XZ Utils versions up to and including 5.2.5 are
>> affected. 5.3.1alpha and 5.3.2alpha are affected as well.
>> This patch works for all of them.
>>
>> This bug was inherited from gzip's zgrep. gzip 1.12 includes
>> a fix for zgrep.
>>
>> This vulnerability was discovered by:
>> cleemy desu wayo working with Trend Micro Zero Day Initiative
>>
>> https://www.mail-archive.com/xz-devel@tukaani.org/msg00551.html
>> https://www.zerodayinitiative.com/advisories/ZDI-22-619/
>> https://www.openwall.com/lists/oss-security/2022/04/07/8
>> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
>> ---
>>   package/xz/0001-xzgrep-ZDI-CAN-16587.patch | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>   create mode 100644 package/xz/0001-xzgrep-ZDI-CAN-16587.patch
> 
> This patch should also add XZ_IGNORE_CVES in xz.mk.
> 
> baruch


Indeed! But Peter already send a better patch that does this:

https://patchwork.ozlabs.org/project/buildroot/patch/20220419113409.1008586-1-peter@korsgaard.com/

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
