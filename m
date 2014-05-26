From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 May 2014 13:52:54 +0200
Subject: [Buildroot] [PATCH v2 1/2] mongoose: bump to version 5.3
In-Reply-To: <1399923087-5550-1-git-send-email-zinosat@tiscali.it> (Davide
 Viti's message of "Mon, 12 May 2014 21:31:26 +0200")
References: <1399923087-5550-1-git-send-email-zinosat@tiscali.it>
Message-ID: <87sinwhi3t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

 > From: Davide Viti <d.viti@infosolution.it>
 > Signed-off-by: Davide Viti <zinosat@tiscali.it>
 > Cc: Will Wagner <will_wagner@carallon.com>

 > ---
 > Changes v1 -> v2:
 >   - rebase
 >   - update license to GPLv2 (Will Wagner)

 > Original patch content:

 > Mongoose has changed quite drastically in the last months.
 > Here is a list of changes which had to be applied:

 >  - Bump version from 3.7 to 5.3
 >  - use tarball download via github helper iso git clone
 >  - need largefile support
 >  - compilation takes place into "examples"
 >  - weberver source is now "server.c"
 >  - adapt to new command line options
 >  - SSL support now controlled via NS_ENABLE_SSL

 > I'd appreciate some feedback in particular on the SSL change: the old
 > NO_SSL_DL and NO_SSL macros have been removed and the only SSL-related
 > macro is now NS_ENABLE_SSL.

Most of this should go above the '---' line so it becomes part of the
commit message.

 > +++ b/package/mongoose/mongoose.mk
 > @@ -4,10 +4,9 @@
 >  #
 >  ################################################################################
 
 > -MONGOOSE_VERSION = 3.7
 > -MONGOOSE_SOURCE = mongoose-$(MONGOOSE_VERSION).tgz
 > -MONGOOSE_SITE = https://mongoose.googlecode.com/files
 > -MONGOOSE_LICENSE = MIT
 > +MONGOOSE_VERSION = 5.3
 > +MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 > +MONGOOSE_LICENSE = GPLv2
 >  MONGOOSE_LICENSE_FILES = LICENSE
 
 >  MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 > @@ -15,18 +14,16 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
 >  MONGOOSE_DEPENDENCIES += openssl
 >  # directly linked
 > -MONGOOSE_CFLAGS += -DNO_SSL_DL -lssl -lcrypto -lz
 > -else
 > -MONGOOSE_CFLAGS += -DNO_SSL
 > +MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 >  endif
 
 >  define MONGOOSE_BUILD_CMDS
 > -	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) \
 > -		linux COPT="$(MONGOOSE_CFLAGS)"
 > +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/examples \
 > +		COPT="$(MONGOOSE_CFLAGS)"

COPT is not used anywhere in examples/Makefile. It seems like it now
uses CFLAGS_EXTRA.

As we are only installing the "server" example, it doesn't make sense to
build the other examples.

Committed with these fixes to next, thanks.

-- 
Bye, Peter Korsgaard
