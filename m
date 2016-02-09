From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 23:13:59 +0100
Subject: [Buildroot] [PATCH v2] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <56B92945.1040705@lucaceresoli.net>
References: <1454670476-20635-1-git-send-email-luca@lucaceresoli.net>
 <20160208190134.GG3436@free.fr> <56B92945.1040705@lucaceresoli.net>
Message-ID: <56BA64A7.3010303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-02-16 00:48, Luca Ceresoli wrote:
> Dear Yann,
> 
> Yann E. MORIN wrote:
>> Luca, All,
>>
>> On 2016-02-05 12:07 +0100, Luca Ceresoli spake thusly:
[snip]
>>> Besides, among all the cmake packages currently in Buildroot, the
>>> highest version mentioned in cmake_minimum_required() is 3.0 (the
>>> grantlee package). Thus 3.0 should be enough to build all current
>>> packages. Of course, with the addition or bump of packages, the
>>> minimum required version will raise.
>>
>> Would it make sense to have the cmake-package infra check for that?
> 
> Sure it would. But I don't know how to do it properly.
> 
> Simply grepping CMakeLists.txt is not reliable: some packages do
> 
>   cmake_minimum_required(VERSION ${SOME_COMPUTED_VARIABLE})
> 
> Probably the only solid way to obtain the minimum required version would
> be to launch cmake and let it tell us. But I had a very quick look and
> I didn't find any way to ask it such information.

 I think the best way to check is to make sure there is an autobuilder with
cmake 3.0. Of course, when we bump the minimum required version, that
autobuilder should be bumped as well. Thomas, do you see this feasible?
[snip]
>>> diff --git a/support/dependencies/check-host-cmake.mk
>>> b/support/dependencies/check-host-cmake.mk
>>> new file mode 100644
>>> index 0000000..fe16322
>>> --- /dev/null
>>> +++ b/support/dependencies/check-host-cmake.mk
>>> @@ -0,0 +1,6 @@
>>> +CMAKE ?= cmake
>>
>> At first, I was a bit worried that we use just 'CMAKE' as the variable
>> name.
>>
>> But in retrospect, it seems you want to allow the user to specify his
>> own locally-installed cmake, right? Is so, maybe you could add that to
>> the manual (chapter 8.6, Environment variables).
> 
> "you want to allow" is an overstatement. What happened is that I lazily
> copied check-host-tar.sh, which happens to have the same construct. I
> don't know whether it was done on purpose there, but I realized being
> able to do 'make CMAKE=/my/dirty/cmake' might be useful, e.g. if one
> is hacking cmake itself and wants to use a specific version without
> tweaking PATH.

 Like, for example, on an autobuilder with cmake 3.0 :-)


[snip]
>>> +major_min=3
>>> +minor_min=0
>>> +if [ $major -gt $major_min ]; then
>>> +    echo $cmake
>>> +else
>>> +    if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
>>
>> Damn, I would have suggested you make it a single condition:
>>
>>      if [ ${major} -gt ${major_min} -o \
>>           ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
> 
> It's nicer and cleaner. However it would produce fairly long lines when
> comparing three or more numbers. E.g. for asciidoc we want at least
> version >= 8.6.3.
> 
> I wonder whether it would make sense to extract a shell function to
> compare a version number and reuse it in all check-host-*.sh, and
> possibly elsewhere. But that's for another day.

 It's something that would fit nicely in the concept of 'shell modules' that
Samuel introduces as part of the fix-rpath series [1].


 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/576597/

> 
>> But since what you did is what is already done for asciidoc and tar, I
>> guess that's OK.
>>
>> Yet, I prefer we use ${..} to expand variables, it is /cleaner/...
> 
> Sure, will do.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
