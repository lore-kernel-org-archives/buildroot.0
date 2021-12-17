Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8DAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 13:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3BD82D12;
	Fri, 17 Dec 2021 13:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QT_DxSCYY7yR; Fri, 17 Dec 2021 13:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4357E84B73;
	Fri, 17 Dec 2021 13:07:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 435BB1BF281
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 13:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4043A610B4
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 13:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z73m-26RYowl for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 13:07:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.bitwise.fi (mail.bitwise.fi [109.204.228.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E89DA61095
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.bitwise.fi (Postfix) with ESMTP id F3B1C460042;
 Fri, 17 Dec 2021 15:07:03 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from mail.bitwise.fi ([127.0.0.1])
 by localhost (mustetatti.dmz.bitwise.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrDRrqZ0_Vfu; Fri, 17 Dec 2021 15:07:01 +0200 (EET)
Received: from [192.168.5.238] (fw1.dmz.bitwise.fi [192.168.69.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: anssiha)
 by mail.bitwise.fi (Postfix) with ESMTPSA id 50F56460041;
 Fri, 17 Dec 2021 15:07:01 +0200 (EET)
Message-ID: <c9aaca1a-a310-fb56-b0a1-054cb9971fc0@bitwise.fi>
Date: Fri, 17 Dec 2021 15:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211216164522.3877446-1-anssi.hannula@bitwise.fi>
 <60305586-b9e1-1067-0488-641cd5876da1@mind.be>
From: Anssi Hannula <anssi.hannula@bitwise.fi>
In-Reply-To: <60305586-b9e1-1067-0488-641cd5876da1@mind.be>
Subject: Re: [Buildroot] [PATCH] package/icu: fix build failure due to a
 library clash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16.12.2021 22.24, Arnout Vandecappelle wrote:
>
> On 16/12/2021 17:45, Anssi Hannula wrote:
>> ICU build scripting adds some host libraries to LD_LIBRARY_PATH by
>> using constructs of the following form:
>>
>>    LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"
>>
>> If the original LD_LIBRARY_PATH is empty, this causes the last search
>> directory be an empty string, i.e. the working directory.
>>
>> ICU build runs some basic host commands (e.g. "rm") in $(TARGET_DIR)/lib
>> under such an LD_LIBRARY_PATH, causing target libraries (e.g. libc) to
>> possibly get loaded instead of host system libraries if they are
>> compatible enough (e.g. arch matches).
>>
>> Since the target libraries may not actually be ABI compatible with host
>> system binaries (e.g. target has an old libc), this can cause crashes
>> or other errors.
>>
>> Observed errors include:
>>    (1) rm: libc.so.6: version `GLIBC_2.33' not found (required by rm)
>>    (2) sh: line 1: 1362670 Segmentation fault      (core dumped) rm -f libicudata.so.65
>>
>> Workaround the issue by setting a dummy LD_LIBRARY_PATH when it would
>> otherwise be empty.
>>
>> https://unicode-org.atlassian.net/browse/ICU-21417
>   Normally, it's better to patch the source and send that patch upstream rather 
> than working around the problem like this. However, it seems that upstream is 
> working on it, so this workaround is good enough for the time being.


OK, thanks, I'll keep that in mind in the future.

>   Therefore, I applied this patch to master, thanks.
>
>   I wonder though why we don't see this issue in the autobuilders. I guess we 
> don't have autobuilders where host and target don't have compatible libc ABI. 
> Could you give some details about what the host is and what the target toolchain 
> is where you encounter this issue, so we can make sure to add something like 
> that to the autobuilders?

Sure.
A quick test with the below minimal defconfig reproduces the issue with
the following environment:

Host: Fedora 34, x86_64, glibc 2.33, coreutils 8.32
Target: buildroot v2021.02.8, x86_64, glibc 2.32 (buildroot toolchain)

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_MERGED_USR=y
BR2_PACKAGE_ICU=y

Seems ROOTFS_MERGED_USR is needed for the issue to trigger, since
otherwise libc.so.6 will be in ${TARGET_DIR}/lib, not
${TARGET_DIR}/usr/lib, so it does not get loaded by the dubious
LD_LIBRARY_PATH.

The end of the build log is as follows:

/bin/make[2]: Making `install' in `data'
/bin/sh ../mkinstalldirs  /home/anssiha/sec/git/buildroot/output3/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib
LD_LIBRARY_PATH=/home/anssiha/sec/git/buildroot/output3/build/host-icu-69-1/source/stubdata:/home/anssiha/sec/git/buildroot/output3/build/host-icu-69-1/source/tools/ctestfw:/home/anssiha/sec/git/buildroot/output3/build/host-icu-69-1/source/lib:$LD_LIBRARY_PATH  /home/anssiha/sec/git/buildroot/output3/build/host-icu-69-1/source/bin/pkgdata -O ../data/icupkg.inc -q -c -s /home/anssiha/sec/git/buildroot/output3/build/icu-69-1/source/data/out/build/icudt69l -d ../lib -m dll -r 69.1 -e icudt69  -T ./out/tmp -s ./out/build/icudt69l -p icudt69l -L icudata ./out/tmp/icudata.lst -I /home/anssiha/sec/git/buildroot/output3/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib
pkgdata: cd ../lib/ && /bin/install -c libicudata.so.69.1 /home/anssiha/sec/git/buildroot/output3/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libicudata.so.69.1
pkgdata: cd /home/anssiha/sec/git/buildroot/output3/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib && rm -f libicudata.so.69 && ln -s libicudata.so.69.1 libicudata.so.69
rm: libc.so.6: version `GLIBC_2.33' not found (required by rm)
-- return status = 256
Error creating symbolic links. Failed command: cd /home/anssiha/sec/git/buildroot/output3/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib && rm -f libicudata.so.69 && ln -s libicudata.so.69.1 libicudata.so.69
make[3]: *** [Makefile:185: install-local] Error 1
make[2]: *** [Makefile:153: install-recursive] Error 2
make[1]: *** [package/pkg-generic.mk:290: /home/anssiha/sec/git/buildroot/output3/build/icu-69-1/.stamp_staging_installed] Error 2
make: *** [Makefile:84: _all] Error 2


>   Regards,
>   Arnout
>
>
>> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
>> ---
>>   package/icu/icu.mk | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
>> index 2c04c3c775..c5d0c3eefb 100644
>> --- a/package/icu/icu.mk
>> +++ b/package/icu/icu.mk
>> @@ -50,6 +50,17 @@ HOST_ICU_CONF_OPTS = \
>>   ICU_SUBDIR = source
>>   HOST_ICU_SUBDIR = source
>>   
>> +# ICU build scripting adds paths to LD_LIBRARY_PATH using
>> +#   LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"
>> +# which, if LD_LIBRARY_PATH was empty, causes the last search directory
>> +# to be the working directory, causing the build to try to load target
>> +# libraries, possibly crashing the build due to ABI mismatches.
>> +# Workaround by ensuring LD_LIBRARY_PATH is never empty.
>> +# https://unicode-org.atlassian.net/browse/ICU-21417
>> +ifeq ($(LD_LIBRARY_PATH),)
>> +ICU_MAKE_ENV += LD_LIBRARY_PATH=/dev/null
>> +endif
>> +
>>   ICU_CUSTOM_DATA_PATH = $(call qstrip,$(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH))
>>   
>>   ifneq ($(ICU_CUSTOM_DATA_PATH),)
>>

-- 
Anssi Hannula / Bitwise Oy
+358 503803997

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
