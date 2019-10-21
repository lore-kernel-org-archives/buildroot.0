From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Oct 2019 21:12:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with python 3.8
In-Reply-To: <20191021205609.57122e8c@windsurf>
References: <20191020193818.85518-1-james.hilliard1@gmail.com>
 <20191021205609.57122e8c@windsurf>
Message-ID: <CADvTj4rAdZzCi5u2qBeGqjyiWPVM92TeNsBXPDRiY7ZmptLLag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 21, 2019 at 8:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 20 Oct 2019 13:38:18 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.net/results/71bf937339705a520e047d12c146229ec42a76f2
> >
> > Details:
> >  - https://bugs.python.org/issue36721
>
> Reading this, I am not sure your fix is correct (though I am not sure
> what the correct fix is).
Yeah, not entirely sure but I saw other projects use this same fix effectively.
>
> Indeed, in this bug report, Victor Stinner explains:
>
> """
> There are two use cases for libpython:
>
> * Build a C extension and load it in Python: use case called "pyext" by waf
> * Embed Python into an application: use case called "pyembed" by waf
> """
>
> The first case should not require -lpython3.8, and therefore
> python-config no longer returns -lpython3.8, unless you pass --embed
> (which means you are in the second case: you embed Python into an
> application).
>
> But kmod is only providing Python bindings: it's a C extension to be
> loaded in Python, so we are in the first case, and we shouldn't need
> --embed.
>
> What do you think ?
Yeah, it's not very clear, this fix is the same as these essentially however:
https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14/diffs
https://gitlab.com/ita1024/waf/merge_requests/2236/diffs
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
