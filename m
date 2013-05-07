From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 May 2013 09:54:48 +0200
Subject: [Buildroot] [PATCH v4 01/12] toolchain/gcc: Add host-{flex,
 bison} dependencies for GCC 4.2, 4.3, 4.4
In-Reply-To: <87wqreqx77.fsf@dell.be.48ers.dk>
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
 <1367524293-32081-2-git-send-email-mjonker@synopsys.com>
 <87wqreqx77.fsf@dell.be.48ers.dk>
Message-ID: <20130507095448.765b8cc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 04 May 2013 22:58:20 +0200, Peter Korsgaard wrote:

>  Mischa> +ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
>  Mischa> +ifneq ($(findstring x4.3.,x$(GCC_VERSION)),x4.3.)
>  Mischa> +ifneq ($(findstring x4.4.,x$(GCC_VERSION)),x4.4.)
>  Mischa> +GCC_HOST_PREREQ = host-flex host-bison
> 
> Ehh, two things:
> 
> - This implements the opposite logic of what the commit message says
>   (E.G. adds flex/bison if the version ISN'T 4.2/4.3/4.4)
> 
> - It overrides GCC_HOST_PREREQ instead of appending to it even though
>   the line just above already appends something.

Hum, right. Mischa, could you fix those and submit a patch? I've added
a ARC configuration to the autobuilders, and it is now failing since
Peter didn't commit this patch.

> It isn't clear to me what the gcc version logic should be, and if it is
> somehow related to ARC - I don't recall any autobuilder failures
> regarding missing flex/bison.

The problem is that those old gcc versions require flex/bison to build
properly. The issue was not seen on the autobuilders, because so far the
only architectures that are using those old versions are AVR32 (4.2)
and SPARC/Leon (4.4).

For AVR32, the autobuilder uses a an external toolchain which was built
with a previous version of Buildroot, at a time where the autobuilder
chroot had bison and flex installed system-wide.

For SPARC, there is no autobuilder configuration (maybe I should add
one?).

So this bug already exists today, independently of the ARC support: I
think that if you try to build the AVR32 internal toolchain on a system
where bison and flex are not installed, the build is going to fail.

See
http://autobuild.buildroot.org/results/cc6c6f8036ee2a35c3eec36cf3f4338e76c19d68/build-end.log
for an autobuilder failure that exhibits the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
