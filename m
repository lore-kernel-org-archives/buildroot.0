From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 May 2017 20:54:15 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-21
In-Reply-To: <20170522152255.7dkweqx25ohzcg7u@tarshish>
References: <20170522063013.3FE2A206ED@mail.free-electrons.com>
 <20170522120753.vebsgc6s2fz5fb6a@tarshish>
 <8E2EE25B-898A-4D7A-9936-BD2517D6D86A@openadk.org>
 <20170522152255.7dkweqx25ohzcg7u@tarshish>
Message-ID: <20170522175415.pcy3uykh7ycoh42b@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Mon, May 22, 2017 at 06:22:55PM +0300, Baruch Siach wrote:
> On Mon, May 22, 2017 at 04:14:28PM +0200, Waldemar Brodkorb wrote:
> > take a look here:
> > https://github.com/richfelker/musl-cross-make/blob/master/patches/gcc-6.3.0/0010-static-pie-support.diff
> 
> Thanks for the pointer.
> 
> I don't see this, or equivalent, patch in any gcc version that Buildroot 
> supports. Is this the right fix to the cifs-utils build failure?
> 
> diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
> index 152a3eeccf8a..ceedcf5de86f 100644
> --- a/package/cifs-utils/cifs-utils.mk
> +++ b/package/cifs-utils/cifs-utils.mk
> @@ -12,6 +12,8 @@ CIFS_UTILS_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
>  CIFS_UTILS_CONF_OPTS += --disable-pie
> +else ifeq ($(BR2_STATIC_LIBS),y)
> +CIFS_UTILS_CONF_OPTS += --disable-pie
>  endif
>  
>  ifeq ($(BR2_PACKAGE_KEYUTILS),y)

A more generic solution might be this, which is similar to what we do with 
uClibc-ng toolchains:

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 652c9d8c1df4..6aaf68bf6547 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -28,7 +28,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_SUPPORTS_PIE
+	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
 
 choice
 	prompt "Toolchain type"

baruch

> > > Am 22.05.2017 um 14:07 schrieb Baruch Siach <baruch@tkos.co.il>: 
> > >> On Mon, May 22, 2017 at 08:30:13AM +0200, Thomas Petazzoni wrote: 
> > >>      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/d19bcfcfb33cc5f5b082b97bbd5852d479823b97 |     
> > > 
> > > In commit 3c93901bcd2 (toolchain: add hidden symbol for PIE support) you 
> > > mentioned
> > > 
> > >  With musl toolchains you might have static PIE support with little
> > >  patching of gcc.
> > > 
> > > What patch of gcc do you refer to? Commit 3c93901bcd2 enables 
> > > BR2_TOOLCHAIN_SUPPORTS_PIE for musl toolchains unconditionally. But this 
> > > cifs-utils build failure indicates that there is still an issue with musl and 
> > > static PIE.
> > > 
> > > Any idea?

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
