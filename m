From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Dec 2014 19:43:40 +0100
Subject: [Buildroot] [PATCH 1/4] pkg-download: check for already
 downloaded file in the download wrapper
In-Reply-To: <20141202092636.4bbfea66@free-electrons.com>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <936ed487d76e1dd36230de9a26d57da908680d79.1417475935.git.yann.morin.1998@free.fr>
 <20141202092636.4bbfea66@free-electrons.com>
Message-ID: <20141203184340.GE4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-02 09:26 +0100, Thomas Petazzoni spake thusly:
> On Tue,  2 Dec 2014 00:24:06 +0100, Yann E. MORIN wrote:
> > Instead of repeating the same test again and again in all our download
> > rules, just delegate the check for an already downloaded file to the
> > download wrapper.
> > 
> > This clears up the path for doing the hash checks on a cached file
> > before the download.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> It has the consequence of doing another fork+exec of a shell script for
> all files, even if they have already been downloaded. I don't know if
> this is really measurable compared to the overall build time, though,
> except maybe on some cases like "make source". So maybe this is OK.

Well, if I remember correctly, make is smart enough to detect simple
commands and not spawn a shell for them, and just does the fork-exec
itself rather than calling system().

So, when counting the fork+exec you'd get:

  - simple command (program arg arg arg): make does a fork()+exec() to
    the script, the kernel sees the she-bang and the exec is a call to
    the shell to interpret the script

  - command lists (command1 || command2), make does a system(), which in
    turn does a fork()+exec() to the shell to interpret the command
    list.

So we're breaking even in that case. We even gain a call to system(), so
we should be a little tiny bit faster! ;-p

And anyway, a fork+exec is not that costly nowaday. Probably, on a
cache-cold system, the IOs will largely over-shadow the fork+exec pair I
am afraid... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
