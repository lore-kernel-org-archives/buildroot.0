From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Nov 2017 14:43:48 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171116072948.smctbcvxwkxgqoah@x230>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510> <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
Message-ID: <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-17 08:29, Petr Vorel wrote:
> Hi,
> 
> ...
>>> make[1]: *** No rule to make target 'toolchain-external-custom', needed by '.../build-prebuild-toolchain-001/build/toolchain-external/.stamp_configured'.  Stop.
>>> make: *** [Makefile:16: _all] Error 2
> 
>>> The error occurs  before the prebuild toolchain is downloaded/extracted...
> 
>>  That is really weird, the toolchain-external-custom dependencies should be
>> defined no matter what... Could you pastebin the output make 'make -qp' somewhere?
> Here it is:
> http://sipe.cz/buildroot/out.log (68M)
> http://sipe.cz/buildroot/out.log.tar.gz (9MB)

 Oh boy...

 The problem is that on Tumbleweed the order of inclusion seems to be different,
which causes toolchain-external-package not to be defined at the time that
toolchain-external-custom.mk is included (same for all other external toolchains).

Makefile:492:include toolchain/*/*.mk

This causes inclusion of
toolchain/toolchain-external/toolchain-external.mk:28:include
toolchain/toolchain-external/*/*.mk
and
toolchain/toolchain-external/pkg-toolchain-external.mk:592:toolchain-external-package
= ...

 If the *.mk is expanded in alphabetical order, pkg-toolchain-external.mk will
always come before toolchain-external.mk. Otherwise it is possible (depending on
the state of hash tables or inode numbers or whatever) that
toolchain-external-custom.mk gets included first.

 The short-term solution is of course $(sort $(wildcard ...))

 But for the long term, I think it's better to move pkg-*.mk to support/misc (or
maybe to support/make) and organise the order of inclusion from there.

 Any takers? Yann?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
