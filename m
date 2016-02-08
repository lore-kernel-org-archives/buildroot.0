From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 9 Feb 2016 00:48:21 +0100
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <20160208190134.GG3436@free.fr>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
 <20160208190134.GG3436@free.fr>
Message-ID: <56B92945.1040705@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Luca, All,
>
> On 2016-02-05 12:07 +0100, Luca Ceresoli spake thusly:
>> Currently all cmake packages depend on host-cmake. Unfortunately
>> host-cmake takes a long time to configure and build: almost 7 minutes
>> on a dual-core i5 with SSD. The time does not change even with ccache
>> enabled.
>>
>> Indeed, building host-cmake is avoidable if it is already installed on
>> the build host: CMake is supposed to be quite portable, and the only
>> patch in Buildroot for the CMake package seems to only affect
>> target-cmake.
>>
>> We avoid building host-cmake if cmake is already available on the host
>> using a technique similar to the one used for host-tar and host-xzcat.
> [--SNIP--]
>> Besides, among all the cmake packages currently in Buildroot, the
>> highest version mentioned in cmake_minimum_required() is 3.0 (the
>> grantlee package). Thus 3.0 should be enough to build all current
>> packages. Of course, with the addition or bump of packages, the
>> minimum required version will raise.
>
> Would it make sense to have the cmake-package infra check for that?

Sure it would. But I don't know how to do it properly.

Simply grepping CMakeLists.txt is not reliable: some packages do

   cmake_minimum_required(VERSION ${SOME_COMPUTED_VARIABLE})

Probably the only solid way to obtain the minimum required version would
be to launch cmake and let it tell us. But I had a very quick look and
I didn't find any way to ask it such information.

>> Note: there is still a pending clarification with Arnout about this
>> patch.
>
> Which is? ;-)

...which is now solved. :) It was only a misunderstanding:
http://lists.busybox.net/pipermail/buildroot/2016-February/151981.html

> [--SNIP--]
>> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
>> new file mode 100644
>> index 0000000..fe16322
>> --- /dev/null
>> +++ b/support/dependencies/check-host-cmake.mk
>> @@ -0,0 +1,6 @@
>> +CMAKE ?= cmake
>
> At first, I was a bit worried that we use just 'CMAKE' as the variable
> name.
>
> But in retrospect, it seems you want to allow the user to specify his
> own locally-installed cmake, right? Is so, maybe you could add that to
> the manual (chapter 8.6, Environment variables).

"you want to allow" is an overstatement. What happened is that I lazily
copied check-host-tar.sh, which happens to have the same construct. I
don't know whether it was done on purpose there, but I realized being
able to do 'make CMAKE=/my/dirty/cmake' might be useful, e.g. if one
is hacking cmake itself and wants to use a specific version without
tweaking PATH.

>> +ifeq (,$(call suitable-host-package,cmake,$(CMAKE)))
>> +BUILD_HOST_CMAKE = YES
>> +CMAKE = $(HOST_DIR)/usr/bin/cmake
>> +endif
>> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
>> new file mode 100755
>> index 0000000..08de60c
>> --- /dev/null
>> +++ b/support/dependencies/check-host-cmake.sh
>> @@ -0,0 +1,30 @@
>> +#!/bin/sh
>> +
>> +candidate="$1"
>> +
>> +cmake=`which $candidate`
>
> For good measure, redirect stderr to /dev/null. 'which' is not supposed
> to spit out anything on stderrm even when the program is not found, but
> still, there might be rogue implenentations of which in the wild...

Yeah, there might be a 'witch' out there in the wild. :)

Enlightened by your shell wisdom, I will add the redirect.

>> +if [ ! -x "$cmake" ]; then
>> +	# echo nothing: no suitable cmake found
>> +	exit 1
>> +fi
>> +
>> +version=`$cmake --version | head -n1 | cut -d\  -f3`
>> +major=`echo "$version" | cut -d. -f1`
>> +minor=`echo "$version" | cut -d. -f2`
>> +
>> +# Versions before 3.0 are affected by the bug described in
>> +# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
>> +# and fixed in upstream CMake in version 3.0:
>> +# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
>> +major_min=3
>> +minor_min=0
>> +if [ $major -gt $major_min ]; then
>> +	echo $cmake
>> +else
>> +	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
>
> Damn, I would have suggested you make it a single condition:
>
>      if [ ${major} -gt ${major_min} -o \
>           ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then

It's nicer and cleaner. However it would produce fairly long lines when
comparing three or more numbers. E.g. for asciidoc we want at least
version >= 8.6.3.

I wonder whether it would make sense to extract a shell function to
compare a version number and reuse it in all check-host-*.sh, and
possibly elsewhere. But that's for another day.

> But since what you did is what is already done for asciidoc and tar, I
> guess that's OK.
>
> Yet, I prefer we use ${..} to expand variables, it is /cleaner/...

Sure, will do.

-- 
Luca
