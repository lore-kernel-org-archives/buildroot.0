From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Nov 2013 09:28:43 +0100
Subject: [Buildroot] [PATCH 3/7] eigen: fix install rules
In-Reply-To: <5281D7C1.8080900@mind.be>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
 <1384203613-17871-4-git-send-email-s.martin49@gmail.com>
 <20131111233358.58088a11@skate> <5281D7C1.8080900@mind.be>
Message-ID: <CAHXCMMKFgTOaW2LhcdYEAvQgFHY0mtqdjSYC1pLUvQjetKt_6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, all,

Eigen is one of the rare package that does not support in-source-tree build.
But this can be worked around quite easily.

Also, after a (not so) quick look at the cmake from the eigen package, most
of the
check/test/bench/doc/... builds can be disabled, but not all (need to be
confirmed).

BTW, Thomas, what is the status of your work on out-of-source-tree build?

2013/11/12 Arnout Vandecappelle <arnout@mind.be>

> On 11/11/13 23:33, Thomas Petazzoni wrote:
>
>> Dear Samuel Martin,
>>
>> On Mon, 11 Nov 2013 22:00:09 +0100, Samuel Martin wrote:
>>
>>  diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
>>> index 5abd464..63e21e9 100644
>>> --- a/package/eigen/eigen.mk
>>> +++ b/package/eigen/eigen.mk
>>> @@ -16,8 +16,14 @@ EIGEN_INSTALL_TARGET = NO
>>>   # This package only consists of headers that need to be
>>>   # copied over to the sysroot for compile time use
>>>   define EIGEN_INSTALL_STAGING_CMDS
>>> -       $(RM) -r $(STAGING_DIR)/usr/include/Eigen
>>> -       cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
>>> +       for d in Eigen unsupported ; do \
>>> +               $(RM) -r $(STAGING_DIR)/usr/include/$${d} ; \
>>>
>>
>> Isn't it a bit "rude" to remove
>> $(STAGING_DIR)/usr/include/unsupported ? I mean, this directory name
>> doesn't seem very Eigen specific. Even though it's unlikely, there
>> might be other things installed in there.
>>
> Indeed.


>
>>  +               rsync -ar --exclude=CMakeLists.txt \
>>> +                       --exclude=test \
>>> +                       --exclude=bench \
>>> +                       --exclude=doc \
>>> +                       $(@D)/$${d} $(STAGING_DIR)/usr/include/ ; \
>>> +       done
>>>
>>
>> I must say I'm not overly enthusiastic about this solution. No way to
>> have a proper make install, or cmake stuff working for this package?
>>
>
We might wonder why using a "heavy" build-system like CMake just to install
a couple
of header.

That's true among the build-system I know/use I do prefer CMake, and in
past I already
got patches refused because I moved them to the cmake infra...
Anyway, it just surprises me a bit that Thomas plays the devil advocate for
CMake, who
usually prefers simple/light solutions ;-)


>  I had a quick look, and it looks like the cmake infra should work for
> this package. I guess Matt Weber originally didn't use it because nothing
> needs to be compiled anyway, and you don't want to compile the tests.
>
I think so as well.


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/4239c576/attachment.html>
