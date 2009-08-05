From: Mike Crowe <mac@mcrowe.com>
Date: Wed, 5 Aug 2009 14:55:02 +0100
Subject: [Buildroot] Having MAKE set in environment causes buildroot to leak
	its own	value
Message-ID: <20090805135502.GA16052@mcrowe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having just spent a while trying to fathom this I thought it
worthwhile documenting it if only to give people who find the same
problem something they can google for.

I saw problems when building openssl with BR2_JLEVEL set to anything
higher than 1:

 asn1pars.o: In function `asn1parse_main':
 asn1pars.c:(.text+0xe8): undefined reference to `OBJ_cleanup'
 asn1pars.c:(.text+0x2d0): undefined reference to `OBJ_create_objects'

It was pretty clear that openssl was building parts of itself with
-j$(BR2_JLEVEL) even though the openssl.mk file specifically uses
$(MAKE1).

I discovered that the options set in the MAKE variable in
package/Makefile.in were leaking through to recursive makes that
openssl's Makefile launched. This only occurred if MAKE happened to be
set in the environment that launched buildroot's make[1]. Although
openssl's top level make is run linearly any sub-makes it spawns
receive -j$(BR2_jLEVEL) and run in parallel. :(

I worked around this by ensuring that MAKE was unset before launching
the buildroot build system.

Assuming my understanding is correct I wonder if it would be better to
fix this permanently by adding "unexport MAKE" to package/Makefile.in?
Alternatively would it be worth adding a check to
toolchain/dependencies/dependencies.sh?

Thanks.

Mike.

[1] In my case it was being set by our SoC supplier's build system
which wraps buildroot.
