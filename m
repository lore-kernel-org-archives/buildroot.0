From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 14:38:19 +0100
Subject: [Buildroot] [PATCH v2,
 2/4] package/celt051: needs dynamic library
In-Reply-To: <20191117164452.5361-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Nov 2019 17:44:50 +0100")
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
 <20191117164452.5361-2-fontaine.fabrice@gmail.com>
Message-ID: <871rtyyapg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > celt051 can't be built statically with opus as opus embeds its own celt
 > version. So add a dynamic library dependency to celt051 (and not to
 > opus, as celt051 is only used optionally by spice whereas opus is
 > selected by 9 packages)

 > This will fix static build of spice with opus and celt:

 > /home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/fabrice/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libopus.a(vq.o): in function `renormalise_vector':
 > vq.c:(.text+0x5ee): multiple definition of `renormalise_vector'; /home/fabrice/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libcelt051.a(vq.o):vq.c:(.text+0x6e6): first defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd

So this is only really an issue for spice, if spice is built statically
and both celt051 and opus are enabled?

If so, then I would prefer to handle it in spice.mk instead,
E.G. blacklist the celt51 + opus + static combination with a sensible
comment, something like:

ifeq ($(BR2_PACKAGE_CELT051),y)

# opus embeds a copy of celt, causing multiple definitions of a number
# of symbols when linked statically together with celt051, so disable
# celt051 support for that combination
ifeq ($(BR2_PACKAGE_OPUS)$(BR2_STATIC_LIBS),yy)
SPICE_CONF_OPTS += --disable-celt051
else
SPICE_CONF_OPTS += --enable-celt051
SPICE_DEPENDENCIES += celt051
endif

else
SPICE_CONF_OPTS += --disable-celt051
endif

Care to send a patch doing something like that? Thanks.

-- 
Bye, Peter Korsgaard
