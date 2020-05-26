From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 26 May 2020 22:56:15 +0200
Subject: [Buildroot] [PATCHv2] package/qt5/qt5declarative: fix parallel
 install
In-Reply-To: <0be38b00-4b79-4cda-539d-9b2201397676@gmail.com>
References: <20200526160724.431212-1-romain.naour@gmail.com>
 <20200526210342.4ce812f1@gmx.net>
 <0be38b00-4b79-4cda-539d-9b2201397676@gmail.com>
Message-ID: <20200526225615.166a281e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Tue, 26 May 2020 22:15:03 +0200, Romain Naour <romain.naour@gmail.com> wrote:

> Hi Peter,
> 
> Le 26/05/2020 ? 21:03, Peter Seiderer a ?crit?:
> > Hello Romain,
> > 
> > On Tue, 26 May 2020 18:07:24 +0200, Romain Naour <romain.naour@gmail.com> wrote:
> >   
> >> While installing qt5declarative	examples on fast machine, example destination
> >> directory will be installed twice, so it can break a parallel install, whereby
> >> two make jobs may run concurrently, trying to install the same files or creating
> >> the same directory.
> >>
> >> Cannot touch [...]chapter5-listproperties/app.qml: No such file or directory
> >> Error copying [...]chapter2-methods/app.qml: Destination file exists
> >>
> >> This is due to "target" and "qml" target creating the same directory in the
> >> generated Makefile:
> >>
> >>   install_target: first FORCE
> >>           @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
> >>           mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
> >>
> >>   install_qml: first FORCE
> >>           @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
> >>           mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
> >>
> >> Add "target" in "qml" dependency to fixes the issue:
> >>
> >>   install_qml: first install_target FORCE  
> > 
> > 
> > Still failing, e.g.:
> > 
> > Error copying /home/seiderer/Work/Buildroot/build_rpi4_update_001/build/qt5declarative-5.14.2/examples/qml/tutorials/extending-qml/chapter2-methods/app.qml to /home/seiderer/Work/Buildroot/build_rpi4_update_001/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods/app.qml: Cannot create /home/seiderer/Work/Buildroot/build_rpi4_update_001/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods/app.qml for output
> > make[7]: *** [Makefile:691: install_qml] Error 3
> > make[7]: *** Waiting for unfinished jobs....
> > make[6]: *** [Makefile:89: sub-chapter2-methods-install_subtargets] Error 2
> > make[6]: *** Waiting for unfinished jobs....
> > make[5]: *** [Makefile:59: sub-extending-qml-install_subtargets] Error 2
> > make[4]: *** [Makefile:164: sub-tutorials-install_subtargets] Error 2
> > make[3]: *** [Makefile:86: sub-qml-install_subtargets] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > make[2]: *** [Makefile:113: sub-examples-install_subtargets] Error 2
> > make[1]: *** [package/pkg-generic.mk:310: /home/seiderer/Work/Buildroot/build_rpi4_update_001/build/qt5declarative-5.14.2/.stamp_staging_installed] Error 2
> > make: *** [Makefile:23: _all] Error 2  
> 
> Just to check, did you clean the qt5decalrative package before testing ?

Yes, qt5declarative re-build via 'rm -rf build/qt5declarative-5.14.2'...

> You can check if the patch has been taken into account by looking at install_qml
> makefile target:
> 
>    install_qml: first install_target FORCE
> 

	$  grep "^install_qml:" build/qt5declarative-5.14.2/examples/qml/tutorials/extending-qml/chapter2-methods/Makefile 
	install_qml: first install_target FORCE

But in the case of app.qml it is not (only) the install_target dependency but
although the install_source dependency (the second place where app.qml is mentioned
in the Makefile)...

> > 
> > 
> > Did try another solution, instead of adding an extra dependency converted qml
> > install targets into 'OTHER_FILES', e.g.:
> > 
> > diff --git a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
> > index 7fd850ce..cba5c39b 100644
> > --- a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
> > +++ b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
> > @@ -6,10 +6,8 @@ SOURCES += piechart.cpp \
> > 
> >  RESOURCES += chapter2-methods.qrc
> > 
> > -DESTPATH = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter2-methods
> > -target.path = $$DESTPATH
> > +target.path = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter2-methods
> > 
> > -qml.files = *.qml
> > -qml.path = $$DESTPATH
> > +OTHER_FILES += *.qml
> > 
> > -INSTALLS += target qml
> > +INSTALLS += target
> > 
> > 
> > Looks promising (survived 40 loops of the install test)...
> > 
> > Should I send a v3 (hijacking your patch) or send it as an new one?  
> 
> Since it looks promising then feel free to send a new one that supersede my patch :)
> Maybe add a link in the commit log to our initial investigations :)

Will do...

Regards,
Peter

> 
> Thanks for the help!
> 
> Best regards,
> Romain
> 
> > 
> > Regards,
> > Peter
> >   
> >>
> >> Fixes:
> >> https://gitlab.com/buildroot.org/buildroot/-/jobs/565470221
> >>
> >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> >> Cc: Ga?l Portay <gael.portay@collabora.com>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >> Cc: Peter Seiderer <ps.report@gmx.net>
> >> ---
> >> v2: Apply this fix each time where several install target are used in .po file:
> >>       INSTALLS += target [qml] [...]
> >>     (Peter)
> >> ---  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
