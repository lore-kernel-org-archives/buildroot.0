From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Mon, 5 Mar 2012 12:55:05 -0200
Subject: [Buildroot] [PATCHv5 1/1] qt: Add option to build and install
 tools on the target
In-Reply-To: <20120305135003.71c080ed@skate>
References: <1330945827-17612-1-git-send-email-ismael.luceno@gmail.com>
 <1330945827-17612-2-git-send-email-ismael.luceno@gmail.com>
 <20120305135003.71c080ed@skate>
Message-ID: <20120305125505.345b0b09@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 5 Mar 2012 13:50:03 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
<...>
> Le Mon,  5 Mar 2012 09:10:27 -0200,
> Ismael Luceno <ismael.luceno@gmail.com> a ?crit :
> 
> > @@ -583,6 +592,9 @@ define QT_INSTALL_STAGING_CMDS
> >  	$(MAKE) -C $(@D) install
> >  	mkdir -p $(HOST_DIR)/usr/bin
> >  	mv $(addprefix
> > $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
> > +ifneq ($(strip $(QT_TARGET_PROGRAMS-y)),)
> > +	mv $(addprefix
> > $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS-y))
> > $(TARGET_DIR)/usr/bin +endif rm -rf $(HOST_DIR)/usr/mkspecs
> >  	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
> >  	$(QT_INSTALL_QT_CONF)
> 
> this will not work. You cannot do ifeq/ifneq tests within
> define...endef blocks.
<...>

Oh :/. I gues I'll have to replace it with an $(if ...).

> So it means that *all* tools depend on the GUI module and SQL module,
<...>

Not exactly. The problem is, there's no way to choose which tools are
built, so the dependency just serves as a way to predict if the
tool will be built or not.

We're not telling anything to the build system based on those options.
IMO, patching the project file is asking for problems.

> I am a bit surprised that the qmlviewer and qmlplugindump tools
> require the SQL module. Is this correct?

Yes, I tried without the SQL module at first, but it gave an error.
I guess it's only needed by qmlviewer, but both are built together.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120305/b4189aa9/attachment.asc>
