From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sat, 13 Feb 2010 22:27:11 -0800 (PST)
Subject: [Buildroot] Best way to run ntpdate at startup
Message-ID: <368044.7338.qm@web44815.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I enabled BR2_PACKAGE_NTP=y, and Buildroot added ntpd and /etc/init.d/S49ntp to the RFS.  Good.

But I need to run ntpdate at startup to set the initial time, before ntpd runs.

So I manually created S48ntpdate to run ntpdate (S48) before ntpd (S49) at startup:

  /etc/init.d/S48ntpdate

    #! /bin/sh
    ntpdate 0.us.pool.ntp.org
    exit 0

That works, but I noticed S49ntp includes support for running ntpdate before ntpd during startup:

  /etc/init.d/S49ntp

    case "$1" in
      start)
         if test x$NTPDATE = xyes ; then
                  echo -n "Getting initial time via ntp"
                  $NTPDATE_BIN $NTPDATE_OPTS $NTPSERVERS > /dev/null 2>&1
                  echo "."
         fi

Where should I configure NTPDATE=yes and NTPSERVERS=0.us.pool.ntp.org?

I could add this to the top of S49ntp, but is there some other startup config file that is intended for such options so S49ntp remains unaltered?

Is this done manually, or through Buildroot 'make menuconfig'?

Ideally, these edits would not be clobbered when I rebuild the RFS.

Thanks.

Jim



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100213/8f358369/attachment.htm>
