From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 May 2017 16:34:56 +0200
Subject: [Buildroot] [git commit] lua-resty-http: new package
In-Reply-To: <CANxTyt6gexW1NkVmi9xgN-A86eO_6A2L8dv_nFwCwLmEYfM=Pg@mail.gmail.com>
 (Danomi Manchego's message of "Fri, 5 May 2017 09:59:51 -0400")
References: <1493935354.76899857@f13.my.com> <87pofntx51.fsf@dell.be.48ers.dk>
 <CANxTyt6gexW1NkVmi9xgN-A86eO_6A2L8dv_nFwCwLmEYfM=Pg@mail.gmail.com>
Message-ID: <87ziers773.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 >> We currently don't have any explicit handling of the nginx-lua
 >> module. You could conceptually do something with the 'nginx additional
 >> modules' (BR2_PACKAGE_NGINX_ADD_MODULES) option, but there's no
 >> guarantee that nginx builds after luajit.
 >> 
 >> I guess the proper solution would be to add an explicit nginx-lua
 >> module, similar to what we already have for nginx-dav-ext / nginx-naxsi
 >> / nginx-upload.

 > FWIW - that's what we did in our project - an "ngx_lua" package that
 > simply uses generic-package to download and untar the source, and an
 > addition to nginx.mk like this:

 > ifeq ($(BR2_PACKAGE_NGX_LUA),y)
 > NGINX_DEPENDENCIES += ngx_lua luainterpreter

ngx_lua (or nginx-lua to follow the naming convention) should probably
be responsible for pulling in luainterpreter, but OK.

> NGINX_CONF_OPTS += --add-module=$(NGX_LUA_DIR)
 > ifeq ($(BR2_PACKAGE_LUAJIT),y)
 > NGINX_CONF_ENV += LUAJIT_LIB=$(STAGING_DIR)/usr/lib
 > LUAJIT_INC=$(STAGING_DIR)/usr/include
 > endif
 > endif

 > But then we ended up not actually using ngx_lua at all.

Would you be interested in contributing (and maintaining) such a package
in BR?

-- 
Bye, Peter Korsgaard
