From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Mar 2014 20:13:46 +0000 (UTC)
Subject: [Buildroot] [Bug 6956] Packaging libsoxr
In-Reply-To: <bug-6956-163@https.bugs.busybox.net/>
References: <bug-6956-163@https.bugs.busybox.net/>
Message-ID: <20140317201346.AE0B19BEED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6956

--- Comment #4 from Samuel Martin <s.martin49@gmail.com> 2014-03-17 20:13:46 UTC ---
(In reply to comment #3)
> The libsoxr package tries to determine the endianness by running a program,
> which is not possible because we're cross compiling. However, this fact is
> detected, and the suggestion is to 'tell' libsoxr the right result:
> 
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the
> following cache variables appropriately:
>    HAVE_WORDS_BIGENDIAN_EXITCODE (advanced)
> 
> 
> So this means you have to pass this variable to the compilation of libsoxr.
> The variable HAVE_WORDS_BIGENDIAN_EXITCODE is created based on the
> test_big_endian macro, present in ./cmake/Modules/TestBigEndian.cmake.
> This file has a note: "1 if system is big endian"
> 
> So essentially, you should add something like this in the libsoxr.mk file:
> 
> ifeq ($(BR2_ENDIAN),"BIG")
> LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN_EXITCODE=1
> else
> LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN_EXITCODE=0
> endif
> 
> I'm unsure about the exact way to pass this flag to the build, either with
> FOO_CONF_OPT or FOO_CONF_ENV, so you may want to try both.

I confirm, when using the cmake infrastructure, the flags are passed to
FOO_CONF_OPT.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
