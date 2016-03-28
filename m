From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 22:40:07 +0200
Subject: [Buildroot] [PATCH] redis: use BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <1459174261-25242-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 28 Mar 2016 11:11:01 -0300")
References: <1459174261-25242-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lh528hg8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It uses __atomic_fetch_add_4 so libatomic must be pulled in if
 > necessary. Fixes:
 > http://autobuild.buildroot.net/results/dfd/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/

 >  # Redis doesn't support DESTDIR (yet, see
 >  # https://github.com/antirez/redis/pull/609).  We set PREFIX
 >  # instead.
 > -REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 > +REDIS_BUILDOPTS = \
 > +	CC="$(TARGET_CC)" \
 > +	CFLAGS="$(TARGET_CFLAGS)" \
 > +	LDFLAGS="$(TARGET_LDFLAGS) $(REDIS_LIBATOMIC)" \
 >  	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \

On second thought, I prefer to keep this as TARGET_CONFIGURE_OPTS
instead of explicitly passing CC / CFLAGS, so I've changed that while
committing.

-- 
Bye, Peter Korsgaard
