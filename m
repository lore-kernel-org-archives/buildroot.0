From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:26:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: fix build without
 alsa mixer
In-Reply-To: <20191204175437.2182278-1-fontaine.fabrice@gmail.com>
References: <20191204175437.2182278-1-fontaine.fabrice@gmail.com>
Message-ID: <20191205222614.39585e4f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 18:54:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> atopology is needed to build alsa-utils since version 1.2.1 and
> https://github.com/alsa-project/alsa-utils/commit/c8fdd38c74de2e8b7b2b5a4576787d5e9b4ae807
> 
> However, atopology is not correctly detected if --disable-alsatest is
> passed so force the detection of alsa-topology through
> --enable-alsa-topology as suggested by upstream in
> https://github.com/alsa-project/alsa-lib/pull/16
> 
> An other option would be to drop --disable-alsatest but I couldn't find
> why it was set

Prior to commit 2c03ec15307b567fd2250fe2a7981a89d19b87a9 (from 2002),
--enable-alsatest would cause an AC_TRY_RUN test to be executed, which
doesn't work in a cross-compiled environment.

There is by the way a remainder from that in utils/alsa.m4:

  AS_HELP_STRING([--disable-alsatest], [Do not try to compile and run a test Alsa program]),

See how it says "Do not try to compile and *run* a test Alsa program" ?

I think --disable-alsatest could be removed now. In addition, upstream
seems to have improved yesterday the detection of the topology library
in alsa-lib commit ad8527d81b09c4d0edd054b5b1468ce1c50b23cb. Could you
try this instead ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
