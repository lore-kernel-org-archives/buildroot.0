From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 16 Jul 2016 22:32:15 +0200
Subject: [Buildroot] [PATCH 3/3] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <9c8ffb8b-2aa6-3e21-6515-3fb5b9d999c8@mind.be>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-4-git-send-email-luca@lucaceresoli.net>
 <100e7fc7-a0bd-78ee-1ab0-815142789005@mind.be>
 <577A3C3F.1060403@lucaceresoli.net>
 <9c8ffb8b-2aa6-3e21-6515-3fb5b9d999c8@mind.be>
Message-ID: <578A99CF.1090504@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

On 05/07/2016 11:21, Arnout Vandecappelle wrote:
[snip]
>>>> Option 3 means adding another parameter (and implement a proper
>>>> version number comparison). It would also force the user to take care
>>>> of setting it properly, which is easy however: if a package fails at
>>>> cmake_minimum_required(), raise the parameter. The advantage is that
>>>> users not using a specific package can keep the number lower, thus
>>>> enabling the speedup on more build hosts.
>>>
>>>  There could also be a BR2_PACKAGE_HOST_CMAKE_MIN_VERSION_X_Y that could be
>>> selected by individual packages, and used in the check-host-cmake script to
>>> evaluate the installed cmake version. However, it is not entirely trivial to
>>> check the correctness of this in the autobuilders.
>>
>> This would be the most complete solution. However, no matter how complex
>> it is to implement and test, it still adds a burden on the shoulders of
>> contributors wanting to "simply" bump a package version. I'm trying to
>> avoid that.
> 
>  I didn't make this clear enough: I absolutely don't like the idea of using
> BR2_PACKAGE_HOST_CMAKE_MIN_VERSION_X_Y, because it adds a lot of complexity and
> maintainance burden with limited gains.

I couldn't agree more.

>>>  For me, option 2 is sufficient. There may indeed be a build speed regression
>>> when bumping buildroot with the same config. But since bumping buildroot also
>>> means that package versions have been bumped, this could also be due to the new
>>> package version requiring a more recent cmake. In addition, a build speed
>>> regression I don't seriously consider a regression. Actually, for me, almost
>>> every buildroot commit is a speed regression because bash-completion becomes
>>> slower with each additional package :-)
>>
>> Thanks for your vote! :)

Guess what, you won the poll! v4 is coming with option 2 implemented.
Which means it will be equivalent to v2, except for cleanups.

>> I just want to make sure you understand this can disable the speedup
>> _without_ any real need. Take this use case:
>>
>> - in BR 2016.08 we bump package foo to 9.9, which needs CMake 4.0
>> - the user bumps to BR 2016.08 when it's released
>> - the user uses Ubuntu 16.04 LTS on his PC, which ships CMake 3.5
>> - the user does not use package foo
>>
>> This user's builds will fail in finding a suitable system-cmake and will
>> build host-cmake, which is not strictly needed because all enabled
>> packages are happy with CMake <= 3.5.
> 
>  Yes, I understand that this is possible. And my response is: I don't care. We
> did the same (though with lower impact) when we started requiring tar >= 1.17. I
> don't think a simple speedup is important enough to warrant additional
> user-visible complexity. Given that it is just a speed-up, I don't think
> complicated help text is needed either.
> 
>  So I really would like to remove the BR2_TRY_SYSTEM_CMAKE option. First of all,
> it obviously doesn't help for the speed regression issue: if you set that to y,
> you will still see the speed regression. Supposedly you would have read the help
> text and know that this is possible, but typically a buildroot bump will happen
> months or years after the configuration was first done, so in all likelihood the
> user has forgotten all about it.

Although I don't 100% agree with you on the theoretical side, I have
come to think your approach is the best to all practical effects. And it
looks like most packages are fine with a relatively old version of
CMake, which makes my concerns much less relevant. Finally, we can add
more complexity later, should we realize it's needed instead.

-- 
Luca
