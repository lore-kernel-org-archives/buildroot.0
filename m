From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 9 Aug 2017 10:37:48 +0200
Subject: [Buildroot] Failing gst1-validate-1.12.2 build,
 documentation not necessary!
In-Reply-To: <15dc45f8e06-3056-94cf@webprd-m104.mail.aol.com>
References: <15dc45f8e06-3056-94cf@webprd-m104.mail.aol.com>
Message-ID: <trinity-adc229dc-8010-433a-83e5-915ef6083410-1502267868449@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello 'grunpferd',

> Gesendet:?Mittwoch, 09. August 2017 um 02:23 Uhr
> Von:?grunpferd at netscape.net
> An:?buildroot at busybox.net
> Betreff:?[Buildroot] Failing gst1-validate-1.12.2 build, documentation not necessary!
>
> In building?gst1-validate-1.12.2.?
> ?I think building "all" here is not necessary. Can't see the documentation is ever going to be installed on a target.
> So why build it at all, especially when it fails!
> ?
> ?
> ?
> make[4]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/docs/validate'
>
> sphinx-build -b html -d ./doctrees ??. ./html
> Error: Source directory doesn't contain a conf.py file.

The problem seems you are one of the rare people who have a (non functional) sphinx documentation
system installed on the build host....

Mind to try the following (untested) patch:

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index be43df4f..5066c277 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -18,4 +18,6 @@ GST1_VALIDATE_DEPENDENCIES = \
        python \
        $(if $(BR2_PACKAGE_CAIRO),cairo)
 
+GST1_VALIDATE_CONF_ENV = ac_cv_prog_enable_sphinx_doc=no
+
 $(eval $(autotools-package))


Regards,
Peter

> Makefile:687: recipe for target 'all' failed
> make[4]: *** [all] Error 1
> make[4]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/docs/launcher'
> Makefile:806: recipe for target 'launcher' failed
> make[3]: *** [launcher] Error 2
> make[3]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/docs'
> Makefile:713: recipe for target 'all-recursive' failed
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2'
> Makefile:623: recipe for target 'all' failed
> make[1]: *** [all] Error 2
> make[1]: Leaving directory '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2'
> package/pkg-generic.mk:227: recipe for target '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/.stamp_built' fail
> ed
> make: *** [/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/gst1-validate-1.12.2/.stamp_built] Error 2
> ?
> ?
> Ross
