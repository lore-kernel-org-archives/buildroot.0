From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2011 19:09:02 +0200
Subject: [Buildroot] [PATCH] new package: minidlna
In-Reply-To: <0MLT3m-1QhakY2PJK-000gV0@mrelayeu.kundenserver.de>
References: <0MKxYi-1QcgdO2zs8-00018x@mrelayeu.kundenserver.de>
 <20110705230018.01be536a@skate>
 <0MLT3m-1QhakY2PJK-000gV0@mrelayeu.kundenserver.de>
Message-ID: <20110713190902.340179ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Wolfram,

Le Wed, 13 Jul 2011 18:59:40 +0200,
Wolfram Gloger <wg@malloc.de> a ?crit :

> > Your .mk file lists multiple dependencies, but your Config.in forgets
> > to "depends on" or "select" them.
> 
> Ok, thanks.  I suspect "depends on" is the correct one?

In general for dependencies on libraries, we use "select", because it's
not easy for an user to figure out all the libraries needed to enable
an application. Seeing the dependencies of minidlna, I think I would
use "select".

> > This patch uses STAGING_DIR
> > in several places, which makes the patch completely unsuitable for
> > upstream inclusion. Isn't there a way of making this a little bit more
> > generic so that there's at least a hope of getting this patch merged
> > upstream in the minidlna project ?
> 
> Why do you think this makes it completely unsuitable for upstream?
> _Some_ form of cross compile support needs to happen, and whether you
> call the base dir STAGING_DIR or anything else really shouldn't
> matter.  I was careful not to break anything generic in the patch, and
> keep it minimal.  Actually, I do intend to propose it for upstream.

STAGING_DIR isn't very standard. DESTDIR is probably more widespread,
as it is the variable used by autotools.

> BTW an autotools patch was proposed for minidlna some time ago,
> but it is of course much bigger and wasn't so far applied.

Ok.

> > In the .mk file, remove all useless commented lines.
> 
> I see only one, but ok.

Well, in:

+#MINIDLNA_INSTALL_STAGING = YES
+MINIDLNA_DEPENDENCIES = libav sqlite libid3tag jpeg libexif libogg libvorbis flac
+
+#
+define MINIDLNA_CONFIGURE_CMDS
+	(cd $(@D); rm -f config.h; \
+		BR2_DEFAULT_KERNEL_HEADERS=$(BR2_DEFAULT_KERNEL_HEADERS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		./genconfig.sh \
+	)
+endef
+
+#define MINIDLNA_INSTALL_TARGET_CMDS
+#endef

I see four useless commented lines.

> > Also remove the
> > 
> > +		BR2_DEFAULT_KERNEL_HEADERS=$(BR2_DEFAULT_KERNEL_HEADERS) \
> > 
> > line, which apparently is useless.
> 
> I'll try this.  Grepping I could not see where
> BR2_DEFAULT_KERNEL_HEADERS is automagically environment-exported to
> config scripts.

It is not automagically exported to the environment. I failed to see
that your patch makes use of it. This part is definitely not suitable
for upstream inclusion: BR2_ is a Buildroot specific prefix.

Unless I'm wrong, it is only used to find the OS_NAME and OS_VERSION.
I'd prefer to have the OS_NAME and OS_VERSION passed to the config
script by the Buildroot .mk file. You can hardcode OS_NAME=Linux and
OS_VERSION=2.6.

Any idea how OS_VERSION is used exactly by minidlna ?

> > Regarding the dependencies, is it directly minidlna that depends on
> > libvorbis, flac, libogg, etc. ? Or is it libav that depends on those ?
> 
> You have a good point there.  minidlna actually only uses av_open()
> and not any of the vorbis, flac, or ogg library entry points directly,
> AFAICS.  So I would say that this is another shortcoming in the
> minidlna config script.  Since libav has had native demuxers for
> ogg/vorbis and flac for a long time (there is a libvorbis option but
> that only enables an alternative encoder which is irrelevant for
> minidlna), I think the best solution is simply to get rid of these
> dependencies in minidlna.

Ok.

Thanks for your persistence. minidlna is indeed a very interesting
package to have in Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
