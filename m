From: Guillermo A. Amaral <g@maral.me>
Date: Thu, 18 Jan 2018 08:35:51 -0800
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 in package SDL2
In-Reply-To: <20180118172216.31d59b4c@windsurf.lan>
References: <20180116175054.GB28324@enterprise.starfleet>
 <20180118081528.16612-1-g@maral.me>
 <20180118160514.0684a720@windsurf.lan>
 <20180118154441.GB26856@momiji>
 <20180118172216.31d59b4c@windsurf.lan>
Message-ID: <20180118163551.GA18359@enterprise.starfleet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 18, 2018 at 05:22:16PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 18 Jan 2018 15:44:41 +0000, Adrian Perez de Castro wrote:
> 
> > Historically in WebKitGTK+ we have had our share of issues with environment
> > variables, mainly due to ?setenv()? not being thread-safe: the only case in
> > which it does really work is at the very beginning of program execution,
> > before any threads or secondary processes are started. Otherwise it's easy
> > to shoot oneself on the foot and end up with threads/processes that ?see?
> > different values for the same environment variable.
> > 
> > Provided that the patch is adding to ?LD_LIBRARY_PATH?, maybe one option could
> > be using ?patchelf? to add the path to the DT_RUNPATH entry in the ELF header
> > of ?libSDL2.so? in a post-build (or post-install?) hook. Or, if possible,
> > arrange to pass the needed linker flags to get the path added there.
> > 
> > Or, even better, add ?/opt/vc/lib? in DT_RUNPATH when the RPi VideoCore
> > libraries are installed into ?/opt/vc? ? somehow that sounds more correct
> > in my head. WDYT?
> 
> Yes, I agree it would be much better to add a -Wl,-rpath,/opt/vc/lib to
> the LDFLAGS if the libraries are in /opt/vc/lib.
> 

After 6-7 years, I hoped that darn path wouldn't be an issue anymore.
If only Raspbian and friends would all add /opt/vc/lib to their
ld.so.conf...

Anyway, I'll try the rpath approach, using LD_LIBRARY_PATH did hurt a
little, but at the moment it looked like the lesser of two evils; They
already added in another workaround for more library locations for the
RPi and it's starting to look even more like a hodgepodge.

Cheers,
G

-- 
gamaral
