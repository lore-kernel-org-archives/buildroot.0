From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 31 Oct 2008 10:44:20 -0200
Subject: [Buildroot] [PATCH] Create zlib installation directory in the
	staging dir
In-Reply-To: <20081031121558.GB27517@mx.loc>
References: <20081030170039.6fe37578@surf> <20081031083736.GB26468@mx.loc>
	<d6cda7730810310511g3e03f40x6385931c49054d2d@mail.gmail.com>
	<20081031121558.GB27517@mx.loc>
Message-ID: <d6cda7730810310544s6a93c58v18206bd17e58a72f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 31, 2008 at 10:15 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Fri, Oct 31, 2008 at 10:11:04AM -0200, Thiago A. Corr?a wrote:
>>Applied in r23879.
>
> You applied something different, fwiw. But it doesn't matter much,
> you're building zlib incorrectly anyway *shrug* i've fixed this now..
>

Diff between svn and git gives me:

-$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so
-       $(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h
$(TARGET_DIR)/usr/include/
-       $(INSTALL) $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
-       $(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so.$(ZLIB_VERSION)
+       mkdir -p $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib
+       cp -dpf $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/
+       cp -dpf $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
+       cp -dpf $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/
+       rm -f $(TARGET_DIR)/lib/libz.so $(TARGET_DIR)/usr/lib/libz.so
+       ln -sf libz.so.$(ZLIB_VERSION) $(TARGET_DIR)/usr/lib/libz.so
        touch -c $@

Why not use $(INSTALL) here? That's what I did in addition to that
point where you and Thomas pointed out.
