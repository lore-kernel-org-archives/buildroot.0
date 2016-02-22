From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Feb 2016 22:22:32 -0300
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <20160221222816.4e53e921@free-electrons.com>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com>
Message-ID: <56CA62D8.10309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/02/16 18:28, Thomas Petazzoni wrote:

> So if I understand correctly, the idea is to replace the vala ->
> vala-3.0 and valac -> valac-3.0 symbolic links by wrappers.

Hi, yes.

> So I did a test, first without your patch, with a stupid vala hello
> world program:
>
> thomas at skate:~/projets/buildroot (next)$ cat > pouet.vala
> class Demo.HelloWorld : GLib.Object {
>
>      public static int main(string[] args) {
>
>          stdout.printf("Hello, World\n");
>
>          return 0;
>      }
> }
> thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/vala pouet.vala
> Hello, World
> thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/valac pouet.vala
> thomas at skate:~/projets/buildroot (next)$ file pouet
> pouet: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=d13ab11a4b8d24623f8ead3e8e3c1c9e73d16df0, not stripped
>
> So, the program runs fine on the host with "vala", and compiles to a
> x86-64 executable. Not really surprising since it's a host-vala
> installation not tuned for cross-compilation.
>
> Then, I apply your patch, rebuild host-vala, and do the same test:
>
> thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/vala pouet.vala
> error: --girdir=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/gir-1.0 not found
>
> What package is supposed to install gir-1.0 in staging ?

vala isn't normally used, only valac & vapigen are, so your usage 
doesn't mirror reality with packages that we currently ship.
IIRC "vala" is a deprecated form of invocation from several years ago, 
still kept for compatibility purposes.
And valac doesn't mind if the directory isn't present.
That being said, gir-1.0 comes from enabling gobject-introspection which 
i have as a WIP patchset but haven't submitted yet.
I've tested this patchset and it doesn't break our current host-vala 
using packages.

> thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/valac pouet.vala
> thomas at skate:~/projets/buildroot (next)$ file pouet
> pouet: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=d13ab11a4b8d24623f8ead3e8e3c1c9e73d16df0, not stripped
>
> But it still compiles to a host binary. Am I missing something ?

Yes, you need to pass full build env variables (CC & friends) to it, it 
doesn't work magically.

> Could you improve the commit log with more explanations for people
> (like me) who don't know vala, and don't understand what your patch is
> fixing exactly ?

It's part of the webkitgtk/midori major bump, which depends on libgtk3, 
which depends on libepoxy patching outside x11r7, which depends on these 
as well.
And, by the way, the webkitgtk bump accounts for like 40+ security bugs 
from http://webkitgtk.org/security/WSA-2015-0002.html
And there are no plans to backport those to 2.4.x
Currently i've got the 2.10.x (the latest stable branch) patchset cooked 
up, and 2.12.x is coming soon - we're 3 major releases behind.
What this solves is pretty simple, if you try to build a vala app (like 
midori) which uses vala bindings (vapi) from others it will fail, 
miserably, because it can't find them (they're in staging, and host-vala 
as it is will search for them in the host dir -> not found -> boom).
Like this:

-----
make[3]: Entering directory 
'/home/gustavoz/b/midori.wayland/output/build/midori-0.5.11'
error: [  1%] Generating nn.gmo
Package make[3]: Leaving directory 
'/home/gustavoz/b/midori.wayland/output/build/midori-0.5.11'
`granite' not found in specified Vala API directories or 
GObject-Introspection GIR directories
-----

We haven't seen this because the only applications in buildroot that use 
vala, gmpc and midori (not bumped) don't use vala bindings.
But for the midori bump granite is highly recommended (building without 
it is likely going away for the next release), hence i've added libgee 
and granite which are prereqs for usability/friendlyness.

The thing is keeping all of this split is quite an amount of work, 
keeping in sync/rebasing against master and so on.
I've been sending what most i could in split sets to keep gtk3, wayland 
and webkitgtk going forward in a reasonable way.
However my patience is wearing quite thin and i'm very tempted to just 
let everything stale, we're about to ship another release with 
non-existant gtk3-wayland support again, a feature that was working just 
fine a few releases ago.

Heck, now that i remember not even the webkitgtk24 patches in patchwork 
are in the release/tree, and the multimedia one fixes autobuilder 
failures with the new dep checking (Peter pointed me to it on IRC), 
besides making life terribly easier for people wanting the video/audio 
features without hunting for many gstreamer options.
The rpi one also fixes and autobuilder failure, why do i care again?

Also if anybody is fool enough to think qt webkit is in better shape 
better read:
https://blogs.gnome.org/mcatanzaro/2016/02/01/on-webkit-security-updates/
...and sleep on it.

Regards.
