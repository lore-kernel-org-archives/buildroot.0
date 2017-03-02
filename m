From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Mar 2017 00:02:10 +0100
Subject: [Buildroot] [PATCH 15/25] luaposix: fix runtime by selecting
 "bit32" instead of "bitop"
In-Reply-To: <20170302232826.55b1db07@free-electrons.com>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-16-arnout@mind.be>
 <20170302232826.55b1db07@free-electrons.com>
Message-ID: <25eb5bcb-aa36-d950-2e6e-b04723274296@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-03-17 23:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Feb 2017 18:00:37 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> Since the bump of luaposix to 33.4.0, it doesn't work anymore at
>> runtime with LuaJIT or Lua 5.1. This can be tested with the following
>> defconfig:
>>
>> BR2_x86_64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_LUA=y
>> BR2_PACKAGE_LUA_5_1=y
>> BR2_PACKAGE_LUAPOSIX=y
>>
>> /usr/bin/lua: /usr/share/lua/5.1/posix/init.lua:17: module 'bit32' not found:
>> ...
>>
>> In older luaposix versions, it would try to load the 'bit' instead of
>> 'bit32' module if LUAVER == 5.1. However, this feature was removed in
>> 33.4.0.
>>
>> So instead of adding a runtime dependency on luabitop, depend on
>> lua-bit32.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Now that I think more about this, I believe PATCH 14/25 and 15/25
> should be merged into the LTS branch, since they fix a runtime issue
> with Lua.
> 
> I believe even though they show up as patches 14 and 15 in the series,
> they don't depend on any of the previous patches.

 Indeed, I intentionally created the lua-bit32 package first without all the
niceties in the luarocks-package infra, and then factored the complexity in the
infra, to make it easy to apply only the fix and not the refactoring.

 Actually, for my customer I just applied the lua-bit32 patch (in a
BR2_EXTERNAL) and it is selected manually, so I am sure it works like that.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
