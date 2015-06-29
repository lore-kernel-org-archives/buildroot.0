From: Martin Bark <martin@barkynet.com>
Date: Mon, 29 Jun 2015 10:13:31 +0100
Subject: [Buildroot] [v2 4/6] package/nodejs: Add
 /usr/lib/node_modules/.bin to PATH
In-Reply-To: <20150627224430.GE30876@free.fr>
References: <1435370498-25473-1-git-send-email-martin@barkynet.com>
 <1435370498-25473-4-git-send-email-martin@barkynet.com>
 <20150627224430.GE30876@free.fr>
Message-ID: <CAFGQKxcrYMsVW+D2Kzwb0A7F529TctGU0KEWGtGXAsx-ATxSqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Yes I agree your way is easier to read, I'll update my patch and resubmit it.

The reason this is useful is because there lots of node.js packages
that are normal command line apps designed to be installed globally.
For example, if you install http-server
(https://github.com/indexzero/http-server) then you simple need to cd
into any directory, type ./http-server and it will server that
directory up for you.  Another example might be vtop
(https://github.com/MrRio/vtop), a graphical version of top.

If you install these apps globally then all the executables will be in
the /usr/lib/node_modules/.bin directory.  So this patch simply saves
you typing the full path, the same as for your desktop.

You can test this out by setting BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
to one of these packages.  For reference these is a nice list of some
useful apps here
https://github.com/sindresorhus/awesome-nodejs#command-line-apps.

Thanks

Martin

On 27 June 2015 at 23:44, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2015-06-27 03:01 +0100, Martin Bark spake thusly:
>> This patch adds /usr/lib/node_modules/.bin to PATH so that global
>> node_modules are accessible from the command line
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>
>> ---
>> Changes v1 -> v2
>>  - Improved commit message
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>> ---
>>  package/nodejs/nodejs.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>> index 59e03b0..5d95f77 100644
>> --- a/package/nodejs/nodejs.mk
>> +++ b/package/nodejs/nodejs.mk
>> @@ -111,6 +111,11 @@ define NODEJS_INSTALL_MODULES
>>               $(HOST_DIR)/usr/bin/npm install \
>>               $(NODEJS_MODULES_LIST) \
>>       )
>> +
>> +     # Add global node_modules to PATH
>> +     $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/profile.d
>> +     printf "export PATH=\x24PATH:/usr/lib/node_modules/.bin\n" \
>
> Nice trick, but what about the slightly-more readable;
>
>     printf 'PATH="$${PATH}:/usr/lib/node_modules/.bin"\n' \
>         >$(TARGET_DIR)/etc/profile.d/node_modules.sh
>
>   - because this is in a Makefile, so we need to $-escape the $.
>
>   - because we do not want that $ to be interpreted by the shell (at build
>     time!), we single-quote it.
>
>   - because whoever knows what PATH is made of would be a fool (and
>     because the world is cruel), we double-quote it (at runtime!)
>
> Otherwise, what is the reason to have nodejs modules available as
> commands from a login (!) shell? (Note: nodejs-noob speaking!)
>
> Regards,
> Yann E. MORIN.
>
>> +             >$(TARGET_DIR)/etc/profile.d/node_modules.sh
>>  endef
>>  endif
>>
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
