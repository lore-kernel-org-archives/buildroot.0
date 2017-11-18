From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Nov 2017 22:22:50 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
Message-ID: <20171118222250.4f4e8e3d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Thu, 16 Nov 2017 14:43:48 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 16-11-17 08:29, Petr Vorel wrote:
> > Hi,
> > 
> > ...  
> >>> make[1]: *** No rule to make target 'toolchain-external-custom', needed by '.../build-prebuild-toolchain-001/build/toolchain-external/.stamp_configured'.  Stop.
> >>> make: *** [Makefile:16: _all] Error 2  
> >   
> >>> The error occurs  before the prebuild toolchain is downloaded/extracted...  
> >   
> >>  That is really weird, the toolchain-external-custom dependencies should be
> >> defined no matter what... Could you pastebin the output make 'make -qp' somewhere?  
> > Here it is:
> > http://sipe.cz/buildroot/out.log (68M)
> > http://sipe.cz/buildroot/out.log.tar.gz (9MB)  
> 
>  Oh boy...
> 
>  The problem is that on Tumbleweed the order of inclusion seems to be different,
> which causes toolchain-external-package not to be defined at the time that
> toolchain-external-custom.mk is included (same for all other external toolchains).
> 
> Makefile:492:include toolchain/*/*.mk
> 
> This causes inclusion of
> toolchain/toolchain-external/toolchain-external.mk:28:include
> toolchain/toolchain-external/*/*.mk
> and
> toolchain/toolchain-external/pkg-toolchain-external.mk:592:toolchain-external-package
> = ...
> 
>  If the *.mk is expanded in alphabetical order, pkg-toolchain-external.mk will
> always come before toolchain-external.mk. Otherwise it is possible (depending on
> the state of hash tables or inode numbers or whatever) that
> toolchain-external-custom.mk gets included first.
> 
>  The short-term solution is of course $(sort $(wildcard ...))

Your investigation seems to be right, the following patch fixes it for me (no
32-bit support installed yet, but the cross compiler is extracted and I get
the 'Cannot execute cross-compiler' error message again):

diff --git a/Makefile b/Makefile
index 55409b99af..9d9737332d 100644
--- a/Makefile
+++ b/Makefile
@@ -483,13 +483,13 @@ include system/system.mk
 include package/Makefile.in
 # arch/arch.mk.* must be after package/Makefile.in because it may need to
 # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
--include $(wildcard arch/arch.mk.*)
+-include $(sort $(wildcard arch/arch.mk.*))
 include support/dependencies/dependencies.mk
 
 PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
 
-include toolchain/*.mk
-include toolchain/*/*.mk
+include $(sort $(wildcard toolchain/*.mk))
+include $(sort $(wildcard toolchain/*/*.mk))
 
 # Include the package override file if one has been provided in the
 # configuration.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 48de1e71f2..dd07884c7e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -25,4 +25,4 @@ $(error No prefix selected for external toolchain package $(BR2_PACKAGE_PROVIDES
 endif
 endif
 
-include toolchain/toolchain-external/*/*.mk
+include $(sort $(wildcard toolchain/toolchain-external/*/*.mk))

Regards,
Peter

> 
>  But for the long term, I think it's better to move pkg-*.mk to support/misc (or
> maybe to support/make) and organise the order of inclusion from there.
> 
>  Any takers? Yann?
> 
>  Regards,
>  Arnout
> 
