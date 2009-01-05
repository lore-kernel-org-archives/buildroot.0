From: David Brown <david@westcontrol.com>
Date: Mon, 05 Jan 2009 17:27:55 +0100
Subject: [Buildroot] avr32 - directfb compile failure in release buildroot
	2.3.0
Message-ID: <gjtcei$egs$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure if this is something that should be considered a buildroot 
issue, a DirectFB issue, or an AVR32-specific issue.  Hopefully someone 
will point me in the right direction if this is not a suitable mailing 
list for this issue.

My build environment is buildroot 2.3.0 from Atmel, configured for the 
AVR32 (with "make atstk1002_defconfig" and a few small changes).

Builds of DirectFB (version 1.2.6) are failing with an error message 
that "PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP" is not defined (in 
lib/direct/interface.c, amongst other files).  I've traced this to a 
difference in the ./configure script and the actual compilation - the 
./configure script defines the "_GNU_SOURCE" symbol before checking for 
the "PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP" macro, and thus finds it 
defined.  The actual library code does not define the "_GNU_SOURCE" 
symbol (according to the changelog, this definition was in older 
DirectFB versions, but has since been removed), and thus (via 
<features.h> and <pthread.h>) "PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP" 
is not defined during compilation.

I've got DirectFB to compile by adding a "#define _GNU_SOURCE 1" to the 
start of "config.h", and now the DirectFB demo programs are compiled and 
seem to be working.

mvh.,

David Brown
Norway.
