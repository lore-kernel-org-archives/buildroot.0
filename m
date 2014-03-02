From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Mar 2014 23:19:59 +0100
Subject: [Buildroot] [PATCH 11/13] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <CAHXCMMLfCntMjYv4ONecSyhLGph=+CdR5mJu92bkCbfxYWhTzA@mail.gmail.com>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
 <b36750f8cb541e068cdce6ec65241ed155997c97.1393781650.git.yann.morin.1998@free.fr>
 <CAHXCMMLfCntMjYv4ONecSyhLGph=+CdR5mJu92bkCbfxYWhTzA@mail.gmail.com>
Message-ID: <20140302221959.GB3379@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-02 21:10 +0100, Samuel Martin spake thusly:
> Yann,
> 
> On Sun, Mar 2, 2014 at 6:51 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Some of the packages that Buildroot might build are sensitive packages,
> > related to security: openssl, dropbear, ca-certificates...
> >
> > Some of those packages are downloaded over plain http, because there is
> > no way to get them over a secure channel, such as https.
> >
> > In these dark times of pervasive surveillance, the potential for harm that
> > a tampered-with package could generate, we may want to check the integrity
> > of those sensitive packages.
> >
> > So, each package may now provide a list of hashes for all files that needs
> > to be downloaded, and Buildroot will just fail if any downloaded file does
> > not match its known hash.
> >
> > Hashes can be any of the sha1 or sha2 variants, and will be checked even if
> > the file was pre-downloaded.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> > Note: this is not a bullet-proof solution, since Buildroot may itself be
> > compromised. But since we do sign our releases, then we secure the list of
> > hashes at the same time. Only random snapshots from the repository may be
> > at risk of tampering, although this is highly doubtfull, given how git
> > stores its data.
> > ---
> >  package/pkg-download.mk     | 27 +++++++++++------
> >  support/download/check-hash | 71 +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 89 insertions(+), 9 deletions(-)
> >  create mode 100755 support/download/check-hash
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index c94ecba..adaccef 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -58,6 +58,17 @@ domainseparator=$(if $(1),$(1),/)
> >  # github(user,package,version): returns site of github repository
> >  github = https://github.com/$(1)/$(2)/tarball/$(3)
> >
> > +# Helper for checking a tarball's checksum
> > +# If the hash does not match, remove the incorrect file
> > +# $(1): the path to the fies with the hashes
> 
> nit:
> s/fies/file/

Already spotted by Gustavo on IRC. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
