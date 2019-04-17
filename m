From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 17 Apr 2019 23:29:23 +0200
Subject: [Buildroot] [PATCH] package/madplay: fix build failure due to
 old autotools macro
In-Reply-To: <60d7cc47-7ec7-22df-d10c-07f073db5cc5@mind.be>
References: <20190416102125.124084-1-giulio.benetti@micronovasrl.com>
 <20190416221315.74b4c9c9@windsurf>
 <75d9fba9-15ff-695a-6347-550bf26488c6@micronovasrl.com>
 <dad71699-7fd9-c7a0-03a7-80352426dcc0@micronovasrl.com>
 <60d7cc47-7ec7-22df-d10c-07f073db5cc5@mind.be>
Message-ID: <334a62df-11d0-adc9-49dd-3420f67a759e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Il 17/04/2019 22:04, Arnout Vandecappelle ha scritto:
> 
> 
> On 17/04/2019 14:45, Giulio Benetti wrote:
>> Hello Thomas,
>>
>> Il 16/04/2019 23:47, Giulio Benetti ha scritto:
>>> Hello Thomas,
>>>
>>> Il 16/04/2019 22:13, Thomas Petazzoni ha scritto:
>>>> On Tue, 16 Apr 2019 12:21:25 +0200
>>>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>>>
>>>>> MKINSTALLDIRS is not automatically called by autotools when
>>>>> autoreconfigured.
>>>>> This leads to have install stage error:
>>>>> `/bin/sh @MKINSTALLDIRS@
>>>>> /home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
>>>>> /bin/sh: 0: Can't open @MKINSTALLDIRS@`
>>>>> because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.
>>>>>
>>>>> Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
>>>>> every @MKINSTALLDIRS@ occurence in *.in Makefile.
>>>>>
>>>>> Fixes:
>>>>> http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/
>>>>>
>>>>>
>>>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>>>
>>>> Why is this package suddenly failing to build ? madplay hasn't been
>>>> updated recently, so why do we have build failures and not before ?
>>>
>>> MKINSTALLDIRS is very obsolete, but Autoconf and Automake are the same
>>> version since 2017 and 2018, so they're not the problem even if I
>>> thought they were.
>>> First failure is dated 14-04-2019.
>>
>> Found, it is due to this patch:
>> https://git.buildroot.net/buildroot/commit/?id=c05cc5de868cc5af27afdb1451e30fcd1ecb2856
> 
>   That commit was applied to master on Feb 15. However, the autobuilder errors
> started on April 14. (There were also a number of autobuild errors in February,
> but they were different errors and they were fixed.)
> 
>   So no, that doesn't explain it.
> 
>   What does explain it, however, is that NLS was only enabled in the autobuilders
> since commit 472e8808d928af9787abd3303fb0b2b4d5916946 which I applied on April 14.
> 
>   The thing is, all the @MKINSTALLDIRS@ things are under a condition like
> 
> if test "$(PACKAGE)" = "gettext-tools"; then
> 
> except for one, which is unconditional but is part of the rule
> 
> install-data-yes: all
>          $(mkinstalldirs) $(DESTDIR)$(datadir)
> 
> and this rule only gets triggered by
> 
> install-data: install-data- at USE_NLS@
> 
> and obviously USE_NLS = yes only if NLS is enabled.
> 
>   So, that explains why this issue appears only now. Therefore, I've applied to
> master (after modifying the comment). I've also reworked the commit log a little.

So as we've discussed in IRC, to summarize:
- AUTORECONF = yes exposed potential build error(install specifically), 
but autobuilders still didn't call Makefile install-data recipe(where 
error was)
then:
- you've applied a patch to autobuilders that enabled NLS support, this 
way Makefile install-data recipe started to get called and then build failed

Thank you for the deep explanation.

Kind regards
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
> 
>> It sets MADPLAY_AUTORECONF = YES in madplay.mk
>>
>> Then "autoreconf" is called and this is why @MKINSTALLDIRS@ is not substituted
>> correctly, due to obsolescence of MKINSTALLDIRS macro.
>>
>> I hope I've explained it decently.
>>
>>>> Isn't the build failure related to the switch from gettext-gnu to
>>>> gettext-tiny ?
>>>
>>> .config has "gettext-gnu" not "gettext-tiny", so that doesn't seem the
>>> problem.
>>> I try to dig deeper.
>>>
>>> Best regards
>>>
>>
>> Best regards
