From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Sep 2016 11:30:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-02
In-Reply-To: <87vayau5yt.fsf@dell.be.48ers.dk>
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
 <20160903203613.2a7f0a32@free-electrons.com>
 <1496256.AqCB2eOqyL@sagittea>
 <20160903232302.40ff0733@free-electrons.com>
 <87vayau5yt.fsf@dell.be.48ers.dk>
Message-ID: <20160905093047.GB5553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-09-05 10:05 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  >> > However, we could discuss whether it really makes sense to use
>  >> > https:// as the main download location when all downloads anyway fall
>  >> > back to downloading from sources.buildroot.net over http://.  
>  >> 
>  >> sources.buildroot.net should provide an https access?
> 
>  > I am not a security expert, I am not sure if this is really useful. I
>  > don't think there's anything secret in those communications, and the
>  > integrity of the downloaded tarballs is verified using hashes.
> 
>  > Maybe the solution to the whole problem is to use http:// when
>  > available over https:// ? Though admittedly more and more sites tend to
>  > redirect http to https and force people to use secure connections
>  > (which is a good thing).
> 
>  > I'm open to suggestions from others on this.
> 
> Well, the problems we typically run into are:
> 
> - Websites using TLS with SNI (to not 'waste' an IP address per site),
>   which isn't supported by old wget versions
> 
> - Websites signed with new certificates not known by older distributions
> 
> - Misconfigured websites or website using self signed certificates
> 
> The reason we have preferred https was to ensure data integrity
> (E.G. make sure we get the correct tarball), not for privacy.

Not sure. If you download the tarball for the tor package, you are
most probably flagged as an interesting target by Eve (or any other
three-letter agency ;-] ).

> With the
> download hashes this doesn't really matter much, as corruption will be
> discovered by the hashes.

Hashes are not only about integrity. They are about authenticity as
well: be sure that upstream did not update the archive with another
re-release.

> I think our options are:
> 
> - Do nothing. The issue is not so big, and presumably will get smaller
>   over time as older distributions get updated.

That means we basically don't care about such old distributions anymore,
and that we should upgrade our autobuilders (or at least locally install
a wget that does accepts newer https stuff). That's fine with me.

> - Change HTTPS URLs to HTTP where possible. Notice that these days a
>   number of websites use HSTS headers to enforce HTTPS. I'm not sure
>   when HSTS support got added to wget though (not clear from changelog)

I would favour we stick to https where upstream provides it.

> - Pass --no-check-certificate in BR2_WGET to disable the check, working
>   around the issues.

Maybe a note in the manual and (as J?r?me suggested) catch such a failure
in our wget wrapper? (but I wouldn't like we do the latter).

But I would argue against the suggestion to use --no-check-certificate,
and rather suggest to install a newer wget.

My suggestion would be we do (both):
  - add the note in the manual,
  - update the affected autobuilders (or at least install a newer wget).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
