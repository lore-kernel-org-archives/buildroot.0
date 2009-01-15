From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 15 Jan 2009 21:39:05 +0100
Subject: [Buildroot] error building alsa-utils
In-Reply-To: <1232051621.4757.26.camel@aeglos.sweden.atmel.com>
References: <496E4A36.4050902@carallon.com>
	<8763khbnec.fsf@macbook.be.48ers.dk>  <496F1A63.3010403@carallon.com>
	<1232051621.4757.26.camel@aeglos.sweden.atmel.com>
Message-ID: <1232051945.4757.32.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 21:33 +0100 skrev Ulf Samuelsson:
> tor 2009-01-15 klockan 11:13 +0000 skrev Will Wagner:
> > > 
> > > Ah yes, thats fairly common. Please send the patch to the list and
> > > I'll apply it - Also don't forget to send it to the alsa people!
> > 
> > Attached is patch, have also mailed alsa-devel
> > 
> Alsa-utils fails for me when I run buildall.sh so 
> I will put the stuff in the alsa-utils directory and rerun.
> 

OK so alsa-utils now compiles OK for ARM, 
It did not do so before the patch.

BR
Ulf Samuelsson

> 
> BR
> Ulf Samuelsson
> 
> > > 
> > >  Will> The second problem I have is it appears to be trying to install
> > >  Will> the manual pages and is failing when trying to use xmlto
> > >  Will> command. I want to configure it to not build/install the man
> > >  Will> pages but I can't spot a configure option to do so. Am I
> > >  Will> missing something obvious? If not how do you suggest fixing
> > >  Will> this?
> > > 
> > > Well, if everything else fails, you can always patch the
> > > Makefile.in's.
> > 
> > Have fixed by patching Makefile.in. I also realise that if I had xmlto on my build machine 
> > it would not be a problem.
> > 
> > Will.
> > 
> > 
> > vanligt textdokument-bilaga (alsa-utils-1.0.18-fix_sysv_legacy.patch)
> > --- a/alsactl/init_parse.c	2009-01-15 10:44:48.000000000 +0000
> > +++ b/alsactl/init_parse.c	2009-01-15 10:46:41.000000000 +0000
> > @@ -381,7 +381,7 @@ static int set_ctl_value(struct space *s
> >  				snd_ctl_elem_value_set_integer(space->ctl_value, idx, val);
> >  			} else if (items > 2 && value[items-2] == 'd' && value[items-1] == 'B') {
> >  				val = strtol(value, NULL, 0) * 100;
> > -				if ((pos2 = index(value, '.')) != NULL) {
> > +				if ((pos2 = strchr(value, '.')) != NULL) {
> >  					if (isdigit(*(pos2-1)) && isdigit(*(pos2-2))) {
> >  						if (val < 0)
> >  							val -= strtol(pos2 + 1, NULL, 0);
> > @@ -1253,7 +1253,7 @@ static char *new_root_dir(const char *fi
> >  
> >  	res = strdup(filename);
> >  	if (res) {
> > -		tmp = rindex(res, '/');
> > +		tmp = strrchr(res, '/');
> >  		if (tmp)
> >  			*tmp = '\0';
> >  	}
> > vanligt textdokument-bilaga (alsa-utils-1.0.18-remove_man.patch)
> > --- a/alsactl/Makefile.in	2009-01-15 10:59:38.000000000 +0000
> > +++ b/alsactl/Makefile.in	2009-01-15 10:59:34.000000000 +0000
> > @@ -204,7 +204,7 @@ sharedstatedir = @sharedstatedir@
> >  sysconfdir = @sysconfdir@
> >  target_alias = @target_alias@
> >  SUBDIRS = init
> > -man_MANS = alsactl.1 alsactl_init.7
> > +man_MANS = alsactl.1
> >  EXTRA_DIST = alsactl.1 alsactl_init.xml
> >  alsactl_SOURCES = alsactl.c state.c utils.c init_parse.c
> >  noinst_HEADERS = alsactl.h list.h init_sysdeps.c init_utils_string.c init_utils_run.c init_sysfs.c
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
