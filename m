From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Tue, 31 May 2016 11:59:13 +0200
Subject: [Buildroot] [PATCH v2] build: fix umask test
In-Reply-To: <20160531115326.5b360fcb@free-electrons.com>
References: <20160531074622.GB26685@airbook>
 <20160531115326.5b360fcb@free-electrons.com>
Message-ID: <20160531095913.GA27305@airbook>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > --- a/Makefile
> > +++ b/Makefile
> > @@ -26,7 +26,7 @@
> >  
> >  # Trick for always running with a fixed umask
> >  UMASK = 0022
> > -ifneq ($(shell umask),$(UMASK))
> > +ifneq (00$(shell umask | sed -e "s/^0*//g"),$(UMASK))
> 
> Doesn't this makes the assumption that "umask" will always return a
> value that starts with two zeros ?

No.
the "umask | sed -e ..." strips leading 0's, when present.
"00$(...)" glues 00 in front of the stripped umask, so it is compatible
again.

Kind regards,
Kurt
