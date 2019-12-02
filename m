From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 17:22:52 +0100
Subject: [Buildroot] [PATCH 1/3] package/bubblewrap: new package
In-Reply-To: <20190920153106.2274596-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 20 Sep 2019 18:31:04 +0300")
References: <20190920153106.2274596-1-aperez@igalia.com>
 <20190920153106.2274596-2-aperez@igalia.com>
Message-ID: <87pnh6puhv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Bubblewrap is a sandboxing tool based on kernel namespaces, typically
 > used as lower-level infastructure by other end-user tools e.g. Flatpak.

 > https://github.com/containers/bubblewrap

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  DEVELOPERS                         |  1 +
 >  package/Config.in                  |  1 +
 >  package/bubblewrap/Config.in       |  7 ++++++
 >  package/bubblewrap/bubblewrap.hash |  5 ++++
 >  package/bubblewrap/bubblewrap.mk   | 40 ++++++++++++++++++++++++++++++
 >  5 files changed, 54 insertions(+)
 >  create mode 100644 package/bubblewrap/Config.in
 >  create mode 100644 package/bubblewrap/bubblewrap.hash
 >  create mode 100644 package/bubblewrap/bubblewrap.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 67a0fef088..bf23b3e1e7 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -73,6 +73,7 @@ F:	package/jack1/
 
 >  N:	Adrian Perez de Castro <aperez@igalia.com>
 >  F:	package/brotli/
 > +F:	package/bubblewrap/
 >  F:	package/cog/
 >  F:	package/libepoxy/
 >  F:	package/libwpe/
 > diff --git a/package/Config.in b/package/Config.in
 > index dbf297f4df..412ea1129f 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -2193,6 +2193,7 @@ menu "System tools"
 >  	source "package/atop/Config.in"
 >  	source "package/attr/Config.in"
 >  	source "package/audit/Config.in"
 > +	source "package/bubblewrap/Config.in"
 >  	source "package/cgroupfs-mount/Config.in"
 >  	source "package/circus/Config.in"
 >  	source "package/coreutils/Config.in"
 > diff --git a/package/bubblewrap/Config.in b/package/bubblewrap/Config.in
 > new file mode 100644
 > index 0000000000..a5220e3fd5
 > --- /dev/null
 > +++ b/package/bubblewrap/Config.in
 > @@ -0,0 +1,7 @@
 > +config BR2_PACKAGE_BUBBLEWRAP
 > +	bool "bubblewrap"
 > +	select BR2_PACKAGE_LIBCAP

It uses fork(), so it needs to depend on BR2_USE_MMU. It also uses
TEMP_FAILURE_RETRY which isn't available on musl, so it should only be
available for glibc/uclibc - Notice that 0.4.0 was recently released
which according to the changelog fixes builds against musl.

Committed with these fixes, thanks.

I wonder what kernel namespacing options are required and/or
recommended? For required options we should add logic in linux/linux.mk
to enable them, and for optional/recommended options it would be good to
mention them in the help text.

-- 
Bye, Peter Korsgaard
