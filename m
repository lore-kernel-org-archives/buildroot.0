From: Mateusz Furdyna <sir.ferdek@gmail.com>
Date: Mon, 05 Dec 2016 12:14:37 +0000
Subject: [Buildroot] [PATCH] vim: be more careful when removing the
	documentation
In-Reply-To: <20161205130930.62ccc373@free-electrons.com>
References: <1480936560-26702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAEGTJuPZKHuu5qd9gK-GyhPkxXdV+X0+V6RAvdX_rmJ5h4vPMg@mail.gmail.com>
 <20161205130930.62ccc373@free-electrons.com>
Message-ID: <CAEGTJuP+cd4D3YqDV+A_NT2QjxKqXu3dsRC9x3yQQq1iq6rXRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sounds good to me.

pon., 5.12.2016 o 13:09 u?ytkownik Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> napisa?:

> Hello,
>
> On Mon, 05 Dec 2016 12:03:45 +0000, Mateusz Furdyna wrote:
> > How about we are even more careful, for instance when vim version changes
> > and also the directory name changes to sth like vim81?
> >
> > like so:
> >
> >  define VIM_REMOVE_DOCS
> > -       find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete
> > +       $(RM) -rf $(find $(TARGET_DIR)/usr/share/vim -type d -name "doc")
> >  endef
> >
> > Rationale:
> > * we cannot use find -delete because it doesn't work on empty directories
> > * we cannot use find -exec rm... because it then tries to traverse
> > directories it has just removed
> > * we probably cannot use rm -rf /usr/share/vim/vim80/doc, because then we
> > have vim version hardcoded into the path
> > * we must use -f flag in case find returns nothing OR we try to delete
> doc
> > directory nested in another doc directory that we've just deleted...
> >
> > What do you think?
>
> What about just:
>
>         $(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161205/e35b2c3d/attachment.html>
