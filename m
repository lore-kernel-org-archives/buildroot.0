From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2016 09:17:08 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 04/11] linux-pam:
 selinux host dependencies
In-Reply-To: <CAMshMJa8n2bFW1Jj3ssMBDgkM-Qkq=qe35x__X=f8HD0zCGSnQ@mail.gmail.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-4-git-send-email-niranjan.reddy@rockwellcollins.com>
 <20160223223650.74c20cfa@free-electrons.com>
 <CAMshMJa8n2bFW1Jj3ssMBDgkM-Qkq=qe35x__X=f8HD0zCGSnQ@mail.gmail.com>
Message-ID: <20160226091708.04d0828a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Niranjan,

On Fri, 26 Feb 2016 12:28:39 +0530, Niranjan Reddy wrote:

> > > +     if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
> > > +             cp -a $(TARGET_DIR)/etc/pam.d/*
> > $(TARGET_DIR)/etc/pam.d.orig/; \
> > > +             rm -rf $(TARGET_DIR)/etc/pam.d/; \
> > > +             mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/;
> > \
> > > +     fi;
> >
> > ; not needed
> >
> 
>   Are you sure you want me to remove these ? If I remove  " ; \"  it gives
> me compilation error.  when I see
>   build-root manual in section 17.15.2 , if condition statements are ended
> with semicolon. Please let me know.

I'm not asking you to remove all ; \, but only to remove the ones that
separate independent commands, since they are useless. I.e you are
currently doing:

1	if [ ... ] ; then \
2		cp -a ..... ; \
3	fi ; \
4	cd $(TARGET_DIR) .... ; \
5	if [ ... ] ; then \
6		cp -a .... ; \
7	fi ; \
8	$(INSTALL) -D ...

The \ or ; \ is needed on lines 1, 2, 4 and 5. But not on lines 3 and 7.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
