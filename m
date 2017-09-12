From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Sep 2017 13:44:22 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: install all MIB files
In-Reply-To: <CAHfJR7jjCn8FdGqhKOq=7_pAgwObLNSQUdzzdbzOi+ijyvJLCw@mail.gmail.com>
References: <20170908134548.23645-1-julien.floret@6wind.com>
 <8d8bb3d5-6ea9-94b4-1a53-a57909b8bbc6@mind.be>
 <CAHfJR7jjCn8FdGqhKOq=7_pAgwObLNSQUdzzdbzOi+ijyvJLCw@mail.gmail.com>
Message-ID: <d60e9f05-f4d2-3927-ee7f-148d6db4c22c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-17 10:48, Julien Floret wrote:
> Hello Arnout,
> 
> 2017-09-12 1:08 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>
>>
>> On 08-09-17 15:45, Julien Floret wrote:
>>> Since commit be8e32d585f3 ("netsnmp: configurable MIB modules"),
>>> the list of MIB modules can be selected with a configuration option.
>>>
>>> However, there was still an hardcoded list of MIB files to exclude from
>>> the target filesystem.
>>> Since it is complicated to know which MIB files are necessary according
>>> to the configuration, let's install all of them.
>>>
>>> Cc: przemyslaw <przemyslaw.wrzos@calyptech.com>
>>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>> Signed-off-by: Julien Floret <julien.floret@6wind.com>
>>
>>  Looks good to me, except: shouldn't the default of
>> BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES so that all the previous BLOAT_MIBS are
>> there?
> 
> Hum, maybe we could parse
> BR2_PACKAGE_NETSNMP_{WITH,WITHOUT}_MIB_MODULES to deduce BLOAT_MIBS,
> but to me it does not seem trivial nor elegant...
> What about adding a new config option BR2_NETSNMP_WITHOUT_MIB_FILES
> whose default value is the content of BLOAT_MIBS?

 Let me rephrase my comment.

 What this patch does, basically, is to clean up the discrepancy between
BR2_PACKAGE_NETSNMP_{WITH,WITHOUT}_MIB_MODULES and BLOAT_MIBS. That is
absolutely a good thing.

 It looks to me like the current BLOAT_MIBS option is removing stuff that is
already disabled by the default value of
BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES. So that part is fine - your patch is
not actually changing anything in the default configuration.

 However, it looks to me like the current BLOAT_MIBS is also removing things
that are *not* included in the current default value of
BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES. Therefore, after this change, we end up
with a bigger rootfs (using defaults) than before.

 My suggestion is: wouldn't it make sense to extend the default value of
BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES? As far as I can see, the current
default removes DISMAN-EVENT and DISMAN-SCHEDULE already. Are there additional
modules we can disable, so that also BRIDGE DISMAN-SCRIPT EtherLike RFC-1215
RFC1155-SMI RFC1213 SCTP and SMUX are gone? And can we do this without loosing
functionality that we did have before?

 Probably extending BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES should be a separate
patch anyway.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
