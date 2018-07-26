From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 10:05:52 +0200
Subject: [Buildroot] [PATCH 1/1] check-package: fix Python3 support
In-Reply-To: <5b593e3ef1eb9_5b462ac51cc29780237b0@ultri5.mail>
References: <b80932b6-1dcb-e769-26cc-55e6ab148f1b@mind.be>
 <5b593e3ef1eb9_5b462ac51cc29780237b0@ultri5.mail>
Message-ID: <12691bc4-c78a-fd93-14b0-973c96b8bd0a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-18 05:21, Ricardo Martincoski wrote:
> Hello,
> 
> Thank you for your review.
> I don't usually write Python3 code, and I still beginning to use modernize.
> Sorry I did the newbie mistake of trusting too much in the defaults of the tool.
> 
> On Tue, Jul 24, 2018 at 05:54 AM, Arnout Vandecappelle wrote:
> 
>> On 23-07-18 02:41, Ricardo Martincoski wrote:
[snip]
>>> +from __future__ import absolute_import
>>
>>  This doesn't make sense in a top-level script, does it?
> 
> I am not sure in the general sense. I am still trying to understand what it
> really does. 

 So am I. As I understand it, in modern Python, for scripts that are part of a
package, the import path is relative to the top level of the package rather than
the directory of the module itself. For scripts outside of a package, nothing
has changed AFAIK.

> It's not easy to get a docker with Python 2.5 to test (the official
> docker images from python start from 2.7).

 Since we're targetting RedHat 6 here, Python 2.6 should be sufficient, no?

> I will probably fallback to setup a VM.
> 
> But it is certainly not needed here. It was a result from the automatic stuff.
> I will remove it. Actually from everywhere.
> 
> [snip]
>>> +++ b/utils/checkpackagelib/lib.py
>>> @@ -1,6 +1,7 @@
>>>  # See utils/checkpackagelib/readme.txt before editing this file.
>>>  
>>> -from base import _CheckFunction
>>> +from __future__ import absolute_import
>>> +from .base import _CheckFunction
>>
>>  Why is this changed? Will Python3 look for base anywhere else than in the
>> checkpackagelib directory?
> 
> Python3 follows PEP328 and dropped implicit relative imports.
> 
> But maybe a better approach is to use the absolute import:
> from checkpackagelib.base import _CheckFunction
> 
> I will do this, everywhere, if you agree.

 Yes, the .xxx approach only makes sense in cases where you want a module in the
package be callable directly as a script.

[snip]
> Good examples (not applicable to this script) seem to be the conversion of
> print, exception, and urllib2.

 print() was already handled before. We're lacking tests of python3 compliance
of this script to make sure there are no regression. Heck, we're lacking tests
of this script, period.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
