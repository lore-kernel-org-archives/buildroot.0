From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Aug 2018 00:14:08 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <20180731205154.62967de8@windsurf>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
 <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
 <20180731205154.62967de8@windsurf>
Message-ID: <ea2ac147-3c9f-a85d-83ea-84f33a0d52e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-07-18 20:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 31 Jul 2018 20:12:29 +0200, David De Grave wrote:
> 
[snip]
>> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_boneblack"
>> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="../uboot.fragment"
>>
>> uboot.fragment:
>> CONFIG_MULTI_DTB_FIT=y
>> CONFIG_OF_LIST="am335x-boneblack"
[snip]
>> If I remove the uboot.fragment, all is building well up to the end.
>> Moreover, why do he use ./scripts/dtc/dtc ? It should use
>> $(HOST_DIR)/bin/dtc at the moment host-dtc is build, no ?
> 
> I think the optional dependency on host-dtc depends from a time where
> U-Boot did not have its own copy of DTC. I'm not sure it makes a lot of
> sense now.

 ... but we still want to support those older U-Boot versions, so we can't
remove it.

 Ideally, we should find out between which two versions it is needed, and
mention that in the help text.

> If U-Boot tries to use ./scripts/dtc/dtc, then it should have built it.
> If it didn't build it but tries to use it nonetheless, it sounds like a
> bug in U-Boot.

 Oh yes, now I see it, it's indeed a bug in U-Boot. CONFIG_OF_LIST should either
depend on CONFIG_OF_CONTROL or select it, otherwise dtc is not built.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
