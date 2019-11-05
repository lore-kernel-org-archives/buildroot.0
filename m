From: Stephan Henningsen <stephan@asklandd.dk>
Date: Tue, 5 Nov 2019 21:42:28 +0100
Subject: [Buildroot] [PATCH] package/sudo: new config to add sudo group
 and rule
In-Reply-To: <20191105185114.GM2710@scaer>
References: <20191103214153.24621-1-stephan@asklandd.dk>
 <20191105185114.GM2710@scaer>
Message-ID: <CAH0Z9Q+WnxY6KEZObKqqm9mS9bOQzYJP0XwBcBgKPnCzijgDXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

On Tue, Nov 5, 2019 at 7:51 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2019-11-03 22:41 +0100, Stephan Henningsen spake thusly:
> > +if BR2_PACKAGE_SUDO
> > +
> > +config BR2_PACKAGE_SUDO_GROUP_AND_RULE
> > +     bool "add group 'sudo' and enable associated sudo rule"
> > +     select BR2_PACKAGE_SUDO_GROUP
> > +     help
> > +       Creates a group named 'sudo', and enables the following rule
> > +       in the /etc/sudoers configuration file that allows members of
> > +       group 'sudo' to execute any command as root:
> > +
> > +       %sudo ALL=(ALL) ALL
>
> I thought the conclusion from the previous iteration was that the
> addition of the group and sudo rules were to be non-optional.

Sorry, I thought the idea was to combine the rule and group together
into one option, since they make perfect sense together, and aren't
very useful separately.

I don't agree that they should be non-optional (or default).

The sudo group+rule is just one of many use-cases for the sudo
program.  Others include granting only access to a specific user
(root, joe, etc.) or existing system groups (wheel, daemon, etc.).
People who rely on these features and are concerned about security,
would need to clean up the mess that the non-optional
BR2_PACKAGE_SUDO_GROUP_AND_RULE brought in, and revert the size of the
attack surface.  In fact, since this is now the default, most users
will most likely not notice this has been added.  If some already
added the 'sudo' system group and their own (different) rules, their
system might break or even open for permission elevation silently.

I don't see how anything good can come out of this.  (Except for my
particular case maybe, because I'm the one who had the need and made
the patch with the option ;).

I really think it should be an option, just like the patch provided.


> > +endif
> > diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> > index cf8b63b1db..5df39b193e 100644
> > --- a/package/sudo/sudo.mk
> > +++ b/package/sudo/sudo.mk
> > @@ -64,4 +64,17 @@ define SUDO_PERMISSIONS
> >       /usr/bin/sudo f 4755 0 0 - - - - -
> >  endef
> >
> > +ifeq ($(BR2_PACKAGE_SUDO_GROUP_AND_RULE),y)
> > +define SUDO_USERS
> > +    -               -1   sudo            -1   -             -            -         -
>
> When the username is '-', even the uid is ignored, we usually make it
> '-' too.

Makes sense.


> Also, there are too many spaces (see PERMISSIONS above).

Even though I usually like spaces, I agree here =).  I don't know how
they got there.  Perhaps I had a header there for personal
documentation.


> So, I removed the condition (and thus the Config.in option), tweaked the
> USERS variable, and pushed to master now.

Please reconsider only cleaning up the USERS variable.  I think adding
potentially unused non-standard system groups, sudo rules, and
silenting, inadvertently allowing running commands as root is a bad
idea.

-- 
Regards,
Stephan
