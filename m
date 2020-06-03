From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 4 Jun 2020 00:42:04 +0200
Subject: [Buildroot] [PATCH] Revert "package/prosody: use correct bit32
 package"
In-Reply-To: <CADvTj4qMYKh1CCqjeZaXcGvguHZbDFao8AXinQtr8LyFjFKmOA@mail.gmail.com>
References: <20200603215904.98199-1-romain.naour@gmail.com>
 <CADvTj4qMYKh1CCqjeZaXcGvguHZbDFao8AXinQtr8LyFjFKmOA@mail.gmail.com>
Message-ID: <281890da-6c1a-fcb5-0436-7d8cb8c1affa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Le 04/06/2020 ? 00:30, James Hilliard a ?crit?:
> On Wed, Jun 3, 2020 at 3:59 PM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> This reverts commit fa84c176c2148a60103e850204180f86aa5baa73 that
>> replace luabitop by lua_bit32 package when lua 5.1 is used.
>>
>> Since this change the prosody test in gitlab is fail due to
>> missing lua-bitops [1]:
>>
>> Starting prosody:
>> **************************
>> Prosody was unable to find lua-bitops
>> This package can be obtained in the following ways:
>>
>>     Source:           http://bitop.luajit.org/
>>     Debian/Ubuntu:    sudo apt-get install lua-bitop
>>     luarocks:         luarocks install luabitop
>>
>> WebSocket support will not be available
>> More help can be found on our website, at https://prosody.im/doc/depends
>> **************************
>>
>> The upstream documentation [2] is misleading (or not uptodate)
>> about lua-bit32 dependency.
>>
>> Since bitop is builtin since lua5.2, we probably need to select
>> luabitop package only when lua 5.1 is used as lua interpreter.
>>
>> Tested with run-tests:
>> ./support/testing/run-tests tests.package.test_prosody.TestProsodyLua51
>>
>> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/576271975
> Isn't this job failure just due to this faulty test?
> self.module_test('bit') # luabitop
> Which should be replaced with:
> self.module_test('bit32') # luabit32
> or something along those lines?

I'm not speaking about the test itself but the prosody log when it's started
"Prosody was unable to find lua-bitops"

Also the test is shared with luajit and the TestProsodyLuajit test is fine.

Best regards,
Romain

>> [2] https://prosody.im/doc/depends#bitop
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: James Hilliard <james.hilliard1@gmail.com>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> ---
>>  package/prosody/Config.in | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/prosody/Config.in b/package/prosody/Config.in
>> index 0b01547103..c32ca20e23 100644
>> --- a/package/prosody/Config.in
>> +++ b/package/prosody/Config.in
>> @@ -4,7 +4,7 @@ config BR2_PACKAGE_PROSODY
>>         depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>>         depends on !BR2_PACKAGE_LUA_5_3
>>         depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
>> -       select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 # runtime
>> +       select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
>>         select BR2_PACKAGE_LUAEXPAT # runtime
>>         select BR2_PACKAGE_LUASEC # runtime
>>         select BR2_PACKAGE_LUASOCKET # runtime
>> --
>> 2.25.4
>>
