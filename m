From: Allan Nielsen <a@awn.dk>
Date: Thu, 12 Apr 2012 10:01:05 +0200
Subject: [Buildroot] Problems with libsigc staging installation
Message-ID: <CANdC7UGan8_4krv_n8NWTbbWQBZgpff8odCAx_9ShPtzdGaExA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm having some problems with using the static libraries libsigc
installs in the staging directory.

The problem only exists when using my Ubuntu computer, everything
works fine when running Gentoo.

Here is my trace of the problem:

- When compiling a package using libsigc (the actual package is not
part of buildroot) the compiler complains that it can not find
libstdc++.la

- This is because libsigc-2.0.la contains an absolute path to the
libstdc++.la file which is incorrect. See snippet:

SNIPPET FROM ./output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/lib/libsigc-2.0.la
START
dependency_libs='
/home/cup/buildroot/buildroot-awn/output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/local/x86_64-gmb-linux-gnu/lib/gcc/x86_64-gmb-linux-gnu/4.4.6/../../../../x86_64-gmb-linux-gnu/lib/../lib64/libstdc++.la'
SNIPPET FROM ./output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/lib/libsigc-2.0.la
END

The same snippet from libsigc-2.0.la~

SNIPPET FROM ./output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/lib/libsigc-2.0.la~
START
dependency_libs='
/usr/local/x86_64-gmb-linux-gnu/lib/gcc/x86_64-gmb-linux-gnu/4.4.6/../../../../x86_64-gmb-linux-gnu/lib/../lib64/libstdc++.la'
SNIPPET FROM ./output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/lib/libsigc-2.0.la~
END

The libsigc-2.0.la and libsigc-2.0.la~ are different because they has
been processed by this command (in package/Makefile.autotools.in) :

        for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
                cp -f $$$$i $$$$i~; \
                $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
        done

This explains the incorrect path in sysroot/usr/lib/libsigc-2.0.la,
but it seems like the path in wrong in the first place...

All the remaining *.la and *.la~ files installed in sysroot/usr/lib/
have absolute pathes pointing to
/home/cup/buildroot/buildroot-awn/output/host/usr/x86_64-unknown-linux-gnu/sysroot/
and not /usr/local/x86_64-gmb-linux-gnu/lib/gcc/x86_64-gmb-linux-gnu

So, why is that?

Any hints on how to debug this?

Best regards
Allan W. Nielsen
