From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 14:14:47 +0100
Subject: [Buildroot] [PATCH] docs/manual: add note about spurious errors
 duing make printvars
In-Reply-To: <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
References: <20190312105713.23968-1-martin.kepplinger@ginzinger.com>
 <99874541-4ce3-4cb8-b7ce-a0d3d7496357@mind.be>
Message-ID: <20718_1552396490_5C87B0CA_20718_131_1_20190312131447.GA25212@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 13:33 +0100, Arnout Vandecappelle spake thusly:
> On 12/03/2019 11:57, Martin Kepplinger wrote:
> > Add a note about errors we currently have, as discussed in
> > http://lists.busybox.net/pipermail/buildroot/2019-March/244212.html
> > 
> > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> > ---
> >  docs/manual/make-tips.txt | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> > index ea1d825bef..475de4ffa7 100644
> > --- a/docs/manual/make-tips.txt
> > +++ b/docs/manual/make-tips.txt
> > @@ -131,3 +131,13 @@ The output of quoted variables can be reused in shell scripts, for example:
> >   $ echo $BUSYBOX_DEPENDENCIES
> >   skeleton toolchain
> >  ----
> > +
> > +Note that when using +make printvars+ you might see spurious errors like
> > +the following. Please help reviewing our Makefile macros and variables
> > +in order to fix this:
> 
>  I thought the conclusion of that thread is that there is no way to fix it? The
> only reasonable way is to filter out macros from the .VARS. E.g. defining
> PRINTVARS_FILTER and for each macro definition, append to that list.
> 
>  However, I'm not even convinced that we really want to do that. It is adding
> significant complexity for little gain.
> 
>  Instead, I'm more inclined to remove the possibility of running printvars
> without explicit VARS=. If you really want, you can still get all variables with
> VARS=%.

I'd like the ability to extract many unrelated variables, but not all of
them either, so maybe we can accept that VARS is a sapce-separated list
of patterns to extract, ?-la:

    make -s printvars VARS="VAR_1 VAR_2 PAT_1_% PAT_2_%"

which would make it faster and more reliable to extract a subset of the
variables, without the need to filter them out of the whole printvars,
nor with the overhead (a few seconds) of calling make for each one.

I think I know someone that will work on that soon. ;-)

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
