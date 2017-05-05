From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 5 May 2017 09:59:51 -0400
Subject: [Buildroot] [git commit] lua-resty-http: new package
In-Reply-To: <87pofntx51.fsf@dell.be.48ers.dk>
References: <1493935354.76899857@f13.my.com> <87pofntx51.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt6gexW1NkVmi9xgN-A86eO_6A2L8dv_nFwCwLmEYfM=Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, May 5, 2017 at 6:29 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "semenak94" == semenak94  <semenak94@mail.ru> writes:
>
>  > Hello,
>  > Well, I'm also very far from nginx expert, but yes, it
>  > lua-nginx-module, which we need in our special embedded linux. So, if
>  > you don't explicitly have nginx modules in buildroot, how should we
>  > deal with it?
>
> So how are you using it now?
>
> We currently don't have any explicit handling of the nginx-lua
> module. You could conceptually do something with the 'nginx additional
> modules' (BR2_PACKAGE_NGINX_ADD_MODULES) option, but there's no
> guarantee that nginx builds after luajit.
>
> I guess the proper solution would be to add an explicit nginx-lua
> module, similar to what we already have for nginx-dav-ext / nginx-naxsi
> / nginx-upload.

FWIW - that's what we did in our project - an "ngx_lua" package that
simply uses generic-package to download and untar the source, and an
addition to nginx.mk like this:

ifeq ($(BR2_PACKAGE_NGX_LUA),y)
NGINX_DEPENDENCIES += ngx_lua luainterpreter
NGINX_CONF_OPTS += --add-module=$(NGX_LUA_DIR)
ifeq ($(BR2_PACKAGE_LUAJIT),y)
NGINX_CONF_ENV += LUAJIT_LIB=$(STAGING_DIR)/usr/lib
LUAJIT_INC=$(STAGING_DIR)/usr/include
endif
endif

But then we ended up not actually using ngx_lua at all.

Danomi -


> Samuel and Adam, you have added / been active around nginx and modules,
> any input?
>
>  >>  > +config BR2_PACKAGE_LUA_RESTY_HTTP
>  >>  > + bool "lua-resty-http"
>  >>  > + help
>  >>  > +   Lua HTTP client cosocket driver for OpenResty / ngx_lua.
>  >>  > +
>  >>  > +   http://github.com/pintsized/lua-resty-http
>  >> Sorry for the slow response, but this patch apparently never made it to
>  >> my mailbox? (It is in the archive, so it must have been an issue on my
>  >> side).
>  >> I'm far from an expert in nginx, but isn't this an extension to the
>  >> lua-nginx-module that we don't (explicitly) have in Buildroot? Is it in
>  >> any way useful without it?
>  >> What is your use case for it?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
