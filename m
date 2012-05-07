From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 May 2012 16:36:05 +0200
Subject: [Buildroot] Globally disable PKG_CONFIG_PATH? [was: Re:
 Buildroot fails to build when selecting build packages]
In-Reply-To: <4F9D564A.8000602@mind.be>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <201204291144.26712.arnout@mind.be>
 <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
 <4F9D4BED.4050001@mind.be>
 <CAG6aBkVUgOkv5kvPZkY+YgysDQ274FdaW+0vtVU-Vk1rBudJZA@mail.gmail.com>
 <4F9D53B5.50705@mind.be>
 <CAG6aBkVL0pXYVJNsk7D4OONWM6-B6Uj7aD364j8nW-mH_5ijJA@mail.gmail.com>
 <4F9D564A.8000602@mind.be>
Message-ID: <20120507163605.2b3b5a27@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 29 Apr 2012 16:55:06 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   Buildroot devels: should we globally unset PKG_CONFIG_PATH with an
> 
> PKG_CONFIG_PATH =
> export PKG_CONFIG_PATH
> 
> in the top-level Makefile?
> 
>   Or should we add PKG_CONFIG_PATH="" to TARGET_CONFIGURE_OPTS?
> 
>   The former has the advantage that it also works for packages that 
> don't use TARGET_CONFIGURE_OPTS.  But I'm not sure if maybe we _want_ 
> host packages to use the system's PKG_CONFIG_PATH...

Well, for the moment, what we do is:

 (1) For target packages, we don't pass any PKG_CONFIG_PATH variable,
     because our host-pkg-config is hardcoded to search
     $(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig.
     However, having PKG_CONFIG_PATH in the environment will lead to
     pkg-config also searching in the paths listed in PKG_CONFIG_PATH
     before searching for the hardcoded paths.

 (2) For host packages: we only pass a PKG_CONFIG_LIBDIR variable,
     which overrides the default list of directories, but still comes
     in addition to the directories listed in the PKG_CONFIG_PATH
     variables (from a quick reading of pkg-config-0.25/main.c). Since
     we used PKG_CONFIG_LIBDIR, I guess our intention was to completely
     limit the search of .pc to the $(HOST_DIR) and not look inside the
     ones offered by the distribution. So if we want to preserve this
     behavior, we have do not something against the PKG_CONFIG_PATH
     being passed in the environment.

Therefore, in order to workaround environments where PKG_CONFIG_PATH is
set, we would have to pass PKG_CONFIG_PATH="" in both the host and
target package cases in order to get the desired effect.

Another solution is to add a check in
support/dependencies/dependencies.sh to verify that PKG_CONFIG_PATH is
not set, and otherwise abort and tell the user to do something about
this. Probably not as nice as the previous solution, though, but we
already do this for PERL_MM_OPT for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
