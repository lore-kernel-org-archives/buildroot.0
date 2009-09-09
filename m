From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2009 08:32:07 +0200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
References: <4AA62DD20200000D00128C56@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
Message-ID: <20090909083207.5432cbf0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your comments!

Le Wed, 09 Sep 2009 07:54:25 +1200,
"angus salkeld" <angus.salkeld@alliedtelesis.co.nz> a ?crit :

> >  2. Remove the BOARD/LOCAL feature.
> > 
> >     This mechanism is a duplication of something that could already
> > be done in a different way: by adding a new target in
> > target/device/.
> > 
> Quite a few of our engineers like this feature.
> When you are testing that a change doesn't break other targets it is
> nice to have a shell per "board" and just be able to run "make" in
> each to re-build.

Let's say your vendor name is Foo and you have two boards Bar1 and
Bar2. Then you would create the following directories:

 target/device/foo/bar1
 target/device/foo/bar2

In these directories you would have :

 * foo_bar1_defconfig and foo_bar2_defconfig, which are the default
   Buildroot configuration for the two boards

 * The Linux kernel configuration file

 * Optionnaly, a Busybox configuration file

 * Optionnaly, a target skeleton and a device table

Then, to build a board, you would just do :

 make foo_bar1_defconfig
 make

or for the other board:

 make foo_bar2_defconfig
 make

This is a mechanism that currently exists, you can try it by yourself
to verify it matches your requirements. I think the BOARD/LOCAL feature
is just a duplication of this.

Of course, there's an obvious lack of documentation on this mechanism.
But this is something I'm working on currently.

> >      - build/    where all the packages are built
> >      - images/   where the final kernel and rootfs images are stored
> >      - staging/  the staging directory (containing the development
> > files and libraries compiled for the target)
> >      - target/   which contains the target root filesystem
> >      - host/     which contains all the host programs
> >      - stamps/   which contains the stamps files
> > 
> 
> We have a a number of boards to build and this is going put the burden
> on the end user to handle moving the output directory around.
> Not very user friendly for people who use buildroot in anything but
> the simplest case.
> 
> Please still support the ability to build multiple targets within the
> same buildroot (in configuration). One option would be to make
> "O=<dir>" a configuration option (defaulting to the output directory).

That could be an option, if that makes it easier to use for your users.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
