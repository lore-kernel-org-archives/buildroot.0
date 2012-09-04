From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Sep 2012 19:52:39 +0200
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
	when building linux-pam package
In-Reply-To: <CADiAo4LQysVFknpskVM0Z2nfY_oSB8vUD306X1KYucM_My+kVw@mail.gmail.com>
References: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
 <201209041902.30271.yann.morin.1998@free.fr>
 <CADiAo4LQysVFknpskVM0Z2nfY_oSB8vUD306X1KYucM_My+kVw@mail.gmail.com>
Message-ID: <201209041952.39756.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dmitry, All,

On Tuesday 04 September 2012 19:33:08 Dmitry Golubovsky wrote:
> On Tue, Sep 4, 2012 at 1:02 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > I think that this patch, which adds the default files, should come
> > _before_ the busybox patch. If only the busybox patch were to be
> > applied, then PAM would not be useable as it would lack those files.
> >
> > In the current order, iIt would also break 'bisectability'.
> 
> This patch was a "reasonable compromise" to have a somewhat working
> system emulating PAM-less behavior when PAM is enabled in login and no
> proper PAM configs are provided.
> I think that in a real project, a post-build filesystem fix should
> replace these files with something more sensible (like mine does).

Ah, OK I get it. With these two files, even if no PAM configuration is
provided by other means, it would behave as if PAM was not enabled. Right?

> Regarding ordering, I'll try to switch the order.

Yes, because without this patch, if linux-pam is enabled, and PAM is
enabled in busybox (which is possible with the previous patch), what
would be the behaviour?

I guess that, without its config files, PAM would not allow anything,
right?

If so, then the default files should come _before_ they are required.

> >> +#
> >> +# default; standard UN*X access
> >> +#
> >> +auth     required       pam_unix.so
> >> +account  required       pam_unix.so
> >> +password required       pam_unix.so
> >> +session  required       pam_unix.so
> >> +
> >
> > I am not a PAM expert, so I can't say whether these settings are correct,
> > enough, or whatever. I'd trust close to anybody on this subject. ;-)
> 
> This is an example from PAM documentation:

OK, good! :-)

> >> +define LINUX_PAM_CONFFILES
> >> +     $(INSTALL) -D -m 0644 package/linux-pam/default $(TARGET_DIR)/etc/pam.d/default
> >> +     $(INSTALL) -D -m 0644 package/linux-pam/login $(TARGET_DIR)/etc/pam.d/login
> >
> > I'd use:
> >     $(INSTALL) -D -m 0644 $(@D)/default $(TARGET_DIR)/etc/pam.d/default
> 
> But $(@D) is the build directory, while the files are part of
> Buildroot package rather than PAM itself. $(@D) is to my understanding
> output/build/linux-pam-x.y.z

Gah, my bad...
This morning's cafeine dose is no longer having any effect... :-(

> > Also, shouldn't these files get special permission (ie. redable only by
> > root, or stuff like that)? If so, then use:
> >   LINUX_PAM_PERMISSIONS = .....
> 
> Not sure if that's needed: they do not have anything secret, just
> nobody other than root can change them.

OK, I just checked on my distro, and indeed there're world-readable.
/etc/shadow is not, however, and that was what I probably was thinking
about (damn lack of cafeine is kicking again...)

> > At the risk of adding to the option maze, I'd suggest at least adding
> > a config knob to enable that. For example:
[--SNIP--]
> I'm afraid this is too much. And it should be provided for the
> PAM-less config as well.

Yep.

> One who wants to use PAM will likely design a proper authentication
> scheme and provide their own better PAM configs.

Granted.

> > IMNSHO, the defaut should be a secure system.
> But it is not by default: root can login w/o password

Yep again, indeed.

If you resubmit with the ordering reversed, you can add my:
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
for this patch (I'll review the other later).

Thanks for bearing with me. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
