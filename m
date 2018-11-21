From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 08:46:39 +0100
Subject: [Buildroot] [PATCH next v2] package/luarocks: rework
 configuration file for per-package folders
In-Reply-To: <9e4b3242-76ad-2e6e-ba3d-5dabde0ffd91@mind.be>
References: <20181120130110.30425-1-thomas.petazzoni@bootlin.com>
 <9e4b3242-76ad-2e6e-ba3d-5dabde0ffd91@mind.be>
Message-ID: <20181121084639.7ad59570@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 23:11:28 +0100, Arnout Vandecappelle wrote:
> On 20/11/2018 14:01, Thomas Petazzoni wrote:
> > +LUAROCKS_RUN_ENV = \
> > +	LUA_PATH="$(HOST_DIR)/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
> > +	STAGING_DIR="$(STAGING_DIR)" \
> > +	TARGET_DIR="$(TARGET_DIR)" \  
> 
>  These two are already exported in top-level Makefile, so it shouldn't be needed
> (note that when a variable is exported, it will get its value from the context
> where the shell is started, not from where the 'export' statement is put, so it
> does exactly what we need it to).

ACK.

> > +	TARGET_CC="$(TARGET_CC)" \
> > +	TARGET_CFLAGS="$(LUAROCKS_CFLAGS)" \
> > +	TARGET_LDFLAGS="$(TARGET_LDFLAGS)"  
> 
>  For these three, I expect other package infras will need it as well, so it
> would make sense to export them too.

Generally speaking, I am not a big fan of things exported in the
environment. One thing I very often do when debugging build issues is
copy/paste the command line that Buildroot ran, to run it again on my
own, sometimes doing additional tweaks. When there's more and more
stuff "hidden" (i.e exported in the environment), it makes that more
and more difficult.

In addition, as you can see here, the TARGET_CFLAGS we use are *NOT*
the global TARGET_CFLAGS that Buildroot defines. It's LUAROCKS_CFLAGS,
which is TARGET_CFLAGS + a few additional luarocks specific CFLAGS.

So no, exporting TARGET_CFLAGS globally doesn't solve that particularly
case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
