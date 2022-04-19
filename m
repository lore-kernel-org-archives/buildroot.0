Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 17:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56754418AD;
	Tue, 19 Apr 2022 17:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHXyzAi3MVFe; Tue, 19 Apr 2022 17:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C5A4185A;
	Tue, 19 Apr 2022 17:27:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA1121BF293
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 17:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9203483FE7
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 17:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDiu98MVASt7 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 17:27:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D4F483F40
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 17:27:16 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4KjW2R6vdyz9smQ
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:27:11 +0200 (CEST)
Message-ID: <6b8513cd-399a-ddfe-2587-a933b6cf0fe6@othermo.de>
Date: Tue, 19 Apr 2022 19:27:06 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
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

> 
>>
>> diff --git a/package/xz/0001-xzgrep-ZDI-CAN-16587.patch b/package/xz/0001-xzgrep-ZDI-CAN-16587.patch
>> new file mode 100644
>> index 0000000000..78ee9640f0
>> --- /dev/null
>> +++ b/package/xz/0001-xzgrep-ZDI-CAN-16587.patch
>> @@ -0,0 +1,96 @@
>> +From 69d1b3fc29677af8ade8dc15dba83f0589cb63d6 Mon Sep 17 00:00:00 2001
>> +From: Lasse Collin <lasse.collin@tukaani.org>
>> +Date: Tue, 29 Mar 2022 19:19:12 +0300
>> +Subject: [PATCH] xzgrep: Fix escaping of malicious filenames (ZDI-CAN-16587).
>> +
>> +Malicious filenames can make xzgrep to write to arbitrary files
>> +or (with a GNU sed extension) lead to arbitrary code execution.
>> +
>> +xzgrep from XZ Utils versions up to and including 5.2.5 are
>> +affected. 5.3.1alpha and 5.3.2alpha are affected as well.
>> +This patch works for all of them.
>> +
>> +This bug was inherited from gzip's zgrep. gzip 1.12 includes
>> +a fix for zgrep.
>> +
>> +The issue with the old sed script is that with multiple newlines,
>> +the N-command will read the second line of input, then the
>> +s-commands will be skipped because it's not the end of the
>> +file yet, then a new sed cycle starts and the pattern space
>> +is printed and emptied. So only the last line or two get escaped.
>> +
>> +One way to fix this would be to read all lines into the pattern
>> +space first. However, the included fix is even simpler: All lines
>> +except the last line get a backslash appended at the end. To ensure
>> +that shell command substitution doesn't eat a possible trailing
>> +newline, a colon is appended to the filename before escaping.
>> +The colon is later used to separate the filename from the grep
>> +output so it is fine to add it here instead of a few lines later.
>> +
>> +The old code also wasn't POSIX compliant as it used \n in the
>> +replacement section of the s-command. Using \<newline> is the
>> +POSIX compatible method.
>> +
>> +LC_ALL=C was added to the two critical sed commands. POSIX sed
>> +manual recommends it when using sed to manipulate pathnames
>> +because in other locales invalid multibyte sequences might
>> +cause issues with some sed implementations. In case of GNU sed,
>> +these particular sed scripts wouldn't have such problems but some
>> +other scripts could have, see:
>> +
>> +    info '(sed)Locale Considerations'
>> +
>> +This vulnerability was discovered by:
>> +cleemy desu wayo working with Trend Micro Zero Day Initiative
>> +
>> +Thanks to Jim Meyering and Paul Eggert discussing the different
>> +ways to fix this and for coordinating the patch release schedule
>> +with gzip.
>> +
>> +Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
>> +---
>> + src/scripts/xzgrep.in | 20 ++++++++++++--------
>> + 1 file changed, 12 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/src/scripts/xzgrep.in b/src/scripts/xzgrep.in
>> +index b180936..e5186ba 100644
>> +--- a/src/scripts/xzgrep.in
>> ++++ b/src/scripts/xzgrep.in
>> +@@ -180,22 +180,26 @@ for i; do
>> +          { test $# -eq 1 || test $no_filename -eq 1; }; then
>> +       eval "$grep"
>> +     else
>> ++      # Append a colon so that the last character will never be a newline
>> ++      # which would otherwise get lost in shell command substitution.
>> ++      i="$i:"
>> ++
>> ++      # Escape & \ | and newlines only if such characters are present
>> ++      # (speed optimization).
>> +       case $i in
>> +       (*'
>> + '* | *'&'* | *'\'* | *'|'*)
>> +-        i=$(printf '%s\n' "$i" |
>> +-            sed '
>> +-              $!N
>> +-              $s/[&\|]/\\&/g
>> +-              $s/\n/\\n/g
>> +-            ');;
>> ++        i=$(printf '%s\n' "$i" | LC_ALL=C sed 's/[&\|]/\\&/g; $!s/$/\\/');;
>> +       esac
>> +-      sed_script="s|^|$i:|"
>> ++
>> ++      # $i already ends with a colon so don't add it here.
>> ++      sed_script="s|^|$i|"
>> +
>> +       # Fail if grep or sed fails.
>> +       r=$(
>> +         exec 4>&1
>> +-        (eval "$grep" 4>&-; echo $? >&4) 3>&- | sed "$sed_script" >&3 4>&-
>> ++        (eval "$grep" 4>&-; echo $? >&4) 3>&- |
>> ++            LC_ALL=C sed "$sed_script" >&3 4>&-
>> +       ) || r=2
>> +       exit $r
>> +     fi >&3 5>&-
>> +--
>> +2.35.1
>> +
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
