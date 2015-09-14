From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 16:09:45 +0100
Subject: [Buildroot] [PATCH] gettext: add dependency on host-libxml2 for
 host-gettext.
In-Reply-To: <20150224222402.GD4783@free.fr>
References: <20150220222933.5B92D817C4@busybox.osuosl.org>
 <1424696593-21361-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150223191721.573fdb19@free-electrons.com> <20150224222402.GD4783@free.fr>
Message-ID: <55F6E339.90805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 02/24/2015 10:24 PM, Yann E. MORIN wrote:
> Thomas, Nicolas, All,
> 
> On 2015-02-23 19:17 +0100, Thomas Petazzoni spake thusly:
>> On Mon, 23 Feb 2015 14:03:13 +0100, Nicolas Cavallari wrote:
>>> From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
>>>
>>> Otherwise, the locally-installed libxml2 will be used, which may
>>> depend on a locally-installed liblzma which may create conflict
>>> if host-liblzma is compiled.
>>>
>>> Fixes https://bugs.busybox.net/show_bug.cgi?id=7886
>>>
>>> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
>>> [nicolas: added extended commit message]
>>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>>> ---
>>> Ignacy is unavailable this week, but he commited this change to our
>>> local tree before leaving.
>>>
>>> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
>>> index c2419c1..a554517 100644
>>> --- a/package/gettext/gettext.mk
>>> +++ b/package/gettext/gettext.mk
>>> @@ -12,7 +12,7 @@ GETTEXT_LICENSE = GPLv2+
>>>  GETTEXT_LICENSE_FILES = COPYING
>>>  
>>>  GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>>> -HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
>>> +HOST_GETTEXT_DEPENDENCIES = host-libxml2 # we don't want the libiconv dependency
>>
>> I agree that we normally prefer to rely on external libraries, rather
>> than built-in copies. However, in this case, I am wondering if we
>> shouldn't rather rely on the built-in copy, which is more lightweight
>> that building host-libxml2.
>>
>> From the DEPENDENCIES file of gettext:
>>
>> * libxml2
>>   + Optional.
>>     Needed for the --color option of the various programs.
>>     If not present, a subset of libxml2 (included in this package) will be
>>     compiled into libgettextlib.
>>   + Homepage:
>>     http://xmlsoft.org/
>>   + Download:
>>     ftp://xmlsoft.org/libxml2/
>>   + If it is installed in a nonstandard directory, pass the option
>>     --with-libxml2-prefix=DIR to 'configure'.
>>
>> So instead of building an external libxml2, we can pass
>> --with-included-libxml to the gettext-tools configure script to force
>> it to use the built-in libxml2 subset.
>>
>> Note that there are several other libraries in the same situation:
>> glib2, libcroco and libunistring.
>>
>> What is the opinion of other BR developers about this?
> 
> On my machine, host-libxml2 takes about 0m53.693s while host-gettext
> takes about 2m34.112s. So the overhead (~20%-pf-gettext)) is not
> negligible...
> 
> I am compeltely undecided on that... Do we consider a ~20%-of-gettext
> overhead for a full build to be important or not?
> 
>> And all that just for a --color command line option that we really
>> don't care about. Why the heck isn't this thing optional in the first place?
> 
> Eh... Upstream... ;-)

Given the following reasons:

- The difference of build time caused by using host-libxml2 is not that
much, as Yann said.

- We normally prefer to rely on external libraries

- Other packages could benefit on having host-libxml2 already built.
Otherwise we could end up with building libxml2 twice, the one bundled
in gettext and the external one.

I vote for using the host-libxml2 package instead of the bundled libxml2.

Regards,

Vincent.

> Regards,
> Yann E. MORIN.
> 
