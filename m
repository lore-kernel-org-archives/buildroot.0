From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2018 19:34:47 +0100
Subject: [Buildroot] [PATCH] meson: bump version to 0.48.1
In-Reply-To: <87tvlc7eir.fsf@tkos.co.il>
References: <20181018204431.29117-1-eric.le.bihan.dev@free.fr>
 <20181019203050.5cdf56e0@gmx.net> <20181019203746.77ca985b@gmx.net>
 <20181019211039.GA14986@itchy> <f6178cb2-5035-a8b7-6a8c-428195fb1eda@mind.be>
 <8dadf2d9-2f53-97cf-0d7f-4d1c323cc2f2@mind.be>
 <f015b0a1-8dc8-2f25-e23a-21bd146d4801@mind.be> <87va5s7w07.fsf@tkos.co.il>
 <20181023184424.3e666e90@gmx.net> <87tvlc7eir.fsf@tkos.co.il>
Message-ID: <bf297b6b-a475-0184-5f03-b008783c52b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/23/18 6:34 PM, Baruch Siach wrote:
> Hi Peter,
> 
> Peter Seiderer writes:
>> On Tue, 23 Oct 2018 14:17:12 +0300, Baruch Siach <baruch@tkos.co.il> wrote:
>>> Arnout Vandecappelle writes:
>>>> On 20/10/2018 15:00, Arnout Vandecappelle wrote:
>>>>> On 20/10/2018 13:57, Arnout Vandecappelle wrote:
>>>> [snip]
>>>>>>> Maybe host-python-setuptools are build for the wrong python version (python2 instead of python3)?
>>>>>>  That is correct. When target python or python3 is selected, then the
>>>>>> corresponding host python is also selected, and *all* host python packages are
>>>>>> built for that specific python version. But if only target python is selected,
>>>>>> then you will get host-python as well, but you can also still depend on
>>>>>> host-python3. In that case, however, all the host python packages will be built
>>>>>> only for python2, not for python3. Hence the breakage.
>>>>>>
>>>>>>  I'm surprised though that we don't see this in the autobuilders... Your patch
>>>>>> doesn't change anything there, does it?
>>>>> It actually does... meson 0.47.1 still had a fallback on distutils if
>>>>> setuptools wasn't available, but 0.48.1 removed that fallback.
>>>>
>>>> Long discussion an the BR developer meeting, here is the conclusion. Adding
>>>> Yegor and Asaf in Cc as python maintainers.
>>>>
>>>> The issue we have at the moment is that all host python packages are built for
>>>> Python 2, not Python 3, *unless* Python 3 is selected for the target.
>>>>
>>>> However, *most* packages support Python 3 as well.
>>>>
>>>> So, the idea is to default to Python 3 for the host. In other words, all host
>>>> packages will use Python 3 (independent of what is going on the target), except
>>>> for the packages that work on python2 only. This step by itself is quite a bit
>>>> of work because there are many packages that can use python2 OR python3.
>>>>
>>>> This leaves us with two problems.
>>>>
>>>> First of all, there may be python-2-only host packages that depend on some
>>>> other host-python package that would only get built for python3. We investigated
>>>> that, and it looks OK: there are only 4 python-2-only host packages: gdb,
>>>> python-cheetah, python-enum34, and python-yieldfrom. The latter two are
>>>> compatibility libraries so obviously only available on Python2. python-yieldfrom
>>>> is not used at all. python-enum34 is only used by setools, in case it needs to
>>>> be built for host-python2, so that should be OK. host-python-cheetah is only
>>>> used by gr-osmosdr; bumping python-cheetah probably enables it for Python 3 so
>>>> would solve that issue. And gdb doesn't need any other python package, just
>>>> python itself. So all this looks fixable.
>>>>
>>>> The bigger problem, is when a setup.py script tries to import a module from
>>>> some python package. The clearest one of those is python-setuptools: any python
>>>> package that uses setuptools will import setuptools using the same host-python
>>>> version as on the target. So when you have python2 on the target, the setup.py
>>>> script will be run in python2, so we need host-python-setuptools for python2.
>>>> The solution there, we think, is to add a separate host-python2-setuptools
>>>> package that is used instead of host-python-setuptools in case the target is
>>>> python2. Unfortunately there are quite a few others that may need the same
>>>> treatment. Some of them, however, probably don't really need to be imported in
>>>> the setup.py script so they can be removed as a dependency. Others, however,
>>>> will need the same treatment. In some cases, we might be able to just build both
>>>> python2 and python3 versions (e.g. for python-sip this should be possible).
>>>>
>>>> Finally, there are most likely some corner cases that we didn't think of...
>>>>
>>>> So it looks like this will be a pretty big migration. Therefore, for the time
>>>> being, it may be easier to just add a host-python3-setuptools package and use
>>>> that in meson.
>>>>
>>>> By the way, lirc-tools has the same problem. It adds python3
>>>> host-python-setuptools to its dependencies, but the setuptools don't get
>>>> imported so it just doesn't work (I think). Baruch, care to take a look at that?
>>>
>>> I'm not that much of a Python expert so I might be missing something
>>> here.
>>>
>>> The python-pkg/setup.py file in the lirc-tools source tree have this:
>>>
>>> from setuptools import setup, Extension
>>>
>>> A build test with python3 enabled installs lirc python and binary code
>>> under /usr/lib/python3.7/site-packages/lirc in the target.
>>>
>>> So what is it that "doesn't work"? Please enlighten me.
>>
>> In the case of meson python3 is enabled for it AND python2 for ninja (via meson
>> dependency), in this case the host-setuptools are build/installed only for python2
>> and the meson build fails...
> 
> So mason needs host-python3 (via HOST_MESON_NEEDS_HOST_PYTHON), but
> since BR2_PACKAGE_PYTHON3 is disabled, ninja drags in host-python as
> well. Is that correct?

 Correct. For the host python we have:

- if target python3 is enabled, we build host-python3 and all host python
packages are generated for python3;

- in any other case (i.e. whether or not target python is enabled), we build
host-python and all host python packages are generated for python2.

 So, any host package that tries to run its setup.py script which python3 will
fail if target python3 is not selected.


> I tried to reproduce something similar with BR2_PACKAGE_PYTHON3 enabled
> using this config:
> 
> BR2_aarch64=y
> BR2_cortex_a72=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_LIRC_TOOLS=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_MONGODB=y
> 
> mongodb depends on host-scons that makes host-python enabled in addition
> to host-python3 for target python3. Yet the build of 'mongodb
> lirc-tools' targets succeeds, with the expected files in the lirc python
> package on target.

 Here you have enabled target python3, so all is well. The meson case will also
work if you do have target python3 selected BTW.

 So indeed, lirc-tools will not have a problem, because the dependency on
setuptools is only there if python3 is enabled.

 Regards,
 Arnout
