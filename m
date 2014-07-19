From: yuvaraj.patil at wipro.com <yuvaraj.patil@wipro.com>
Date: Sat, 19 Jul 2014 17:12:19 +0000
Subject: [Buildroot] [PATCH] quagga: Do not use fork on noMMU platforms
In-Reply-To: <20140718140358.2ff1bf5b@free-electrons.com>
References: <1405684663-3100-1-git-send-email-yuvaraj.patil@wipro.com>
 <20140718140358.2ff1bf5b@free-electrons.com>
Message-ID: <C89D20716E201D428CB114157FC1F4E380F18DF0@BLR-SJP-MBX-1.wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,



Thank you very much for your comments.



On Friday, July 18, 2014 5:34 PM, Thomas Petazzoni wrote:

>Patches for packages should be named:

>

>             <package>-<number>-<description>.patch.



I will follow this.



> Patches must have a description + Signed-off-by line.



I could see, Signed-off line is added in patch.

I used below command sequence (blue colour) to generate a patch.

#Diff to make a code patch

diff -Nurp <package_orig> <package> > <patch_name>.patch



#Move the diff generated patch to buildroot package directory



git add <patch name>.patch

                git commit -a -s

                #add the comment



git format-patch -1

                #edit the patch to add comments

                git send-email



Am I missing anything here? Please let me know so that I can take care for the next patch.





>We have already received numerous patches like this from ADI, and each time our answer was the same: please include in the patch description a justification of why the fork() call can be replaced by vfork(). I'm sure >you know that vfork() is not equivalent to fork() and that we cannot simply replace one by the other without checking carefully how

>fork() is used. With vfork(), the parent process is blocked until the child exits or calls exec(), and all changes made by the child will be visible by the parent. There are therefore many situations in which

>vfork() cannot be used as a replacement for fork().



Can you please provide us a reference example (or a sample patch) from other architectures, how the fork() issue is fixed?

Similar issue is reported for few other packages on Blackfin and a reference example will help me to fix this issue in a correct way.



Thanks

Yuvaraj Patil





-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Sent: Friday, July 18, 2014 5:34 PM
To: Yuvaraj Patil (WT01 - MFG & HITECH-HP-BANGALORE)
Cc: buildroot at busybox.net; adi-buildroot-devel at lists.sourceforge.net
Subject: Re: [PATCH] quagga: Do not use fork on noMMU platforms



Dear Yuvaraj Patil,



On Fri, 18 Jul 2014 17:27:43 +0530, Yuvaraj Patil wrote:

> fork() is not available in noMMU platforms, hence use vfork instead

>

> fixes:

> http://autobuild.buildroot.net/results/1c5/1c5fdfe3a0248b65efdea0594d8

> 367ff907015d4//

>

> Signed-off-by: Yuvaraj Patil <yuvaraj.patil at wipro.com<mailto:yuvaraj.patil@wipro.com>>

> ---

>  arch/Config.in              |    2 +-

>  package/quagga/quagga.patch |   28 ++++++++++++++++++++++++++++

>  2 files changed, 29 insertions(+), 1 deletion(-)  create mode 100644

> package/quagga/quagga.patch

>

> diff --git a/arch/Config.in b/arch/Config.in index 77fae7a..9cd85a5

> 100644

> --- a/arch/Config.in

> +++ b/arch/Config.in

> @@ -60,7 +60,7 @@ config BR2_avr32

>             # do the lack of upstream support in the major toolchain

>             # components. If you're interested by AVR32, contact the

>             # Buildroot community. Otherwise, its support will be removed

> -           # in 2014.11.

> +          # by the 2015.02 release.

>             depends on BR2_DEPRECATED_SINCE_2014_08

>             help

>               The AVR32 is a 32-bit RISC microprocessor architecture designed by



This chunk is not related to quagga, so it shouldn't be part of your patch.



> diff --git a/package/quagga/quagga.patch b/package/quagga/quagga.patch



Patches for packages should be named:



                <package>-<number>-<description>.patch.



See http://buildroot.org/downloads/manual/manual.html#patch-policy.



> new file mode 100644

> index 0000000..2949b2c

> --- /dev/null

> +++ b/package/quagga/quagga.patch



Patches must have a description + Signed-off-by line.



> @@ -0,0 +1,28 @@

> +diff -Nurp quagga-0.99.23_orig/babeld/util.c quagga-0.99.23/babeld/util.c

> +--- quagga-0.99.23_orig/babeld/util.c               2014-07-18 15:31:02.078625470 +0530

> ++++ quagga-0.99.23/babeld/util.c      2014-07-18 15:33:45.838618612 +0530

> +@@ -430,7 +430,11 @@ daemonise()

> +     fflush(stdout);

> +     fflush(stderr);

> +

> ++#ifdef HAVE_FORK

> +     rc = fork();

> ++#else

> ++    rc = vfork();

> ++#endif



We have already received numerous patches like this from ADI, and each time our answer was the same: please include in the patch description a justification of why the fork() call can be replaced by vfork(). I'm sure you know that vfork() is not equivalent to fork() and that we cannot simply replace one by the other without checking carefully how

fork() is used. With vfork(), the parent process is blocked until the child exits or calls exec(), and all changes made by the child will be visible by the parent. There are therefore many situations in which

vfork() cannot be used as a replacement for fork().



We therefore want to see a justification for each patch making this replacement.



Also, notice that since commit

http://git.buildroot.net/buildroot/commit/?id=26b482990870bdc9921ceaa3204eaf513e0be165,

quagga can no longer be selected on Blackfin, as I've added a MMU dependency on the package. Of course, if you're interested in seeing quagga becoming available on Blackfin, some changes are needed. If you don't care specifically about quagga on Blackfin, we can live with it being non-available in Buildroot for Blackfin.



Best regards,



Thomas Petazzoni

--

Thomas Petazzoni, CTO, Free Electrons

Embedded Linux, Kernel and Android engineering http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140719/ed0ef6ab/attachment.html>
