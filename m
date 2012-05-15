From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 16 May 2012 00:01:57 +0200
Subject: [Buildroot] [PATCH v2 1/2] dependencies: build a host python2
 if no suitable one can be found
In-Reply-To: <4FB2CE05.9030208@mind.be>
References: <4FAD8F82.6010007@mind.be>
 <1336905822-10021-1-git-send-email-s.martin49@gmail.com>
 <4FB2CE05.9030208@mind.be>
Message-ID: <CAHXCMMJm6VKARNOJyNoE8D2XFhpiCB5nw6F+ob+7CFGQW+x90Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/5/15 Arnout Vandecappelle <arnout@mind.be>:
> On 05/13/12 12:43, Samuel Martin wrote:
>>
>> diff --git a/support/dependencies/check-host-python2.mk
>> b/support/dependencies/check-host-python2.mk
>> new file mode 100644
>> index 0000000..79197cb
>> --- /dev/null
>> +++ b/support/dependencies/check-host-python2.mk
>> @@ -0,0 +1,7 @@
>> +PYTHON2 := $(call suitable-host-package,python2)
>> +NEED_PYTHON2 :=
>
>
> ?This can be removed, empty is the default.
Fair enough

>
>
>> +
>> +ifeq (,$(PYTHON2))
>> + ?NEED_PYTHON2 = host-python
>> + ?PYTHON2 = $(HOST_DIR)/usr/bin/python
>> +endif
>
>
> ?Does this work? ?I thought it wasn't allowed to mix := and = assignments.
In my test runs, it does, though I can get rid of the immediat
assignment I think.

>
>
>> diff --git a/support/dependencies/check-host-python2.sh
>> b/support/dependencies/check-host-python2.sh
>> new file mode 100755
>> index 0000000..6adb328
>> --- /dev/null
>> +++ b/support/dependencies/check-host-python2.sh
>> @@ -0,0 +1,13 @@
>> +#!/bin/sh
>> +
>> +candidates="python python2"
>> +
>> +for candidate in ${candidates} ; do
>> + ?which ${candidate}&>/dev/null || continue
>> + ?# restrict version of python2 to 2.6 or 2.7
>> + ?if ${candidate} --version 2>&1 | grep -qE 'Python 2\.[6-7]*' ; then
>
>
> ?The * is a mistake, I think. ?This way, 2.5 also matches (zero
> repetitions).
You're right, .* will fix that.

> The -E is also a redundant since you're not using extended regexp.
ok


Cheers,

Sam
