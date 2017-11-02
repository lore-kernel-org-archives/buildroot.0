From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 02 Nov 2017 23:21:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <20171101105305.1cd82e60@windsurf>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf>
Message-ID: <59FB8C69.7050108@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

1.11.2017, 11:53, Thomas Petazzoni kirjoitti:
> Why does it bundle freetype? Can it use an external Freetype instead?
>>> +		   bzip2 license (bzip2), Zlib (zlib)
> The SPDX license code for bzip2 license is bzip2-1.0.5 or bzip2-1.0.6,
> see https://spdx.org/licenses/.
>
> Also, why does it bundle Zlib ?
I honestly have not the faintest idea why it want's to use it's own, 
bundled versions of bzip2,freetype2 and zlib.
On my 64-bit Intel box these are produced under lib directory:

libbzip2.a      libfontenc.a    librandr.a    libXau.a libxkb.a
libcomposite.a  libfreetype2.a  librender.a   libXdmcp.a libXNVCtrl.a
libdamage.a     libmain.a       libsha1.a     libXext-server.a libzlib.a
libdamageext.a  libmi.a         libsync.a     libxfixes.a
libdix.a        libos.a         libvnc.a      libXfont.a
libfb.a         libpixman.a     libvncauth.a  libXi.a

But then doing ldd for Xvnc binary gives this:
Xvnc:
         linux-vdso.so.1 (0x00007fffbbffe000)
         libturbojpeg.so.0 => /usr/lib64/libturbojpeg.so.0 
(0x00007f1d221b8000)
         libm.so.6 => /lib64/libm.so.6 (0x00007f1d21eba000)
         libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f1d21c9e000)
         libpam.so.0 => /lib64/libpam.so.0 (0x00007f1d21a90000)
         libdl.so.2 => /lib64/libdl.so.2 (0x00007f1d2188c000)
         libSM.so.6 => /usr/lib64/libSM.so.6 (0x00007f1d21683000)
         libICE.so.6 => /usr/lib64/libICE.so.6 (0x00007f1d21466000)
         libX11.so.6 => /usr/lib64/libX11.so.6 (0x00007f1d21124000)
         libXext.so.6 => /usr/lib64/libXext.so.6 (0x00007f1d20f12000)
         libc.so.6 => /lib64/libc.so.6 (0x00007f1d20b76000)
         /lib64/ld-linux-x86-64.so.2 (0x00007f1d2242b000)
         libuuid.so.1 => /lib64/libuuid.so.1 (0x00007f1d20971000)
         libbsd.so.0 => /usr/lib64/libbsd.so.0 (0x00007f1d2075b000)
         libxcb.so.1 => /usr/lib64/libxcb.so.1 (0x00007f1d20532000)
         librt.so.1 => /lib64/librt.so.1 (0x00007f1d2032a000)
         libXau.so.6 => /usr/lib64/libXau.so.6 (0x00007f1d20126000)
         libXdmcp.so.6 => /usr/lib64/libXdmcp.so.6 (0x00007f1d1ff20000)

So it builds a static versions of libXau.a libXdmcp.a for example, but 
then does not use them anyway in the final link but instead the system 
wide versions ?

I posted question to github if bzip2, freetype2 and zlib can be external 
dependencies or if they contain some TurboVNC specific stuff.

-S-
