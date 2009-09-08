From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Sep 2009 09:16:41 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
Message-ID: <20090908091641.56774510@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 8 Sep 2009 08:27:07 +0200,
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> a ?crit :

> I use it all the time ;) How do you propose building for multiple
> targets? I would at least like to share the toolchain, preferably also
> libraries.

One solution is to do it outside of Buildroot. Assuming all you want to
rebuild for the different targets is kernel, u-boot and busybox :

 $ make menuconfig
 Configure for target 1
 $ make
 Wait
 Copy the result image
 $ rm -rf output/build/linux-* output/build/u-boot-* output/build/busybox-*
 $ make menuconfig
 Configure for target 2
 $ make
 Wait
 Copy the result image

And so on. Is this significantly different (in terms of complexity)
compared to what you have to do today ?

The net advantage of this solution is that it keeps the complexity
outside of Buildroot, so the users not interested by this feature don't
see this complexity.

> I did not think project_build_ARCH was confusing, but perhaps project_
> part would be misleading? I would rather see a build/board/<stuff>
> setup.

Yes, project_build_ARCH is very confusing. Question from beginners: ?Why
are some stuff built in project_build_ARCH and some others in
build_ARCH ??, ?Why is my root filesystem in this strange and far away
place project_build_ARCH/uclibc/root/ ??, etc.

build/board/ would probably be ok if only the kernel + u-boot would
differ from one board to the other. But in the current implementation,
busybox is also treated like the kernel and u-boot (i.e built inside
project_build_ARCH and not inside build_ARCH).

Moreover, this build/board/ thing only works if your boards are very
similar (i.e same processor architecture, same instruction set, etc.).
So it only partially solves the problem we're trying to address.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
