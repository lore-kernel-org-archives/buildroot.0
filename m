From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Apr 2016 12:48:00 +0200
Subject: [Buildroot] [PATCH] python-backports-ssl-match-hostname: new
	package
In-Reply-To: <57195CFA.8060005@mind.be>
References: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
 <57192BD1.8090409@mind.be>
 <CAGm1_kuBn=tsBbb-BAczkdctQ=ecsZROyRJgJgBPHcWxJkfqJA@mail.gmail.com>
 <57195CFA.8060005@mind.be>
Message-ID: <CAGm1_kuVRwS0dFNvHSR2FhKoESyi02ddK9Wkz_fCx6fv=DZzzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 22, 2016 at 1:06 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 04/21/16 23:18, Yegor Yefremov wrote:
>>
>> On Thu, Apr 21, 2016 at 9:36 PM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
>>>
>>> On 04/20/16 11:22, yegorslists at googlemail.com wrote:
>>>>
>>>>
>>>> From: Yegor Yefremov<yegorslists@googlemail.com>
>>>>
>>>> Fixes #8856
>>>>
>>>> Signed-off-by: Yegor Yefremov<yegorslists@googlemail.com>
>>>> ---
>>>>    package/Config.in                                          |  1 +
>>>>    package/python-backports-ssl-match-hostname/Config.in      |  6
>>>> ++++++
>>>>    .../python-backports-ssl-match-hostname.hash               |  4 ++++
>>>>    .../python-backports-ssl-match-hostname.mk                 | 14
>>>> ++++++++++++++
>>>>    4 files changed, 25 insertions(+)
>>>>    create mode 100644
>>>> package/python-backports-ssl-match-hostname/Config.in
>>>>    create mode 100644
>>>>
>>>> package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
>>>>    create mode 100644
>>>>
>>>> package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
>>>>
>>>> diff --git a/package/Config.in b/package/Config.in
>>>> index ecaf164..3b5e66e 100644
>>>> --- a/package/Config.in
>>>> +++ b/package/Config.in
>>>> @@ -630,6 +630,7 @@ menu "External python modules"
>>>>          source "package/python-alsaaudio/Config.in"
>>>>          source "package/python-autobahn/Config.in"
>>>>          source "package/python-backports-abc/Config.in"
>>>> +       source "package/python-backports-ssl-match-hostname/Config.in"
>>>>          source "package/python-beautifulsoup4/Config.in"
>>>>          source "package/python-bottle/Config.in"
>>>>          source "package/python-can/Config.in"
>>>> diff --git a/package/python-backports-ssl-match-hostname/Config.in
>>>> b/package/python-backports-ssl-match-hostname/Config.in
>>>> new file mode 100644
>>>> index 0000000..36399bb
>>>> --- /dev/null
>>>> +++ b/package/python-backports-ssl-match-hostname/Config.in
>>>> @@ -0,0 +1,6 @@
>>>> +config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
>>>> +       bool "python-backports-ssl-match-hostname"
>>>
>>>
>>>
>>>   Smell likes this should
>>>          depends on BR2_PACKAGE_PYTHON
>>> no? Doesn't make much sense to backport this function to Python 3.6 :-)
>>
>>
>> No. We still have Python 3.4.x
>
>
>  Oh, I thought Thomas bumped it... Looks like that patch hasn't been applied
> yet.
>
>  Regards,
>  Arnout
>
>>
>> The most interesting goody about about 3.5 ssl-match-hostname is
>> support for IP addresses or something like this, that uses "import
>> ipaddress", so it would make sense to select this package for Python
>> 2.7.

I've installed circus myself and now I understand the problem. circusd
uses following code:

#!/usr/bin/python
# EASY-INSTALL-ENTRY-SCRIPT: 'circus==0.13.0','console_scripts','circusd'
__requires__ = 'circus==0.13.0'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('circus==0.13.0', 'console_scripts', 'circusd')()
    )

This code checks package requirements of all needed Python packages at
run-time. Tornado itself is working without backports.ssl-* package
(just enabling PYTHON SSH support is sufficient). In Python 3.4 there
are no problems, as backports.ssl-* is required only for Python < 3.2
(tornado's setup.py).

My suggestion is to enable
BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME for Python2 only and
enable both it and certify when selecting tornado. What do you think
about this?

Yegor
