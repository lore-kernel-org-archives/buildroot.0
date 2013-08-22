From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 11:21:39 +0200
Subject: [Buildroot] [PATCH] python-setuptools: Add patch to prevent
 detecting the host installation
In-Reply-To: <CAG2jQ8h04Ln-6Eo=cPCF_uc0d3XeZzj3ea-XpRQPyYbCWvSy3A@mail.gmail.com>
References: <1377008739-12484-1-git-send-email-markos.chandras@imgtec.com>
 <521527EC.8000307@mind.be>
 <CAGm1_kvOgqynT=gJcxQW=xr_MQeiL8QuxiKAi88QrKADwQY1EQ@mail.gmail.com>
 <CAGm1_ktgXAkpBOQJ4JspAfWKirqQg2SdKOvYH9+on2wKKgHOFw@mail.gmail.com>
 <CAG2jQ8h04Ln-6Eo=cPCF_uc0d3XeZzj3ea-XpRQPyYbCWvSy3A@mail.gmail.com>
Message-ID: <5215D823.30905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 11:17, Markos Chandras wrote:
> On 22 August 2013 10:07, Yegor Yefremov <yegorslists@googlemail.com> wrote:
>> On Thu, Aug 22, 2013 at 10:19 AM, Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>>> On Wed, Aug 21, 2013 at 10:49 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>> On 20/08/13 16:25, Markos Chandras wrote:
>>>>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>>>>> ---
>>>>>    ...etuptools-do-not-detect-installed-version.patch | 26 ++++++++++++++++++++++
>>>>>    1 file changed, 26 insertions(+)
>>>>>    create mode 100644 package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch
>>>>>
>>>>> diff --git a/package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch b/package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch
>>>>> new file mode 100644
>>>>> index 0000000..ebc8830
>>>>> --- /dev/null
>>>>> +++ b/package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch
>>>>> @@ -0,0 +1,26 @@
>>>>> +Prevent build system from detecting an existing installation.
>>>>> +Fixes the following problem when python-setuptools is installed
>>>>> +on the host:
>>>>> +
>>>>> +Setuptools installation detected at /usr/lib64/python2.7/site-packages
>>>>> +Renaming /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
>>>>> +/usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
>>>>> +OSError: [Errno 13] Permission denied
>>>>
>>>>   This happens because setuptools is called with:
>>>>
>>>>          PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
>>>>
>>>>   Yegor, Gustavo, any idea why this is called with a python path pointing
>>>> to the host? Maybe this isn't needed anymore? A quick grep in the source
>>>> doesn't indicate an obvious place where PYTHONPATH would be relevant
>>>> during install itself.
>>>>
>>>>   I've just tried removing the PYTHONPATH override and it built OK, but I
>>>> haven't tested if a package installed with setuptools actually works.
>>>> Well, actually, host-setuptools _doesn't_ have that strange
>>>> PYTHONPATH override and that is of course the only one used within
>>>> buildroot itself...
>>>
>>> I'll look into it. But I need some time.
>>
>> The only package, that relies on setuptools is netifaces. I've applied
>> the patch, rebuilt BR and everything seems to be OK. I can use
>> netifaces, when I start the new image.
>>
>> Yegor
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Thanks for testing. Shall I submit a new patch removing the PYTHONPATH
> variable from the makefile?

  It should probably be changed to
$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages

  I guess it was just a typo in the original patch, forgetting to add 
$(TARGET_DIR)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
