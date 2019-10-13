From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Oct 2019 00:47:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/clamav: fix clamsubmit linking
In-Reply-To: <CAPi7W838ORXVNLx-0=yoQhLd-Ub65UYWp2a5kUXhSpV2WW0bfA@mail.gmail.com>
References: <20191012170455.9816-1-fontaine.fabrice@gmail.com>
 <20191012170455.9816-2-fontaine.fabrice@gmail.com>
 <c3872f5d-35c7-eb96-e48a-a4a42d01e790@mind.be>
 <CAPi7W838ORXVNLx-0=yoQhLd-Ub65UYWp2a5kUXhSpV2WW0bfA@mail.gmail.com>
Message-ID: <6c74c8a5-b946-d8fa-53f3-7bc7ebf76471@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/10/2019 23:20, Fabrice Fontaine wrote:
> Dear Arnout,
> 
> Le dim. 13 oct. 2019 ? 22:35, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>>
>>
>> On 12/10/2019 19:04, Fabrice Fontaine wrote:
>>> Fixes:
>>>  - http://autobuild.buildroot.org/results/49973b2283c65de5155deaf633cd6569a37af375
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>  ...ix-using-wrong-linker-for-clamsubmit.patch | 27 +++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>  create mode 100644 package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch
>>>
>>> diff --git a/package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch b/package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch
>>> new file mode 100644
>>> index 0000000000..f7d72c000f
>>> --- /dev/null
>>> +++ b/package/clamav/0003-Fix-using-wrong-linker-for-clamsubmit.patch
>>> @@ -0,0 +1,27 @@
>>> +From 59f7ec0046e399e33003f83dd76f968441066ed4 Mon Sep 17 00:00:00 2001
>>> +From: arlecchino <kolbma@users.noreply.github.com>
>>> +Date: Mon, 9 Sep 2019 14:58:54 +0200
>>> +Subject: [PATCH] Fix using wrong linker for clamsubmit
>>> +
>>> +Changing from Objective-C linker to C linker for clamsubmit
>>> +
>>> +[Retrieved from:
>>> +https://github.com/Cisco-Talos/clamav-devel/pull/108/commits/59f7ec0046e399e33003f83dd76f968441066ed4]
>>> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> +---
>>> + clamsubmit/Makefile.in | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/clamsubmit/Makefile.in b/clamsubmit/Makefile.in
>>> +index 1ada5c620c..142f0f0291 100644
>>> +--- a/clamsubmit/Makefile.in
>>> ++++ b/clamsubmit/Makefile.in
>>> +@@ -679,7 +679,7 @@ installcheck-binPROGRAMS: $(bin_PROGRAMS)
>>> +
>>> + clamsubmit$(EXEEXT): $(clamsubmit_OBJECTS) $(clamsubmit_DEPENDENCIES) $(EXTRA_clamsubmit_DEPENDENCIES)
>>> +     @rm -f clamsubmit$(EXEEXT)
>>> +-    $(AM_V_OBJCLD)$(OBJCLINK) $(clamsubmit_OBJECTS) $(clamsubmit_LDADD) $(LIBS)
>>> ++    $(AM_V_CCLD)$(LINK) $(clamsubmit_OBJECTS) $(clamsubmit_LDADD) $(LIBS)
>>
>>  The upstream commit [1] looks better, could you submit that one?
> This upstream commit is already in the current version (0.102.0) so
> obviously it isn't enough to fix our build failures.
> I'm not an expert in Objective C and so I don't know why upstream
> wants to use it instead of C linker.

 So I studied this a little further and I understand the issue.

 First of all, clamav sets AC_PROG_OBJC in configure.ac because they need that
to be able to link with MacOS libraries. For compilation this makes no
difference because automake will automatically detect that .c files need CC and
.cxx files need CXX. So OBJC is only used for linking. On Linux, at least for
native compilation, it happens to work because AC_PROG_OBJC happens to default
to gcc. But the effect is that we use the system gcc instead of the cross
compiler for linking.

 The patch you provided works, but only because we don't AUTORECONF, because
autoreconfiguring will undo the change. And obviously it's not upstreamable.

 I have no idea what the proper solution is at the autotools level.

 However, I just added 'OBJC=$(TARGET_CC)' to clamav's CONF_ENV and that seems
to work.


 Regards,
 Arnout


>>
>>  Regards,
>>  Arnout
>>
>> [1]
>> https://github.com/Cisco-Talos/clamav-devel/commit/a78fd7e91b77b83d73dcca84d4b48bebda27953f
>>
>>
>>> +
>>> + mostlyclean-compile:
>>> +     -rm -f *.$(OBJEXT)
>>>
> Best Regards,
> 
> Fabrice
> 
