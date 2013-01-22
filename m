From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 22 Jan 2013 23:56:56 +0100
Subject: [Buildroot] Question about Buildroot-Based External Toolchains
 with 2012.11.1
In-Reply-To: <9A206D81F45CAE4EB5A38D7E602F5AEA0B772447@TRANSXCH01.transcrypt.local>
References: <9A206D81F45CAE4EB5A38D7E602F5AEA0B772447@TRANSXCH01.transcrypt.local>
Message-ID: <CAHXCMM+tZ_BFH6ZkE1sAzaDbyb+0NH67COk1QG5bR=Eek=uKHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

2013/1/22 Will Bickford <WBickford@efji.com>:
> I'm confused by problems I'm seeing when deploying a pre-computed toolchain using Buildroot 2012.11.1 for both the target and the toolchain. Previously I've used the external toolchain feature from Buildroot 2010.05 without any problems.

Well, when using the external toolchain backend, the external
toolchain (from Code-Sourcery or any other organizations) is most
likely relocatable. Buildroot just builds some wrapper to make easier
its integration in the Buildroot infrastructure.

However, currently, with internal Buildroot toolchain backend, the
built toolchain is not relocatable.

>
> Related discussion:
> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/45427

This discussion deals with making relocatable a toolchain built using
internal Buildroot toolchain backend, to be able to use it as an
external one later (i.e. in another build configuration).

This is mainly for the autobuilders, to save some cpu time on those
machines, and help contributors to reproduce the build failures.

I think, in first thought, it was not intended at all to help
Buildroot users making their toolchains relocatable by hand (the
targeted users were the Buildroot maintainers), though it might help
anyone ;)

>
> It is unclear to me how I'm supposed to strip the usr/ directory from the toolchain archive. The naive approach (mentioned in the discussion linked above) results in a broken toolchain. Is there a documented way to resolve this problem?

The usr/ problem, afaik, only occurs with toolchains built using
internal Buildroot toolchain backend.

External toolchain typical layout:
./
|`+- bin/
|      `+- ...   # the crosstools running on the host
|`+- lib/
|      `+- ...   # the libraries used by the crosstools
`- <target>/  # anything for the target
       `- sysroot/
             |`+- lib/
             |  ...
              `+- include/

Buildroot toolchain layout:
./
 `+- usr/
       |`+- bin/
       |      `+- ...   # the crosstools running on the host
       |`+- lib/
       |      `+- ...   # the libraries used by the crosstools
       `- <target>/  # anything for the target
              `- sysroot/
                   |`+- lib/
                   |  ...
                    `+- include/


>
> Documentation:
> http://buildroot.uclibc.org/downloads/manual/manual.html#external-toolchain

This part of the manual is up-to-date.
So, if you choose to use an external toolchain and stick to the
documentation, I'm confident you'll find your way out. :)

Otherwise, don't hesitate to point out what is missing, unclear or
misleading in the doc, or ask for help.


BTW, I do have some patches explaining few things about what is
relocatable in Buildroot, what is not.
I just need some time to clean them up.


Regards,

-- 
Samuel
