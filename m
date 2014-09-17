From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 17 Sep 2014 15:19:25 +0200
Subject: [Buildroot] [PATCH 6/6] targetcli-fb: add sysv initscript
In-Reply-To: <20140917141204.5dbaa667@free-electrons.com>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-7-git-send-email-cvubrugier@fastmail.fm>
 <20140917141204.5dbaa667@free-electrons.com>
Message-ID: <20140917151925.15b49f86@grp-cvubrugier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 17 Sep 2014 14:12:04 +0200, Thomas Petazzoni wrote :
> On Wed, 17 Sep 2014 13:39:59 +0200, Christophe Vu-Brugier wrote:
> > Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> > ---
> >  package/targetcli-fb/S50target       | 46 ++++++++++++++++++++++++++++++++++++
> >  package/targetcli-fb/targetcli-fb.mk | 11 +++++++++
> >  2 files changed, 57 insertions(+)
> >  create mode 100755 package/targetcli-fb/S50target
> 
> I think this should be part of the previous patch.

OK.


> > diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> > index 2384569..b83a6b6 100644
> > --- a/package/targetcli-fb/targetcli-fb.mk
> > +++ b/package/targetcli-fb/targetcli-fb.mk
> > @@ -11,4 +11,15 @@ TARGETCLI_FB_LICENSE_FILES = COPYING
> >  TARGETCLI_FB_SETUP_TYPE = setuptools
> >  TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb
> >  
> > +define TARGETCLI_FB_INSTALL_INITSCRIPT
> > +        @if [ ! -f $(TARGET_DIR)/etc/init.d/S50target ]; then \
> > +                $(INSTALL) -m 0755 -D package/targetcli-fb/S50target $(TARGET_DIR)/etc/init.d/S50target; \
> > +        fi
> 
> This should not be handled using a post install target hook, but rather
> using the TARGETCLI_FB_INIT_SYSV mechanism. See the Buildroot manual or
> other packages for example (dnsmasq for example, or ntp if you want to
> see both the SysV and the systemd cases).

OK. By the way, I also intend to add a systemd unit file later.


> Also, I don't think adding a @ at the beginning is really needed, as we
> usually don't do that I believe. The test could also be summarized as:
> 
> 	[ -f $(TARGET_DIR)/etc/init.d/S50target ] || \
> 		$(INSTALL) ...
> 
> > +        @if [ ! -d $(TARGET_DIR)/etc/target ]; then \
> > +                $(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/target; \
> > +        fi
> 
> This should continue to belong to post install hook because it isn't
> related to which init system is used. Is the test really necessary in
> this case? Maybe you can just to the $(INSTALL), which doesn't fail if
> the directory already exists I believe. If not, just use mkdir -p and
> that's it. If you really want to be nice, you could also add a comment
> above the hook explaining why this directory is needed.

The directory "/etc/target" is needed because it is expected by
targetcli. The configuration of the "SCSI target" driver is stored in a
JSON file named "/etc/target/saveconfig.json". This configuration is
used to create the configfs hierarchy that configures the target driver.

Thank you!
