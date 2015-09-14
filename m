From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Sep 2015 23:38:33 +0200
Subject: [Buildroot] [PATCH] host-gcc-final: don't install a dead symlink
In-Reply-To: <20150913211643.5ea1e647@free-electrons.com>
References: <1442068315-23186-1-git-send-email-arnout@mind.be>
 <20150913211643.5ea1e647@free-electrons.com>
Message-ID: <55F73E59.8090801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-09-15 21:16, Thomas Petazzoni wrote:
> Arnout,
> 
> On Sat, 12 Sep 2015 16:31:55 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> Nothing is installed into $(HOST_DIR)/usr/$(GNU_TARGET_NAME) by
>> host-gcc-final (only by binutils), so no 'gcc' executable exists
>> there. Therefore, the cc -> gcc symlink that is created in that
>> directory is dead.
>>
>> Since this was not working, the symlink is clearly not needed, so
>> remove its installation command.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  package/gcc/gcc-final/gcc-final.mk | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
>> index 86b3c78..3426ba4 100644
>> --- a/package/gcc/gcc-final/gcc-final.mk
>> +++ b/package/gcc/gcc-final/gcc-final.mk
>> @@ -92,9 +92,6 @@ define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
>>  		ln -snf $(GNU_TARGET_NAME)-gcc \
>>  			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
>>  	fi
>> -	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
>> -		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
>> -	fi
> 
> Hum, are you sure? When I look at an external toolchain built with
> Buildroot, I see:
> 
> $ ls -l arm-buildroot-linux-uclibcgnueabi/bin/cc 
> lrwxrwxrwx 1 thomas thomas 3 ao?t   8 16:14 arm-buildroot-linux-uclibcgnueabi/bin/cc -> gcc
> $ ls -l arm-buildroot-linux-uclibcgnueabi/bin/gcc
> -rwxr-xr-x 1 thomas thomas 595798 ao?t   8 16:14 arm-buildroot-linux-uclibcgnueabi/bin/gcc
> 
> This is the only file named 'cc' in the toolchain.

 Ah, it seems that it was removed in gcc 4.9.x. Look at e.g.
br-arm-full-static-2015.08-rc1-38-gad0f85e.tar.bz2

 There are quite a few gcc 4.9 or gcc 5 toolchains in the autobuilders and no
marked failures, so I still think it's going to be pretty harmless.

 I created this patch because I'm working on the internal toolchain wrapper.
There has to be an equivalent real file for every wrapped executable, without
any intermediate symlinks - e.g. cc -> gcc -> toolchain-wrapper wouldn't work,
it has to be cc -> toolchain-wrapper and there has to be a cc.real -> gcc.real
as well. So all these additional symlinks are pretty annoying.


 So, what do you think: resubmit with an updated commit message, or drop it and
handle the additional symlink in the internal toolchain wrapper?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
