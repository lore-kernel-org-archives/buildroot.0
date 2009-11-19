From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 19 Nov 2009 23:24:52 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
 by webkit)
In-Reply-To: <20091115123925.0649e537@surf>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
	<20091115123925.0649e537@surf>
Message-ID: <1258669493.24296.100.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I did had some problem with fontconfig :

>>> fontconfig 2.6.0 Extracting
>>> fontconfig 2.6.0 Patching package/fontconfig

Applying fontconfig-2.6.0-parallel-compilation-fix.patch using plaintext: 
patching file fc-case/Makefile.am

Applying fontconfig-2.6.0-use_for_build.patch using plaintext: 
patching file fc-arch/Makefile.am
patching file fc-case/Makefile.am
patching file fc-glyphname/Makefile.am
patching file fc-lang/Makefile.am
/bin/sh: -c: line 0: Erreur de syntaxe pr?s du symbole inattendu ? @echo ?
/bin/sh: -c: line 0: `(for file in config.guess config.sub; do for i in ; do cp package/gnuconfig/ile ; done; done) 	@echo ">>>   "Autoreconfiguring""'
make: *** [/home/djdeath/src/buildroot/buildroot_rebase/output/build/fontconfig-2.6.0/.stamp_patched] Erreur 2


The following patch fix the problem, but I don't understand why...
Any idea ?

->>>>>

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index f039903..ebe8299 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -107,6 +107,7 @@ define UPDATE_CONFIG_HOOK
                        cp package/gnuconfig/$$file $$i; \
                done; \
        done)
+
 endef
 
 ifeq ($(BR2_UPDATE_CONFIG),y)

<<<<<-

Le dimanche 15 novembre 2009 ? 12:39 +0100, Thomas Petazzoni a ?crit :
> Hi Lionel,
> 
> Le Sun, 15 Nov 2009 11:12:53 +0100,
> llandwerlin at gmail.com a ?crit :
> 
> >  $(eval $(call AUTOTARGETS,package,flex))
> > +$(eval $(call AUTOTARGETS,package,flex,host))
> 
> Thanks for using so quickly the new autotools infrastructure! Have you
> been able to use it with success ?
> 
> However, please note that if you depend on this new infrastructure,
> your patches will not be integrated in the upcoming 2009.11 release,
> because the new infrastructure is post-2009.11 material.
> 
> Sincerly,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
