From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2011 21:58:17 +0200
Subject: [Buildroot] [PATCH] linux custom tarball: automatically detect
 a change in tarball configuration
In-Reply-To: <7ee0d57e0b0bbf8917e2.1316595354@localhost6.localdomain6>
References: <7ee0d57e0b0bbf8917e2.1316595354@localhost6.localdomain6>
Message-ID: <20110922215817.1bba4c82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 10:55:54 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> When you specify a LINUX_TARBALL, the variable LINUX_VERSION will be set to
> the fixed "custom". As a result, LINUX_DIR remains the same even though you
> modified the .config file to specify a different tarball.  When re-running
> make, buildroot does not see the change because the stamp files still look
> up-to-date, and you'll have to force building the new kernel in some way.
> 
> This patch overwrites LINUX_VERSION to include the LINUX_TARBALL string, If a
> new custom tarball is configured, LINUX_DIR will be different, the old stamp
> files will not matter, and buildroot will correctly start the build process for
> the new kernel.

Sorry, but LINUX_TARBALL can be something like
http://foobar.com/blah/blek/linux-3.11.0.tar.bz2, and I don't think
it's a good idea to create a directory named
linux-custom-http://foobar.com/blah/blek/linux-3.11.0.tar.bz2

You could do something like:

LINUX_VERSION = $(LINUX_SOURCE), in which case the directory would be:

linux-linux-3.11.0.tar.bz2/ in the case highlighted above, which is not
very nice either.

Or:

LINUX_VERSION = $(firstword $(shell echo $(LINUX_TARBALL) | md5sum)

which would create a hash from the LINUX_TARBALL URL, and that hash
would change when the LINUX_TARBALL URL is changed. I don't know if
it's nicer.

I agree that their is a minor inconvenience in having the directory
always named linux-custom/, but I don't have a good solution in mind.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
