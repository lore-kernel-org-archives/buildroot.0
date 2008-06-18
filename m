From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 17:09:24 +0200
Subject: [Buildroot] [PATCH] Fix nbd compile
In-Reply-To: <d6cda7730806180745s329ee330of0fdfaf7fb7a8397@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 18 Jun 2008
	11\:45\:51 -0300")
References: <d6cda7730806180745s329ee330of0fdfaf7fb7a8397@mail.gmail.com>
Message-ID: <87ej6u2317.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> This will fix nbd compile, since all versions after 2.8 now
 Thiago> depends on glib.

Thanks, committed.

The only issue I saw was:

-nbd: uclibc $(TARGET_DIR)/sbin/nbd-client
+nbd: uclibc libglib2 $(TARGET_DIR)/sbin/nbd-client

which doesn't work for parallel builds (libglib's staging install
might not have completed before the configure step of nbd
runs). Unfortunately this isn't easy to do with Makefile.autootools.in
as the libglib version number is part of the .stamp_staging_installed
path, and LIBGLIB2_TARGET_INSTALL_STAGING isn't defined yet if
libglib2.mk gets parsed later than nbd.mk.

Perhaps we should get rid of the package version in the stamp files?
That would ofcause break if you changed package version, but it might
be preferable to what we have now - E.G.:

$(BUILD_DIR)/libglib2_stamp_staging_installed

-- 
Bye, Peter Korsgaard
