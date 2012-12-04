From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 10:10:42 +0100
Subject: [Buildroot] How to handle modularity in buildroot?
In-Reply-To: <201212041249.14541.manningc2@actrix.gen.nz>
References: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
 <F9C551623D2CBB4C9488801D14F864C610B824F7@ex-mb1.corp.adtran.com>
 <201212041249.14541.manningc2@actrix.gen.nz>
Message-ID: <20121204101042.3ae057bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Manning,

On Tue, 4 Dec 2012 12:49:14 +1300, Charles Manning wrote:

> I am aware of this mechanism but I don't think it really gets me what I am 
> after.
> 
> I think that with defconfig, I would be able to make defconfig, then tweak the 
> config to get a variant. But now if I change the base config, I then have to 
> go through the process again for the variant.
> 
> What I would like is the ability to have:
> * A base package
> * Production rootfs = base + production files.
> * Development rootfs = base  + development files.
> 
> Then a change to the base package automatically flows through the production + 
> development rootfs.
> 
> Is there a way to accomplish that?

First of all, thanks for your nice words about Buildroot, definitely
appreciated.

That said, if Buildroot is certainly simpler than OE, it also means
that Buildroot has a smaller feature set, and to some extent a bit less
flexibility.

What you can do to achieve what you want is use defconfig fragments.
For example:

 * mysystem_base_defconfig.frag would contain:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/thomas/x-tools/arm-br-arm926/usr/"
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_BUSYBOX=y

 * mysystem_prod_defconfig.frag would contain:

BR2_PACKAGE_APPLICATION1=y
BR2_PACKAGE_APPLICATION2=y

 * mysystem_dev_defconfig.frag would contain:

BR2_PACKAGE_STRACE=y
BR2_PACKAGE_LTRACE=y

And then, when you want to do a production build:

 make clean
 cat mysystem_base_defconfig.frag mysystem_prod_defconfig.frag > configs/mysystem_prod_defconfig
 make mysystem_prod_defconfig
 make

And when you want to do a development build:

 make clean
 cat mysystem_base_defconfig.frag mysystem_dev_defconfig.frag > configs/mysystem_dev_defconfig
 make mysystem_dev_defconfig
 make

Basically, instead of having Buildroot providing this feature, we rely
on the simple manipulation of the configuration file.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
