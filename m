From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 18 Jun 2008 17:16:36 +0200
Subject: [Buildroot] [PATCH] Fix nbd compile
In-Reply-To: <87ej6u2317.fsf@macbook.be.48ers.dk>
References: <d6cda7730806180745s329ee330of0fdfaf7fb7a8397@mail.gmail.com>
	<87ej6u2317.fsf@macbook.be.48ers.dk>
Message-ID: <20080618151636.GA2172@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 05:09:24PM +0200, Peter Korsgaard wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> Thiago> This will fix nbd compile, since all versions after 2.8 now
> Thiago> depends on glib.
>
>Thanks, committed.
>
>The only issue I saw was:
>
>-nbd: uclibc $(TARGET_DIR)/sbin/nbd-client
>+nbd: uclibc libglib2 $(TARGET_DIR)/sbin/nbd-client
>
>which doesn't work for parallel builds (libglib's staging install
>might not have completed before the configure step of nbd
>runs). Unfortunately this isn't easy to do with Makefile.autootools.in
>as the libglib version number is part of the .stamp_staging_installed
>path, and LIBGLIB2_TARGET_INSTALL_STAGING isn't defined yet if
>libglib2.mk gets parsed later than nbd.mk.
>
>Perhaps we should get rid of the package version in the stamp files?
>That would ofcause break if you changed package version, but it might
>be preferable to what we have now - E.G.:
>
>$(BUILD_DIR)/libglib2_stamp_staging_installed


echo the current package version into a .test_ver file in the toplevel
builddir, then cmp(1) .test_ver
$(BUILD_DIR)/$(PACK)_stamp_staging_installed. If cmp returns !0 then
rebuild and update the current version into the stamp-file
