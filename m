From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 10:15:48 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <20170705073807.GF3499@scaer>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net> <20170705072538.GE3499@scaer>
 <20170705073807.GF3499@scaer>
Message-ID: <ec76e925-ea4b-32d2-35f0-ec04537f6584@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 09:38, Yann E. MORIN wrote:
> Markus, All,
> 
> On 2017-07-05 09:25 +0200, Yann E. MORIN spake thusly:
>> On 2017-07-04 16:54 -0700, Markus Mayer spake thusly:
>>> From: Markus Mayer <mmayer@broadcom.com>
>>>
>>> The Linux tools master makefile (linux-tools.mk) must be included after
>>> all Linux tools sub-makefiles (linux-tool-*.mk). This is currently
>>> ensured by sorting all package makefiles alphabetically.
>>>
>>> In preparation for adding linux-tool-tmon, we cannot keep relying on
>>> this mechanism. In the C locale, linux-tool-tmon.mk will be sorted
>>> behind linux-tools.mk, which would break the build.
> [--SNIP--]
>> However, I am totally in favour of fixing it once and for all.
>>
>> But rather than do a hack in the main Makefile as you suggest, I would
>> just ensure the ordering of the files.
>>
>> I think we should just rneame the individual tool files to remove
>> the .mk extension, and then exp[licitly source them from
>> package/linux-tools/linux-tools.mk
>>
>>     include $(wildcard package/linux-tools/linux-tool-*)
>>
>> and be done with that once and for all.
> 
> But don't hurry in doing so, we've been discussing this IRL with Thomas,
> and he is not happy with that proposal (but he agrees that touching the
> main Makefile is not acceptable).
> 
> We're looking to find an alternative solution...

 The proposal is to move all the linux-tool-*.mk files to subdirectories of
package/linux-tools, and include them from the linux-tool.mk file at the
appropriate place. This is more in-line with how we do it for other packages,
e.g. qt5 or barebox. Ideally, the Config.in would also be split up into the
individual subpackages.

 Could you prepare a patch for that?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
