From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 30 Apr 2014 16:20:14 -0500
Subject: [Buildroot] uboot.pbl - make 'include' issue
Message-ID: <OFB2294D5B.F4E5AC38-ON86257CCA.00752EA9-86257CCA.00753202@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have recently been working on trying to get support for the u-boot.pbl 
image format into buildroot. I submitted an initial patch set back in 
October and was given feedback to break out the boot/uboot/uboot.mk into 
processor specific architectures. Thomas Petazzoni and I did some initial 
work to split these out and he provide an example. I have been trying to 
take this work that he did and submit an updated patch set. However, I 
have hit a roadblock for which I can't seem to debug or figure out what is 
going wrong.

When I breakout defines and variables in boot/uboot/uboot.mk into separate 
files and add the following line:

include boot/uboot/*/*.mk

Once I add this to uboot.mk, the rules for uboot no longer work. Using any 
configuration, I can no longer do anything like this:

make uboot
make uboot-dirclean

Running the above yields the following error:

make[1]: *** No rule to make target `uboot'.  Stop.
make: *** [_all] Error 2

It seems that the include statement is affecting the $(eval 
$(generic-package)) call which generates the rules for uboot. However, I 
am able to copy the contents of both of my architecture specific changes 
verbatim into uboot.mk and they will work (when I remove or comment out 
the include statement). This leads me to believe that I do not have a 
syntax issue with the files. I have found that linux/linux.mk does the 
same thing and it works which is why this is very confusing to me.

I have put my recent work on a github branch - the top 3 patches are 
modification that I have done to head. If anybody has suggestions on how 
to fix this issue, please let me know.

https://github.com/rjbarnet/buildroot/tree/uboot-pbl

My original patch submission can be found here:
http://patchwork.ozlabs.org/bundle/rjbarnet/uboot-pbl/?state=*

Feedback from Thomas Petazzoni:
http://lists.busybox.net/pipermail/buildroot/2013-December/084613.html

Thanks,
-Ryan
