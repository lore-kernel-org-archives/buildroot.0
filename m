From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 14 May 2019 23:45:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5sensors: disable on
 microblaze with gcc < 8
In-Reply-To: <e64ec143-a98a-0c59-d410-6542763e1272@mind.be>
References: <20190514201443.24645-1-fontaine.fabrice@gmail.com>
 <e64ec143-a98a-0c59-d410-6542763e1272@mind.be>
Message-ID: <0722b25d-70ef-166d-3575-d1757a7a6e82@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Il 14/05/2019 23:34, Arnout Vandecappelle ha scritto:
> 
> 
> On 14/05/2019 22:14, Fabrice Fontaine wrote:
>> Fixes:
>>   - http://autobuild.buildroot.org/results/3ba494a3341301cb71d1346aefc28f884479f912
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>   package/qt5/qt5sensors/Config.in | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
>> index 4846a3f95f..488027875b 100644
>> --- a/package/qt5/qt5sensors/Config.in
>> +++ b/package/qt5/qt5sensors/Config.in
>> @@ -1,5 +1,7 @@
>>   config BR2_PACKAGE_QT5SENSORS
>>   	bool "qt5sensors"
>> +	# internal compiler error: in do_output_reload, at reload1.c:7978
>> +	depends on !BR2_microblaze || BR2_TOOLCHAIN_GCC_AT_LEAST_8
> 
>   So, apparently, there are tons of failures and timeouts (e.g. [1]) for
> microblaze that are fixed with GCC 8.
> 
>   Since microblaze is kind of niche anyway, can't we just globally require GCC 8
> for microblaze?

That could be an idea.
Anyway tomorrow I would like to try to find if there is a common bug in 
toolchain.

What I've found at the moment(today I had very few time) is that:
- atop compiles c files and works ok without -g2/3
- flare-engine compiles c++ files and doesn't seem to work at all(but 
need to repeat buildings)

and these packages need to be tested:
- boost
- gst-ffmpeg
- glibmm
- qt5sensors(added now)

The only chance is that C and CXX behave in the same way,
so I can treat them with different patches.

Otherwise your solution would be the best one IMHO.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

>   Regards,
>   Arnout
> 
> 
> [1] http://autobuild.buildroot.net/results/94aa00f776b8a3491ac0b3212c95f5e666c5a29a
> 
> 
> 
>>   	select BR2_PACKAGE_QT5BASE
>>   	help
>>   	  Qt is a cross-platform application and UI framework for
>>
