From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 9 May 2018 10:04:15 -0500
Subject: [Buildroot] [PATCH] xfsprogs: bump to 4.16.1
In-Reply-To: <20180509165536.14b0c47b@windsurf.home>
References: <1525876323-62495-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180509165536.14b0c47b@windsurf.home>
Message-ID: <CANQCQpZ6_vZT5bvgX36ANzJtAafA3YQ48ziXw1te1mG6Sc-POw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, May 9, 2018 at 9:55 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed,  9 May 2018 09:32:03 -0500, Matt Weber wrote:
>
>> diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
>> index 74636c2..9030a2a 100644
>> --- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
>> +++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
>> @@ -14,6 +14,8 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>  [Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
>>  [baruch: update for v4.15.1; extend to include scrub]
>>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> +[matt: update for v4.16.1; adjusted libunistring -> libicu]
>> +Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>>  ---
>>   mdrestore/Makefile | 2 +-
>>   scrub/Makefile     | 2 +-
>> @@ -38,8 +40,8 @@ index 063279400262..949f6fd8ba94 100644
>>  +++ b/scrub/Makefile
>>  @@ -70,7 +70,7 @@ xfs_scrub.c
>>
>> - LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
>> - LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
>> + LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBICU_LIBS) $(LIBRT)
>> + LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)
>
> Does this also remove $(LIBRT) ?
>

I read this https://patchwork.kernel.org/patch/10296957/ as the LIBRT
isn't an issue after switching to LIBICU (Not that LIBRT is removed).
Do you guys have more context on why LIBRT would be pulled out?

> Why is this now done in patch 0001, while it was done in
>
>
>> diff --git a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch b/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
[snip]
>> ---- a/scrub/Makefile
>> -+++ b/scrub/Makefile
>> -@@ -69,7 +69,7 @@ vfs.c \
>> - xfs_scrub.c
>> -
>> - LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
>> --LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
>> -+LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBRT)
>
> this patch before ?
>

Didn't realize I should set up the makefile for optional inclusion of
LIBICU.  I'll revisit as part of testing the selective libicu
dependency.

Matt
