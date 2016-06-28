From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 28 Jun 2016 10:30:45 +0200
Subject: [Buildroot] [PATCH] package/rrdtool: add support for perl
 bindings
In-Reply-To: <20160624175801.569ad7c9@free-electrons.com>
References: <1466665963-5543-1-git-send-email-yann.morin@orange.com>
 <20160624175801.569ad7c9@free-electrons.com>
Message-ID: <22551_1467102647_577235B7_22551_42_1_20160628083045.GH7797@r-lnx-ilmarinen>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-24 17:58 +0200, Thomas Petazzoni spake thusly:
> On Thu, 23 Jun 2016 09:12:43 +0200, Yann E. MORIN wrote:
> > +ifeq ($(BR2_PACKAGE_PERL),y)
> > +RRDTOOL_DEPENDENCIES += host-perl
> It is somewhat weird, one would expect to see a dependency on "perl"
> here, not "host-perl".
> 
> However, maybe you simply need host-perl at *build* time to build the
> bindings, and the target perl is only needed at *runtime*. If that's
> the case, then a comment above this dependency would be good to have.
> 
> If you confirm my understanding, I can also just add the comment when
> applying.

In fact, the host-perl is only used for a few things:

 1- extract some configuration:

    - the perl version: we need host-perl because otherwise the host
      system perl may be a different version;

    - the compiler used to build perl: this is not OK, because we'd get
      the host compiler, not the target one. This is why we override it
      in the RRDTOOL_CONF_ENV.

 2- generate the Makefiles from Makefile.PL templates.


However, I withdraw this patch, as it breaks now with the paranoid
wrapper. I'll fix that in the coming days.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 299.124.769 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
|         824.769 '--------------------: (_    `--, |  X  AGAINST      |
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
