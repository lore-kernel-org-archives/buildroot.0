From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 19:19:49 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com> (Wolfgang
 Grandegger's message of "Wed, 14 Jun 2017 09:14:46 +0200")
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
Message-ID: <877ezp780a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

 > Hello,
 > I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder why
 > the address sanitizer library "libasan.so*" is not available in the
 > rootfs of the target. Is it intentional? And what is the best way to
 > get it added to the rootfs?

Is this with uClibc-ng, musl or Glibc?

We have the following in package/gcc/gcc.mk:

# libsanitizer requires wordexp, not in default uClibc config. Also
# doesn't build properly with musl.
ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
endif

We recently enabled wordexp support in uClibc-ng, so this can most likely
we enabled there. I'll do a test build now.

-- 
Bye, Peter Korsgaard
