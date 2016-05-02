From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 May 2016 21:45:06 +0200
Subject: [Buildroot] [PATCH] x264: needs mmu
In-Reply-To: <87eg9kqxmk.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 02 May 2016 17:37:39 +0200")
References: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
 <87inywqy9f.fsf@dell.be.48ers.dk> <572771B9.6080807@zacarias.com.ar>
 <87eg9kqxmk.fsf@dell.be.48ers.dk>
Message-ID: <8760uwqm65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
 >> On 02/05/16 12:23, Peter Korsgaard wrote:
 >>> Hmm, is that really generally true? I don't quite see why you cannot
 >>> have madvise() without mmu. Looking at uClibc-ng, the option enabling
 >>> madvise support doesn't depend on MMU support.

 >> I've based the rule on previous 80b9dfce, 5b309e1a and 8d446718
 >> scenarios and didn't investigate myself.

 > Ok - Thomas, do you know if madvise generally isn't available or if it
 > is something specific to the binary bfin toolchain?

 > I'll kick off a build with our new stm32f defconfig and look.

As expected, building stm32f429_disco_defconfig with x264 works:

arm-linux-nm staging/usr/lib/libc.a | egrep 'fork|madvise'
vfork.o:
00000000 T __GI_vfork
00000000 W vfork
00000000 T __vfork
madvise.o:
00000000 T madvise
posix_madvise.o:
00000000 T posix_madvise
         U __GI_vfork
00000000 T _fork_parent
         U __GI_vfork

So I'll change it to simply disable for that bfin toolchain instead.

-- 
Bye, Peter Korsgaard
