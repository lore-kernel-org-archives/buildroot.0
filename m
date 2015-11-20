From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Nov 2015 12:29:49 -0300
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151120001552.51c1b21b@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
Message-ID: <564F3C6D.8080502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/15 20:15, Thomas Petazzoni wrote:

>>       powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/ec82752a6b20ed92beb703f68f591faf27b7724e/
>>       powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/763d9aff86085b67077fc665e462cee81962246d/
>
> Smells like wchar support is needed. Gustavo, can you have a look ?
>
> BTW, it seems like this package also needs thread support, according to
> http://autobuild.buildroot.org/results/ed4/ed410283871926f61175326dc7f2b48fee9038b9/build-end.log.
> Would be good to fix this at the same time.

Hi, yes, it needs both.
For wchar it's mandatory, for threads it could be optional but isn't 
because the default for sqlite (bundled) is threads on for *nixes and 
the decision can be changed from configure (which is missing).
It's probably not worth the effort/testing to make them optional.

>>       powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/aae4266c16189b295cc7ceb60000c504ebb60752/
>
> gdkwindow-wayland.c:50:34: error: redefinition of typedef 'GdkWaylandWindow'
> ../../gdk/wayland/gdkwaylandwindow.h:32:34: note: previous declaration of 'GdkWaylandWindow' was here
>
> libgtk3 is for Gustavo :-)

I already have a bump to 3.18 in the pipe.
For now i'd say ignore this, even if it builds it doesn't work at 
runtime since the wayland/weston xdg api level != gtk3.
This happened when wayland/westion were bumped, the API level was raised 
with it, but gtk3 wasn't, hence it's in a previous level.
Mental note for the future: wayland/weston bumps may be tied to gtk3.
The gtk3 bump isn't 100% clean right now (WIP) and tinkers somewhat 
heavily in other packages, so it's material for the 2016.02 release.
Unfortunately this means we'll ship a known-broken combo (gtk3 with 
wayland).

>> microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/5b50695350b48cff6ac2eecd4cf9d7b2fb5c1beb/
>
> ./.libs/libglsl.a(glsl_parser_extras.o): In function `_mesa_glsl_compile_shader':
> (.text+0x3588): undefined reference to `__sync_val_compare_and_swap_1'
>
> I'm tempted to simply mark mesa3d as not available on microblaze. Bernd, any suggestion?

This is in the bag of "arch needs libatomic" together with strongswan 
for microblaze.

>> sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/8dcf5f73904de835bf66c46747cd544efc9d3a22/
>
> undefined reference to `__atomic_fetch_or_4'
>
> Waldemar, can you have a look ?

SPARC (v8, 32 bits) doesn't have atomics at all, libatomic, again could 
fit the bill. It may be inherited from somewhere else like boost.

Regards.
