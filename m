From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 08:55:00 +0200
Subject: [Buildroot] [PATCH v7 1/9] package/patchelf: add patch for
 rpath sanitization under a root directory
In-Reply-To: <3efb1d74-0f29-4c98-3b51-7dd24f21aabb@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-2-git-send-email-wg@grandegger.com>
 <3efb1d74-0f29-4c98-3b51-7dd24f21aabb@mind.be>
Message-ID: <cae36672-baf1-5a57-64be-17a99cf9c061@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 19.07.2017 um 23:08 schrieb Arnout Vandecappelle:
>   Hi Wolfgang,
> 
> On 05-07-17 18:53, Wolfgang Grandegger wrote:
>> The patch allows to use patchelf to sanitize the rpath of the buildroot
>> libraries and binaries using the option "--make-rpath-relative <rootdir>".
>> Recent versions of patchelf will not built on old Debian and RHEL systems
>> due to C++11 constructs. Therefore we stick with v0.9 for the time being.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
>   I still have a bunch of comments, but they're solidly in the nitpicking
> category. We definitely want this series (or at least part of it) in
> 2017.08-rc1, so if you don't respin in time, it will be applied. In that case,
> however, feel free to fix my nitpicks in follow-up patches. That said:

OK. I will concentrate on the important (and trivial) issues.

> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Should I also add your "Acked-by" to the patchelf patches itself?

>> diff --git a/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>> new file mode 100644
>> index 0000000..eda32e8
>> --- /dev/null
>> +++ b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>> @@ -0,0 +1,52 @@
>> +From a365bcb7d7025da51b33165ef7ebc7180199a05e Mon Sep 17 00:00:00 2001
>> +From: Eelco Dolstra <eelco.dolstra@logicblox.com>
>> +Date: Mon, 19 Sep 2016 17:31:37 +0200
>> +Subject: [PATCH] Remove apparently incorrect usage of "static"
> 
>   I was going to say: we don't really need this patch. However, we do need it
> because it removes the DT_INIT symbols from needed_libs (DT_INIT points to
> library initialisation function, not to needed libraries...). So perhaps that
> bit should be added to the patch message.

Added to the [] comment. I think the original messages should bot be 
touched.

>> +
>> +[Upstream-commit: https://github.com/NixOS/patchelf/commit/a365bcb7d7025da51b33165ef7ebc7180199a05e]
>> +Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> +
>> +---
>> + src/patchelf.cc | 8 +++-----
>> + 1 file changed, 3 insertions(+), 5 deletions(-)
>> +
>> +Index: patchelf-0.9.old/src/patchelf.cc
> 
>   Looks like you didn't really generate this with git-format-patch, although the
> header looks like it... It's not very important, but we really like to be able
> to regenerate exactly the same patches with the following procedure:
> 
> cd patchelf
> git checkout -b buildroot 0.9
> git am ../buildroot/package/patchelf/*.patch
> git format-patch -N --no-renames -o ../buildroot/package/patchelf 0.9..

This is generate with quilt against patchelf-0.9.tag.bz2. Will fix.

> [snip]
>> diff --git a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
>> new file mode 100644
>> index 0000000..ed7bb12
>> --- /dev/null
>> +++ b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
>> @@ -0,0 +1,423 @@
>> +From af8d4a24a0ef613bdb47f0b1c3d962d59c53a4be Mon Sep 17 00:00:00 2001
>> +From: Wolfgang Grandegger <wg@grandegger.com>
>> +Date: Mon, 20 Feb 2017 16:29:24 +0100
>> +Subject: [PATCH] Add option to make the rpath relative under a specified root
>> + directory
> 
>   I'm not yet 100% satisfied with this patch, because it combines too many things
> in a single bunch. However, improving it really requires a lot of additional
> refactoring in patchelf. And patchelf test coverage is exactly great so
> refactoring is tricky. And we anyway can't use the latest patchelf version. So I
> guess this Buildroot-specific patch is good enough.
> 
> [snip]
>> +@@ -1261,35 +1396,35 @@
>> + void ElfFile<ElfFileParamNames>::replaceNeeded(map<string, string>& libs)
>> + {
>> +     if (libs.empty()) return;
>> +-
>> ++
> 
>   The patch really shouldn't contain these whitespace fixes... (Lots more below).

Ah, obviously I did a remove-trailing-white-space. I have reverted them.

More soon...

Wolfgang.
