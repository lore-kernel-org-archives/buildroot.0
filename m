From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 11:35:23 +0100
Subject: [Buildroot] [PATCH 7/7] package/mksh: add /bin/mksh to
 /etc/shells
In-Reply-To: <20180114223736.GH16760@scaer>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-8-git-send-email-romain.naour@smile.fr>
 <20180114223736.GH16760@scaer>
Message-ID: <20180115113523.3bdd9887@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jan 2018 23:37:36 +0100, Yann E. MORIN wrote:

> On 2018-01-14 22:03 +0100, Romain Naour spake thusly:
> > When mksh is selected, /bin/mksh is not added to /etc/shells
> > (see man shells). So, login tools like dropbear reject the ssh
> > connexions for users using mksh as shell in /etc/passwd.
> > 
> > buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> > 
> > Signed-off-by: Romain Naour <romain.naour@smile.fr>
> > ---
> >  package/mksh/mksh.mk | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
> > index b5706db..52d4b00 100644
> > --- a/package/mksh/mksh.mk
> > +++ b/package/mksh/mksh.mk
> > @@ -21,4 +21,13 @@ define MKSH_INSTALL_TARGET_CMDS
> >  	$(INSTALL) -m 0755 -D $(@D)/mksh $(TARGET_DIR)/bin/mksh
> >  endef
> >  
> > +# Add /bin/mksh to /etc/shells otherwise some login tools like dropbear
> > +# can reject the user connexion. See man shells.
> > +define MKSH_INSTALL_ADD_MKSH_TO_SHELLS
> > +	grep -qsE '^/bin/mksh' $(TARGET_DIR)/etc/shells \
> > +		|| echo "/bin/mksh" >> $(TARGET_DIR)/etc/shells
> > +endef
> > +
> > +MKSH_POST_INSTALL_TARGET_HOOKS += MKSH_INSTALL_ADD_MKSH_TO_SHELLS  
> 
> Use a simple assignement here.

Well, actually, I'm quite happy with using += for hooks, even if
there's only one registered.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
