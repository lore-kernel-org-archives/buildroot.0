From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 15 Sep 2015 11:03:35 +1200
Subject: [Buildroot] [PATCH] micropython: new package
In-Reply-To: <55F6D5C5.9090504@imgtec.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <20150914155829.1d326cc0@free-electrons.com>
 <55F6D5C5.9090504@imgtec.com>
Message-ID: <CAFOYHZAWy7NpB2eXw20RmRaw6j3ySvxeWf9n6mhKrGL_9jhdfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 15, 2015 at 2:12 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Dear Thomas Petazzoni,
>
> On 09/14/2015 02:58 PM, Thomas Petazzoni wrote:
>> Chris,
>>
>> Thanks for this contribution.
>>
>> On Mon, 14 Sep 2015 22:21:42 +1200, Chris Packham wrote:
>>> MicroPython - a lean and efficient Python implementation for
>>> microcontrollers and constrained systems.
>>>
>>> Signed-off-by: Chris Packham <judge.packham@gmail.com>
>>> ---
>>>
>>> Hi Buildroot,
>>>
>>> Thought you might be interested in mircopython a minimal python 3
>>> implementation. It's designed for micro controllers but is also well suited
>>> to other general purpose embedded CPUs.
>>
>> Some quick questions that come to mind:
>>
>>  * What happens if we have Micropython installed next to the regular
>>    Python 2 or Python 3 interpreters / standard library on the same
>>    system? Do they conflict or not?
>
> It shouldn't conflict as micropython installs the library files under
> /usr/lib/micropython/ directory. And the installed binaries are
> /usr/local/bin/{pip-}micropython. Perhaps this should be changed to
> install them in /usr instead of /usr/local.

The local part seems hard-coded to me. But we could always sed it on
the way through.

>
> Regards,
>
> Vincent.
>
>>  * What about all the Python external modules (package/python-*/) we
>>    have in Buildroot? Do they work with Micropython?
>>
>>> diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
>>> new file mode 100644
>>> index 0000000..a7e017b
>>> --- /dev/null
>>> +++ b/package/micropython-lib/Config.in
>>> @@ -0,0 +1,7 @@
>>> +config BR2_PACKAGE_MICROPYTHON_LIB
>>> +    bool "micropython-lib"
>>> +    depends on BR2_PACKAGE_MICROPYTHON
>>> +    help
>>> +      Core Python libraries ported to MicroPython.
>>> +
>>> +      http://micropython.org
>>> diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
>>> new file mode 100644
>>> index 0000000..c0e6a2a
>>> --- /dev/null
>>> +++ b/package/micropython-lib/micropython-lib.mk
>>> @@ -0,0 +1,12 @@
>>> +################################################################################
>>> +# micropython-lib
>>> +################################################################################
>>
>> Nitpick: use the standard header for all packages. You lack an empty
>> line before and after the package name. See all other Buildroot
>> packages. Ditto for the micropython package.
>>
>>> +MICROPYTHON_LIB_VERSION = v0.5
>>> +MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
>>> +MICROPYTHON_LIB_LICENSE_FILES = LICENSE
>>
>> You should define MICROPYTHON_LIB_LICENSE as well.
>>
>> Thomas
>>
