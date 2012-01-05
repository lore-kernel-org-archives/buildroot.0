From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Thu, 5 Jan 2012 13:12:49 +0100
Subject: [Buildroot] libftdi in buildroot 2011.11 - spurious write to 245
	fifo during initialization
Message-ID: <CAMduVEfU9rGB5arJCtpPmb1siSXYjH6O8ypGx_ympz6yx50QpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've developed an application which uses the FT2232H chip configured
for 245 FIFO in channel A and USART in channel B (which is further
software switched to MPSSE - JTAG mode).
I've noticed, that during the startup of the system and initialization
of my software, which uses the libftdi, a few spurious writes of the
0xff bytes to the FIFO occured.
What's interesting - no such effect appears in the same application
run on debian/testing with the same version of libftdi.
I've even tried to boot the buildroot on my development machine (both
embedded PC and my development box are X86_64 machines).

The initialization of my application looks like below:
  if (ftdi_init(&ftdic) < 0)
  {
    fprintf(stderr, "ftdi_init failed\n");
    return EXIT_FAILURE;
  }
  if ((ret = ftdi_set_interface(&ftdic,1))<0)
  {
    fprintf(stderr, "unable to set ftdi interface: %d (%s)\n", ret,
ftdi_get_error_string(&ftdic));
    return EXIT_FAILURE;
  }
  if ((ret = ftdi_usb_open(&ftdic, 0x0403, 0x6010)) < 0)
  {
    fprintf(stderr, "unable to open ftdi device: %d (%s)\n", ret,
ftdi_get_error_string(&ftdic));
    return EXIT_FAILURE;
  }
  ftdi_usb_reset(&ftdic);

I've tested both version with call to ftd_usb_reset and without it...
-- 
TIA & Regards,
Wojtek
