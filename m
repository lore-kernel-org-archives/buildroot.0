From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jul 2018 12:10:47 +0200
Subject: [Buildroot] [PATCH] package/squid: fix automake breakage
In-Reply-To: <1273785525.10287869.1531419841244.JavaMail.zimbra@savoirfairelinux.com>
References: <20180711193452.19461-1-jean-francois.tetu@savoirfairelinux.com>
 <e8dab288-fa61-b67f-a37a-d5f59023ad44@mind.be>
 <1471196708.10077896.1531356443377.JavaMail.zimbra@savoirfairelinux.com>
 <1273785525.10287869.1531419841244.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <9182911e-9411-dca6-d9ce-04de0b9f3965@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-07-18 20:24, Jean-Fran?ois T?tu wrote:
> Hello Arnout,
> 
> On Wednesday, July 11, 2018 8:47:23 PM, Jean-Fran?ois T?tu wrote:
>> Hello!
>>
>> On Wednesday, July 11, 2018 5:08:13 PM, Arnout Vandecappelle wrote:
>>> On 11-07-18 21:34, Jean-Fran?ois T?tu wrote:
>>>> Much like e27ccbabc1, the recent bump in automake causes a build error.
>>>> If the host automake is not the same version as the one used to generate
>>>> the squid package, the build fails while building the copy of libltdl
>>>> included in the package.
>>>>
>>>> This happens regardless of the Buildroot automake version since the
>>>> included library is not reconfigured properly. The previous fix set the
>>>> ACLOCAL and AUTOMAKE variables to the Buildroot generated aclocal and
>>>> automake thereby ensuring that the subpackage would build correctly.
>>>> What is needed is to make sure that both the squid configure script and
>>>> the libltdl configure script are reconfigured following a change to
>>>> either configure.ac files.
>>>>
>>>> This commit adds an option passed to autoreconf which ensures both
>>>> configure scripts are regenerated with Buildroot's autotools.
>>>
>>> Nicely found!
>>>
>>
>> Thanks :)
>>
>>> However, have you also looked into the option of using Buildroot's libtool
>>> instead of the bundled libltdl? If that doesn't work for some reason, I'd like
>>> to add it in the commit log so a future developer who wants to give it go can
>>> see what has been tried already.
>>>
>>
>> I can look into how we could pull in Buildroot's libltdl because
>> currently, Squid relies on its bootstrap script to pull in libtldl from
>> the machine that is generating the package. Maybe this could be done
>> with the autotools instead of the bootstrap?
>>
> 
> From what I understand, the packaged libltdl in Squid comes from its
> bootstrap.

 We probably don't want to use the bootstrap script :-)

 What I meant was: make squid depend on libtool (target libtool, not host
libtool), and remove libltdl from SUBDIRS in Makefile.am. Probably something
goes wrong somewhere on the way, so that would have to be fixed as well.

 Regards,
 Arnout

> This pulls in libltdl from the host's libtool during the
> libtoolize step.  Currently, the latest version of libtool is 2.4.6.
> This version was itself created using automake 1.15. Ultimately, this
> means that the included libltdl in Squid is made to be built with
> automake 1.15. Unless its forcibly reconf'd with automake 1.16.1.
> 
> To fix this issue would require a version of libtool made with automake
> 1.16.1.  This version currently does not exist as the latest version of
> libtool dates back from 2015-02-15, just after the release of automake 
> 1.15 on 2015-01-05.
> 
> In order to build Squid in a sustainable manner, the autoreconf flags
> are needed, at least until libtool is bumped.
> 
> Would you like me to add a note reflecting this in the commitmsg?
> 
> Regards,
> 
> --
> Jean-Fran?ois T?tu
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
