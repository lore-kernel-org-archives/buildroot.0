From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 22:59:21 +0200
Subject: [Buildroot] [PATCH RFC/next 0/4] Unify configuration/makefiles
 for the GTK and WPE WebKit packages
In-Reply-To: <20190218171719.18721-1-aperez@igalia.com>
References: <20190218171719.18721-1-aperez@igalia.com>
Message-ID: <a6c36acc-91c7-e3c9-0f2b-e693f76468e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adrian,

 It took us a bit of time, but finally a few of us got together and discussed
this series.

On 18/02/2019 18:17, Adrian Perez de Castro wrote:
> Hello!
> 
> Both the GTK and WPE WebKit ports share many dependencies (usage of GLib,
> libsoup, GStreamer, Cairo, etc.), their supported platforms, and both
> receive releases from the same stable branch following the same schedule:
> major releases twice a year, around the release dates for GNOME.
> 
> Because of the above, it is possible to factor out commonalities from
> the packaging for both the GTK and WPE WebKit ports. This patch set tries
> to explore a possible way of doing it by moving both packages (plus libwpe
> and wpebackend-fdo, which are specific to the WPE port) into a new
> package/webkit/ subdirectory, where common parts live in a webkit.mk
> and a Config.in file.
> 
> I would really like to make it easier to maintain both the webkitgtk
> and wpewebkit packages by factoring out the commonalities, so I am looking
> forward to read you feedback on this patch set :-)

 We doubt that this really makes it easier to maintain these packages.

 One of the design guidelines of Buildroot is "Explicit rather than implicit".
Although software developers are tempted to "refactor" common bits into
variables, this is often not making it easier to understand the code, and also
not making it easier to change it. The refactoring of this series smells a bit
like that: it factors out the options that happen to be the same.

 Also, it makes these packages different from how we normally do things in
Buildroot. Normally, we don't use subdirectories. Also normally, the .mk file is
self-contained, so within one file (and assuming you know how the infra works),
you have everything needed to understand how the build system will behave. After
this series, it will become more difficult to find out e.g. why the package has
this particular dependency or config option. When you want to change something
in wpewebkit, you need to also open, look at and potentially modify webkit.mk.

 Admittedly, the latter can be an advantage too: when you're editing wpewebkit,
you're forced to consider if and how it impacts webkitgtk as well. But the same
could be achieved by simply adding a comment in the .mk file that you should
also look at the other package and do similar updates there.

 To compare: we have for example mesa3d and mesa3d-headers, which are two
separate independent packages even though they're tightly related. For those, we
consciously chose to keep them separate to keep things explicit. In the end, not
so much would be shared between the two packages. I think we have a similar case
here: the common Config.in and webkit.mk files are less than 30 lines, and the
non-shared Config.in and .mk files are much larger than that.

 Therefore, I've marked the series as Rejected in patchwork.

 However, it's a thin line. If you really believe that unifying these packages
would make maintaining them significantly easier, feel free to resubmit the
series, with a short explanation why it makes life easier. This probably means:
how does this refactoring make it less likely that you make a mistake when
you're updating the webkit stuff.

 In case you would do that, I have one more suggestion: you should probably also
factor out WEBKIT_MAJOR = 2.22. Otherwise, a common _ARCH_DEPENDS risks to
become incorrect when one of them is bumped and the other is not.

 Regards,
 Arnout
