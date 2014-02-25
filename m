From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 08:15:32 +0100
Subject: [Buildroot] Analysis of VLC build failures
In-Reply-To: <20140223110021.16b6b976@skate>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
Message-ID: <530C4314.4000203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/14 11:00, Thomas Petazzoni wrote:
>>    aarch64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/64c4f405c7bd72e5e9dc8fc0823677b79e476e8e/
>> >     x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/8726be7b5432dbab0b0ca5a0c0e5152a66c45171/
>> >     x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b319c6722395a99f98790e6c4582dc872d7ef0d9/
> Weird problems :)
> 

 I've been looking at vlc off and on for the last couple of days. I don't
have a solution yet, but I do have a number of observations.

- When I disable all optional packages, it does work. But I haven't been
able to pinpoint a single dependency that makes it fail. I haven't been
methodical about it, though.

- vlc uses a homegrown "dolt" instead of libtool; however, it does
support libtool as a fallback. Switching to that doesn't make a
difference. And anyway, for linking it calls into libtool.

- The relocatable object files are created in .libs/*.o like they usually
are. They just don't get linked into a .libs/*.so library.

- Our AUTOREGEN breaks a lot of things. During autoregen I get errors like:

modules/stream_out/Modules.am:18: warning: source file 'transcode/osd.c'
is in a subdirectory,
modules/stream_out/Modules.am:18: but option 'subdir-objects' is disabled
modules/stream_out/Makefile.am:10:   'modules/common.am' included from here

and at configure time I get:
configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-doc, --disable-docs, --disable-documentation, --with-xmlto,
--with-fop, --enable-ipv6, --disable-shout, --disable-twolame,
--disable-dca, --disable-dirac, --disable-schroedinger,
--disable-quicksync, --disable-fluidsynth, --disable-kate,
--disable-caca, --disable-samplerate, --disable-chromaprint,
--disable-goom, --disable-mtp, --enable-bonjour, --enable-flac,
--enable-opus, --enable-libmpeg2, --enable-svg, --enable-theora,
--enable-upnp, --enable-vorbis, --enable-libxml2, --enable-speex,
--enable-udev



 My feeling is that vlc is currently not in a state that we can release
it. I have no issue with including some package that doesn't work very
well in a release, but for a flagship package like vlc I think it's
important that we really get it right. And currently we don't.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
