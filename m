From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 22:05:28 +0100
Subject: [Buildroot] [PATCH] lua: fix compilation with Blackfin FLAT
In-Reply-To: <1390389214-9768-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Wed, 22 Jan 2014 12:13:34 +0100")
References: <1390389214-9768-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87ob33d8x3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > the dlfcn interface is not available with flat memory model
 > see http://autobuild.buildroot.net/results/b41/b4146bf821d59f694546f6e3a341394cc8fa43ce/

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/lua/lua.mk |   12 ++++++++----
 >  1 file changed, 8 insertions(+), 4 deletions(-)

 > diff --git a/package/lua/lua.mk b/package/lua/lua.mk
 > index 2c867f6..b263070 100644
 > --- a/package/lua/lua.mk
 > +++ b/package/lua/lua.mk
 > @@ -15,7 +15,6 @@ LUA_LICENSE = MIT
 >  LUA_LICENSE_FILES = COPYRIGHT
 
 >  LUA_CFLAGS = -Wall -fPIC
 > -LUA_MYLIBS += -ldl
 
 >  ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 >  LUA_CFLAGS += -DLUA_COMPAT_ALL
 > @@ -24,17 +23,22 @@ LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
 >  endif
 >  endif
 
 > +ifneq ($(BR2_BINFMT_FLAT),y)
 > +	LUA_CFLAGS += -DLUA_USE_DLOPEN
 > +	LUA_MYLIBS += -ldl
 > +endif

But BINFMT_FLAT imply BR2_PREFER_STATIC_LIB. I guess we should do this
whenever BR2_PREFER_STATIC_LIB is enabled, right?

-- 
Bye, Peter Korsgaard
