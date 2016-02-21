From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Feb 2016 17:23:32 +0100
Subject: [Buildroot] [PATCH v4 1/3] chocolate-doom: new package
In-Reply-To: <CABLs7GWq4j7DPexG+-XnyMBocBJw-GDb2056erdGAWVNizYMpw@mail.gmail.com>
References: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
 <20151223233453.0e71a3b6@free-electrons.com>
 <CABLs7GUV97Ck5V6_vgmsCJfgxgvgZkkrvKvLeV8RX3RZK9+6Ug@mail.gmail.com>
 <20151224082921.1e482c18@free-electrons.com>
 <CABLs7GWq4j7DPexG+-XnyMBocBJw-GDb2056erdGAWVNizYMpw@mail.gmail.com>
Message-ID: <56C9E484.5080207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rodrigo, Thomas, All,

Le 24/12/2015 12:11, Rodrigo Rebello a ?crit :
> Thomas,
> 
> 2015-12-24 5:29 GMT-02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>> Dear Rodrigo Rebello,
>>
>> On Wed, 23 Dec 2015 22:33:01 -0200, Rodrigo Rebello wrote:
>>
>>> Agreed. I have considered exactly that when I was working on the
>>> patch, but I have decided to leave it for later since a patch for
>>> SDL_mixer is also necessary (SDL_mixer.pc is missing a 'Libs.private'
>>> section with libraries necessary for static linking). I've just had a
>>> look at it and the solution is actually quite simple, so I'll work on
>>> it and propose a patch. That will also be useful to fix a recent ltris
>>> autobuild failure related to static linking as well.
>>
>> Indeed, according to your description of the problem, it is really
>> SDL_mixer.pc that needs to be fixed. However, if I looked correctly,
>> chocolate-doom doesn't use pkg-config to find libraries, so it would
>> have to be changed as well.
>>
> 
> Yes, both SDL_mixer and chocolate-doom need patching. That's actually
> what I meant in my previous email. I'll be working on that soon.

Any update on this topic ?

I looked at chocolate-doom static build failure [1] and I have some comments to
complete this discussion.

If libmad is available, SDL_mixer forget to add -lmad in SDL_mixer.pc file for
static build only (you're right it should have a 'Libs.private' section). This
means that all SDL_mixer will unlikely forget -lmad in their LDFALGS leading to
the build failure similar to :

[...]sysroot/usr/lib/libSDL_mixer.a(music_mad.o): In function `read_next_frame':
music_mad.c:(.text+0xbc): undefined reference to `mad_stream_buffer'
music_mad.c:(.text+0xd0): undefined reference to `mad_frame_decode'
music_mad.c:(.text+0x134): undefined reference to `mad_timer_add'

So, fixing SDL_mixer and adding pkg-config support to chocolate-doom and ltris
(maybe others) is needed if we want to support static only build.

As a quick workaround, we may disable libmad support in SDL_mixer for static
build only ? Thomas ?

Best regards,
Romain

[1]
http://autobuild.buildroot.net/results/e09/e09ea3a64d396bbc855acf7c07fcbea28fb2395d/build-end.log
