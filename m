From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Oct 2018 22:24:25 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181010212630.7f47270e@windsurf>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com>
 <20181010212630.7f47270e@windsurf>
Message-ID: <20181010202425.GN2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-10-10 21:26 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Wed, 10 Oct 2018 01:08:52 +0300, Adrian Perez de Castro wrote:
> > This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
> > gets passed), which makes the webkitgtk build system assume GStreamer-GL
> > is available, while actually it is not.
> > 
> > Also, use "imply" to select the needed GStreamer-GL component, because
> > in general it is preferred due to better performance.
> > 
> > This fixes some autobuilder failures like the following:
> > 
> >   http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
> 
> What is fixing the autobuilder issue exactly? Explicitly disabling
> -DUSE_GSTREAMER_GL=OFF when the plugin is not available ? Or having it
> enabled by the "imply" ?
> 
> In the former case, then I believe we need two patches: one fixing the
> autobuilder issue (i.e just the part in the .mk file) that we can
> backport to older Buildroot versions as needed, and another one adding
> the imply.
> 
> This usage of "imply" would be the first in Buildroot. Peter, Arnout,
> Yann, anything against it ?

I don't like it, because it makes it more complex to follow what is
going on. 'imply' is a weak 'select', as the implied symbol can still be
changed to 'n'. Where 'imply' is suefull, is with tristates, where it
ensures that a tristate can't be 'M' when the implier is 'y'. From the
kernel's doc:

  config FOO
        tristate
        imply BAZ

  config BAZ
        tristate
        depends on BAR

  The following values are possible:

        FOO             BAR             BAZ's default   choice for BAZ
        ---             ---             -------------   --------------
        n               y               n               N/m/y
        m               y               m               M/y/n
        y               y               y               Y/n
        y               n               *               N

And we do not even use tristates at all in Buildroot.

And basically, from a Buildroot point of view: either we need something,
in which case we select it (or depend on it), or it is optional, and we
let the user decide for themselves.

Optionally, if package A can optionaly use package B (or a sub-option of
it), and we want to entice the user to select it, then we just add a
sub-option to package A, something like "use B's feature", with proper
select or depends. We already do such things in many places.

So, no, I am absolutely not in favour of using 'imply' at all in Buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
