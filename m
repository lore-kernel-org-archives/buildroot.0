From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 21:38:57 +0100
Subject: [Buildroot] [PATCH] kexec: fix build when BR2_STRIP_none=y
In-Reply-To: <87a8ce8g6c.fsf@dell.be.48ers.dk>
References: <1480679517-551-1-git-send-email-marcin.nowakowski@imgtec.com>
 <87a8ce8g6c.fsf@dell.be.48ers.dk>
Message-ID: <20161202213857.673e4b97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 02 Dec 2016 17:11:07 +0100, Peter Korsgaard wrote:

>  > When BR2_STRIP is set to none, a dummy 'true' app is used instead of
>  > strip utility. However, kexec package always requires a real strip
>  > executable as it is used to generate intermediate files during the build
>  > process.  
> 
>  > If 'true' is used the build system runs the following command:  
> 
>  > true --strip-debug -o purgatory/purgatory.ro purgatory/purgatory.ro.sym  
> 
>  > which obviously doesn't do anything useful and the build later fails
>  > with:  
> 
>  > bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
>  > /bin/sh: purgatory/purgatory.ro: No such file or directory
>  > kexec/Makefile:7: recipe for target 'kexec/purgatory.c' failed
>  > make[2]: *** [kexec/purgatory.c] Error 1  
> 
>  > To resolve it always specify STRIP=$(CROSS_COMPILE)strip, regardless of
>  > buildroot configuration.  
> 
> My first thought was that we shouldn't strip when the user has selected
> not to do so, but as it leaves the unstripped variant around I guess it
> is OK.

My other thought is that I believe it's not the first time (see commit
fc174b7057495ebb31393ae27f3ceeefdc490022), so perhaps our idea of
having STRIP=true when BR2_STRIP_none=y is a bad idea, and we should
handle this in a different way.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
