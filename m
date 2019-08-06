From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 6 Aug 2019 09:32:43 +0000
Subject: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <42e755da-8fcc-2a34-d304-ea7489261203@mind.be>
References: <20190801210920.31338-1-romain.naour@smile.fr>
 <20190801210920.31338-4-romain.naour@smile.fr>
 <46a14660-516e-46e4-3ecf-5f43b422a5d8@mind.be>
 <CY4PR1201MB01208D2F8FAD71EE9FDA8754A1D80@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <799fbe91-2db8-b771-3de8-4e777a62965e@mind.be>
 <CY4PR1201MB0120523CE90081F3CCB3B66DA1D80@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <42e755da-8fcc-2a34-d304-ea7489261203@mind.be>
Message-ID: <CY4PR1201MB0120F9CD0735F8A2C1FD48CAA1D50@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Saturday, August 3, 2019 5:12 PM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>; Alexandre PAYEN
> <alexandre.payen@smile.fr>; Damien DUVAL <damien.duval@smile.fr>; Evgeniy Didin <didin@synopsys.com>;
> Fabrice Fontaine <fontaine.fabrice@gmail.com>; Romain Naour <romain.naour@smile.fr>;
> buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if fenv.h is not provided by
> libc
> 
> 
> 
> On 03/08/2019 14:49, Alexey Brodkin wrote:
> > Hi Arnout,
> >
> >> -----Original Message-----
> >> From: Arnout Vandecappelle <arnout@mind.be>
> >> Sent: Saturday, August 3, 2019 3:25 PM
> >> To: Alexey Brodkin <abrodkin@synopsys.com>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>; Alexandre PAYEN
> >> <alexandre.payen@smile.fr>; Damien DUVAL <damien.duval@smile.fr>; Evgeniy Didin
> <didin@synopsys.com>;
> >> Fabrice Fontaine <fontaine.fabrice@gmail.com>; Romain Naour <romain.naour@smile.fr>;
> >> buildroot at buildroot.org
> >> Subject: Re: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if fenv.h is not provided
> by
> >> libc
> >>
> >>
> >>
> >> On 03/08/2019 12:48, Alexey Brodkin wrote:
> >>> Hi Arnout,
> >>>
> >>>>  Since Alexey indicated that this is not needed any longer, I removed that part
> >>>> and applied to master, thanks.
> >>>>
> >>>>  Alexey, could you do a runtime test (based on the one submitted by Romain) for
> >>>> ARC to be sure? You'll need a qemu for ARC for that, obviously, which is why I'm
> >>>> asking you instead of doing it myself :-)
> >>>
> >>> Any hint on why QEMU is in the question?
> >>> I.e. is there any framework or test-suite that require QEMU?
> >>
> >>  Yes, the Buildroot runtime tests in support/testing use qemu.
> >
> > That's cool, though I haven't tried that yet so may I ask what do I
> > need to run for testing numpy in particular?
> 
>  Specifically for numpy, there is no runtime test yet - Romain submitted a patch
> [1] but it needs a new iteration.
> 
>  But I realise now that in your case the runtime testing infra isn't that useful
> since you anyway need to change the test completely to get the right arch and
> kernel. So yes, by all means, test it on the board :-)
> 
>  You just need to add this to the config:
> 
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_NUMPY=y
> 
>  And run this in Python:
> 
> import numpy as np
> list = [1,2,3,4]
> arr = np.array(list)
> print (arr)

It works perfectly fine:
------------------------------>8---------------------------------
# python
Python 3.7.4 (default, Aug  6 2019, 12:07:44)
[GCC 8.3.1 20190225] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import numpy as np
>>> list = [1,2,3,4]
>>>
>>> arr = np.array(list)
>>> print (arr)
[1 2 3 4]
>>>

# uname -a
Linux buildroot 5.2.5 #2 PREEMPT Tue Aug 6 12:10:30 MSK 2019 arc GNU/Linux
------------------------------>8---------------------------------

-Alexey
