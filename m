From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 21:43:25 +0100
Subject: [Buildroot] [PATCH] package/collectd: fix build without
	libgcrypt
In-Reply-To: <1418424693-10108-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 12 Dec 2014 23:51:33 +0100")
References: <1418424693-10108-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wq5slk42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In case lthe libgcrypt development files are present on the host system,
 > collectd's ./configure will mistakenly try to use them and will call the
 > host system's libgcrypt-config, thus leading it to use path to the host
 > system includes and libraries.

 > Fix that in two ways:
 >   - explicitly disable libgcrypt support when libgcrypt is not enabled;
 >   - pass the complete path to libgcrypt-config when libgcrypt is enabled.

 > However, collectd's configure.ac is uterly broken. The code in
 > configure.ac has special code to check for libgcrypt-config, and use
 > whatever is provided via --with-libgcrypt=/path/to/libgcrypt-config. But
 > that is promptly forgotten because they then call the AM_PATH_LIBGCRYPT
 > macro, that just does it all again from scratch, and does not use the
 > value previously found.

 > Instead, we set LIBGCRYPT_CONFIG in the environment and point it to our
 > own libgcrypt-config.

 > Should fix numerous build issues:
 >     http://autobuild.buildroot.net/results/ad4/ad408aef5fb92fe9e031c7dbaf6999776b40ace4/
 >     http://autobuild.buildroot.net/results/967/96735bfa91bcf2e3dff89f69c0a12ed406e9efb9/
 >     ...
 >     http://autobuild.buildroot.net/results/3bd/3bdd9bdffb1d55414787d38fc2656d7a3391a957/
 >     ...

 > (the first two are with the paranoid wrapper, the third one was before
 > the paranoid wrapper.)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@openwide.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

 > ---
 > To be noted: even though this fixes the afore-mentioned issues, there
 > are potentially more failures lurking around the corner:
 >     checking for Python CPPFLAGS... /usr/include/python2.7
 > Fun times ahead... :-/

:/

Committed, thanks.

-- 
Bye, Peter Korsgaard
