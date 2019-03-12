From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 15:25:55 +0100
Subject: [Buildroot] [PATCH 5/5 v2] toolchain: allow PIC/PIE without
 RELRO
In-Reply-To: <CANQCQpaWDAmxxZqzR0wushhhuva9QG7dPO45HU81h1LKa8h5TQ@mail.gmail.com>
References: <cover.1552392456.git.yann.morin@orange.com>
 <16391_1552392582_5C87A186_16391_281_1_704ea354-404e-4e6b-af91-9e63897e78c9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <CANQCQpaWDAmxxZqzR0wushhhuva9QG7dPO45HU81h1LKa8h5TQ@mail.gmail.com>
Message-ID: <27752_1552400757_5C87C175_27752_116_1_20190312142555.GC25212@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2019-03-12 08:50 -0500, Matthew Weber spake thusly:
> On Tue, Mar 12, 2019 at 7:09 AM <yann.morin@orange.com> wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > In commit 7484c1c3b806 (toolchain/toolchain-wrapper: add BR2_RELRO_),
> > we added the PIC/PIE flags, but based on the RELRO_FULL condition.
[--SNIP--]
> >  config BR2_RELRO_FULL
> >         bool "Full"
> > +       select BR2_PIC_PIE
> 
> In the previous email chain it was being discussed if PIC/PIE was
> required for full RELRO.  Like you guys mentioned, I believe it was
> always just lumped into the configuration the other distros called
> "full".  However, I'm pretty sure they are independent and you could
> have full RELRO without PIC/PIE  (I did not test this theory, just
> checked some docs and the theory holds).

Arnout did test it, and it indeed works.

>  I'd be on the fence if we
> should remove this select and keep the BR2_PIC_PIE as something you'd
> need to independently set if you want it with BR2_RELRO_FULL.  I
> guess, better to make that sort of change now then after more time has
> gone by.

I did not do that in this patch, to introduce the minimal disruption
possible. I.e. a configuration which had relro-full will still get
PIC/PIE. This patch just adds the possiblity to do PIC/PIE without
relro-full.

If we really want to decouple the two, then I think we should do that in
a separate patch, which just drops this new select, to allow relro-full
without PIC/PIE.

I'll do that in a followup patch.

Regards,
Yann E. MORIN.

> >         help
> >           This option includes the partial configuration, but also marks
> >           the GOT as read-only at the cost of initialization time during
> > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> > index c73a0cc079..7a4b9c4007 100644
> > --- a/toolchain/toolchain-wrapper.c
> > +++ b/toolchain/toolchain-wrapper.c
> > @@ -367,7 +367,7 @@ int main(int argc, char **argv)
> >                 *cur++ = "-Wno-builtin-macro-redefined";
> >         }
> >
> > -#ifdef BR2_RELRO_FULL
> > +#ifdef BR2_PIC_PIE
> 
> Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
