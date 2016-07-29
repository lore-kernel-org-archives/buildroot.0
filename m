From: Jordan Yelloz <jordan@yelloz.me>
Date: Fri, 29 Jul 2016 09:32:02 -0700
Subject: [Buildroot] [PATCH 4/4] swupdate: added a warning for
 LuaJIT/Lua 5.1
In-Reply-To: <1469809234.3805.10.camel@embedded.rocks>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-5-jordan@yelloz.me>
 <1469809234.3805.10.camel@embedded.rocks>
Message-ID: <8fc5a199-611c-d45e-e655-cc81e288aa9c@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/29/2016 09:20 AM, J?rg Krause wrote:
> On So, 2016-07-24 at 16:27 -0700, Jordan Yelloz wrote:
>> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
>> ---
>>  package/swupdate/Config.in | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
>> index 85dde4eb0bc5..046903de87f5 100644
>> --- a/package/swupdate/Config.in
>> +++ b/package/swupdate/Config.in
>> @@ -55,6 +55,12 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
>>  	  This is necessary if you want to run swupdate with the
>> embedded
>>  	  webserver and do not provide an own website to be
>> installed to
>>  	  /var/www/swupdate.
>> +
>> +if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
>> +comment "swupdate cannot use CONFIG_HANDLER_IN_LUA with Lua API <
>> 5.2."
>> +comment "Lua parsers and pre/post-install hooks should still
>> work.    "
>> +endif
>> +
> 
> I would prefer to put this as a note in the help text.
> 

Ok, I can move it there.

> Do you know where this restriction comes from? Why does the Lua
> handlers does not work? Did you tell upstream about the issue? AFAIK
> swupate should work with Lua 5.1 - 5.3, but I did not checked.

The handlers incompatibility is because of the Lua C API changes from
5.1 to 5.2.
I've done some testing earlier this week and it turns out you can
actually include the compat53 C files
(<https://github.com/keplerproject/lua-compat-5.3/tree/master/c-api>)
into swupdate's core/handler.c if you really want and the lua handlers
feature will build and work successfully with Lua 5.1 and LuaJIT (though
I have done very limited testing).

I started writing a patch for swupdate but I currently have no use for
the handlers in lua and don't have the time to integrate it into
swupdate's build system so it's on hold.

--
Jordan
