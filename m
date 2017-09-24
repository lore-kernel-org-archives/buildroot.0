From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:34:07 +0200
Subject: [Buildroot] [PATCH] bash: fix static build
In-Reply-To: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
References: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
Message-ID: <84c95fdc-b9cf-4008-2e8e-5c158f74c983@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-09-17 20:30, Baruch Siach wrote:
> When building bash statically, configure does not initialize the
> SHOBJ_STATUS variable. The SHOBJ_STATUS make variable in
> examples/loadables/Makefile.in must resolve to either 'supported' or
> 'unsupported'. Otherwise, the install-$(SHOBJ_STATUS) target does not
> exist.
> 
> This leads to the following build failure:
> 
> make[2]: Entering directory '.../output/build/bash-4.4/examples/loadables'
> make[2]: *** No rule to make target 'install-', needed by 'install'.  Stop.
> make[2]: Leaving directory '.../output/build/bash-4.4/examples/loadables'
> Makefile:793: recipe for target 'install' failed
> 
> with the following defconfig:
> 
> BR2_arm=y
> BR2_STATIC_LIBS=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_BASH=y
> 
> Set SHOBJ_STATUS in the configure environment as a workaround.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Even though this doesn't fail the build (because the error is ignored), it's
pretty fragile. And SHOBJ_STATUS=unsupported is certainly correct for static
builds. So I applied after all.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
