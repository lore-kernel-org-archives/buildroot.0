From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Wed, 27 May 2015 17:03:00 +0200
Subject: [Buildroot] scons and check
Message-ID: <5565DCA4.5040002@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

I'm trying to create a package for Galera, a library needed by mariadb
galera cluster. It builds with scons. Galera depends on check so I
created a package for this library too, which seems to build and
install correctly.

A few packages in buildroot already use scons (exfat, exfat-utils,
benejson, gpsd). Their build commands look like this:

FOO_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
FOO_SCONS_OPTS = "prefix=/usr"

define FOO_BUILD_CMDS
        cd $(@D) && \
	 $(FOO_SCONS_ENV) \
	 CROSS=$(TARGET_CROSS) \
	 $(SCONS) $(FOO_SCONS_OPTS)
endef

So I wrote my .mk file the same way. However scons does not seem to
find the Check library. Building galera fails with:

Checking for C header file check.h... no
Error: check header file not found or not usable

and corresponding config.log shows a "check.h: file not found" error.

Now the disturbing thing is that it only happens when I build on a
system on which check is not installed system-wise. If the build host
has check installed, galera builds. Does this mean that scons uses
host haeders instead of those provided by buildroot packages? Any idea
how to make it behave properly?

Cheers,


- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVZdykAAoJEEkkwl4JtJ9yhFQP/1Tz1R+MTfKofn6mR5cRHhsQ
v9vZubtiWsbJ5iIBHWOiY6axhRxeizlmXy1MdCtJ6V6vWpo4IQsAOi1T5iDYsNvc
F6q1JUJWLxF3cpeqDULbjdySyJL2193SNvakf5yVCpJH2/ZF0r1UYXZz6aNPkfZv
ADz0dPc2XaZRFuinW24NbZyz6//HLTl9C0U006PzZO3ztCTA3jv09gGW4WSyX5Mn
yEN+WsQ3pjRIJwhrHKjA9/4Dtk7HIG1p6ln2swiiMYxZarIQik70aRIFHchwDS9J
sLrLVSLQHvY8OR0pnmdIoY1RBBAC2sUlbSh57Fb+bJEI0vommRgkZjPP6my4WW7F
SMtaAwzuXNDN/XYb5JoCfJVjyByV/0OLPxWGHFZ77W32xQ59n5jDi10RHL85wnvP
kmgJ7LSvvwgfMioBo8QC/t0zI9kvU0emq136khuROMKRbFAKnAZqRr97OCJ3s5Uz
qjAW2iY5MufgNWdyQG+M5plnt+3hqgFAKJwQwgyuyeVPgHI0N1ZZ6wQYff3LV4xm
QWULAwVyiyNgqRb45OfP7JWqCFhoP8gQiWCYMVlRmTEfY/lLMxd20AK8qz1v4uTA
p4t9n6ql6dXloeWcw2dlxQVS6ZHqK/6xxfh6d2RsnekN5OVjRvEE3KaKt/5ae3pa
F+NzawlBLBStsW73P6LZ
=twcI
-----END PGP SIGNATURE-----
