From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Apr 2018 17:53:25 +0200
Subject: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset
 variable in init script
In-Reply-To: <1990213039.2807.1523823774902.JavaMail.zimbra@datacom.ind.br>
References: <20180413162521.7078-1-casantos@datacom.ind.br>
 <20180413162521.7078-2-casantos@datacom.ind.br>
 <20180414180725.4964d59d@windsurf>
 <650761555.1610.1523806309320.JavaMail.zimbra@datacom.ind.br>
 <20180415201808.013e84f3@windsurf.numericable.fr>
 <20180415185828.GD21958@scaer>
 <1990213039.2807.1523823774902.JavaMail.zimbra@datacom.ind.br>
Message-ID: <eb2e030a-c7de-60e5-b92f-4c0eb02742f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-04-18 22:22, Carlos Santos wrote:
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
>> Cc: "Carlos Santos" <casantos@datacom.ind.br>, "buildroot" <buildroot@buildroot.org>, "Aleksander Morgado"
>> <aleksander@aleksander.es>, "Peter Korsgaard" <peter@korsgaard.com>, "Arnout Vandecappelle" <arnout@mind.be>
>> Sent: Sunday, April 15, 2018 3:58:28 PM
>> Subject: Re: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset variable in init script
> 
>> Thomas, All,
>>
>> On 2018-04-15 20:18 +0200, Thomas Petazzoni spake thusly:
>>> On Sun, 15 Apr 2018 12:31:49 -0300 (BRT), Carlos Santos wrote:
>>>>>> +MODEMMANAGER_BIN=/usr/sbin/ModemManager
>>>>>>  PIDFILE=/var/run/ModemManager.pid
>>>>>>  
>>>>>>  [ -x $MODEMMANAGER_BIN ] || exit 0
>>>>>
>>>>> In fact, I think this test doesn't make sense. It just exits without
>>>>> any error if the binary doesn't exists, which is silly.
>>>>>
>>>>> I'm advocating for removing such tests altogether, which would make the
>>>>> MODEMMANAGER_BIN variable unnecessary.
>>>>
>>>> I think the original purpose of these test was allowing the user to
>>>> disable the service by chmod'ing -x the executable file. We discussed
>>>> a similar situation in
>>>>
>>>>    https://patchwork.ozlabs.org/patch/818897/
>>>>
>>>> [which by the way is still in my endless to-do list]
>>>
>>> Well, if you look at my feedback on this patch, I was already saying
>>> that the test to check whether radvd was executable or not was not
>>> useful.
>>>
>>> I don't think making a binary program non-executable as a way of
>>> disabling its startup at boot time is very common. Probably a
>>> ENABLED=true/false variable in /etc/default/<service> is more common.
>>>
>>> So, I think we should remove all those [ -x /usr/sbin/<foo> ] checks in
>>> our init scripts.
>>>
>>> Cc'ing Peter, Arnout and Yann to gather additional opinions on this.
>>
>> I agree with Thomas.

 +1


>> This is a position we already stated quite a few times in the past.
>>
>> If one does not want the daemon, then just remove it and the init script
>> from a post-build script. If it is about debugging, just remove the
>> startup script on the target, or just 'exit 0' at the top of it.
> 
> So I will prepare a series removing the tests from the startup scripts.

 Well, part of the position we already stated a few times in the past is that we
should make our sysvinit scripts conform to a pattern. So I think the optimal
approach is:

1. Update the sysvinit scripts of one or two packages to conform to this
pattern. Note that we have not really discussed the actual pattern, just a few
preferences (e.g. don't test for the existence of the daemon). So it is
important to update only one or two scripts so we can get convergence on the
desired pattern, before updating many more packages.

2. Document this pattern in the manual. For me, it would be sufficient to refer
to an existing sysvinit script rather than repeating it in the manual.

3. Update more packages.

4. Add some support to check-package to identify common mistakes in the pattern.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
