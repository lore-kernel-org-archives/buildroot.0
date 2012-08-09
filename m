From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Aug 2012 11:58:19 +0200
Subject: [Buildroot] [RFC] "select" vs. "depends on" : a proposal for a
	workaround
In-Reply-To: <20120809114001.6e9d2a10@skate>
References: <201208072252.18028.yann.morin.1998@free.fr>
 <20120809114001.6e9d2a10@skate>
Message-ID: <201208091158.19469.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 09 August 2012 11:40:01 Thomas Petazzoni wrote:
> Le Tue, 7 Aug 2012 22:52:17 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> > This is a Request For Comments about the now-infamous dilemn between
> > "depends on" vs. "select", and a suggestion to work it around.
[--SNIP--]
> Thanks a lot for thinking about this. So, the idea is that every time
> there is a "select", we add a corresponding "depends on", and that
> since there is inheritance of "depends on", we will not have to
> recursively add all the "depends on" on toolchain options on all the
> reverse dependencies of a package that need such toolchain options.
> 
> Am I understanding your proposal correctly?

Basically, yes. I was only thinking about inter-package dependencies, but
it can be of course applied to other options.

Where this would usefull:
 - a package depends on some generic options: toolchain, architecture...
 - a package depends on another package.

Adding the intermediate _AVAILABLE symbol propagates the dependency list,
so all a package (or a sub-option of a package) needs to know is wether
that other package it depends on is available, so it can select it.

But there is a limitation: should we also use that mechanism for package
options? Eg:

  config PKG_FOO_AVAIL
    def_bool y
    depends on WCHAR

  config PKG_FOO
    bool "foo"
    depends on PKG_FOO_AVAIL

  if PKG_FOO

  config PKG_FOO_OPT_AVAIL
    def_bool y
    depends on ARM

  config PKG_FOO_OPT
    bool "opt"
    depends on PKG_FOO_OPT_AVAIL

  endif # PKG_FOO

  config PKG_BAR
    bool "bar"
    depends on PKG_FOO_AVAIL && PKG_FOO_OPT_AVAIL
    select PKG_FOO
    select PKG_FOO_OPT

Going this route can lead to over-complicated and over-cluterred Config.in
files. We have to set a limit to where we want to go.

> On my side, I would need to experiment a bit with this on some
> real-world example, but it sounds like a nice path to investigate, for
> sure.

I'm finishing my new packages that I'll push soon (this WE?) because it
takes a bit of time testing all the combinations.

When those are pushed, I'll try to add this _AVAILABLE stuff to the packages
I added and their depndencies to see if it plays nicely.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
