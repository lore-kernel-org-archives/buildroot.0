From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 04 Oct 2014 19:55:37 +0200
Subject: [Buildroot] [RFC 3/3] package/kodi: Bump version to 14.0a4-Helix
References: <1412439081-2975-1-git-send-email-bernd.kuhls@t-online.de>
 <1412439081-2975-4-git-send-email-bernd.kuhls@t-online.de>
 <20141004164357.GC3990@free.fr>
Message-ID: <XnsA3BCCAB5527E6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

a short disclaimer first ;): In this posting I am writing about the kodi and 
OpenElec project. Doing this I have to stress that I am _not_ a project 
member in neither of the projects, just a normal user following their public 
discussions on the forum and the commits to the xbmc and OpenElec repos.

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20141004164357.GC3990 at free.fr:

> Bernd, All,
> 
> On 2014-10-04 18:11 +0200, Bernd Kuhls spake thusly:
>> - add kodi/xbmc specific patches for ffmpeg from OpenELEC
> 
> NAK, those patches are against ffmpeg, not Kodi. They should be provided
> in a separate changeset.

ok.

> Does that mean those patches come from upstream XBMC/Kodi?

Yes, https://github.com/xbmc/FFmpeg/commits/release/2.4-xbmc
This repo is regularly synced with upstream ffmpeg.

This should be the kodi patchset; not diffed against my patch, because I 
trust the OpenElec team ;):

https://github.com/xbmc/FFmpeg/compare/FFmpeg:release/2.4...release/2.4-xbmc

>> - add dependency to ffmpeg, xbmc does not deliver its own ffmpeg anymore
> 
> Woot! Yeah! *That* is good news! :-)

The reason why xbmc <= 13.x delivered its own ffmpeg source code were their 
patches to make xbmc work properly, these patches were applied to 
https://github.com/xbmc/xbmc/tree/Gotham/lib/ffmpeg, which is based on ffmpeg 
1.2.x. This directory was removed several months ago in preparation for 
Helix. Helix works with current ffmpeg 2.4, that?s the reason I am regularly 
updating the ffmpeg package in buildroot, as a preparation for this version 
bump ;) The kodi team is working with the ffmpeg project to include their 
patches upstream.

The building of Helix can be done in two seperate ways:

- kodi itself fetches ffmpeg from their git repo[1] and builds it if you use 
their ./bootstrap[2] script

Since buildroot delivers all dependencies I chose the second option:

- OpenElec downloads vanilla ffmpeg[3] and applies the patches from 
  https://github.com/xbmc/FFmpeg/commits/release/2.4-xbmc
  on top of it[4].

I added the kodi-specific patches for ffmpeg as a separate patch to prevent 
package/ffmpeg/ffmpeg.mk being changed to a foreign upstream source, which 
would also be possible of course.

By default kodi, while being linked dynamically to pretty much all libs, 
links _statically_ to ffmpeg to prevent bugs when the system-provided ffmpeg 
is updated. This version bump respects this but locally I patch kodi to link 
dynamically to ffmpeg to save space since I am in control of the ffmpeg 
version in use. I also use minidlna on my system, linked against the kodi-
patched ffmpeg, and it works fine.

>> - remove dependency to lame, audio encoders have been seperated from kodi
> 
> In what way? Does it now rely on ffmpeg instead?

No, they are now delivered as add-ons. I have yet to create packages for them 
but will do so before the final version of this package is released. Here is 
the list of encoding-addons to be found in the xbmc project:

https://github.com/xbmc/audioencoder.flac
https://github.com/xbmc/audioencoder.vorbis
https://github.com/xbmc/audioencoder.lame
https://github.com/xbmc/audioencoder.wav

I will let them depend on a new config option in kodi/Config.in to enable 
optical-drive support, which is currently disabled by default in our 
buildroot package.

Regards, Bernd

[1] 
https://github.com/xbmc/xbmc/blob/master/tools/depends/target/ffmpeg/FFMPEG-
VERSION
[2] https://github.com/xbmc/xbmc/blob/master/docs/README.linux
[3] 
https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/multimedia/ffmpe
g/package.mk
[4] 
https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/multimedia/ffmpe
g/patches/ffmpeg-0000-xbmc.patch
