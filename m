From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 4 Jul 2016 12:36:47 +0200
Subject: [Buildroot] [PATCH 3/3] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <100e7fc7-a0bd-78ee-1ab0-815142789005@mind.be>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-4-git-send-email-luca@lucaceresoli.net>
 <100e7fc7-a0bd-78ee-1ab0-815142789005@mind.be>
Message-ID: <577A3C3F.1060403@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

thanks for your comments! Se my replies below.

On 02/07/2016 16:18, Arnout Vandecappelle wrote:
> On 01-07-16 17:53, Luca Ceresoli wrote:
[...]
>> Discussion:
> 
>  IMHO this discussion text should be part of the commit log. We typically look
> at the commit log when we wonder why something is done in a particular way, and
> this discussion gives exactly that kind of information.
> 
>>
>> There's an open point about this patch. Currently check-host-cmake.sh
>> only selects a cmake executable if it is >= 3.0, which is the highest
>> requirement among all Buildroot packages on current master. In the
>> future when bumping cmake-packages we should check whether they need a
>> more recent CMake and bump the required version. Doing that we will
>> silently disable the speedup for all users who upgrade Buildroot, even
>> if they do not use the specific package requiring a more recent CMake.
>>
>> This issue can be handled in several ways:
>>  1. remove the version check entirely
>>  2. let the check as it is in this patch
>>  3. add a "minimum required version" kconfig parameter
>>
>> Option 1 makes the Buildroot code simpler but breaks builds for people
>> using one of the mentioned packages. They can address the issue:
>>  - installing a more recent cmake (maybe in their $HOME, if they
>>    cannot do any better)
>>  - disabling BR2_TRY_SYSTEM_CMAKE
> 
>  Ah, this is the problem you are talking about? So basically,
> BR2_TRY_SYSTEM_CMAKE is only relevant if the version check is removed?

Technically you're right. But for a goor "user experience", I'd like
BR2_TRY_SYSTEM_CMAKE to be there at least to hold docs about this
feature. In case 2 the user should be aware that the speedup might not
exist and might disappear bumping Buildroot, why, and how to re-enable it.

I also would give the users the option to opt out, in case there's any
suspect problems with the system cmake.

>> Option 2 is similar, except it silently disables the "speedup" feature
>> for known-too-old versions of cmake. This is bad because it does it
>> silently as discussed above. On the other hand this option handles the
>> use case where exactly the same configuration is built on several
>> machines with different distros, e.g. developer PC and CI server. The
>> system cmake will be used where suitable, built otherwise.
>>
>> Option 3 means adding another parameter (and implement a proper
>> version number comparison). It would also force the user to take care
>> of setting it properly, which is easy however: if a package fails at
>> cmake_minimum_required(), raise the parameter. The advantage is that
>> users not using a specific package can keep the number lower, thus
>> enabling the speedup on more build hosts.
> 
>  There could also be a BR2_PACKAGE_HOST_CMAKE_MIN_VERSION_X_Y that could be
> selected by individual packages, and used in the check-host-cmake script to
> evaluate the installed cmake version. However, it is not entirely trivial to
> check the correctness of this in the autobuilders.

This would be the most complete solution. However, no matter how complex
it is to implement and test, it still adds a burden on the shoulders of
contributors wanting to "simply" bump a package version. I'm trying to
avoid that.

>  For me, option 2 is sufficient. There may indeed be a build speed regression
> when bumping buildroot with the same config. But since bumping buildroot also
> means that package versions have been bumped, this could also be due to the new
> package version requiring a more recent cmake. In addition, a build speed
> regression I don't seriously consider a regression. Actually, for me, almost
> every buildroot commit is a speed regression because bash-completion becomes
> slower with each additional package :-)

Thanks for your vote! :)

I just want to make sure you understand this can disable the speedup
_without_ any real need. Take this use case:

- in BR 2016.08 we bump package foo to 9.9, which needs CMake 4.0
- the user bumps to BR 2016.08 when it's released
- the user uses Ubuntu 16.04 LTS on his PC, which ships CMake 3.5
- the user does not use package foo

This user's builds will fail in finding a suitable system-cmake and will
build host-cmake, which is not strictly needed because all enabled
packages are happy with CMake <= 3.5.

I'm trying to support users not willing do modify the Buildroot code
(e.g. using only BR2_EXTERNAL to add their own salt). With the current
patch, these users could not touch the minimum required version. They
would have no way to re-enable the speedup from Buildroot, they'd need
to act on the "environment", by installing a newer CMake.

[...]
>> +ifneq ($$(USE_SYSTEM_HOST_CMAKE),YES)
> 
>  We typically talk about host-foo and system-foo, so this should be
> USE_SYSTEM_CMAKE.

Right, will fix!

-- 
Luca
