From: Martin Bark <martin@barkynet.com>
Date: Mon, 29 Jun 2015 11:51:55 +0100
Subject: [Buildroot] [v2 5/6] package/nodejs: Define NPM command for
 other packages to use
In-Reply-To: <20150627225325.GF30876@free.fr>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
 <1435370498-25473-5-git-send-email-martin@barkynet.com>
 <20150627225325.GF30876@free.fr>
Message-ID: <CAFGQKxcsaDH1cYoQrsAQyL_QQiq03No2q_uS+ydJp0PMiDbjUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Yes I was thinking of submitting some patches to add other node.js
based packages but really I just submitted this patch because I though
$(NPM) would be useful for other people too.   I was thinking of
submitting pm2 (https://www.npmjs.com/package/pm2) as a package to
buildroot.  pm2 is a popular process manager and I've used it to solve
the issue of starting/stopping other node.js apps.  Having $(NPM)
defined makes writing node.js based packages for buildroot easier.

Thanks

Martin

On 27 June 2015 at 23:53, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2015-06-27 03:01 +0100, Martin Bark spake thusly:
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> But see below...
>
>> ---
>> Changes v1 -> v2
>>  - No changes
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>> ---
>>  package/nodejs/nodejs.mk | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>> index 5d95f77..8cd4fd3 100644
>> --- a/package/nodejs/nodejs.mk
>> +++ b/package/nodejs/nodejs.mk
>> @@ -95,6 +95,13 @@ NODEJS_MODULES_LIST= $(call qstrip,\
>>       $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
>>       $(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
>>
>> +# Define NPM for other packages to use
>> +NPM = $(TARGET_CONFIGURE_OPTS) \
>> +     LD="$(TARGET_CXX)" \
>> +     npm_config_arch=$(NODEJS_CPU) \
>> +     npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
>> +     $(HOST_DIR)/usr/bin/npm
>> +
>>  #
>>  # We can only call NPM if there's something to install.
>>  #
>> @@ -104,12 +111,7 @@ define NODEJS_INSTALL_MODULES
>>       # npm install call below and setting npm_config_rollback=false can both
>>       # help in diagnosing the problem.
>>       (cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
>> -             $(TARGET_CONFIGURE_OPTS) \
>> -             LD="$(TARGET_CXX)" \
>> -             npm_config_arch=$(NODEJS_CPU) \
>> -             npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
>> -             $(HOST_DIR)/usr/bin/npm install \
>> -             $(NODEJS_MODULES_LIST) \
>> +             $(NPM) install $(NODEJS_MODULES_LIST) \
>
> Although the change looks trivially OK, I wonder why you introduce
> $(NPM) for this single user (there is no other user of $(NPM) added
> in your series).
>
> Do you intend to send more patches that make use of $(NPM) ?
>
> Regards,
> Yann E. MORIN.
>
>>       )
>>
>>       # Add global node_modules to PATH
>> --
>> 2.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
