From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Aug 2018 00:50:42 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <20180814152743.GJ7915@scaer>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
 <20180814162130.00f55418@windsurf> <20180814152743.GJ7915@scaer>
Message-ID: <ea46788a-f814-7fc8-b9dd-1ce97a59546c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-18 17:27, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-08-14 16:21 +0200, Thomas Petazzoni spake thusly:
>> On Fri,  3 Aug 2018 22:16:55 +0200, Yann E. MORIN wrote:
>>> Take this opportunity to also drop the append-assignment as the first
>>> assignment to LINUX_DEPENDENCIES.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>
>> I am a bit confused. In this series, you suggest to make
>> host-flex/host-bison dependencies of the configuration step of Linux.
>> But in another series
>> (http://patchwork.ozlabs.org/project/buildroot/list/?series=59260), you
>> suggest to make flex/bison hard requirements of Buildroot, so that we
>> don't have to build them.
>>
>> Could you clarify in which direction you would like to go ?
> 
> This very series is about solving a technical problem, that
> kconfig-based packages may have dependencies required even before
> running the configurators.
> 
> On the other hand, that other series is about changing our requirements.
> 
> If we decide to require flex+bison, so in this series, only patch 2 can
> be dropped.
> 
>> Also, if we
>> make bison/flex hard requirements of Buildroot, I'd like to have a
>> clear rule on whether we keep or not our host-bison/host-flex packages,
>> and if we keep them, when they should be used vs. when the system
>> bison/flex should be used.
> 
> My position is that we will always want to have our host flex and bison
> to build packages that install things in host/, in staging/ or in
> target/.

 My position is that we do indeed need our host flex and bison for everything
installed in target/ (which implies everything installed in staging/), but not
for things installed in host/. We definitely need it for BR2_REPRODUCIBLE.

 It would also be nice if dependencies.sh could do a version check and accept
the system flex/bison if it is the right version, like we do for cmake and tar.

 But both of these wishes make things more complicated, so I'm OK with just
keeping all current host-flex/bison dependencies.


> For the linux kernel and other kconfig-based packages, we don't care
> which flex/bison are used, because the resulting binaries are not
> installed, unless those packages also generate code eventually installed
> in host/, staging/ or target/

 Note that this means you'll still need host-flex/bison for the kernel, because
the kernel may build dtc and that gets installed in host...

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
