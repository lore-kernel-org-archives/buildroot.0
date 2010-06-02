From: Holger <ltsp@webers-web.net>
Date: Wed, 02 Jun 2010 19:00:27 +0200
Subject: [Buildroot] libxml2 / gzopen64
In-Reply-To: <20100601212904.0f0ff917@surf>
References: <1275407041.2737.13.camel@HellDesk.zuhause.net>
	<20100601212904.0f0ff917@surf>
Message-ID: <1275498027.2711.39.camel@HellDesk.zuhause.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx,

that seems to work :-)

Am Dienstag, den 01.06.2010, 21:29 +0200 schrieb Thomas Petazzoni:
> Hello,
> 
> On Tue, 01 Jun 2010 17:44:01 +0200
> Holger <ltsp@webers-web.net> wrote:
> 
> > error: /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2:
> > undefined symbol: gzopen64
> 
> Ok, thanks to the build log you sent to me (BTW, why didn't you send
> the link to the list, so that others could have a look too), I could
> understand a few things.
> 
> The thing is that host-libxml2 detects that zlib is available on your
> host, even if we haven't built host-zlib yet. This is because zlib is
> installed on your development system.
> 
> Something must be odd with the zlib library that you have installed on
> your system. Which distribution/version are you using ? Which version
> of zlib ? By any chance, don't you have two copies of zlib, one
> in /usr/lib, one in /usr/local/lib ?
> 
> Anyway, Buildroot is supposed to be independent from the host system,
> so it should rely on the host zlib to work. As I think we don't need
> zlib support in the host libxml2 that we build, something like the
> following patch should fix the problem. Can you test and report ?
> 
> Thanks!
> 
> Thomas
> 
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 3a3e007..11b946e 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -26,7 +26,7 @@ HOST_LIBXML2_DEPENDENCIES = host-pkg-config
>  
>  HOST_LIBXML2_CONF_OPT = \
>                 --enable-shared --without-debugging --without-python \
> -               --without-threads
> +               --without-threads --without-zlib
>  
>  $(eval $(call AUTOTARGETS,package,libxml2))
>  $(eval $(call AUTOTARGETS,package,libxml2,host))
> 
> 
