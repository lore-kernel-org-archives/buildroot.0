From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Oct 2012 19:12:59 +0200
Subject: [Buildroot] export ARCH and CROSS_COMPILE for the post build
 script
In-Reply-To: <508020C8.8000700@wanadoo.fr>
References: <507F9EFB.60601@wanadoo.fr> <20121018153822.58509c94@skate>
 <508020C8.8000700@wanadoo.fr>
Message-ID: <20121018191259.0d9d9843@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 18 Oct 2012 17:31:20 +0200, Thierry Bultel wrote:

> >> What do you think about it ?
> > Why don't you create a Buildroot package to build your external
> > application? It sounds much more logical.
> 
> That was my very first idea.
> But I wanted to keep the Buildroot tree unchanged.

You can keep your Buildroot tree unchanged and still have Buildroot
packages for your own application:

 buildroot/
 mysystem/
    mysystem.mk
    packages/
       myapp/myapp.mk
       myotherapp/myotherapp.mk

And then you can do something like this in mysystem.mk:

BR2_PACKAGE_MYAPP=y
BR2_PACKAGE_MYOTHERAPP=y
include packages/*/*.mk

And your Buildroot configuration, set BR2_PACKAGE_OVERRIDE_FILE to
"$(TOPDIR)/../system.mk".

> And at the time I took the decision, I did not find out how
> to make such a package be built after all the others.

Why would you want to do that absolutely? If your packages have
dependencies, put them in <yourpackage>_DEPENDENCIES, and your package
will be built after its required dependencies. There is no reason to
build after *all* packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
