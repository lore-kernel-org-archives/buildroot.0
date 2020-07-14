From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 14:46:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix static build
In-Reply-To: <CAPi7W82G3K_FEJbdSjUJZs8FfKkFjrDoY8jHqKft0hk4ENOLHw@mail.gmail.com>
References: <20200713215943.2240412-1-fontaine.fabrice@gmail.com>
 <20200714102035.0536d2bd@windsurf.home>
 <CAPi7W82G3K_FEJbdSjUJZs8FfKkFjrDoY8jHqKft0hk4ENOLHw@mail.gmail.com>
Message-ID: <20200714144628.223b7fe5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 10:33:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I basically copy/pasted the solution that was applied to the open2300
> package 4 years ago:
> https://git.buildroot.net/buildroot/commit/package/open2300?id=382fa60f9c7445e962b290c74779a0e0fd7e310f

Wow, I looked into this, and what I found is not pretty. It turns out
that when there's no zlib available, MySQL builds its own copy, and
installs it in $(STAGING_DIR). We can see during the MySQL configure:

checking for zlib compression library... system-wide zlib not found, using one bundled with MySQL

So to me, it seems like we should fix this, using the following option:

  --with-zlib-dir=no|bundled|DIR
                          Provide MySQL with a custom location of compression
                          library. Given DIR, zlib binary is assumed to be in
                          $DIR/lib and header files in $DIR/include.

I.e probably:

ifeq ($(BR2_PACKAGE_ZLIB),y)
ORACLE_MYSQL_CONF_OPTS += --with-zlib-dir=$(STAGING_DIR)/usr
ORACLE_MYSQL_DEPENDENCIES += zlib
else
ORACLE_MYSQL_CONF_OPTS += --without-zlib-dir
endif

and of course check in the latter case that it really builds without
zlib.

Could you have a look into this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
