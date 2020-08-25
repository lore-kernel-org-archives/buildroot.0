From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 21:27:40 +0200
Subject: [Buildroot] [git commit] package/patchelf: keep RPATH entries
 even without DT_NEEDED libraries
In-Reply-To: <20200825161659.GE2246@scaer>
References: <20200825110428.40F71815AF@busybox.osuosl.org>
 <20200825161659.GE2246@scaer>
Message-ID: <20200825212740.46eabe58@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Aug 2020 18:16:59 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > -+            if (!libFoundInRPath(canonicalPath, neededLibs, neededLibFound)) {
> > -+                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
> > -+                      dirName.c_str());
> > -+                continue;  
> 
> I'd rather that we keep that as a warning, because in some cases it
> really is an error to keep an RPATH with no DT_NEEDED.
> 
>     debug("keeping directory %s in RPATH, even though it contains no needed library\n", dirName.c_str())

Such debug() messages are not even printed by default, only when you
pass --debug to patchelf. So essentially in the context of Buildroot,
those messages would never be seen. With that information, does it
still make sense ?

Also, it would IMO still be wrong to output a warning. Having a RPATH
to resolve dlopen() library paths is a perfectly valid and legitimate
situation, there is nothing to warn about. Excessive warnings make
warnings useless I believe.

See the dlopen() man page where they explain how dlopen() behaves when
the library path doesn't start with a /.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
