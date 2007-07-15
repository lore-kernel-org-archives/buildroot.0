From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 15 Jul 2007 14:41:03 +0200 (CEST)
Subject: [Buildroot] make source-check
In-Reply-To: <20070709102348.GA21001@aon.at>
References: <20070709045947.D862330066@busybox.net>
	<0707091002300.8319@somehost>
	<20070709091324.GB19774@aon.at> <0707091121270.8319@somehost>
	<20070709094027.GB20627@aon.at> <0707091152450.8319@somehost>
	<20070709102348.GA21001@aon.at>
Message-ID: <0707151431170.6891@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Jul 2007, Bernhard Fischer wrote:

> On Mon, Jul 09, 2007 at 12:01:08PM +0200, Cristian Ionescu-Idbohrn wrote:
> >On Mon, 9 Jul 2007, Bernhard Fischer wrote:
>
> >But, wouldn't you agree that doing the same thing witout changing the
> >.config could be a much more elegant way to do it?
>
> If you have a better impl than my quick-hack, i'm eager to see it, sure.

Looks like there might be another way: see info-node "6.10 Target-specific
Variable Values" in a recent manual.  What do you think of something like:

--- Makefile	(revision 19052)
+++ Makefile	(working copy)
@@ -222,11 +222,8 @@

 source: $(TARGETS_SOURCE) $(HOST_SOURCE)

-.config.check: dependencies
-	$(SED) '/BR2_WGET/s/\"$$/ --spider\"/g' .config
-	touch $@
-
-_source-check: .config.check
+_source-check: WGET += --spider
+_source-check:
 	$(MAKE) source

That is, the wget option '--spider' will be used _only_ by target
'_source-check' and the '.config' won't have to be edited behind one's
back.


-- 
Cristian
