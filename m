From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 11 Feb 2016 22:50:16 +0100
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <56BA64A7.3010303@mind.be>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
 <20160208190134.GG3436@free.fr> <56B92945.1040705@lucaceresoli.net>
 <56BA64A7.3010303@mind.be>
Message-ID: <56BD0218.4030001@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 09/02/2016 23:13, Arnout Vandecappelle wrote:
> [snip]
>>>> Besides, among all the cmake packages currently in Buildroot, the
>>>> highest version mentioned in cmake_minimum_required() is 3.0 (the
>>>> grantlee package). Thus 3.0 should be enough to build all current
>>>> packages. Of course, with the addition or bump of packages, the
>>>> minimum required version will raise.
>>>
>>> Would it make sense to have the cmake-package infra check for that?
>>
>> Sure it would. But I don't know how to do it properly.
>>
>> Simply grepping CMakeLists.txt is not reliable: some packages do
>>
>>    cmake_minimum_required(VERSION ${SOME_COMPUTED_VARIABLE})
>>
>> Probably the only solid way to obtain the minimum required version would
>> be to launch cmake and let it tell us. But I had a very quick look and
>> I didn't find any way to ask it such information.
>
>   I think the best way to check is to make sure there is an
autobuilder with
> cmake 3.0. Of course, when we bump the minimum required version, that
> autobuilder should be bumped as well. Thomas, do you see this feasible?

That would be great!

> [snip]
>>>> diff --git a/support/dependencies/check-host-cmake.mk
>>>> b/support/dependencies/check-host-cmake.mk
>>>> new file mode 100644
>>>> index 0000000..fe16322
>>>> --- /dev/null
>>>> +++ b/support/dependencies/check-host-cmake.mk
>>>> @@ -0,0 +1,6 @@
>>>> +CMAKE ?= cmake
>>>
>>> At first, I was a bit worried that we use just 'CMAKE' as the variable
>>> name.
>>>
>>> But in retrospect, it seems you want to allow the user to specify his
>>> own locally-installed cmake, right? Is so, maybe you could add that to
>>> the manual (chapter 8.6, Environment variables).
>>
>> "you want to allow" is an overstatement. What happened is that I lazily
>> copied check-host-tar.sh, which happens to have the same construct. I
>> don't know whether it was done on purpose there, but I realized being
>> able to do 'make CMAKE=/my/dirty/cmake' might be useful, e.g. if one
>> is hacking cmake itself and wants to use a specific version without
>> tweaking PATH.
>
>   Like, for example, on an autobuilder with cmake 3.0 :-)

Sure!! :-)

> [snip]
>>>> +major_min=3
>>>> +minor_min=0
>>>> +if [ $major -gt $major_min ]; then
>>>> +    echo $cmake
>>>> +else
>>>> +    if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
>>>
>>> Damn, I would have suggested you make it a single condition:
>>>
>>>       if [ ${major} -gt ${major_min} -o \
>>>            ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ];
then
>>
>> It's nicer and cleaner. However it would produce fairly long lines when
>> comparing three or more numbers. E.g. for asciidoc we want at least
>> version >= 8.6.3.
>>
>> I wonder whether it would make sense to extract a shell function to
>> compare a version number and reuse it in all check-host-*.sh, and
>> possibly elsewhere. But that's for another day.
>
>   It's something that would fit nicely in the concept of 'shell
modules' that
> Samuel introduces as part of the fix-rpath series [1].

Hey, cool stuff! Sorry, I hadn't had a look at that patch yet.

However, since it it not yet applied, I'll keep the code as is for now
and will take care of updating when it will be official.

-- 
Luca
