From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Jun 2017 11:25:51 +0200
Subject: [Buildroot] [FYI 2/2] WIP:qt5: Bump up to 5.9
In-Reply-To: <09654530-e03b-bcfd-0e52-1be644792111@melcoinc.co.jp>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
 <1cc8737a-4ecd-5aa7-2a2e-628cea1e6652@melcoinc.co.jp>
 <20170629213647.020e3fb0@gmx.net>
 <09654530-e03b-bcfd-0e52-1be644792111@melcoinc.co.jp>
Message-ID: <4d0a7e96-00c8-4234-9174-f584aeda7844@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 04:24, Naoki Matsumoto wrote:
> Hello Peter
> 
> Thank you for comments.
> 
> On 2017/06/30 4:36, Peter Seiderer wrote:
>> Hello Naoki,
>>
>> On Wed, 28 Jun 2017 16:42:42 +0900, Naoki Matsumoto
>> <n-matsumoto@melcoinc.co.jp> wrote:
>>
>>> Qt5.9 is LTS.
>>> Dependences: pcre2
>>>
>>> Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
>>> ---
>>>   package/qt5/Config.in            | 11 +++++++++++
>>>   package/qt5/qt5.mk               |  6 ++++++
>>>   package/qt5/qt5base/qt5base.hash |  3 +++
>>>   package/qt5/qt5base/qt5base.mk   |  7 +++++++
>>>   4 files changed, 27 insertions(+)
>>>
>>> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
>>> index 04dccea..a6fc307 100644
>>> --- a/package/qt5/Config.in
>>> +++ b/package/qt5/Config.in
>>> @@ -50,6 +50,17 @@ comment "Latest Qt version needs host/toolchain w/ gcc >=
>>> 4.8"
>>>       depends on !BR2_ARM_CPU_ARMV4
>>>       depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
>>>   +config BR2_PACKAGE_QT5_VERSION_5_9
>>> +        bool "LTS (5.9)"
>>> +        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>>> +        depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
>>> +        depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
>>> +        # no built-in double-conversion support
>>> +        depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
>>> +        help
>>> +          This option builds Qt 5.9, which is licensed under
>>> +          (L)GPL-3.0+.
>>> +
>>
>> No need to keep 5.8, just replace _LATEST...
> 
> I think so too.
> If qt5.10 release, we add BR2_PACKAGE_QT5_VERSION_5_9.

 That's actually still to be decided... The main reason we keep 5.6 is because
5.7 introduced a licensing change that may be unacceptable for some users. We
generally want to avoid multiple versions.

> 
>> Missing 'select BR2_PACKAGE_PCRE2'...
> I don't need 'select BR2_PACKAGE_PCRE2'
> because,
> 1. It is not wrote `select BR2_PACKAGE_PCRE` now.
> 2. qt5base.mk is wrote `QT5BASE_DEPENDENCIES += pcre2`
> 
> I think better that we write it to qt5base/Config.in If add `select
> BR2_PACKAGE_PCRE2`.

 Indeed, there in fact is a select pcre2 in qt5base/Config.in:

package/qt5/qt5base/Config.in:  select BR2_PACKAGE_PCRE
package/qt5/qt5base/Config.in:  select BR2_PACKAGE_PCRE_16
package/qt5/qt5base/Config.in:  select BR2_PACKAGE_PCRE_UTF

 Is the _16 not needed with pcre2 anymore?

[snip]
>>
>> Next step would be to bump all remaining 22 sub modules...
>> Thanks for your effort...
> Oh... That's right. we want to change *.hash and some *.mk.

 Which is probably why you wrote "I can't modify and cleanup.because, I'm busy." :-)

 Peter, would you like to take over this series and clean it up?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
