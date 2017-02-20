From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 20 Feb 2017 12:01:56 +0100
Subject: [Buildroot] luaposix not working with luajit/lua5.1
In-Reply-To: <270d2a5f-178d-9937-988c-01791cb15dba@mind.be>
References: <257db515-cfda-4122-55e9-b7783b28dfcf@mind.be>
 <CAB0FRsvL0pR974ur0v9b5R=wphQSJStxfJ6YkiECVX4DLoAkdg@mail.gmail.com>
 <270d2a5f-178d-9937-988c-01791cb15dba@mind.be>
Message-ID: <CAB0FRsvqj=1EQrHKH2Zzn8DLtCbF3q+8_WvcUJxrwLuN-QBE1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-02-20 11:47 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 20-02-17 10:58, Fran?ois Perrad wrote:
>> 2017-02-20 8:35 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>>  Hi Francois,
>>>
>>>  Three years ago you submitted a patch that was supposed to fix luaposix by
>>> adding the bitop module.
> [snip]
>>>  I've worked around this by using the bit32 module instead of the bitop module.
>>> I can submit this patch but I first wanted to check if I just did something wrong.
>>>
>>
>> old versions of luaposix use :
>>     local bit = bit32 or require 'bit'
>> which work out of the box with LuaJIT, Lua 5.2 and Lua 5.3
>> Lua 5.1 requires an additionnal dependency
>>     - bit from LuaBitOp
>>     - or bit32 from https://github.com/keplerproject/lua-compat-5.2
>> In 2013, I choose LuaBitOp.
>>
>> recent versions of luaposix use :
>>     local bit = require 'bit32'
>> which work out of the box with Lua 5.2 and Lua 5.3
>> LuaJIT and Lua 5.1 require an additionnal dependency
>>     - bit32 from https://github.com/keplerproject/lua-compat-5.2
>>
>> The rockspec is available https://luarocks.org/modules/siffiejoe/bit32/5.3.0-1,
>> so it's easy to add this new package.
>
>  That's exactly what I did, but I wanted your feedback before submitting. Thanks
> for your confirmation that bit32 is needed.
>
>  Integrating this package is not trivial, because our luarocks infra assumes
> that the upstream name is the same as the Buildroot name. That's not the case
> for bit32, however: in Buildroot, we really want to call it "lua-bit32". So it
> requires a bit of infra change to clean it up. Therefore, it'll take me a couple
> of days before I can submit.
>

We have already luarock packages which name is not prefixed by 'lua-'
: copas, cosmo, dado, orbit, rings, ...

Fran?ois

>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
