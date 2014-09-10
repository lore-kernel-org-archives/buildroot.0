From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 22:23:17 +0200
Subject: [Buildroot] [PATCH 01/12] toolchain-external: instrument
 wrapper to warn about unsafe paths
In-Reply-To: <20140910221830.5e94360a@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408540005-26934-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140910194239.GB4155@free.fr>
 <20140910221830.5e94360a@free-electrons.com>
Message-ID: <20140910202317.GH23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-10 22:18 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> > > +		/* We handle two cases: first the case where -I/-L and
> > > +		 * the path are separated by one space and therefore
> > > +		 * visible as two separate options, and then the case
> > > +		 * where they are stuck together forming one single
> > > +		 * option.
> > > +		 */
> > > +		if (strlen(argv[i]) == 2) {
> > 
> > argv[*] are passed by the user, so better not trust them. What about:
> > 
> >     if (argv[i][2]!='\0') {
> >         ...;
> >     }
> 
> This makes an assumption on the length of argv[i], which is even worse,
> IMO. I don't see why strlen(argv[i]) would be unsafe, actually.

Well, you know it is at least 3-char long, because it is at least either
"-I" or "-L" so argv[i][2] is valid.

And it can be an overly-long string passed by the user, so let's be
prepared to the worse.

And it is much faster than calling strlen, which is a costly function.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
