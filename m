From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 4 Feb 2016 14:37:44 +0100
Subject: [Buildroot] [PATCH] Don't build host-cmake if it is available
 on the build host
In-Reply-To: <56B0704C.4060400@lucaceresoli.net>
References: <1454363063-21105-1-git-send-email-luca@lucaceresoli.net>
 <56B06C7F.3010201@mind.be> <56B0704C.4060400@lucaceresoli.net>
Message-ID: <56B35428.2070400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Luca Ceresoli wrote:
> Hi Arnout,
>
> thanks for the review.
>
> Unfortunately this patch is not working, at least for qjson with qt4.

It's fixed now (thanks to Samuel Martin for the help). So it's now time
for the refinements.

[...]

>>> new file mode 100644
>>> index 0000000..fe16322
>>> --- /dev/null
>>> +++ b/support/dependencies/check-host-cmake.mk
>>> @@ -0,0 +1,6 @@
>>> +CMAKE ?= cmake
>>> +
>>> +ifeq (,$(call suitable-host-package,cmake,$(CMAKE)))
>>> +BUILD_HOST_CMAKE = YES
>>> +CMAKE = $(HOST_DIR)/usr/bin/cmake
>>> +endif
>>> diff --git a/support/dependencies/check-host-cmake.sh
>>> b/support/dependencies/check-host-cmake.sh
>>> new file mode 100755
>>> index 0000000..76a81e0
>>> --- /dev/null
>>> +++ b/support/dependencies/check-host-cmake.sh
>>> @@ -0,0 +1,14 @@
>>> +#!/bin/sh
>>> +
>>> +candidate="$1"
>>> +
>>> +cmake=`which $candidate`
>>
>>   $candidate could be an absolute path, in which case which returns
>> nothing.

Not sure I got what you mean, sorry. which + absolute path returns the
absolute path itself, if it exists:

$ which cmake
/usr/bin/cmake
$ which /usr/bin/cmake
/usr/bin/cmake
$ which /not/quite/cmake
$

And the which(1) manpage confirms this is correct.

>>> +if [ ! -x "$cmake" ]; then
>>> +    cmake=`which cmake`
>>
>>   Since there is already CMAKE ?= cmake in the caller, this is pointless.

Aah, yes. Removing the second if will still allow to override CMAKE
('make CMAKE=/my/custom/cmake qjson') but if it does not exist it will
not search for one in the path. Sounds good.

>>   How about a
>>
>> for cmake in "$cmake" "$( which "$cmake" )"; do
>>   ...
>>
>> instead?

Given the above discussion about which(1), I think this is useless.

>>> +    if [ ! -x "$cmake" ]; then
>>> +        # echo nothing: no suitable cmake found
>>> +        exit 1
>>> +    fi
>>> +fi
>>
>>   I have the feeling that there should also be a version check here,
>> though I
>> don't know which version we should use.
>
> Right. My idea is to download all the cmake packages that are currently
> in Buildroot, find the highest version mentioned in their
> CMAKE_MINIMUM_REQUIRED() statement and check for that version in the
> script.

I added it, will be in v2. This was absolutely needed to make it work on
a Ubuntu 14.04 LTS host. More details will be in the commit log (which
will be even longer, ooh yeah).

-- 
Luca
