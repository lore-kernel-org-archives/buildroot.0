From: Andreas Ehmanns <universeii@gmx.de>
Date: Tue, 25 Aug 2015 21:28:54 +0200
Subject: [Buildroot] Add missing config to RPM target package
In-Reply-To: <20150823200604.0c1e00cb@free-electrons.com>
References: <55D70AF3.3050604@gmx.de>
 <20150823200604.0c1e00cb@free-electrons.com>
Message-ID: <55DCC1F6.4060008@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
in my first try I had no pcre support, so rpm package was built with 
--with-pcre=none
Trying to install a binary rpm just containing one file on my target 
system failed at the very beginning when rpm was checking package 
dependencies. Setting --with-pcre=internal solved this problem. So it 
seems to me that pcre is necessary to to dependency checks which is in 
my opinion one of the main features or rpm. Isn't it?

Arnout mentioned that he wants to change from rpm5 to rpm and this will 
solve my problem too.
So let me know what you think and if I shall send the patch again (now 
in the right format) or not.

Regards,
Andreas


Am 23.08.2015 um 20:06 schrieb Thomas Petazzoni:
> Andreas,
>
> On Fri, 21 Aug 2015 13:26:43 +0200, universe II wrote:
>
>> building the RPM package for my remote target I found a misconfiguration
>> of the .mk file.
>> If the regular expression package pcre is enabled in buildroot, rpm will
>> use it. If not, nothing will be used and regular expression are not
>> available, making rpm unusable. But rpm has the ability to use an
>> internal pcre implementation if the external lib is not available. This
>> needs to be correctly activated before building and then rpm works fine
>> on the target. See the attached patch for more details.
> We generally don't want to use the internal copy of libraries, and
> prefer to use the system-provided library when possible, which is what
> is done here.
>
> So there are really two cases:
>
>   1 Either the regexp support in RPM is absolutely mandatory for RPM to
>     be useful. If this is the case, then just make the pcre dependency a
>     mandatory one, and always pass --with-pcre=external.
>
>   2 Or the regexp support in RPM is really optional, and useful only in
>     certain situations. If this is the case, then what is done today is
>     correct, and you should simply enable the pcre library.
>
> Consequently, I've marked your patch as Rejected in our patch tracking
> system. Do not hesitate to follow up with a different patch if we are
> in case (1) above.
>
> Thanks a lot!
>
> Thomas
