From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Mon, 7 Sep 2015 15:09:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-06
In-Reply-To: <20150907063016.E32C8100E4D@stock.ovh.net>
References: <20150907063016.E32C8100E4D@stock.ovh.net>
Message-ID: <20150907150903.038d8740@PAL-U515208D001>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon,  7 Sep 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote :
>       x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/b6aa71e60f2db5f3378186e06a11d7bbca0f2eb5/

drbd-utils (even after an upgrade to version 8.9.3) does not build with
musl. drbd_endian.h contains the following snippet:

  #include <stdint.h>
  #include <endian.h>

  #ifndef BITS_PER_LONG
  # define BITS_PER_LONG __WORDSIZE
  #endif

  ...

  #if BITS_PER_LONG == 32
  # ...
  #elif BITS_PER_LONG == 64
  # ...
  #else
  # error "sorry, unsupported word length on this box" /* Our error */
  #endif


__WORDSIZE is not defined in musl unless <sys/reg.h> is included (which
I find weird). I will ask upstream if we can simply define
BITS_PER_LONG as follows:

  #define BITS_PER_LONG (sizeof(long) * 8)

Best regards,

-- 
Christophe Vu-Brugier
