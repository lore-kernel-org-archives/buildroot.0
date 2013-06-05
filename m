From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 16:48:41 +0200
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <CAG2jQ8iYbYKBsS6Mku-NOgvdKigP9Doyy8_++joecKk7t31qRg@mail.gmail.com>
 (Markos Chandras's message of "Wed, 5 Jun 2013 15:25:29 +0100")
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk> <20130605160438.2a47341b@skate>
 <8738swej95.fsf@dell.be.48ers.dk>
 <CAG2jQ8iYbYKBsS6Mku-NOgvdKigP9Doyy8_++joecKk7t31qRg@mail.gmail.com>
Message-ID: <87y5aod35i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

Hi,

 Markos> The problem here is that Debian uses a single Makefile to build both
 Markos> the static and the shared library but in buildroot we use
 Markos> the Makefile for the static one and Makefile-libbz2_so for the shared
 Markos> one. In this case, doing what Debian did is not possible
 Markos> but what we can do is to remove the *.o files within the
 Markos> Makefile-libbz2_so before we try to build the shared library.

Or we could just do something like:

define BZIP2_BUILD_CMDS
	$(TARGET_MAKE_ENV)
		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover \
                        $(if $(BR2_PREFER_STATIC_LIB),,libbz2.so) \
                        $(TARGET_CONFIGURE_OPTS)
endef

E.G. only build the libbz2.so taget (which pulls in *.sho) if building
shared.

Or alternatively, keep Makefile-libbz2_so, but change it to use .sho
files instead of .o

-- 
Bye, Peter Korsgaard
