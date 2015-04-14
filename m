From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Apr 2015 00:25:45 +0200
Subject: [Buildroot] [PATCHv2 11/21] pkg-download: extend DOWNLOAD_INNER,
 add a SOURCE_CHECK macro
In-Reply-To: <552D732C.3060907@mind.be>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413210024.GK29025@free.fr> <552D732C.3060907@mind.be>
Message-ID: <20150414222545.GD4053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-14 22:06 +0200, Arnout Vandecappelle spake thusly:
> On 13/04/15 23:00, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> >> As part of moving to a package infrastructure based source-check
> >> implementation, we are going to move away from the global DL_MODE
> >> variable to select the behavior of the DOWNLOAD_INNER macro.
> >>
> >> As a preparation to this, this commit makes the DOWNLOAD_INNER macro
> >> take a third argument, which is the action to be done: either DOWNLOAD
> >> or SOURCE_CHECK. For now, the DOWNLOAD macro passes $(DL_MODE) as this
> >> third argument, in order to keep the existing behavior.
> >>
> >> In addition, a SOURCE_CHECK macro is added, which calls DOWNLOAD_INNER
> >> with the appropriate action. This macro will be used in the upcoming
> >> package infra based implementation of source-check.
> 
>  It seems a bit weird to do that in this commit, more logical to do it in the
> next one or as a separate commit. But that's no major issue, so
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> >>
> >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > [tested by doing a "make source" on a randpackageconfig]
> 
>  You should have tested make source-check.

Well, I did run source-check and source; just forgot to state it.

However, I did not notice a failure, because buildroot will fallback to
our mirror when it does not find something. Because source-check takes
quite some time to run, I just ran it and went off doing smething else;
when I came back, there was no error of a failing package, because
every missing pieces were retrieved from the mirror. And in the default
config, there is a mirror (our).

And then, it means we can't reliably run sourcce-check to check that
upstream is still available, just becasue some upstream do not allow us
to do so (HEAD not being supported).

An alternative would be to use a GET instead of a HEAD, and just ask for
zero byte (or probably just a few bytes in case some servers would
refuse to serve zero byte). But there's no way to do so with wget. curl
is a little bit more flexible and it is possible ask for a range, but
not all server will abide to that range.

So, I can see a few blockign points baring source-check from being
completely useful:

  - no or limited VCS support: git does not always support remote-listing
    a sha1 so we only check the remote exists, our bzr, cvs and hg checks
    are no better, svn is OK though;

  - scp only works if the user has a shell (which is not mandatory, scp
    can work even if the user can't get a shell);

  - some HTTP upstreams do not accept a HEAD request;

  - as far as I could see all out FTP-hosted packages are on behaving
    servers.

Bizarelly enough, what works best are the legacy (or oldish) methods:
svn and FTP. Yeah for grumpy old guys... :-(

In the ned, does source-check really makes sense?

Let me rephrase...

What's the purpose of source-check?

As far as I can see, there are two use-cases:

  - for us Buildroot devs: check that an upstream still provides a
    resource;

  - for a standard user to check if he can get the source of his set of
    packages.

But is that really necessary?

For a user, what can he do if the package can't be downloaded (i.e. not
in upstream and not on our mirror)? Nothing...

For us, all we need to know is that something can't be downloaded so we
can bump the package (or point it to our mirror). We have autobuilders
to catch download failures.

So, does it make sense to keep source-check at all?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
