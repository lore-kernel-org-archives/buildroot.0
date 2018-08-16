From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Aug 2018 17:50:34 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <20180815141838.0a83993c@windsurf>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
 <20180814162130.00f55418@windsurf> <20180814152743.GJ7915@scaer>
 <ea46788a-f814-7fc8-b9dd-1ce97a59546c@mind.be>
 <20180815141838.0a83993c@windsurf>
Message-ID: <afed53a2-8711-f927-31c7-8d84caa7b541@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/08/2018 14:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 15 Aug 2018 00:50:42 +0200, Arnout Vandecappelle wrote:
[snip]
> I'd prefer to see:
> 
>   LINUX_KCONFIG_DEPENDENCIES = $(BR2_FLEX_HOST_DEPENDENCY) $(BR2_BISON_HOST_DEPENDENCY)
> 
> And the usual logic in support/dependencies/ to check for bison/flex.
> This will avoid disrupting all existing setups, and still provide the
> speed-up that we don't need to build flex/bison when doing "make
> linux-menuconfig".

 +1. It also makes it easy to add the feature "build flex is system version is
not OK" later.


>>> For the linux kernel and other kconfig-based packages, we don't care
>>> which flex/bison are used, because the resulting binaries are not
>>> installed, unless those packages also generate code eventually installed
>>> in host/, staging/ or target/  
>>
>>  Note that this means you'll still need host-flex/bison for the kernel, because
>> the kernel may build dtc and that gets installed in host...
> 
> Are you sure flex/bison are used when building the DTC copy in the
> Linux kernel ? Indeed we only added host-bison/host-flex as
> dependencies of linux in commit
> 1b9faedf32be26d9c983c573ccd98f57fc6f6569, when kconfig stopped shipping
> its pre-generated files. How could DTC be built before
> 1b9faedf32be26d9c983c573ccd98f57fc6f6569 if it required bison/flex ?

 The shipped files for DTC were removed in
e039139be8c25145b103ab365ff1bd4a540066a3 which is v4.17-rc1~106^2~8^2~2 (while
the kconfig stuff was removed in 29c833061c1d8c2d1d23a62e7061561eadd76cdb which
is v4.16-rc1~105^2~26). So we already had the dependencies when the shipped DTC
files were removed from the kernel. And as Yann said, they're not needed for
kconfig itself, only for building.

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
