From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 17 Jul 2012 10:03:32 +0200
Subject: [Buildroot] [UNSURE]Re:  [PATCH] New package: lua-cjson [v2]
In-Reply-To: <CANxTyt5U0RsfyQMWgLiAc3wEku59CdwW_izUD0sBDdTxnGxGMg@mail.gmail.com>
References: <1342407627-2861-1-git-send-email-danomimanchego123@gmail.com>
 <1342407627-2861-2-git-send-email-danomimanchego123@gmail.com>
 <CAB0FRss+UK1cuQgkvmgb+sg3rAG74yCD1ooMc2NJQJPguO1VAw@mail.gmail.com>
 <CANxTyt5U0RsfyQMWgLiAc3wEku59CdwW_izUD0sBDdTxnGxGMg@mail.gmail.com>
Message-ID: <CAB0FRstXLAAeKbBBPghzBLFTw939WyRK7V7_1TUtz1fxkq174g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/17 Danomi Manchego <danomimanchego123@gmail.com>:
> Fran?ois,
>
>> - the variable LUA_CJSON_SOURCE is useless, because the default scheme
>> (packagename-$(LIBFOO_VERSION).tar.gz) is used
>
> True.
>
>> - PREFIX=$(STAGING_DIR)/usr in LUA_CJSON_BUILD_CMDS is useless
>>
>> a good use of PREFIX & DESTDIR is, for example :
>>     define LUA_FOO_INSTALL_TARGET_CMDS
>>       $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX="/usr" install
>>     endef
>
> Not quite true.  If you look at the Makefile in lua-cjson, you will see that
> DESTDIR is only used for the install targets, which I have avoided in the
> .mk.  But the PREFIX is used in the build phase for -I:
>
> LUA_INCLUDE_DIR =   $(PREFIX)/include
> ...
> BUILD_CFLAGS =      -I$(LUA_INCLUDE_DIR) $(CJSON_CFLAGS)
> ...
> .c.o:
> $(CC) -c $(CFLAGS) $(CPPFLAGS) $(BUILD_CFLAGS) -o $@ $<
>
> Since we need header files to come from staging rather than /usr, I set
> PREFIX=$(STAGING_DIR)/usr.  If you prefer, I can override BUILD_CFLAGS or
> LUA_INCLUDE_DIR, but I think that proper compilation is obtained with the
> file as-is.
>

in order to explain your intention, I prefer
LUA_INCLUDE_DIR="$(STAGING_DIR)/usr/include"

Fran?ois

> Danomi -
>
>
> On Mon, Jul 16, 2012 at 10:29 AM, Fran?ois Perrad <francois.perrad@gadz.org>
> wrote:
>>
>> in lua-cjson.mk :
>> - the variable LUA_CJSON_SOURCE is useless, because the default scheme
>> (packagename-$(LIBFOO_VERSION).tar.gz) is used
>> - PREFIX=$(STAGING_DIR)/usr in LUA_CJSON_BUILD_CMDS is useless
>>
>> a good use of PREFIX & DESTDIR is, for example :
>>     define LUA_FOO_INSTALL_TARGET_CMDS
>>              $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX="/usr" install
>>     endef
>>
>> Fran?ois
>>
