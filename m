From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 22 Sep 2014 09:38:29 +0200 (CEST)
Subject: [Buildroot] [PATCH] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <20140921200737.740f2bc0@free-electrons.com>
Message-ID: <1125534742.25538251.1411371509741.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> Dear J?r?my Rosen,
> 
> On Fri, 19 Sep 2014 09:13:51 +0200, J?r?my Rosen wrote:
> > the cmake detection script provided with cmake will first look for
> > a
> > binary called swig2.0 then for a binary called swig
> > 
> > swig-host only installs a binary called swig and gets overridden by
> > the
> > version installed by the host distro. This symlink prevents that
> > from
> > happening
> 
> I don't understand the explanation: if it looks for a binary called
> swig, then where's the need to create a swig2.0 symbolic link? How a
> binary in $(HOST_DIR)/usr/bin can get overridden by the version
> installed by the host distro?
> 

The line in FindSwig.mk (part of the cmake package, not swig package)

find_program(SWIG_EXECUTABLE NAMES swig2.0 swig)


This will look in PATH for

* an executable called "swig2.0"
* if it is not found, an executable called "swig"

so if there is a "swig2.0" in /usr/bin it will be used instead of the
one called "swig" in $(HOST_DIR)/usr/bin even if the PATH order says
otherwise.

currently, host-swig only installs $(HOST_DIR)/usr/bin/swig and the
debian package on my host only installs /usr/bin/swig2.0 thus the 
problem.


(Note that the separate bump of cmake changes the cmake line above to 
dealwith swig3.0 that has been updated since, but using 
$(MAJOR_VERSION) deals with it properly)


> The SoB line is missing.


OK

> 
> > diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> > index 5efc81c..233e97d 100644
> > --- a/package/swig/swig.mk
> > +++ b/package/swig/swig.mk
> > @@ -15,4 +15,10 @@ HOST_SWIG_CONF_OPT = \
> >  SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
> >  SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
> >  
> > +define SWIG_INSTALL_SYMLINK
> 
> Should be HOST_SWITCH_INSTALL_SYMLINK.
> 

OK

> I've marked your patch as "Changes requested" in patchwork.
> 

Ok, thx, I'll fix all that, rebase and resubmit

Thx for the review

> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
