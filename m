From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 18 Jan 2018 15:44:41 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 in package SDL2
In-Reply-To: <20180118160514.0684a720@windsurf.lan>
References: <20180116175054.GB28324@enterprise.starfleet>
 <20180118081528.16612-1-g@maral.me> <20180118160514.0684a720@windsurf.lan>
Message-ID: <20180118154441.GB26856@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

On Thu, 18 Jan 2018 16:05:14 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
 
> Thanks for respining! It looks much better, but there's still one thing
> I'm not sure is very good. See below.
> 
> On Thu, 18 Jan 2018 00:15:28 -0800, Guillermo A. Amaral wrote:
> 
> > ++#if SDL_VIDEO_DRIVER_RPI
> > ++    path = SDL_getenv("LD_LIBRARY_PATH");
> > ++    if (path) {
> > ++        const int path_size = SDL_strlen(path) + 1 + sizeof(g_rpi_opt_path);
> > ++        char *new_path = SDL_calloc(1, path_size);
> > ++        strcat(new_path, path);
> > ++        strcat(new_path, ":");
> > ++        strcat(new_path, g_rpi_opt_path);
> > ++        SDL_setenv("LD_LIBRARY_PATH", new_path, 1);
> > ++        SDL_free(new_path);
> > ++    } else {
> > ++        SDL_setenv("LD_LIBRARY_PATH", g_rpi_opt_path, 1);
> > ++    }
> > ++    path = NULL;
> 
> Yerk, upstream has accepted this? To me, it looks really terrible to
> set LD_LIBRARY_PATH from within a program. Is it really considered a
> good practice ?

Historically in WebKitGTK+ we have had our share of issues with environment
variables, mainly due to ?setenv()? not being thread-safe: the only case in
which it does really work is at the very beginning of program execution,
before any threads or secondary processes are started. Otherwise it's easy
to shoot oneself on the foot and end up with threads/processes that ?see?
different values for the same environment variable.

Provided that the patch is adding to ?LD_LIBRARY_PATH?, maybe one option could
be using ?patchelf? to add the path to the DT_RUNPATH entry in the ELF header
of ?libSDL2.so? in a post-build (or post-install?) hook. Or, if possible,
arrange to pass the needed linker flags to get the path added there.

Or, even better, add ?/opt/vc/lib? in DT_RUNPATH when the RPi VideoCore
libraries are installed into ?/opt/vc? ? somehow that sounds more correct
in my head. WDYT?

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180118/25b5f162/attachment.asc>
