From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 6 Dec 2019 01:22:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/bubblewrap: new package
In-Reply-To: <87pnh6puhv.fsf@dell.be.48ers.dk>
References: <20190920153106.2274596-1-aperez@igalia.com>
 <20190920153106.2274596-2-aperez@igalia.com>	<87pnh6puhv.fsf@dell.be.48ers.dk>
Message-ID: <20191206012259.GB1574913@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 02 Dec 2019 17:22:52 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > Bubblewrap is a sandboxing tool based on kernel namespaces, typically
>  > used as lower-level infastructure by other end-user tools e.g. Flatpak.
> 
>  > https://github.com/containers/bubblewrap
> 
>  > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
>  > ---
>  >  DEVELOPERS                         |  1 +
>  >  package/Config.in                  |  1 +
>  >  package/bubblewrap/Config.in       |  7 ++++++
>  >  package/bubblewrap/bubblewrap.hash |  5 ++++
>  >  package/bubblewrap/bubblewrap.mk   | 40 ++++++++++++++++++++++++++++++
>  >  5 files changed, 54 insertions(+)
>  >  create mode 100644 package/bubblewrap/Config.in
>  >  create mode 100644 package/bubblewrap/bubblewrap.hash
>  >  create mode 100644 package/bubblewrap/bubblewrap.mk
> 
>  > diff --git a/DEVELOPERS b/DEVELOPERS
>  > index 67a0fef088..bf23b3e1e7 100644
>  > --- a/DEVELOPERS
>  > +++ b/DEVELOPERS
>  > @@ -73,6 +73,7 @@ F:	package/jack1/
>  
>  >  N:	Adrian Perez de Castro <aperez@igalia.com>
>  >  F:	package/brotli/
>  > +F:	package/bubblewrap/
>  >  F:	package/cog/
>  >  F:	package/libepoxy/
>  >  F:	package/libwpe/
>  > diff --git a/package/Config.in b/package/Config.in
>  > index dbf297f4df..412ea1129f 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -2193,6 +2193,7 @@ menu "System tools"
>  >  	source "package/atop/Config.in"
>  >  	source "package/attr/Config.in"
>  >  	source "package/audit/Config.in"
>  > +	source "package/bubblewrap/Config.in"
>  >  	source "package/cgroupfs-mount/Config.in"
>  >  	source "package/circus/Config.in"
>  >  	source "package/coreutils/Config.in"
>  > diff --git a/package/bubblewrap/Config.in b/package/bubblewrap/Config.in
>  > new file mode 100644
>  > index 0000000000..a5220e3fd5
>  > --- /dev/null
>  > +++ b/package/bubblewrap/Config.in
>  > @@ -0,0 +1,7 @@
>  > +config BR2_PACKAGE_BUBBLEWRAP
>  > +	bool "bubblewrap"
>  > +	select BR2_PACKAGE_LIBCAP
> 
> It uses fork(), so it needs to depend on BR2_USE_MMU. It also uses
> TEMP_FAILURE_RETRY which isn't available on musl, so it should only be
> available for glibc/uclibc - Notice that 0.4.0 was recently released
> which according to the changelog fixes builds against musl.
> 
> Committed with these fixes, thanks.

\o/

I will post a follow patch updating to version 0.4.0 when I manage to get a
little bit of spare time, so we can support the package on Musl as well.

> I wonder what kernel namespacing options are required and/or
> recommended? For required options we should add logic in linux/linux.mk
> to enable them, and for optional/recommended options it would be good to
> mention them in the help text.

Mount namespaces are mandatory (I think those cannot be disabled in the kernel
config, I'll have to check to be sure), while User, IPC, PID, Network, and UTS
namespaces are optional. Side note: If User namespaces are enabled in the
kernel, we could avoid installing the ?bwrap? binary setuid root, is this
something desirable?

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191206/e9e4484d/attachment.asc>
