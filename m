From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 08:55:33 +0100
Subject: [Buildroot] [PATCH 06/10] autotools: allow host package to use
 <pkg>_MAKE_ENV and <pkg>_MAKE
In-Reply-To: <87ei82qaho.fsf@macbook.be.48ers.dk>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<178a42636fdb3c6119ca718a24b14a22c9c9df28.1295866866.git.thomas.petazzoni@free-electrons.com>
	<87ei82qaho.fsf@macbook.be.48ers.dk>
Message-ID: <20110125085533.35bd27e1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Jan 2011 22:04:35 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Hmm, I don't really like this. Packages might be adding target specific
> stuff to their $PKG_MAKE_ENV - E.G.:
> 
> lvm2/lvm2.mk:LVM2_MAKE_ENV = CC="$(TARGET_CC)"
> 
> Wouldn't it make more sense to add a HOST_$PKG_MAKE_ENV and use it just
> like we do for $PKG_MAKE_ENV (E.G. at build and install time)?

$$(PKG) is already HOST_FOOBAR. So, when I do:

$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install

it gets expanded to

$(HOST_MAKE_ENV) $(HOST_<pkg>_MAKE_ENV) $(HOST_<pkg>_MAKE) -C $(HOST_<pkg>_SRCDIR) install

See how $(PKG) is defined:

$$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)

And $(2) is :

#  argument 2 is the uppercase package name, including an HOST_ prefix
#             for host packages

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
