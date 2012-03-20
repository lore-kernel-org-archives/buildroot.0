From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Mar 2012 11:18:17 +0100
Subject: [Buildroot] WebKit - Random-crashes ?
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6703136751@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB6703136751@WETMEX10.loepfe.com>
Message-ID: <20120320111817.227486ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 20 Mar 2012 10:50:13 +0100,
"Vellemans, Noel" <Noel.Vellemans@visionBMS.com> a ?crit :

> Finally got 'something' running, that is not crashing all the time.
> What Did I do?
> A) Reverted back to older-WebKit 1.2.7. : DID NOT HELP (i.o.w
> WebKit/GtkLauncher still crashes 'random') 
> A) Reverted back to Uclibc 0.9.32.x     : DID NOT HELP. 
> B) Reverted back to glib-2.28.8         : DID NOT HELP.
> C) reverted to an older version of GTK (2.24.4): DID NOT HELP.
> D) Reverted back to libsoup-2.32.2 (had to remove glib-networking
> depends): SEEMS to be STABLE!

Ah, interesting. Then maybe contacting the libsoup developers will be a
good idea.

Another option is to try to upgrade libsoup. We have 2.36.1 in
Buildroot, the latest one is
http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.37/libsoup-2.37.92.tar.xz.

> Compiling WebKit (and his depends) takes some time, even on
> fast-build-machine (some hours in my case).
> In order to be sure that everything is recompiled/linked correctly, I
> always wipe the complete 'output' directory.
> Is there a faster way to do this?
> {if I do not wipe the output directory I always have leftovers (in /lib,
> /usr/lib ..... ) ... from previous compile cycle(s).}

If you want to just rebuild *one* component, you can do:

	rm -rf output/build/<component>-<version>

and do 'make'. But note that it doesn't remove the previous
installation from the target directory, the installation of the new
component version will overwrite the old one, unless the installed
files are different, of course.

Another way of speeding up the build is to use an external toolchain if
you're not already using. You can also enable the ccache feature (be
sure to have the latest ccache fixes, otherwise ccache is basically
unused).

> I run Gtklauncher in Val grind as suggested, but I get a Lot of
> 'console'-output from everywhere. 
> For example.... "== Invalid write of size 4" and/or "Address 0x97b6e14
> is not stack'd, malloc'd or (recently) free'd" 
> Don't know exactly, how valuable this output is ( i.o.w. did not look
> into the details yet...)

valgrind is a big, big hammer, and for any given large software stack,
the number of errors is so huge that it's difficult to find out what's
going on.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
