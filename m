From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:30:13 +0200
Subject: [Buildroot] [PATCH 4/4 v3] kodi: allow enablement of libamcodec
 as	codec if selected
In-Reply-To: <trinity-90b29fc0-247c-47a2-9a96-f80d2a588ee3-1467482301230@3capp-mailcom-bs01>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>
 <37g24dxqbs.ln2@ID-313208.user.individual.net>
 <trinity-6552df3a-288c-4396-95fb-c56acc32c4d5-1467371097197@3capp-mailcom-bs11>
 <trinity-90b29fc0-247c-47a2-9a96-f80d2a588ee3-1467482301230@3capp-mailcom-bs01>
Message-ID: <20160827223013.32645edf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Jul 2016 19:58:21 +0200, daggs wrote:

> as prefix is set to /usr (see output/build/kodi-16.1-Jarvis/config.log), I'm not sure fixing prefix is the answer.
> in general, replacing the include lines with the follows:
> INCLUDES += -I$(shell $(CC) --print-sysroot)/$(prefix)/include/amcodec
> INCLUDES += -I$(shell $(CC) --print-sysroot)/$(prefix)/include/amplayer

You can also do:

	-I=$(prefix)/include/amcodec

'=' is automatically replaced by gcc by the sysroot path. However, as
it was discussed, there should be a choice between:

 - amcodec headers are meant to be installed in /usr/include/amcodec,
   in which case Kodi should #include <amcodec/foobar.h>, and then the
   amcodec headers also use #include <amcodec/barfoo.h> internally.

 - amcodec headers are meant to be installed in /usr/include/
   directory, in which case Kodi should #include <foobar.h>, and then
   the amcodec headers can do #include <barfoo.h>

The drawback with the second option is obviously the potential for
conflicting file names in /usr/include.

Since the patch doesn't work as-is, I've marked it as "Changes
Requested" in patchwork. Please come up with a better solution,
possibly by talking with the libamcodec maintainer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
