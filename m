From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 18:55:21 +0100
Subject: [Buildroot] Adding leveldb to buildroot
In-Reply-To: <201412081517.25808.ste@junkomatic.net>
References: <201412081517.25808.ste@junkomatic.net>
Message-ID: <20141208175521.GC4105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

[Sorry for the duplicate, I forgot to Cc the Buildroot mailing list in
the previous mail.]

On 2014-12-08 15:17 +0000, Steve James spake thusly:
> Hello Yann,
> I noticed that you started adding leveldb to buildroot at the weekend. I just 
> finished off the Makefile for the current release (1.18). Files are attached. 
> Please do with them as you wish.

Thank you for your contribution!

In the future, do not hesitate to post the patch to the mailing list,
so it can get more thorough reviews.

In fact, I started work on leveldb back in MAy 2013, not this
week-end! ;-)

It is part of my (still on-going) work to get a complete libvirt
integration in Buildroot, and leveldb is needed by ceph, which in turn
can be used by Qemu, but that is still all a long way ahead.

As for leveldb, I have some comments.

First, look at the manual, which explains how to add a package, the
coding style we use, and some other usefull tips and tricks, as well as
how to submit your changes:

    http://buildroot.net/downloads/manual/manual.html
    http://buildroot.net/downloads/manual/manual.html#adding-packages
    http://buildroot.net/downloads/manual/manual.html#_contributing_to_buildroot
    http://buildroot.net/downloads/manual/manual.html#submitting-patches

You must sign-off your patches. Signing-off is a way to handle a chain
of origins of a contribution; see a description there:
    http://elinux.org/Developer_Certificate_Of_Origin

Basically, you sign-off on a patch with a line like:

    Signed-off-by: Your Real NAME <your-email@example.net>

> config BR2_PACKAGE_LEVELDB
>    bool "leveldb"
>    select BR2_PACKAGE_SNAPPY
>    help

This hsould be indented with a single TAB, not spaces.

>      LevelDB is a fast key-value storage library written at Google that
>      provides an ordered mapping from string keys to string values.
> 
>      https://github.com/google/leveldb

Help text should be indented with a single TAB followed by two spaces.

> comment "leveldb needs a toolchain w/ C++"
>         depends on !BR2_INSTALL_LIBSTDCPP

If so, then you should add a "depends on BR2_INSTALL_LIBSTDCPP" to the
main option:

    config BR2_PACKAGE_LEVELDB
        bool "leveldb"
        depends on BR2_INSTALL_LIBSTDCPP
        select BR2_PACKAGE_SNAPPY
        help
          leveldb blabla...


> #############################################################
> #
> # leveldb
> #
> #############################################################

The ### lines should be 80-chars wide.

> 
> LEVELDB_VERSION		   = 1.18
> LEVELDB_SITE            = https://github.com/google/leveldb/archive/
> LEVELDB_SOURCE          = v$(LEVELDB_VERSION).tar.gz
> LEVELDB_LICENSE		   = BSD-3c
> LEVELDB_LICENSE_FILES	= LICENSE
> LEVELDB_INSTALL_STAGING	= YES

There should be only one space before and after the equal sign.

> 
> define LEVELDB_BUILD_CMDS
> 	$(MAKE) -C $(@D) all

This won't work, because you forgot to pass the appropriate variables
that contain the cross-compiler and compilation flags. This should be
something like:

    $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) all

(You can omit 'all' if it is the default rule of the makefile, which it
usually is.)

> endef
> 
> define LEVELDB_INSTALL_TARGET_CMDS
>    $(INSTALL) -D -m 0644 $(@D)/libleveldb.a       $(TARGET_DIR)/usr/lib
>    $(INSTALL) -D -m 0755 $(@D)/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib
> 
>    $(HOSTLN) -sf $(TARGET_DIR)/usr/lib/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so.1
>    $(HOSTLN) -sf $(TARGET_DIR)/usr/lib/libleveldb.so.1.18 $(TARGET_DIR)/usr/lib/libleveldb.so

The last three lines won;t work in case we are doing a static-only
build, that is when BR2_PREFER_STATIC_LIB is set.

>    $(INSTALL) -d -m 0755 $(@D)/include/leveldb $(TARGET_DIR)/usr/include/leveldb

What are you trying to do there? Are you trying to copy the directory
$(@D)/include/leveldb and all its content over to
$(TARGET_DIR)/usr/include/leveldb ?

If so, that's wrong. This should be installed in $(STAGING_DIR).

Basically, we put all that is needed for development (headers, .so
symlinks, shared and/or static libraries) in $(STAGING_DIR), and all
that is needed at runtime (shared libraries) in $(TARGET_DIR).

> endef
> 
> $(eval $(generic-package))

All the comments above are not in anyway a mean to turn down this patch,
but are made so that the code we get in Buildroot meets our standards so
that it is maintainable over the long run, and also so you can improve
and gain some more knowledge of Buildroot internals.

Care to address all the above and respin a new version, please?

Thank you again for your contribution, it is much appreciated! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
