From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 11 May 2015 15:53:03 +1000
Subject: [Buildroot] [PATCH 2/2] powerpc-utils: remove --without-librtas
In-Reply-To: <20150511043445.GO2558@tarshish>
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
 <05714bb15869de4bead83eec7df5e9c9b0bd8fa7.1431059241.git.sam.bobroff@au1.ibm.com>
 <20150508045758.GH2183@tarshish> <554FFB2F.2010102@au1.ibm.com>
 <20150511043445.GO2558@tarshish>
Message-ID: <20150511055303.GA3583@ocelot.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 11, 2015 at 07:34:45AM +0300, Baruch Siach wrote:
> Hi Sam,
> 
> On Mon, May 11, 2015 at 10:43:27AM +1000, Sam Bobroff wrote:
> > On 08/05/15 14:57, Baruch Siach wrote:
> > > On Fri, May 08, 2015 at 02:27:49PM +1000, Sam Bobroff wrote:
> > >> -POWERPC_UTILS_DEPENDENCIES = zlib
> > >> +POWERPC_UTILS_DEPENDENCIES = zlib librtas
> > > 
> > > Why not make librtas an optional dependency? Something like:
> > > 
> > > ifeq ($(BR2_PACKAGE_LIBRTAS),y)
> > > POWERPC_UTILS_DEPENDENCIES += librtas
> > > POWERPC_UTILS_CONF_OPTS = --with-librtas
> > > else
> > > POWERPC_UTILS_CONF_OPTS = --without-librtas
> > > endif
> > 
> > I thought about making it optional, but there seemed to be two reasons
> > to always include it:
> > 
> > * librtas is a small library and it provides a lot of functionality to
> > powerpc-utils. Why leave it out?
> > 
> > * Distros (AFAIK) always include librtas when providing powerpc-utils,
> > so it would surprise users to provide a powerpc-utils without it by
> > default. So if I did make it optional, I think it should be using some
> > method that caused librtas to be included by default or at least
> > provided some indication in the menu that they may want to go and enable
> > librtas. Then I thought this was a bit complicated for a use case that I
> > couldn't find a reason for.
> 
> These are valid reasons. What is the target installed size of librtas compared 
> to powerpc-utils?

This might be a bit rough but it looks like:

* librtas: 360Kb
* powerpc-utils with librtas: 1,660Kb
.. for a total of  2020Kb

* powerpc-utils without librtas: 484Kb

So it looks like the increase is about 1.5Mb (or 3x, depending on how you look
at it).

> > That said, if you have a reason to make it optional I'll be happy to
> > make it so. Maybe using a sub-option to add the dependency, and that
> > could default to yes?
> > 
> > e.g.
> > 
> > [*] powerpc-utils
> > 	[*] RTAS functionality
> 
> Sounds reasonable to me. Let's see what others think.
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
