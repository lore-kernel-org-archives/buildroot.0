From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Thu, 1 May 2014 11:58:34 -0500
Subject: [Buildroot] uboot.pbl - make 'include' issue
In-Reply-To: <20140430230240.GH3336@free.fr>
References: <OFB2294D5B.F4E5AC38-ON86257CCA.00752EA9-86257CCA.00753202@rockwellcollins.com>
 <20140430223910.GF3336@free.fr> <20140501004716.5a27705a@skate>
 <20140430230240.GH3336@free.fr>
Message-ID: <OFD34F41A7.5039430E-ON86257CCB.005A97CF-86257CCB.005D3D34@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas, All,

"Yann E. MORIN" <yann.morin.1998@gmail.com> wrote on 04/30/2014 06:02:40 
PM:

> Thomas, Ryan, All,
> 
> On 2014-05-01 00:47 +0200, Thomas Petazzoni spake thusly:
>> Dear Yann E. MORIN,
>> 
>> On Thu, 1 May 2014 00:39:10 +0200, Yann E. MORIN wrote:
>> 
>>> Yes, that's not so surprising:
>>> 
>>>   - the $(eval $(generic-package)) use the $(pkgname) macro, which 
uses
>>>     the $(pkgdir) macro
>>> 
>>>   - the $(pkgdir) macro is defined as thus:
>>>         pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
>>> 
>>>   - and $(MAKEFILE_LIST) contains the _last_ Makefile that was parsed
>>> 
>>>   - but the pkg-inra expects that the last Makefile parsed be the
>>>     current Makefile
>>> 
>>> Since you include other Makefiles from uboot.mk:
>>>     boot/uboot/ppc-freescale/uboot-ppc-freescale.mk
>>> 
>>> then $(MAKEFILE_LIST) will end up with that when you call the usual 
eval
>>> above, from which the generic-package derives the $(pkgdir) to be
>>> "boot/uboot/ppc-freescale", and thus the $(pkgname) to be
>>> "ppc-freescale", and not the "uboot" you expect.

Yann - thank you for this explanation as was trying to figure out how 
MAKEFILE_LIST and all the includes were relating. When you run "make 
--debug" and all of the includes are printed it is very difficult to get a 
grasp of what is going on. I didn't realize that the targets were 
"ppc-freescale" and not "uboot".

>> I haven't looked at the details, but linux/linux.mk seems to be doing
>> the exact same thing with the "Linux extensions" for real-time, and
>> doesn't appear to have any problem. It does:
>> 
>> include $(sort $(wildcard linux/linux-ext-*.mk))
>> 
>> $(eval $(generic-package))
>> 
>> So by the time generic-package is expanded, the last included makefile
>> is not linux.mk. And still the thing works.
> 
> Indeed, but the includes are all in the same directory, so pkgdir still
> return "linux" and thus the pkgname is correct.
> 
> In Ryan's case, the included Makefiles are in sub-dirs of uboot, so
> pkgdir returns that last sub-dir, hence the wrong pkgname.

Based on this bit of information, I am going to rework the patch so that 
the names of the processor architectures are as follows:

boot/uboot/uboot.mk.<platform>
boot/uboot/Config.in.<platform>

Naming the files this way will get around the issues described above along 
with identified in the patch. I should be sending the first version of the 
patches later today to the mailing list.

Thanks again for the help,
-Ryan

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140501/9f810e84/attachment.html>
