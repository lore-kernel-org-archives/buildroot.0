From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 26 Jul 2018 00:21:34 -0300
Subject: [Buildroot] [PATCH 1/1] check-package: fix Python3 support
References: <b80932b6-1dcb-e769-26cc-55e6ab148f1b@mind.be>
Message-ID: <5b593e3ef1eb9_5b462ac51cc29780237b0@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for your review.
I don't usually write Python3 code, and I still beginning to use modernize.
Sorry I did the newbie mistake of trusting too much in the defaults of the tool.

On Tue, Jul 24, 2018 at 05:54 AM, Arnout Vandecappelle wrote:

> On 23-07-18 02:41, Ricardo Martincoski wrote:
>> This script currently uses "/usr/bin/env python" as shebang but it does
>> not really support Python3. Instead of limiting the script to Python2,
>> fix it to support both versions.
>> 
>> Do this by first using an automated tool:
>> $ python -m modernize -w -p <files>
> 
>  In general (if it doesn't break things), I prefer to do the automatic stuff in
> a separate patch from the manual stuff. That makes review easier (because for
> the automatic stuff, you mainly review the automation itself rather than the
> result).

OK. In this case things are already broken. The automatic stuff would unbreak
99% of them, and the manual stuff would unbreak the remaining 1%. So separate
patches makes sense.
I will not use the tool for the new iteration, but I will keep in mind for
future patch series.

> 
>> and then manually fixing what remains:
>>  - keep the imports in alphabetical order;
>>  - fix handling of files that cannot be decoded by 'utf-8' codec, such
>>    as package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch .
>> 
>> In order to avoid errors when decoding files, use
>> errors="surrogateescape" when opening files, the docs for open() states:
>> "This is useful for processing files in an unknown encoding.".
>> This argument is not compatible with Python2 open() so import 'six' to
>> use it only when running in Python3.
> 
>  I would prefer to open files with "rb" instead. However, that's a much bigger
> change because all checks should then use bytes objects instead of strings.

Indeed it would change all functions in the lib*.py files.
It seems to me it's not worth the effort in this case. All functions are there
to check text files. The only case we can have non-ascii/non-utf-8 files being
checked by the script are for patch files when the file to be patched is not
ascii or utf-8. We have currently one case in the tree right now.

[snip]
>> +++ b/utils/check-package
>> @@ -1,11 +1,13 @@
>>  #!/usr/bin/env python
>>  # See utils/checkpackagelib/readme.txt before editing this file.
>>  
>> +from __future__ import absolute_import
> 
>  This doesn't make sense in a top-level script, does it?

I am not sure in the general sense. I am still trying to understand what it
really does. It's not easy to get a docker with Python 2.5 to test (the official
docker images from python start from 2.7). I will probably fallback to setup a
VM.

But it is certainly not needed here. It was a result from the automatic stuff.
I will remove it. Actually from everywhere.

[snip]
>> +++ b/utils/checkpackagelib/lib.py
>> @@ -1,6 +1,7 @@
>>  # See utils/checkpackagelib/readme.txt before editing this file.
>>  
>> -from base import _CheckFunction
>> +from __future__ import absolute_import
>> +from .base import _CheckFunction
> 
>  Why is this changed? Will Python3 look for base anywhere else than in the
> checkpackagelib directory?

Python3 follows PEP328 and dropped implicit relative imports.

But maybe a better approach is to use the absolute import:
from checkpackagelib.base import _CheckFunction

I will do this, everywhere, if you agree.

> 
>  Same below.
> 
[snip]
>> @@ -45,7 +46,7 @@ class AttributesOrder(_CheckFunction):
>>          if attribute in entries_that_should_not_be_indented:
>>              self.state = 0
>>              return
>> -        if attribute not in self.attributes_order_convention.keys():
>> +        if attribute not in list(self.attributes_order_convention.keys()):
> 
>  Why is this needed? 'not in' works on an iterator, doesn't it?

You are right. It does work. It seems modernize adds it always, when it is
needed (when a index will be used in the result for example) and when it is not
needed.

So I probably won't use the 'hash' transformation from modernize anymore, it is
enabled by default.

> 
>  Same below.
> 
>  Bottom line: I don't think modernize does anything useful.

For this script I must agree.

Good examples (not applicable to this script) seem to be the conversion of
print, exception, and urllib2.


Regards,
Ricardo
