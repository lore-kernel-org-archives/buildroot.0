From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Feb 2017 17:09:11 +0100
Subject: [Buildroot] [PATCHv3] package/ccache: do not force colored
 diagnostics
In-Reply-To: <04456b76-8eed-f7e8-0bf8-b649bee98bcb@mind.be>
References: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
 <04456b76-8eed-f7e8-0bf8-b649bee98bcb@mind.be>
Message-ID: <20170213160911.GA3956@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-02-12 22:39 +0100, Arnout Vandecappelle spake thusly:
> On 12-02-17 14:30, Yann E. MORIN wrote:
> > When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> > this flag requires GCC v4.9 or later. Older versions complain about the
> > unrecognized command line option.
> > 
> > We could override GCC_COLORS in the environment, but this would not be
> > enough since some packages may call directly $(CC) or $(HOSTCC) (like
> > makedevs do, as spotted by Thomas).
> > 
> > Since we use the same ccache build for both host and target, we disable
> > that behaviour when either the host or target compiler is tool old to
> > support this, at the cost of nol onger colorising output diagnostics for
> > the one that is recent enough.
> 
>  Actually, if the user sets GCC_COLORS in his environment while his host
> compiler is too old to support that option, then he's just plain stupid, no?
> 
>  But anyway, I would tend to say, let's simplify things and do a global
> "unexport GCC_COLORS" like we already do for a few other options. IMHO
> colourized output is not so useful in Buildroot context. A global unexport is a
> lot simpler.

I agree, too.

Although I could well see that someone is actively developping a package
(with an FOO_OVERRIDE_SRCDIR) and would be interested in having the
colors for that package. In which case they could add a local override
for this specific package, a-la:

    FOO_MAKE_ENV += GCC_COLORS=blabla

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
