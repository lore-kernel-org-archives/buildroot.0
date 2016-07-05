From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jul 2016 11:21:59 +0200
Subject: [Buildroot] [PATCH 3/3] Don't build host-cmake if it is
 available on the build host
In-Reply-To: <577A3C3F.1060403@lucaceresoli.net>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-4-git-send-email-luca@lucaceresoli.net>
 <100e7fc7-a0bd-78ee-1ab0-815142789005@mind.be>
 <577A3C3F.1060403@lucaceresoli.net>
Message-ID: <9c8ffb8b-2aa6-3e21-6515-3fb5b9d999c8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-16 12:36, Luca Ceresoli wrote:
> Arnout,
> 
> thanks for your comments! Se my replies below.
> 
> On 02/07/2016 16:18, Arnout Vandecappelle wrote:
>> On 01-07-16 17:53, Luca Ceresoli wrote:
[snip]
>>> Option 3 means adding another parameter (and implement a proper
>>> version number comparison). It would also force the user to take care
>>> of setting it properly, which is easy however: if a package fails at
>>> cmake_minimum_required(), raise the parameter. The advantage is that
>>> users not using a specific package can keep the number lower, thus
>>> enabling the speedup on more build hosts.
>>
>>  There could also be a BR2_PACKAGE_HOST_CMAKE_MIN_VERSION_X_Y that could be
>> selected by individual packages, and used in the check-host-cmake script to
>> evaluate the installed cmake version. However, it is not entirely trivial to
>> check the correctness of this in the autobuilders.
> 
> This would be the most complete solution. However, no matter how complex
> it is to implement and test, it still adds a burden on the shoulders of
> contributors wanting to "simply" bump a package version. I'm trying to
> avoid that.

 I didn't make this clear enough: I absolutely don't like the idea of using
BR2_PACKAGE_HOST_CMAKE_MIN_VERSION_X_Y, because it adds a lot of complexity and
maintainance burden with limited gains.

> 
>>  For me, option 2 is sufficient. There may indeed be a build speed regression
>> when bumping buildroot with the same config. But since bumping buildroot also
>> means that package versions have been bumped, this could also be due to the new
>> package version requiring a more recent cmake. In addition, a build speed
>> regression I don't seriously consider a regression. Actually, for me, almost
>> every buildroot commit is a speed regression because bash-completion becomes
>> slower with each additional package :-)
> 
> Thanks for your vote! :)
> 
> I just want to make sure you understand this can disable the speedup
> _without_ any real need. Take this use case:
> 
> - in BR 2016.08 we bump package foo to 9.9, which needs CMake 4.0
> - the user bumps to BR 2016.08 when it's released
> - the user uses Ubuntu 16.04 LTS on his PC, which ships CMake 3.5
> - the user does not use package foo
> 
> This user's builds will fail in finding a suitable system-cmake and will
> build host-cmake, which is not strictly needed because all enabled
> packages are happy with CMake <= 3.5.

 Yes, I understand that this is possible. And my response is: I don't care. We
did the same (though with lower impact) when we started requiring tar >= 1.17. I
don't think a simple speedup is important enough to warrant additional
user-visible complexity. Given that it is just a speed-up, I don't think
complicated help text is needed either.

 So I really would like to remove the BR2_TRY_SYSTEM_CMAKE option. First of all,
it obviously doesn't help for the speed regression issue: if you set that to y,
you will still see the speed regression. Supposedly you would have read the help
text and know that this is possible, but typically a buildroot bump will happen
months or years after the configuration was first done, so in all likelihood the
user has forgotten all about it.

 The only real reason to keep the option is to work around a problem where the
system cmake seems to be OK but isn't. Since we have various cmake versions in
the autobuilders, the risk should be limited there. And if a user really has a
broken system cmake, you can still set BR2_HOST_CMAKE=missing to override it. It
does make sense to put that in the troubleshooting section of the manual
(together with xzcat and tar).

 Regards,
 Arnout


> I'm trying to support users not willing do modify the Buildroot code
> (e.g. using only BR2_EXTERNAL to add their own salt). With the current
> patch, these users could not touch the minimum required version. They
> would have no way to re-enable the speedup from Buildroot, they'd need
> to act on the "environment", by installing a newer CMake.
> 
> [...]
>>> +ifneq ($$(USE_SYSTEM_HOST_CMAKE),YES)
>>
>>  We typically talk about host-foo and system-foo, so this should be
>> USE_SYSTEM_CMAKE.
> 
> Right, will fix!
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
