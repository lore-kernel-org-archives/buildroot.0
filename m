From: matthew.amlogic shyu <matthew.shyu.amlogic@gmail.com>
Date: Fri, 19 Feb 2016 18:33:44 +0800
Subject: [Buildroot] [PATCH 1/1] fix host-openssl binary installation
In-Reply-To: <87k2m1huky.fsf@dell.be.48ers.dk>
References: <1455705686-20822-1-git-send-email-matthew.shyu.amlogic@gmail.com>
 <8737sr1ise.fsf@dell.be.48ers.dk>
 <CAJjDOTnPLk-zo4+fxFtrbfUCWo+q9fcHcPE3fRQxUscXHkfjKA@mail.gmail.com>
 <87k2m1huky.fsf@dell.be.48ers.dk>
Message-ID: <CAJjDOTkbynNqt_19U_W+Nmn7iDHL9t9GuCREzo8ak6R6HaO_vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-02-19 18:18 GMT+08:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "matthew" == matthew amlogic shyu <matthew.shyu.amlogic@gmail.com>
> writes:
>
> Hi,
>
>  >> > The Configure script in openssl takes install_prefix from env by
> default
>  >> > $install_prefix= "$ENV{'INSTALL_PREFIX'}"
>  >> > However, the INSTALL_PREFIX points to *TARGET* folder instead of
>  >> > *HOST* folder.
>  >> > This is fixed by intentionally setting install_prefix to blank.
>  >>
>  >> Sorry, I'm not following you here. Do you mean that you have exported
>  >> INSTALL_PREFIX=<something> in your environment outside Buildroot? We do
>  >> indeed pass INSTALL_PREFIX to make install when we install the target
>  >> version to staging/target, but I don't see the relation to the host
>  >> variant?
>
>  > Yes, the INSTALL_PREFIX env is passed in  from buildroot.  However,  as
>  > you said, it points to output/staging/usr.  For host variant, the
> correct
>  > installation path should be output/host/usr, which is set by --prefix.
> The
>  > idea of this patch is for host-openssl not to use --install-prefix but
> to
>  > use --prefix.
>
> But we only pass INSTALL_PREFIX=$(STAGING_DIR)/usr during the
> make-install-to-staging step, and not when we configure/build/install
> the host variant:
>
> define OPENSSL_INSTALL_STAGING_CMDS
>         $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
> endef
>
> define HOST_OPENSSL_INSTALL_CMDS
>         $(MAKE) -C $(@D) install
> endef
>
> define OPENSSL_INSTALL_TARGET_CMDS
>         $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
>         rm -rf $(TARGET_DIR)/usr/lib/ssl
>         rm -f $(TARGET_DIR)/usr/bin/c_rehash
> endef
>
> So I'm still not sure what you are trying to solve?
>
> Ha, you're right!
I found that I have a stupid package inside my Buildroot tree that's
exporting INSTALL_PREFIX during the build and thus messing up my
environment.
There's nothing wrong with host-openssl package.
My bad. Sorry.

> --
> Venlig hilsen,
> Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160219/818deaa6/attachment.html>
