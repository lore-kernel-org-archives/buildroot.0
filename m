From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jul 2013 13:25:58 +0200
Subject: [Buildroot] packages build order and dependencies
In-Reply-To: <51DFE0C0.6010307@gmail.com>
References: <51DFE0C0.6010307@gmail.com>
Message-ID: <20130712132558.59e78252@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Pohanka,

On Fri, 12 Jul 2013 12:56:00 +0200, Jan Pohanka wrote:

> I would like to clarify myself how the order of the package build is 
> defined. I thought that when I specify the package dependency in 
> Kconfig, then the top one should be built first. But it seems that I 
> need also it to add MY_PACKAGE_DEPENDENCIES variable in mk file. Am I right?

What defines the order of build is the <pkg>_DEPENDENCIES variable in
the package .mk file.

> Like this example
> # Kconfig
> config MY_PACKAGE
>      bool "my_package"
>      depends on BR2_LINUX_KERNEL

The Config.in stuff doesn't take care of anything build order. It's
just here to ensure consistency of the configuration, i.e that when one
package selects libpng, all packages that can optionally use libpng are
informed and can use it.

> #my_package.mk
> ...
> #is this needed for building linux before my_package?
> MY_PACKAGE_DEPENDENCIES += linux

Yes, this is precisely what tells Buildroot to build the 'linux'
package, then the 'my-package' package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
